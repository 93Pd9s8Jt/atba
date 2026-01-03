import 'dart:convert';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_cache_core/http_cache_core.dart';
import 'package:http_cache_drift_store/http_cache_drift_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class TorboxCacheHttpClient {
  late final DriftCacheStore store;
  late final Duration defaultExpiry;

  static final _uuid = Uuid();

  TorboxCacheHttpClient({this.defaultExpiry = const Duration(minutes: 5)});

  Future<void> init() async {
    final appDocDir = kIsWeb ? "/cache" : (await getApplicationCacheDirectory()).path;
    store = DriftCacheStore(databasePath:  "$appDocDir/torbox_cache");
  }

  /// Generates a cache key based on Uri and headers.
  String _cacheKey(Uri uri, Map<String, String>? headers) {
    final normalizedHeaders = headers != null
        ? Map.fromEntries(
            headers.entries.map((e) => MapEntry(e.key.toLowerCase(), e.value)))
        : null;
    return _uuid.v5(Namespace.url.value,
        uri.toString() + (normalizedHeaders?.toString() ?? ''));
  }

  Future<void> _cacheRequest(String key, http.Response response,
      {Duration? expiry}) async {
    await store.set(await response.toCacheResponse(
        key: key,
        options: CacheOptions(
            store: store, maxStale: expiry ?? defaultExpiry),
        requestDate: DateTime.now()));
  }

  /// Checks all cache entries for expiry and removes expired ones.
  Future<void> _purgeExpired() async {
    store.clean(staleOnly: true);
  }

  /// Helper for matching endpoints
  bool _matches(String pattern, String path) =>
      RegExp(pattern.replaceFirst(r"^", "^(?:/v1)?")).hasMatch(path);

  /// Custom get method, similar to http.get, with advanced cache logic
  Future<http.Response> get(Uri uri,
      {Map<String, String>? headers,
      Duration? expiry,
      bool? cacheAndRefreshMylist}) async {
    await _purgeExpired();

    final path = uri.path;

    // --- NEVER CACHE ---
    const neverCacheEndpoints = [
      r'^/api/torrents/checkcached',
      r'^/api/stats',
      r'^/api/notifications/rss',
      r'^/api/notifications/mynotifications',
      r'^/api/user/me',
      r'^/api/user/getconfirmation',
      r'^/api/rss/getfeeds',
      r'^/api/rss/getfeeditems',
      r'^/api/integration/jobs($|/)',
      r'^/api/torrents/torrentinfo'
    ];
    for (final pattern in neverCacheEndpoints) {
      if (_matches(pattern, path)) {
        // Always fetch from network, never cache
        final response = await http.get(uri, headers: headers);
        return response;
      }
    }

    // --- ALWAYS CACHE ---
    const alwaysCacheEndpoints = [
      r'^/api/torrents/exportdata', // magnet/.torrent file
      r'^/api/torrents/requestdl',
      r'^/meta/',
    ];
    for (final pattern in alwaysCacheEndpoints) {
      if (_matches(pattern, path)) {
        return await _getWithCache(uri, headers,
            expiry: const Duration(days: 7));
      }
    }

    // --- TIME-BASED CACHE ---
    if (_matches(r'^/search/', path) ||
        _matches(r'^/torrents/', path) ||
        _matches(r'^/usenet/', path) ||
        _matches(r'^/webdl/', path)) {
      final isSearch =
          _matches(r'^/search/', path) || _matches(r'/search/', path);
      return await _getWithCache(
        uri,
        headers,
        expiry:
            isSearch ? const Duration(minutes: 10) : const Duration(minutes: 5),
      );
    }

    // --- Special: api/webdl/hosters ---
    if (_matches(r'^/api/webdl/hosters', path)) {
      return await _getWithCache(uri, headers, expiry: const Duration(days: 1));
    }

    // --- MYLIST endpoints ---
    if (_matches(r'^/api/(torrents|usenet|webdl)/mylist', path)) {
      final bypassCache = uri.queryParameters['bypass_cache'] == 'true';
      if (bypassCache) {
        // Never cache if bypass_cache param is present and true
        final response = await http.get(uri, headers: headers);
        _cacheRequest(_cacheKey(uri, headers), response);
        return response;
      } else {
        // Try to share cache between bypass_cache and non-bypass_cache
        Map<String, String> newQueryParameters = Map.from(uri.queryParameters);
        newQueryParameters['bypass_cache'] = "true";
        final bypassCacheUri = uri.replace(queryParameters: newQueryParameters);
        final bypassCacheKey = _cacheKey(bypassCacheUri, headers);

        return await _getWithCache(uri, headers,
            expiry: const Duration(days: 1), providedKey: bypassCacheKey);
      }
    }

    // --- Default: use network, but allow cache fallback on error ---
    try {
      final response = await http.get(uri, headers: headers);
      await store.set(await response.toCacheResponse(
          key: _cacheKey(uri, headers),
          options: CacheOptions(store: store),
          requestDate: DateTime.now()));
      return response;
    } catch (_) {
      // On error, try to return cache if available and not expired
      final key = _cacheKey(uri, headers);
      final cached = await store.get(key);
      if (cached != null && !cached.isStaled()) {
        final headers = cached.headers != null
            ? Map<String, String>.from(jsonDecode(utf8.decode(cached.headers!)))
            : <String, String>{};
        return http.Response.bytes(
          cached.content!,
          cached.statusCode,
          headers: headers,
          request: http.Request('GET', uri),
          isRedirect: false,
          persistentConnection: true,
          reasonPhrase: null,
        );
      }
      rethrow;
    }
  }

  /// Helper to get with cache and expiry
  Future<http.Response> _getWithCache(Uri uri, Map<String, String>? headers,
      {Duration? expiry, String? providedKey}) async {
    final key = providedKey ?? _cacheKey(uri, headers);
    final cached = await store.get(key);

    if (cached != null) {
      try {
        if (!cached.isStaled()) {
          print("Cache hit for $uri");
          final headersMap = cached.headers != null
              ? Map<String, String>.from(
                  jsonDecode(utf8.decode(cached.headers!)))
              : <String, String>{};
          return http.Response.bytes(
            cached.content!,
            cached.statusCode,
            headers: headersMap,
            request: http.Request('GET', uri),
            isRedirect: false,
            persistentConnection: true,
            reasonPhrase: null,
          );
        } else {
          await store.delete(key);
        }
      } catch (_) {
        await store.delete(key);
      }
    }

    // Not cached or expired, fetch from network
    final response = await http.get(uri, headers: headers);
    _cacheRequest(key, response);

    return response;
  }

  Future<void> clearCache() async {
    final appDocDir = kIsWeb ? "/cache" : (await getApplicationCacheDirectory()).path;
    await store.delete("$appDocDir/torbox_cache");
  }
}

extension ResponseExtension on http.Response {
  Future<CacheResponse> toCacheResponse({
    required String key,
    required CacheOptions options,
    required DateTime requestDate,
  }) async {
    final respDate = getDateHeaderValue(headers[dateHeader]);
    final expires = getExpiresHeaderValue(headers[expiresHeader]);

    final h = utf8.encode(jsonEncode(headers));

    return CacheResponse(
      cacheControl: CacheControl.fromHeader(
        headersSplitValues[cacheControlHeader],
      ),
      content: await options.cipher?.encryptContent(bodyBytes) ?? bodyBytes,
      date: respDate,
      eTag: headers[etagHeader],
      expires: expires,
      headers: await options.cipher?.encryptContent(h) ?? h,
      key: key,
      lastModified: headers[lastModifiedHeader],
      maxStale: (options.maxStale != null)
          ? DateTime.now().toUtc().add(options.maxStale!)
          : null,
      priority: options.priority,
      requestDate: requestDate,
      responseDate: respDate ?? DateTime.now().toUtc(),
      url: request!.url.toString(),
      statusCode: statusCode,
    );
  }

  /// Update cache headers on 304
  ///
  /// https://tools.ietf.org/html/rfc7232#section-4.1
  void updateCacheHeaders(http.Response response) {
    void updateNonNullHeader(String headerKey) {
      final value = response.headers[headerKey];
      if (value != null) headers[headerKey] = value;
    }

    updateNonNullHeader(cacheControlHeader);
    updateNonNullHeader(dateHeader);
    updateNonNullHeader(etagHeader);
    updateNonNullHeader(lastModifiedHeader);
    updateNonNullHeader(expiresHeader);
    updateNonNullHeader(contentLocationHeader);
    updateNonNullHeader(varyHeader);
  }
}
