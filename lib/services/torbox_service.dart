import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:atba/models/library_items/queued_torrent.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/models/library_items/torrent.dart' show Torrent;
import 'package:atba/services/library_page_state.dart';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:atba/config/constants.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart'
    show Settings;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:atba/services/cache/cache_dio_interceptor.dart';
import 'package:atba/services/cache/cache_http_client.dart';
import 'package:atba/services/secure_storage_service.dart';
import 'package:torbox_api/torbox_api.dart' as torbox;

TorboxAPIResponse _parseTorboxAPIResponse(dynamic json) {
  assert(
    json is Map<String, dynamic> || json is String,
    'Invalid JSON data type',
  );
  final jsonMap = json is String ? jsonDecode(json) : json;
  return TorboxAPIResponse.fromJson(jsonMap);
}

String _decodeResponseBody(List<int> bodyBytes) {
  return utf8.decode(bodyBytes);
}

class TorboxAPI {
  final SecureStorageService secureStorageService;
  TorboxCacheHttpClient? client;
  LibraryPageState? downloadsPageState;

  static const api_base = 'https://api.torbox.app';
  static const search_api_base = 'https://search-api.torbox.app';
  static const api_version = 'v1';

  /// The new-API facade. Kept in sync with [apiKey] by [_syncApi] so that
  /// individual calls never have to build or look one up.
  torbox.TorboxApi? _api;

  String? apiKey;
  String? googleToken;

  final String baseUrl;

  TorboxAPI({
    required this.secureStorageService,
    TorboxCacheHttpClient? client,
    this.baseUrl = '$api_base/$api_version',
    this.apiKey,
  }) : client = kIsWasm ? null : TorboxCacheHttpClient() {
    _syncApi();
  }

  /// Whether an API key is loaded and [_api] is ready to use.
  bool get hasApiKey => _api != null;

  Future<void> init() async {
    final results = await Future.wait([
      secureStorageService.read('api_key'),
      getGoogleToken(),
      client?.init() ?? Future.value(),
    ]);
    apiKey = results[0] as String?;
    googleToken = results[1] as String?;
    _syncApi();
  }

  void setDownloadsPageState(LibraryPageState state) {
    downloadsPageState = state;
  }

  /// Creates — or clears — the new-API facade to match the current [apiKey].
  void _syncApi() {
    _api = apiKey == null
        ? null
        : torbox.TorboxApi(token: apiKey!, baseUrl: baseUrl);
    // Registered after construction so it runs after the built-in auth
    // interceptor, and therefore sees the Authorization header that the
    // cache key is derived from.
    _api?.addInterceptor(TorboxCacheInterceptor(client: client));
  }

  /// Runs [call] and turns any failure into a legacy error response.
  ///
  /// The new client throws [torbox.TorboxApiException] where the legacy
  /// `_makeRequest` returned `success: false`, and callers across the app
  /// branch on `response.success` without catching, so the mapping happens
  /// here rather than at every call site.
  Future<TorboxAPIResponse> _guardCall(
    Future<TorboxAPIResponse> Function() call,
  ) async {
    if (_api == null) {
      return TorboxAPIResponse(
        success: false,
        error: 'MISSING_API_KEY',
        detail: 'API key not found',
      );
    }
    try {
      return await call();
    } on torbox.TorboxApiException catch (e) {
      return TorboxAPIResponse(
        success: false,
        error: e.errorCode ?? 'HTTP ${e.statusCode}',
        detail: e.detail ?? e.message,
      );
    } on Exception catch (e) {
      return TorboxAPIResponse(
        success: false,
        error: 'CLIENT_ERROR',
        detail: e.toString(),
      );
    }
  }

  /// Runs a new-API call and maps its typed envelope back to the legacy
  /// [TorboxAPIResponse] shape.
  ///
  /// [mapData] converts the typed payload into the loosely typed `data` that
  /// legacy callers expect (usually `toJson()`); omit it when the payload is
  /// already a plain value.
  Future<TorboxAPIResponse> _callApi<T>(
    Future<torbox.TorBoxResponse<T>> Function(torbox.TorboxApi api) call, {
    Object? Function(T data)? mapData,
  }) {
    return _guardCall(() async {
      final response = await call(_api!);
      final data = response.data;
      return TorboxAPIResponse(
        success: response.success,
        error: response.error,
        detail: response.detail,
        data: data == null ? null : (mapData == null ? data : mapData(data)),
      );
    });
  }

  /// Legacy request path, now used only by the search API (a different host
  /// the new package does not cover). New code should go through [_callApi].
  Future<TorboxAPIResponse> _makeRequest(
    String endpoint, {
    String method = "get",
    Map<String, dynamic>? body,
    String? baseUrl,
  }) async {
    const multiPartRequestStreamEndpoints = [
      // hardcoded due to strange bug that wouldn't let me pass this as a parameter
      'api/torrents/createtorrent',
      'api/usenet/createusenetdownload',
      'api/webdl/createwebdownload',
    ];
    final useMultipartRequestStream = multiPartRequestStreamEndpoints.contains(
      endpoint,
    );
    baseUrl ??= this.baseUrl;
    apiKey ??= await secureStorageService.read('api_key');
    if (apiKey == null) {
      throw Exception(
        'API key not found',
      ); // we should never make a request without the api key
    }

    final url = Uri.parse('$baseUrl/$endpoint');

    method = method.toLowerCase();

    late final int statusCode;
    late final String responseData;
    late final String responseReasonPhrase;

    switch (method) {
      case 'get':
        Map<String, dynamic> queryParameters = body ?? {};
        queryParameters.removeWhere((key, value) => value == null);
        queryParameters = queryParameters.map(
          (key, value) => MapEntry(key, value.toString()),
        );
        final requestUrl = Uri.https(
          url.authority,
          url.path,
          queryParameters.cast<String, dynamic>(),
        ); // adds body as query parameters
        final dynamic fetchClient;
        if (client != null &&
            Settings.getValue(Constants.useCache, defaultValue: true)!) {
          fetchClient = client;
        } else {
          fetchClient = http.Client();
        }
        final response = await fetchClient!.get(
          requestUrl,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        );
        statusCode = response.statusCode;
        responseData = await compute(
          _decodeResponseBody,
          response.bodyBytes as List<int>,
        );
        responseReasonPhrase = response.reasonPhrase ?? 'Unknown Error';
        break;
      case 'post':
        if (useMultipartRequestStream ||
            (body?.values.any((value) => value is PlatformFile) ?? false)) {
          var request = http.MultipartRequest('POST', url);
          for (String? key in body?.keys ?? []) {
            if (key == null || body?[key] == null || body?[key] == "") continue;
            if (body?[key] is PlatformFile) {
              request.files.add(
                await http.MultipartFile.fromPath(key, body?[key].path),
              );
            } else {
              request.fields[key] = body?[key];
            }
          }
          request.headers.addAll({
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            HttpHeaders.contentTypeHeader: 'application/json',
          });
          final streamedResponse = await request.send();
          final response = await http.Response.fromStream(streamedResponse);
          statusCode = response.statusCode;
          responseData = utf8.decode(response.bodyBytes);
          responseReasonPhrase = response.reasonPhrase ?? 'Unknown Error';
        } else {
          final response = await http.post(
            url,
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $apiKey',
              HttpHeaders.contentTypeHeader: 'application/json',
            },
            body: jsonEncode(body),
          );
          statusCode = response.statusCode;
          responseData = await compute(
            _decodeResponseBody,
            response.bodyBytes as List<int>,
          );
          responseReasonPhrase = response.reasonPhrase ?? 'Unknown Error';
        }
        break;
      case 'put':
        final response = await http.put(
          url,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(body),
        );
        statusCode = response.statusCode;
        responseData = await compute(_decodeResponseBody, response.bodyBytes);
        responseReasonPhrase = response.reasonPhrase ?? 'Unknown Error';
        break;
      case 'delete':
        final response = await http.delete(
          url,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        );
        statusCode = response.statusCode;
        responseData = await compute(_decodeResponseBody, response.bodyBytes);
        responseReasonPhrase = response.reasonPhrase ?? 'Unknown Error';
        break;
      default:
        throw Exception('Invalid request type');
    }

    if (statusCode == 200) {
      return await compute(_parseTorboxAPIResponse, responseData);
    } else {
      // first attempt to parse as torbox response:
      try {
        return await compute(_parseTorboxAPIResponse, responseData);
      } catch (e) {
        // if parsing fails, return as http error
        return TorboxAPIResponse.fromJson({
          "success": false,
          "error": "HTTP $statusCode",
          "detail": "HTTP $statusCode - $responseReasonPhrase",
        });
      }
    }
  }

  Future<void> deleteTorboxCache() async {
    await client?.store.clean();
  }

  Future<void> saveApiKey(String apiKeyToSave) async {
    await secureStorageService.write('api_key', apiKeyToSave);
    apiKey = apiKeyToSave;
    _syncApi();
    // now we add referral
    Future.microtask(() async {
      await deleteTorboxCache();
      await addReferralCode('61747744-fc2c-4580-907e-1e3816f54bfa');
    });
  }

  Future<void> deleteApiKey() async {
    await secureStorageService.delete('api_key');
    apiKey = null;
    _syncApi();
    Future.microtask(() async {
      await deleteTorboxCache();
    });
  }

  Future<void> saveGoogleToken(String token, String unixExpiryDate) async {
    await secureStorageService.write(Constants.googleDriveToken, token);
    await Settings.setValue(Constants.googleDriveTokenExpiry, unixExpiryDate);
    googleToken = token;
  }

  Future<String?> getGoogleToken() async {
    return await secureStorageService.read(Constants.googleDriveTokenExpiry);
  }

  Future<void> deleteGoogleToken() async {
    await secureStorageService.delete(Constants.googleDriveTokenExpiry);
    await Settings.setValue(Constants.googleDriveTokenExpiry, null);
    googleToken = null;
  }

  // Wrapper for the api calls

  // MAIN

  // #TORRENTS

  Future<TorboxAPIResponse> createTorrent({
    torbox.TorboxFileUpload? dotTorrentFile,
    String? magnetLink,
    SeedingPreference? seedingPreference,
    bool? allowZipping,
    String? torrentName,
    bool? asQueued,
  }) async {
    final response = await _callApi(
      (api) => api.torrents.createTorrent(
        file: dotTorrentFile,
        magnet: magnetLink,
        seed: seedingPreference?.index,
        allowZip: allowZipping,
        name: torrentName,
        asQueued: asQueued,
        addOnlyIfCached: null,
      ),
      mapData: (data) => data.toJson(),
    );

    final data = response.data;
    if (response.success && data is Map<String, dynamic>) {
      if (data['queued_id'] != null) {
        final newQueuedTorrent = QueuedTorrent.fromJsonStub(data);
        downloadsPageState?.addQueuedTorrent(newQueuedTorrent);
        downloadsPageState?.addItemsToCache([newQueuedTorrent]);
      }
      if (Settings.getValue(
        Constants.libraryForegroundUpdate,
        defaultValue: false,
      )!) {
        downloadsPageState?.startPeriodicUpdate<Torrent>(data['torrent_id']);
      }
    }
    return response;
  }

  Future<TorboxAPIResponse> controlTorrent(
    ControlTorrentType operation, {
    int? torrentId,
    bool? all,
  }) {
    return _callApi(
      (api) => api.torrents.controlTorrent(
        operation: operation.name,
        torrentId: torrentId,
        all: all,
      ),
    );
  }

  Future<TorboxAPIResponse> getTorrentDownloadUrl(
    int torrentId, {
    int? fileId,
    bool? zipLink,
    String? userIP,
  }) async {
    assert(
      fileId != null || zipLink != null,
      'Either fileId or zipLink must be provided',
    );
    return _callApi(
      (api) => api.torrents.requestDownloadLink(
        torrentId: torrentId,
        fileId: fileId,
        zipLink: zipLink,
        userIP: userIP,
        token: apiKey,
      ),
      mapData: (uri) => uri.toString(),
    );
  }

  Future<TorboxAPIResponse> getTorrentsList({
    bool? bypassCache,
    int? torrentId,
    int? offset,
    int? limit,
  }) {
    if (torrentId != null) {
      // The API returns a single object (not a list) for id queries.
      return _callApi(
        (api) =>
            api.torrents.getTorrent(id: torrentId, bypassCache: bypassCache),
        mapData: (torrent) => torrent.toJson(),
      );
    }
    return _callApi(
      (api) => api.torrents.getTorrentList(
        bypassCache: bypassCache,
        offset: offset,
        limit: limit,
      ),
      mapData: (torrents) =>
          torrents.map((torrent) => torrent.toJson()).toList(),
    );
  }

  Future<TorboxAPIResponse> checkIfTorrentCached(
    List<String> torrentHashes, {
    CheckCacheReturnFormat? returnFormat,
    bool? listFiles,
  }) {
    assert(
      torrentHashes.isNotEmpty,
      'At least one torrent hash must be provided',
    );
    if (returnFormat == CheckCacheReturnFormat.list) {
      return _callApi(
        (api) => api.torrents.checkCachedAvailabilityList(
          hashes: torrentHashes,
          format: returnFormat?.name,
          listFiles: listFiles,
        ),
        mapData: (entries) => entries.map((entry) => entry.toJson()).toList(),
      );
    }
    return _callApi(
      (api) => api.torrents.checkCachedAvailability(
        hashes: torrentHashes,
        format: returnFormat?.name,
        listFiles: listFiles,
      ),
      mapData: (entries) =>
          entries.map((key, entry) => MapEntry(key, entry.toJson())),
    );
  }

  Future<TorboxAPIResponse> exportTorrentData(
    int torrentId,
    ExportTorrentDataType exportType,
  ) async {
    if (exportType == ExportTorrentDataType.torrentFile) {
      // The API answers with the file itself, so it is streamed to disk and
      // the saved path is returned in `data`, as the legacy path did.
      final directory = await getApplicationDocumentsDirectory();
      return _guardCall(() async {
        final path = await _api!.torrents.exportTorrentDataAsTorrentFile(
          torrentId: torrentId,
          savePath: '${directory.path}/torrent_$torrentId.torrent',
        );
        return TorboxAPIResponse(
          success: true,
          error: null,
          detail: null,
          data: path,
        );
      });
    }
    return _callApi(
      (api) => api.torrents.exportTorrentDataAsMagnet(torrentId: torrentId),
    );
  }

  Future<TorboxAPIResponse> getTorrentData(String torrentHash, {int? timeout}) {
    return _callApi(
      (api) => api.torrents.getTorrentInfo(hash: torrentHash, timeout: timeout),
      mapData: (info) => info.toJson(),
    );
  }

  // #USENET

  Future<TorboxAPIResponse> createUsenetDownload({
    torbox.TorboxFileUpload? nzbFile,
    String? link,
    String? name,
    String? password,
    UsenetPostProcessing? postProcessing,
    bool? asQueued,
  }) {
    return _callApi(
      (api) => api.usenet.createUsenetDownload(
        file: nzbFile,
        link: link,
        name: name,
        password: password,
        postProcessing: postProcessing?.index,
        asQueued: asQueued,
      ),
      mapData: (data) => data.toJson(),
    );
  }

  Future<TorboxAPIResponse> controlUsenetDownload(
    ControlUsenetType operation, {
    int? usenetId,
    bool? all,
  }) {
    return _callApi(
      (api) => api.usenet.controlUsenetDownload(
        operation: operation.name,
        usenetId: usenetId,
        all: all,
      ),
    );
  }

  Future<TorboxAPIResponse> getUsenetDownloadUrl(
    int usenetId, {
    int? fileId,
    bool? zipLink,
    String? userIP,
  }) {
    assert(
      fileId != null || zipLink != null,
      'Either fileId or zipLink must be provided',
    );
    return _callApi(
      (api) => api.usenet.requestDownloadLink(
        usenetId: usenetId,
        fileId: fileId,
        zipLink: zipLink,
        userIP: userIP,
        token: apiKey,
      ),
      mapData: (uri) => uri.toString(),
    );
  }

  Future<TorboxAPIResponse> getUsenetDownloadsList({
    bool? bypassCache,
    int? usenetId,
    int? offset,
    int? limit,
  }) {
    if (usenetId != null) {
      // The API returns a single object (not a list) for id queries.
      return _callApi(
        (api) => api.usenet.getUsenet(id: usenetId, bypassCache: bypassCache),
        mapData: (download) => download.toJson(),
      );
    }
    return _callApi(
      (api) => api.usenet.getUsenetList(
        bypassCache: bypassCache,
        offset: offset,
        limit: limit,
      ),
      mapData: (downloads) =>
          downloads.map((download) => download.toJson()).toList(),
    );
  }

  Future<TorboxAPIResponse> checkIfUsenetCached(
    List<String> usenetHashes, {
    CheckCacheReturnFormat? returnFormat,
  }) {
    assert(usenetHashes.isNotEmpty, 'At least one nzb id must be provided');
    if (returnFormat == CheckCacheReturnFormat.list) {
      return _callApi(
        (api) => api.usenet.checkCachedAvailabilityList(
          hashes: usenetHashes,
          format: returnFormat?.name,
        ),
        mapData: (entries) => entries.map((entry) => entry.toJson()).toList(),
      );
    }
    return _callApi(
      (api) => api.usenet.checkCachedAvailability(
        hashes: usenetHashes,
        format: returnFormat?.name,
      ),
      mapData: (entries) =>
          entries.map((key, entry) => MapEntry(key, entry.toJson())),
    );
  }

  // #Web downloads/Debrid

  Future<TorboxAPIResponse> createWebDownload(
    String link, {
    String? name,
    String? password,
    bool? asQueued,
  }) {
    return _callApi(
      (api) => api.webDownloads.createWebDownload(
        link: link,
        name: name,
        password: password,
        asQueued: asQueued,
      ),
      mapData: (data) => data.toJson(),
    );
  }

  Future<TorboxAPIResponse> controlWebDownload(
    ControlWebdlType operation, {
    int? webId,
    bool? all,
  }) {
    return _callApi(
      (api) => api.webDownloads.controlWebDownload(
        operation: operation.name,
        webdlId: webId,
        all: all,
      ),
    );
  }

  Future<TorboxAPIResponse> getWebDownloadUrl(
    int webId, {
    int? fileId,
    bool? zipLink,
    String? userIP,
  }) {
    assert(
      fileId != null || zipLink != null,
      'Either fileId or zipLink must be provided',
    );
    return _callApi(
      (api) => api.webDownloads.requestDownloadLink(
        webId: webId,
        fileId: fileId,
        zipLink: zipLink,
        userIP: userIP,
        token: apiKey,
      ),
      mapData: (uri) => uri.toString(),
    );
  }

  Future<TorboxAPIResponse> getWebDownloadsList({
    bool? bypassCache,
    int? webId,
    int? offset,
    int? limit,
  }) {
    if (webId != null) {
      // The API returns a single object (not a list) for id queries.
      return _callApi(
        (api) => api.webDownloads.getWebDownload(
          id: webId,
          bypassCache: bypassCache,
        ),
        mapData: (download) => download.toJson(),
      );
    }
    return _callApi(
      (api) => api.webDownloads.getWebDownloadList(
        bypassCache: bypassCache,
        offset: offset,
        limit: limit,
      ),
      mapData: (downloads) =>
          downloads.map((download) => download.toJson()).toList(),
    );
  }

  Future<TorboxAPIResponse> checkIfWebDownloadCached(
    List<String> webLinks, {
    CheckCacheReturnFormat? returnFormat,
  }) {
    assert(webLinks.isNotEmpty, 'At least one web link must be provided');
    final hashes = webLinks
        .map((link) => md5.convert(utf8.encode(link)).toString())
        .toList();
    if (returnFormat == CheckCacheReturnFormat.list) {
      return _callApi(
        (api) => api.webDownloads.checkCachedAvailabilityList(
          hashes: hashes,
          format: returnFormat?.name,
        ),
        mapData: (entries) => entries.map((entry) => entry.toJson()).toList(),
      );
    }
    return _callApi(
      (api) => api.webDownloads.checkCachedAvailability(
        hashes: hashes,
        format: returnFormat?.name,
      ),
      mapData: (entries) =>
          entries.map((key, entry) => MapEntry(key, entry.toJson())),
    );
  }

  Future<TorboxAPIResponse> getWebHostersList() {
    return _callApi(
      (api) => api.webDownloads.getHosters(),
      mapData: (hosters) => hosters.map((hoster) => hoster.toJson()).toList(),
    );
  }

  // #General

  Future<TorboxAPIResponse> checkUpStatus() async {
    throw UnimplementedError(); // needs special handling because it just requests the base url
  }

  Future<TorboxAPIResponse> getStats() {
    return _callApi(
      (api) => api.general.getStats(),
      mapData: (stats) => stats.toJson(),
    );
  }

  // #Notifications
  Future<TorboxAPIResponse> getRSSNotificationFeed() {
    // XML feed: there is no JSON envelope to map, so the raw document is
    // returned as `data` (as the legacy path did).
    return _guardCall(() async {
      final feed = await _api!.notifications.getRssNotificationFeed(
        token: apiKey,
      );
      return TorboxAPIResponse(
        success: true,
        error: null,
        detail: null,
        data: feed.xml,
      );
    });
  }

  Future<TorboxAPIResponse> getJSONNotificationFeed() {
    return _callApi(
      (api) => api.notifications.getNotificationFeed(),
      mapData: (notifications) =>
          notifications.map((notification) => notification.toJson()).toList(),
    );
  }

  Future<TorboxAPIResponse> clearAllNotifications() {
    return _callApi((api) => api.notifications.clearAllNotifications());
  }

  Future<TorboxAPIResponse> clearNotification(int notificationId) {
    return _callApi(
      (api) => api.notifications.clearNotification(notificationId),
    );
  }

  Future<TorboxAPIResponse> sendTestNotification() {
    return _callApi((api) => api.notifications.sendTestNotification());
  }

  // #User

  Future<TorboxAPIResponse> getUserData({bool? getSettings}) {
    return _callApi(
      (api) => api.user.getUserData(settings: getSettings),
      mapData: (user) => user.toJson(),
    );
  }

  Future<TorboxAPIResponse> addReferralCode(String referralCode) {
    return _callApi((api) => api.user.addReferral(referralCode));
  }

  Future<TorboxAPIResponse> requestConfirmationCode() {
    return _callApi((api) => api.user.getConfirmation());
  }

  // #RSS feeds

  Future<TorboxAPIResponse> addRSSFeed(
    String url,
    String name, {
    String? definitelyAddRegex,
    String? dontAddRegex,
    num? dontAddifOlderThanDays,
    int? minutesScanInterval,
    bool? ensurePassDuplicateCheck,
    FileType? rssType,
    SeedingPreference? seedingPreference,
  }) {
    assert(
      minutesScanInterval == null || minutesScanInterval >= 10,
      'minutesScanInterval must be at least 10',
    );
    return _callApi(
      (api) => api.rssFeeds.addRssFeed(
        url: url,
        name: name,
        doRegex: definitelyAddRegex,
        dontRegex: dontAddRegex,
        dontOlderThan: dontAddifOlderThanDays?.toInt(),
        scanInterval: minutesScanInterval,
        passCheck: ensurePassDuplicateCheck,
        rssType: rssType?.name,
        torrentSeeding: seedingPreference?.index,
      ),
    );
  }

  Future<TorboxAPIResponse> controlRSSFeed(int rssId, RssOperation operation) {
    return _callApi(
      (api) => api.rssFeeds.controlRssFeed(
        operation: operation.name,
        rssFeedId: rssId,
      ),
    );
  }

  Future<TorboxAPIResponse> modifyRSSFeed(
    int rssId, {
    String? name,
    String? definitelyAddRegex,
    String? dontAddRegex,
    num? dontAddifOlderThanDays,
    int? minutesScanInterval,
    bool? ensurePassDuplicateCheck,
    FileType? rssType,
    SeedingPreference? seedingPreference,
  }) {
    return _callApi(
      (api) => api.rssFeeds.modifyRssFeed(
        rssFeedId: rssId,
        name: name,
        doRegex: definitelyAddRegex,
        dontRegex: dontAddRegex,
        dontOlderThan: dontAddifOlderThanDays?.toInt(),
        scanInterval: minutesScanInterval,
        passCheck: ensurePassDuplicateCheck,
        rssType: rssType?.name,
        torrentSeeding: seedingPreference?.index,
      ),
    );
  }

  Future<TorboxAPIResponse> getRSSFeeedsList({int? rssId}) {
    return _callApi(
      (api) => api.rssFeeds.getRssFeeds(id: rssId),
      mapData: (feeds) => feeds.map((feed) => feed.toJson()).toList(),
    );
  }

  Future<TorboxAPIResponse> getRSSFeedItems(int rssId) {
    return _callApi(
      (api) => api.rssFeeds.getRssFeedItems(rssFeedId: rssId),
      mapData: (items) => items.map((item) => item.toJson()).toList(),
    );
  }

  // #Integrations

  Future<TorboxAPIResponse> queueIntegration(
    QueueableIntegration integration,
    int id, {
    int? fileId,
    bool? zip,
    IntegrationFileType? type,
  }) {
    assert(
      fileId != null || zip != null,
      'Either fileId or zip must be provided',
    );
    final String? token;
    switch (integration) {
      case QueueableIntegration.google:
        token = googleToken;
      case QueueableIntegration.onedrive:
      case QueueableIntegration.gofile:
      case QueueableIntegration.onefichier:
        // Only Google Drive has a token available on this device.
        token = null;
    }
    assert(
      token != null && token.isNotEmpty,
      'Token for ${integration.name} is not available',
    );
    return _callApi((api) {
      return switch (integration) {
        QueueableIntegration.google => api.integrations.addToGoogleDrive(
          id: id,
          fileId: fileId,
          zip: zip,
          type: type?.name,
          googleToken: token,
        ),
        QueueableIntegration.onedrive => api.integrations.addToOneDrive(
          id: id,
          fileId: fileId,
          zip: zip,
          type: type?.name,
          onedriveToken: token,
        ),
        QueueableIntegration.gofile => api.integrations.addToGofile(
          id: id,
          fileId: fileId,
          zip: zip,
          type: type?.name,
          gofileToken: token,
        ),
        QueueableIntegration.onefichier => api.integrations.addToOneFichier(
          id: id,
          fileId: fileId,
          zip: zip,
          type: type?.name,
          onefichierToken: token,
        ),
      };
    });
  }

  Future<TorboxAPIResponse> getAllJobs() {
    return _callApi(
      (api) => api.integrations.getAllJobs(),
      mapData: (jobs) => jobs.map((job) => job.toJson()).toList(),
    );
  }

  Future<TorboxAPIResponse> getJobStatusById(int jobId) {
    return _callApi(
      (api) => api.integrations.getJobById(jobId),
      mapData: (job) => job.toJson(),
    );
  }

  Future<TorboxAPIResponse> getJobStatusByHash(String hash) {
    return _callApi(
      (api) => api.integrations.getJobsByHash(hash),
      mapData: (jobs) => jobs.map((job) => job.toJson()).toList(),
    );
  }

  Future<TorboxAPIResponse> cancelJobById(int jobId) {
    return _callApi((api) => api.integrations.cancelJob(jobId));
  }

  // #Queued

  Future<TorboxAPIResponse> getQueuedItemsList({
    bool? bypassCache,
    int? id,
    int? offset,
    int? limit,
    FileType? type,
  }) {
    return _callApi(
      (api) => api.queued.getQueuedDownloads(
        bypassCache: bypassCache,
        id: id,
        offset: offset,
        limit: limit,
        type: type?.name,
      ),
      mapData: (items) => items.map((item) => item.toJson()).toList(),
    );
  }

  // #Search API

  Future<TorboxAPIResponse> getMetadata(IdType idType, String id) async {
    return _makeRequest(
      'meta/${idType.name}:$id',
      method: 'get',
      baseUrl: search_api_base,
    );
  }

  Future<TorboxAPIResponse> searchMetadata(
    String query, {
    TorboxSearchType? type,
  }) async {
    return _makeRequest(
      'search/$query',
      method: 'get',
      baseUrl: search_api_base,
      body: {'type': type?.name},
    );
  }

  Future<TorboxAPIResponse> searchTorrentsById(
    IdType idType,
    String id, {
    bool? metadata,
    int? season,
    int? episode,
    bool? checkCache,
    bool? checkOwned,
    bool? searchUserEngines,
  }) async {
    return _makeRequest(
      'torrents/${idType.name}:$id',
      method: 'get',
      baseUrl: search_api_base,
      body: {
        'metadata': metadata,
        'season': season,
        'episode': episode,
        'check_cache': checkCache,
        'check_owned': checkOwned,
        'search_user_engines': searchUserEngines,
      },
    );
  }

  Future<TorboxAPIResponse> searchTorrents(
    String query, {
    bool? metadata,
    bool? checkCache,
    bool? checkOwned,
    bool? searchUserEngines,
  }) async {
    return _makeRequest(
      'torrents/search/$query',
      method: 'get',
      baseUrl: search_api_base,
      body: {
        'metadata': metadata,
        'check_cache': checkCache,
        'check_owned': checkOwned,
        'search_user_engines': searchUserEngines,
      },
    );
  }

  Future<TorboxAPIResponse> searchUsenetById(
    IdType idType,
    String id, {
    bool? metadata,
    int? season,
    int? episode,
    bool? checkCache,
    bool? checkOwned,
    bool? searchUserEngines,
  }) async {
    return _makeRequest(
      'usenet/${idType.name}:$id',
      method: 'get',
      baseUrl: search_api_base,
      body: {
        'metadata': metadata,
        'season': season,
        'episode': episode,
        'check_cache': checkCache,
        'check_owned': checkOwned,
        'search_user_engines': searchUserEngines,
      },
    );
  }

  Future<TorboxAPIResponse> searchUsenet(
    String query, {
    bool? metadata,
    int? season,
    int? episode,
    bool? checkCache,
    bool? checkOwned,
    bool? searchUserEngines,
  }) async {
    return _makeRequest(
      'usenet/search/$query',
      method: 'get',
      baseUrl: search_api_base,
      body: {
        'metadata': metadata,
        'season': season,
        'episode': episode,
        'check_cache': checkCache,
        'check_owned': checkOwned,
        'search_user_engines': searchUserEngines,
      },
    );
  }

  Future<TorboxAPIResponse> controlQueuedItem(
    QueuedItemOperation operation, {
    int? queuedId,
    bool? all,
  }) {
    assert(
      queuedId != null || all != null,
      'Either queuedId or all must be provided',
    );
    assert(
      queuedId == null || all == null,
      'Only one of queuedId or all can be provided',
    );
    assert(
      operation != QueuedItemOperation.start || all == null,
      'all can only be true for delete operation',
    );
    return _callApi(
      (api) => api.queued.controlQueuedDownload(
        operation: operation.name,
        queuedId: queuedId,
        all: all,
      ),
    );
  }

  // Relay
}

enum SeedingPreference { auto, seed, dontSeed }

extension SeedingPreferenceExtension on SeedingPreference {
  int get index {
    switch (this) {
      case SeedingPreference.auto:
        return 1;
      case SeedingPreference.seed:
        return 2;
      case SeedingPreference.dontSeed:
        return 3;
    }
  }
}

enum ControlTorrentType { reannounce, delete, resume, stop }

extension ControlTorrentTypeExtension on ControlTorrentType {
  String get name {
    switch (this) {
      case ControlTorrentType.reannounce:
        return 'reannounce';
      case ControlTorrentType.delete:
        return 'delete';
      case ControlTorrentType.resume:
        return 'resume';
      case ControlTorrentType.stop:
        return 'stop_seeding';
    }
  }
}

enum ControlUsenetType { delete, resume, stop }

extension ControlUsenetTypeExtension on ControlUsenetType {
  String get name {
    switch (this) {
      case ControlUsenetType.delete:
        return 'delete';
      case ControlUsenetType.resume:
        return 'resume';
      case ControlUsenetType.stop:
        return 'pause';
    }
  }
}

enum ControlWebdlType { delete }

extension ControlWebdlTypeExtension on ControlWebdlType {
  String get name {
    switch (this) {
      case ControlWebdlType.delete:
        return 'delete';
    }
  }
}

enum CheckCacheReturnFormat { object, list }

extension CheckCacheReturnFormatExtension on CheckCacheReturnFormat {
  String get name {
    switch (this) {
      case CheckCacheReturnFormat.object:
        return 'object';
      case CheckCacheReturnFormat.list:
        return 'list';
    }
  }
}

enum ExportTorrentDataType { magnet, torrentFile }

extension ExportTorrentDataTypeExtension on ExportTorrentDataType {
  String get name {
    switch (this) {
      case ExportTorrentDataType.magnet:
        return 'magnet';
      case ExportTorrentDataType.torrentFile:
        return 'file';
    }
  }
}

enum UsenetPostProcessing {
  none,
  defaultProcessing,
  repair,
  repairAndUnpack,
  repairAndUnpackAndDelete,
}

extension UsenetPostProcessingExtension on UsenetPostProcessing {
  int get index {
    switch (this) {
      case UsenetPostProcessing.defaultProcessing:
        return -1;
      case UsenetPostProcessing.none:
        return 0;
      case UsenetPostProcessing.repair:
        return 1;
      case UsenetPostProcessing.repairAndUnpack:
        return 2;
      case UsenetPostProcessing.repairAndUnpackAndDelete:
        return 3;
    }
  }
}

enum FileType { torrent, usenet, webdl }

extension FileTypeExtension on FileType {
  String get name {
    switch (this) {
      case FileType.torrent:
        return 'torrent';
      case FileType.usenet:
        return 'usenet';
      case FileType.webdl:
        return 'webdl';
    }
  }
}

enum RssOperation { update, delete, resume, pause }

extension RssOperationExtension on RssOperation {
  String get name {
    switch (this) {
      case RssOperation.update:
        return 'update';
      case RssOperation.delete:
        return 'delete';
      case RssOperation.resume:
        return 'resume';
      case RssOperation.pause:
        return 'pause';
    }
  }
}

enum IntegrationProvider { google, dropbox, discord, onedrive }

extension IntegrationProvidersExtension on IntegrationProvider {
  String get name {
    switch (this) {
      case IntegrationProvider.google:
        return 'google';
      case IntegrationProvider.dropbox:
        return 'dropbox';
      case IntegrationProvider.discord:
        return 'discord';
      case IntegrationProvider.onedrive:
        return 'onedrive';
    }
  }
}

enum QueueableIntegration { google, onedrive, gofile, onefichier }

extension QueueableIntegrationExtension on QueueableIntegration {
  String get name {
    switch (this) {
      case QueueableIntegration.google:
        return 'googledrive';
      case QueueableIntegration.onedrive:
        return 'onedrive';
      case QueueableIntegration.gofile:
        return 'gofile';
      case QueueableIntegration.onefichier:
        return '1fichier';
    }
  }
}

enum IntegrationFileType { torrent, usenet, webdownload }

extension IntegrationFileTypeExtension on IntegrationFileType {
  String get name {
    switch (this) {
      case IntegrationFileType.torrent:
        return 'torrent';
      case IntegrationFileType.usenet:
        return 'usenet';
      case IntegrationFileType.webdownload:
        return 'webdownload';
    }
  }
}

enum IntegrationjobStatus { pending, uploading, completed, failed }

extension IntegrationjobStatusExtension on IntegrationjobStatus {
  String get name {
    switch (this) {
      case IntegrationjobStatus.pending:
        return 'pending';
      case IntegrationjobStatus.uploading:
        return 'uploading';
      case IntegrationjobStatus.completed:
        return 'completed';
      case IntegrationjobStatus.failed:
        return 'failed';
    }
  }
}

enum QueuedItemOperation { delete, start }

extension QueuedItemOperationExtension on QueuedItemOperation {
  String get name {
    switch (this) {
      case QueuedItemOperation.delete:
        return 'delete';
      case QueuedItemOperation.start:
        return 'start';
    }
  }
}

enum IdType { imdb, tmdb, tvdb, mal }

extension IdTypeExtension on IdType {
  String get name {
    switch (this) {
      case IdType.imdb:
        return 'imdb';
      case IdType.tmdb:
        return 'tmdb';
      case IdType.tvdb:
        return 'tvdb';
      case IdType.mal:
        return 'mal';
    }
  }
}

enum TorboxSearchType { media, file }

extension SearchTypeExtension on TorboxSearchType {
  String get name {
    switch (this) {
      case TorboxSearchType.media:
        return 'media';
      case TorboxSearchType.file:
        return 'file';
    }
  }
}
