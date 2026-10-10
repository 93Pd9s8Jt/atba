import 'package:dio/dio.dart';

/// Dio interceptor that injects a Bearer token into every outgoing request.
class AuthInterceptor extends Interceptor {
  String? _token;

  AuthInterceptor({String? token}) : _token = token;

  /// Update the token at runtime (e.g. after login or token refresh).
  void setToken(String? token) => _token = token;

  String? get token => _token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _token;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
