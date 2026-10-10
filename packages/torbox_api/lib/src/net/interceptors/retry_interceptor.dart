import 'dart:math';

import 'package:dio/dio.dart';

/// Dio interceptor that retries failed requests with exponential backoff.
///
/// Retries on HTTP 408 (timeout), 429 (rate limiting, honoring the
/// `Retry-After` header), and any status ≥ 500 (server error), as well as
/// transport-level timeouts and connection errors. Other client errors
/// (4xx) are not retried.
///
/// Note: unlike the Python SDK this mirrors (which retries 408/5xx only),
/// 429 is included because sustained polling against a large account can
/// hit TorBox rate limits; backing off is strictly safer than failing.
class RetryInterceptor extends Interceptor {
  /// The [Dio] instance used to re-dispatch retried requests.
  final Dio dio;

  /// Maximum number of retry attempts (excluding the original request).
  final int maxAttempts;

  /// Base delay in milliseconds. Actual delay is
  /// `baseDelay * 2^attempt * random(0.5, 1.5)`.
  final int baseDelayMs;

  final Random _random = Random();

  RetryInterceptor({
    required this.dio,
    this.maxAttempts = 3,
    this.baseDelayMs = 150,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final attempt = err.requestOptions._retryAttempt;

    if (attempt >= maxAttempts || !_shouldRetry(err)) {
      // Out of attempts, or a non-retryable error: propagate untouched so
      // callers see the original status code and message.
      handler.next(err);
      return;
    }

    err.requestOptions._retryAttempt = attempt + 1;
    await Future.delayed(_computeDelay(attempt, err));

    try {
      // Re-dispatches through the interceptor chain; a further failure
      // re-enters this handler with the incremented attempt count, so
      // retries terminate once [maxAttempts] is reached.
      final response = await dio.fetch(err.requestOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  bool _shouldRetry(DioException err) {
    final statusCode = err.response?.statusCode;
    if (statusCode == null) {
      // Network error, timeout, etc. — retry.
      return err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.sendTimeout ||
          err.type == DioExceptionType.receiveTimeout ||
          err.type == DioExceptionType.connectionError;
    }
    return statusCode == 408 ||
        statusCode == 429 ||
        statusCode >= 500;
  }

  Duration _computeDelay(int attempt, DioException err) {
    final jitter = 0.5 + _random.nextDouble(); // 0.5 – 1.5
    var delayMs = baseDelayMs * (1 << attempt) * jitter;
    // Honor the server's back-off request when present (seconds).
    final retryAfterSecs =
        int.tryParse(err.response?.headers.value('retry-after') ?? '');
    if (retryAfterSecs != null) {
      delayMs = max(delayMs, retryAfterSecs * 1000.0);
    }
    return Duration(milliseconds: delayMs.toInt());
  }
}

/// Extension to track retry attempt count on [RequestOptions].
extension _RetryAttemptExtension on RequestOptions {
  static const _retryAttemptKey = 'retry_attempt';

  int get _retryAttempt => (extra[_retryAttemptKey] as int?) ?? 0;
  set _retryAttempt(int value) => extra[_retryAttemptKey] = value;
}
