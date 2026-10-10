/// Exception thrown when a TorBox API request fails.
///
/// Distinguishes HTTP errors (status code available) from transport-level
/// errors (timeouts, connection failures, etc.).
///
/// Implements [Exception] directly (rather than `dart:io`'s [IOException],
/// which does not exist on web) so the package compiles everywhere.
class TorboxApiException implements Exception {
  /// Human-readable error message.
  final String message;

  /// HTTP status code, or `-1` for non-HTTP errors (e.g. timeout).
  final int statusCode;

  /// Whether this error originated from an HTTP response (status ≥ 400).
  final bool isHttpError;

  /// Machine-readable error code from the TorBox envelope (e.g.
  /// `BAD_TOKEN`, `ITEM_NOT_FOUND`), if available.
  final String? errorCode;

  /// User-friendly detail message from the TorBox envelope, if available.
  final String? detail;

  /// The request URI that failed, when known.
  final Uri? uri;

  TorboxApiException({
    required this.message,
    this.statusCode = -1,
    this.errorCode,
    this.detail,
    this.uri,
  }) : isHttpError = statusCode > 0;

  @override
  String toString() {
    final buffer = StringBuffer('TorboxApiException: $message');
    if (uri != null) buffer.write(' [$uri]');
    if (isHttpError) buffer.write(' (status $statusCode)');
    if (errorCode != null) buffer.write(' [errorCode: $errorCode]');
    if (detail != null) buffer.write('\n  detail: $detail');
    return buffer.toString();
  }
}
