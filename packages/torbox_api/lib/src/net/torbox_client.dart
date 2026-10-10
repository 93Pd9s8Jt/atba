import 'package:dio/dio.dart';

import '../models/common/torbox_file_upload.dart';
import '../models/common/torbox_response.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/retry_interceptor.dart';
import 'torbox_api_exception.dart';

/// A Dio-based HTTP client for the TorBox API.
///
/// Handles authentication, retries, and HTTP transport. Returns raw
/// response maps — services wrap them in [TorBoxResponse] and
/// deserialize the `data` field themselves.
class TorboxClient {
  late final Dio _dio;
  final AuthInterceptor _authInterceptor;

  TorboxClient({
    required String baseUrl,
    String? token,
    Duration timeout = const Duration(seconds: 60),
    int maxAttempts = 3,
    Duration retryDelay = const Duration(milliseconds: 150),
  }) : _authInterceptor = AuthInterceptor(token: token) {
    _dio = Dio(
      BaseOptions(
        // Dio concatenates baseUrl + path verbatim, so a missing trailing
        // slash would produce URLs like `.../v1api/stats` (404s).
        baseUrl: _normalizeBaseUrl(baseUrl),
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      _authInterceptor,
      RetryInterceptor(
        dio: _dio,
        maxAttempts: maxAttempts,
        baseDelayMs: retryDelay.inMilliseconds,
      ),
    ]);
  }

  /// Update the Bearer token at runtime.
  void setToken(String? token) => _authInterceptor.setToken(token);

  /// The current base URL.
  String get baseUrl => _dio.options.baseUrl;

  /// Update the base URL at runtime.
  set baseUrl(String url) => _dio.options.baseUrl = _normalizeBaseUrl(url);

  /// Dio concatenates [BaseOptions.baseUrl] and the request path verbatim,
  /// so the base URL must end with `/` for paths like `api/stats` to
  /// resolve to `.../v1/api/stats`.
  static String _normalizeBaseUrl(String url) =>
      url.endsWith('/') ? url : '$url/';

  /// The underlying [Dio] instance for advanced use cases.
  Dio get dio => _dio;

  // ─────────────────────────── GET ───────────────────────────

  /// Sends a GET request and returns the full response body.
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    final filtered = _stripNulls(queryParams);
    final response = await _guard(
      () => _dio.get<dynamic>(
        path,
        queryParameters: filtered.isNotEmpty ? filtered : null,
      ),
    );
    return _parseResponse(response);
  }

  /// Sends a GET request and returns the raw response body as a [String].
  ///
  /// Used for endpoints that return non-JSON content (e.g. RSS/XML feeds).
  Future<String> getRaw(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    final filtered = _stripNulls(queryParams);
    final response = await _guard(
      () => _dio.get<String>(
        path,
        queryParameters: filtered.isNotEmpty ? filtered : null,
        options: Options(responseType: ResponseType.plain),
      ),
    );
    return response.data ?? '';
  }

  // ─────────────────────────── POST ──────────────────────────

  /// Sends a POST request and returns the full response body.
  ///
  /// [body] is the JSON object to send. The caller decides which fields to
  /// include, so a null value is sent as `null` rather than omitted.
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, Object?>? body,
  }) async {
    final filtered = _stripNulls(queryParams);
    final response = await _guard(
      () => _dio.post<dynamic>(
        path,
        queryParameters: filtered.isNotEmpty ? filtered : null,
        data: body,
      ),
    );
    return _parseResponse(response);
  }

  /// Sends a POST request with multipart form data and returns the full
  /// response body.
  ///
  /// Used for every endpoint that can accept a file, whether or not one is
  /// attached — the API does not recognise these endpoints otherwise.
  ///
  /// [fields] holds the non-file form fields. A field with a null value is
  /// omitted, and the remaining values are sent with `toString()`. [file] is
  /// the optional attachment; it is sent under the field name `file` and is
  /// therefore never part of [fields].
  Future<Map<String, dynamic>> postMultipart(
    String path, {
    required Map<String, Object?> fields,
    TorboxFileUpload? file,
  }) async {
    final formData = FormData.fromMap({
      for (final entry in fields.entries)
        if (entry.value != null) entry.key: entry.value.toString(),
      if (file != null)
        'file': MultipartFile.fromBytes(file.bytes, filename: file.filename),
    });

    final response = await _guard(
      () => _dio.post<dynamic>(
        path,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      ),
    );
    return _parseResponse(response);
  }

  // ─────────────────────────── PUT ───────────────────────────

  /// Sends a PUT request and returns the full response body.
  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, Object?>? body,
  }) async {
    final filtered = _stripNulls(queryParams);
    final response = await _guard(
      () => _dio.put<dynamic>(
        path,
        queryParameters: filtered.isNotEmpty ? filtered : null,
        data: body,
      ),
    );
    return _parseResponse(response);
  }

  // ────────────────────────── DELETE ─────────────────────────

  /// Sends a DELETE request and returns the full response body.
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, Object?>? body,
  }) async {
    final filtered = _stripNulls(queryParams);
    final response = await _guard(
      () => _dio.delete<dynamic>(
        path,
        queryParameters: filtered.isNotEmpty ? filtered : null,
        data: body,
      ),
    );
    return _parseResponse(response);
  }

  // ───────────────────────── DOWNLOAD ────────────────────────

  /// Downloads a file and saves it to [savePath].
  ///
  /// Returns the absolute path of the saved file.
  Future<String> download(
    String path, {
    required String savePath,
    Map<String, dynamic>? queryParams,
  }) async {
    final filtered = _stripNulls(queryParams);
    await _guard(
      () => _dio.download(
        path,
        savePath,
        queryParameters: filtered.isNotEmpty ? filtered : null,
      ),
    );
    return savePath;
  }

  // ──────────────────────── HELPERS ──────────────────────────

  /// Runs a Dio call, converting any [DioException] into a
  /// [TorboxApiException] so no raw Dio errors escape the client.
  Future<T> _guard<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  /// Maps a [DioException] to a [TorboxApiException], preserving the
  /// envelope's error code and detail message when the server sent a
  /// JSON error body.
  TorboxApiException _toApiException(DioException e) {
    final status = e.response?.statusCode ?? -1;
    String? code;
    String? detail;
    final body = e.response?.data;
    if (body is Map<String, dynamic>) {
      // Same normalization as the envelope's `error` field.
      code = const TorBoxErrorCodeConverter().fromJson(body['error']);
      final rawDetail = body['detail'];
      if (rawDetail is String && rawDetail.isNotEmpty) detail = rawDetail;
    }
    return TorboxApiException(
      message: detail ?? e.message ?? 'Request failed',
      statusCode: status,
      errorCode: code,
      detail: detail,
      uri: e.requestOptions.uri,
    );
  }

  Map<String, dynamic> _parseResponse(Response<dynamic> response) {
    final body = response.data;

    if (body is Map<String, dynamic>) return body;

    // Non-JSON response (e.g. plain text from an error page).
    throw TorboxApiException(
      message: 'Unexpected response type: ${body.runtimeType}',
      statusCode: response.statusCode ?? -1,
    );
  }

  Map<String, dynamic> _stripNulls(Map<String, dynamic>? map) {
    if (map == null) return {};
    return Map.fromEntries(map.entries.where((e) => e.value != null));
  }
}
