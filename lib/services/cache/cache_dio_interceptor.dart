import 'dart:convert';

import 'package:atba/config/constants.dart';
import 'package:atba/services/cache/cache_http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart'
    show Settings;
import 'package:http/http.dart' as http;

/// Serves GET requests through [TorboxCacheHttpClient] so the TorBox API
/// client keeps the existing Drift-backed cache.
///
/// [TorboxCacheHttpClient] already implements every caching rule — the
/// never/always/time-based endpoint lists, `bypass_cache` handling, and
/// falling back to a cached body when the network fails — so this adapter
/// only bridges the two HTTP stacks. Everything that is not a cacheable GET
/// is handed straight to Dio.
///
/// Register it on the API client *after* construction (see
/// `TorboxAPI._syncApi`) so it runs after the built-in auth interceptor and
/// therefore sees the `Authorization` header, which the cache key includes.
class TorboxCacheInterceptor extends Interceptor {
  final TorboxCacheHttpClient? client;

  TorboxCacheInterceptor({this.client});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cache = client;
    if (cache == null ||
        options.method.toUpperCase() != 'GET' ||
        !_isResolvable(options.responseType) ||
        !(Settings.getValue(Constants.useCache, defaultValue: true) ?? true)) {
      handler.next(options);
      return;
    }

    Future<void>(() async {
      final response = await cache.get(
        options.uri,
        headers: {
          for (final entry in options.headers.entries)
            entry.key: entry.value.toString(),
        },
      );
      handler.resolve(
        Response<dynamic>(
          data: _body(response, options.responseType),
          requestOptions: options,
          statusCode: response.statusCode,
          statusMessage: response.reasonPhrase,
          headers: Headers.fromMap({
            for (final entry in response.headers.entries)
              entry.key: [entry.value],
          }),
        ),
      );
    }).catchError((Object error, StackTrace stackTrace) {
      // Report transport failures the way Dio expects, so the client's error
      // mapping (and its retry interceptor) still apply.
      handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          stackTrace: stackTrace,
        ),
        true,
      );
    });
  }

  /// Whether a cached body can stand in for what the request asked for.
  ///
  /// `stream` and `bytes` are excluded: `Dio.download` writes
  /// `response.data.stream` to disk, so resolving anything but a real
  /// response body there would break the download. Those requests (the
  /// `.torrent` export) therefore always hit the network.
  bool _isResolvable(ResponseType responseType) =>
      responseType == ResponseType.json ||
      responseType == ResponseType.plain;

  /// JSON bodies are handed to the API client as decoded maps; plain-text
  /// responses (the XML feed) stay strings; anything else is passed through
  /// as bytes.
  dynamic _body(http.Response response, ResponseType responseType) {
    if (responseType == ResponseType.plain) return response.body;
    final contentType = response.headers['content-type'] ?? '';
    if (contentType.contains('json')) {
      try {
        return jsonDecode(response.body);
      } on FormatException {
        return response.bodyBytes;
      }
    }
    return response.bodyBytes;
  }
}
