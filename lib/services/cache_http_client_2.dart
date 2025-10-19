import 'package:dio/dio.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path_provider/path_provider.dart';

class TorboxCacheHttpClient {
  late final Dio dio;
  late final CacheOptions cacheOptions;
  late final CacheStore store;

  TorboxCacheHttpClient();

  Future<void> init() async {
    // initialize Hive-based cache store
    final appDocDir = await getApplicationCacheDirectory();
    store = FileCacheStore("${appDocDir.path}/torbox_cache");

    cacheOptions = CacheOptions(
      store: store,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(hours: 1),
    );

    dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
    ));

    dio.transformer = FusedTransformer(contentLengthIsolateThreshold: 10 ^ 6);

    // Add your custom interceptors **before** the cache interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final path = options.uri.path;

        // Helper for matching endpoints
        bool matches(String pattern) =>
            RegExp(pattern.replaceFirst(r"^", "^(?:/v1)?"))
                .hasMatch(path); // replacement handles api versioning

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
          if (matches(pattern)) {
            options.extra =
                cacheOptions.copyWith(policy: CachePolicy.noCache).toExtra();
            return handler.next(options);
          }
        }

        // --- ALWAYS CACHE ---
        const alwaysCacheEndpoints = [
          r'^/api/torrents/exportdata',
          r'^/api/torrents/requestdl',
          r'^/meta/',
        ];
        for (final pattern in alwaysCacheEndpoints) {
          if (matches(pattern)) {
            options.extra = cacheOptions
                .copyWith(
                    policy: CachePolicy.forceCache,
                    maxStale: const Duration(days: 7))
                .toExtra();
            return handler.next(options);
          }
        }

        // --- TIME-BASED CACHE ---
        // search/*, torrents/*, torrents/search/*, usenet/search/*, usenet/*, webdl/*
        if (matches(r'^/search/') ||
            matches(r'^/torrents/') ||
            matches(r'^/usenet/') ||
            matches(r'^/webdl/')) {
          // Use a 10 min cache for search, 5 min for others
          final isSearch = matches(r'^/search/') || matches(r'/search/');
          options.extra = cacheOptions
              .copyWith(
                policy: CachePolicy.forceCache,
                maxStale: isSearch
                    ? const Duration(minutes: 10)
                    : const Duration(minutes: 5),
              )
              .toExtra();
          return handler.next(options);
        }

        // // --- Special: api/torrents/torrentinfo ---
        // if (matches(r'^/api/torrents/torrentinfo')) {

        //   final CacheResponse? cache = await store.get(key);
        //   if (cache == null) {
        //     options.extra = cacheOptions.copyWith(policy: CachePolicy.forceCache).toExtra();
        //   } else {
        //     final cachedResponse = cache.toResponse(options);
        //     // Check if the cached response indicates the torrent is inactive/completed
        //     final parsedResponse = TorboxAPIResponse.fromJson(jsonDecode(utf8.decode(cachedResponse.data)));
        //     parsedResponse.data.
        //   }

        //   // Only cache if torrent is inactive/completed (cannot know here, so default to 5 min)
        //   options.extra = cacheOptions.copyWith(
        //     policy: CachePolicy.forceCache,
        //     maxStale: const Duration(minutes: 5),
        //   ).toExtra();
        //   return handler.next(options);
        // }

        // --- Special: api/webdl/hosters ---
        if (matches(r'^/api/webdl/hosters')) {
          options.extra = cacheOptions
              .copyWith(
                policy: CachePolicy.forceCache,
                maxStale: const Duration(days: 1),
              )
              .toExtra();
          return handler.next(options);
        }

        // --- MYLIST endpoints ---
        if (matches(r'^/api/(torrents|usenet|webdl)/mylist')) {
          // options.extra = cacheOptions
          //     .copyWith(
          //       policy: CachePolicy.noCache,
          //     )
          //     .toExtra();
          // return handler.next(options);
          final bypassCache =
              options.uri.queryParameters['bypass_cache'] == 'true';

          // mylist be cached except
          // - if called with bypasscache
          // - if new api key is used, delete all cache
          // - should be refreshed on app start (background) and have a 1 day expiry
          // If bypass_cache param is present and true, do not cache

          if (bypassCache) {
            options.extra =
                cacheOptions.copyWith(policy: CachePolicy.noCache).toExtra();
            print("Bypassing cache for mylist due to bypass_cache param");
          } else {
            Map<String, String> queryParameters =
                Map.from(options.uri.queryParameters);
            queryParameters['bypass_cache'] =
                "true"; // we need to check if this is newer than the cached version
            final bypassCacheKey = CacheOptions.defaultCacheKeyBuilder(
                url: options.uri.replace(queryParameters: queryParameters),
                headers: options.headers.cast<String, String>());

            final CacheResponse? cache = await store.get(bypassCacheKey);
            if (cache != null) {
              // overwrite the no bypass_cache with the bypass_cache version
              final noBypassCacheKey = CacheOptions.defaultCacheKeyBuilder(
                  url: options.uri,
                  headers: options.headers.cast<String, String>());
              CacheResponse newCache = cache.copyWith(
                  key: noBypassCacheKey, url: options.uri.toString());
              await store.set(newCache);
              // now we can finally return the cache
              options.extra = cacheOptions
                  .copyWith(
                    policy: CachePolicy.forceCache,
                    maxStale: const Duration(days: 1),
                  )
                  .toExtra();
              print("Using shared cache forceCache");
            } else {
              // there is no cache, so we can return normally
              options.extra = cacheOptions
                  .copyWith(
                    policy: CachePolicy.forceCache,
                    maxStale: const Duration(days: 1),
                  )
                  .toExtra();
              print("No cached mylist data, forceCache");
            }
          }
          return handler.next(options);
        }

        // --- Default: use network, but allow cache fallback on error ---
        options.extra = cacheOptions
            .copyWith(
                policy: CachePolicy.noCache, hitCacheOnNetworkFailure: true)
            .toExtra();

        return handler.next(options);
      },
    ));

    // Finally add the cache interceptor
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  Future<Response> get(Uri uri, Map<String, String> headers) async {
    final extra = Map<String, dynamic>.from(cacheOptions.toExtra());
    extra['headers'] = headers;
    final opts = Options(
      headers: headers,
      extra: extra,
    );
    return await dio.get(uri.toString(), options: opts);
  }

  Future<void> clearCache() async {
    final appDocDir = await getApplicationCacheDirectory();
    await store.delete("${appDocDir.path}/torbox_cache");
  }
}
