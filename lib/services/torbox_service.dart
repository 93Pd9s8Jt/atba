import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/models/torrent.dart' show QueuedTorrent, Torrent;
import 'package:atba/services/library_page_state.dart';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart'
    show Settings;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:atba/services/cache_http_client.dart';
import 'package:atba/services/secure_storage_service.dart';

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
  DownloadsPageState? downloadsPageState;

  static const api_base = 'https://api.torbox.app';
  static const search_api_base = 'https://search-api.torbox.app';
  static const api_version = 'v1';

  String? apiKey;
  String? googleToken;

  final String baseUrl;

  TorboxAPI({
    required this.secureStorageService,
    TorboxCacheHttpClient? client,
    this.baseUrl = '$api_base/$api_version',
    this.apiKey,
  }) : client = TorboxCacheHttpClient();

  Future<void> init() async {
    final results = await Future.wait([
      secureStorageService.read('api_key'),
      getGoogleToken(),
      client!.init(),
    ]);
    apiKey = results[0] as String?;
    googleToken = results[1] as String?;
  }

  void setDownloadsPageState(DownloadsPageState state) {
    downloadsPageState = state;
  }

  Future<TorboxAPIResponse> makeRequest(
    String endpoint, {
    String method = "get",
    SuccessReturnType returnType = SuccessReturnType.jsonResponse,
    Map<String, dynamic> body = const {},
    String? baseUrl,
  }) async {
    const multiPartRequestStreamEndpoints = [
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
        Map<String, dynamic> queryParameters = body;
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
        if (Settings.getValue("key-use-cache", defaultValue: true)!) {
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
        if (body.values.any((value) => value is PlatformFile) ||
            useMultipartRequestStream) {
          var request = http.MultipartRequest('POST', url);
          for (String? key in body.keys) {
            if (key == null || body[key] == null || body[key] == "") continue;
            if (body[key] is PlatformFile) {
              request.files.add(
                await http.MultipartFile.fromPath(key, body[key].path),
              );
            } else {
              request.fields[key] = body[key];
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
      if (returnType == SuccessReturnType.file) {
        // TODO: detect from content type
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/torrent_${body['id']}.torrent';
        final file = File(filePath);
        await file.writeAsString(responseData);
        return TorboxAPIResponse.fromJson({
          'success': true,
          'error': null,
          'detail': '',
          'data': filePath,
        });
      } else if (returnType == SuccessReturnType.xml) {
        return TorboxAPIResponse.fromJson({
          'success': true,
          'error': null,
          'detail': '',
          'data': responseData,
        });
      } else {
        return await compute(_parseTorboxAPIResponse, responseData);
      }
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
    // now we add referral
    Future.microtask(() async {
      await deleteTorboxCache();
      await addReferralCode('61747744-fc2c-4580-907e-1e3816f54bfa');
    });
  }

  Future<void> deleteApiKey() async {
    await secureStorageService.delete('api_key');
    apiKey = null;
    Future.microtask(() async {
      await deleteTorboxCache();
    });
  }

  Future<void> saveGoogleToken(String token, String UnixExpiryDate) async {
    await secureStorageService.write('google_drive_token', token);
    await Settings.setValue('google_drive_token_expiry', UnixExpiryDate);
    googleToken = token;
  }

  Future<String?> getGoogleToken() async {
    return await secureStorageService.read('google_drive_token');
  }

  Future<void> deleteGoogleToken() async {
    await secureStorageService.delete('google_drive_token');
    await Settings.setValue('google_drive_token_expiry', null);
    googleToken = null;
  }

  // Wrapper for the api calls

  // MAIN

  // #TORRENTS

  Future<TorboxAPIResponse> createTorrent({
    PlatformFile? dotTorrentFile,
    String? magnetLink,
    SeedingPreference? seedingPreference,
    bool? allowZipping,
    String? torrentName,
    bool? asQueued,
  }) async {
    assert(
      dotTorrentFile != null || magnetLink != null,
      'Either dotTorrentFile or magnetLink must be provided',
    );
    assert(
      dotTorrentFile == null || magnetLink == null,
      'Only one of dotTorrentFile or magnetLink can be provided',
    );
    final response = await makeRequest(
      'api/torrents/createtorrent',
      method: 'post',
      body: {
        'file': dotTorrentFile,
        'magnet': magnetLink,
        'seeding_preference': seedingPreference?.index,
        'allow_zipping': allowZipping,
        'torrent_name': torrentName,
        'as_queued': asQueued,
      },
    );
    if (response.success && response.data != null) {
      if (response.data.containsKey('queued_id')) {
        final newQueuedTorrent = QueuedTorrent.fromJson(response.data);
        downloadsPageState?.addQueuedTorrent(newQueuedTorrent);
        downloadsPageState?.addItemsToCache([newQueuedTorrent]);
      }
      if (Settings.getValue(
        "key-library-foreground-update",
        defaultValue: false,
      )!) {
        downloadsPageState?.startPeriodicUpdate<Torrent>(
          response.data['torrent_id'],
        );
      }
    }
    return response;
  }

  Future<TorboxAPIResponse> controlTorrent(
    ControlTorrentType operation, {
    int? torrentId,
    bool? all,
  }) async {
    assert(
      torrentId != null || all != null,
      'Either torrentId or all must be provided',
    );
    return makeRequest(
      'api/torrents/controltorrent',
      method: 'post',
      body: {'torrent_id': torrentId, 'operation': operation.name, 'all': all},
    );
  }

  Future<TorboxAPIResponse> getTorrentDownloadUrl(
    int torrentId, {
    int? fileId,
    bool? zipLink,
    bool? returnTorrentFile,
    String? userIP,
  }) async {
    assert(
      fileId != null || zipLink != null,
      'Either fileId or zipLink must be provided',
    );
    return makeRequest(
      'api/torrents/requestdl',
      method: 'get',
      returnType: returnTorrentFile == null
          ? SuccessReturnType.jsonResponse
          : SuccessReturnType.file,
      body: {
        'token': apiKey,
        'torrent_id': torrentId,
        'file_id': fileId,
        'zip_link': zipLink,
        'torrent_file': returnTorrentFile,
        'user_ip': userIP,
      },
    );
  }

  Future<TorboxAPIResponse> getTorrentsList({
    bool? bypassCache,
    int? torrentId,
    int? offset,
    int? limit,
  }) async {
    return makeRequest(
      'api/torrents/mylist',
      method: 'get',
      body: {
        'bypass_cache': bypassCache,
        'id': torrentId,
        'offset': offset,
        'limit': limit,
      },
    );
  }

  Future<TorboxAPIResponse> checkIfTorrentCached(
    List<String> torrentHashes, {
    CheckCacheReturnFormat? returnFormat,
    bool? listFiles,
  }) async {
    assert(
      torrentHashes.isNotEmpty,
      'At least one torrent hash must be provided',
    );
    return makeRequest(
      'api/torrents/checkcached',
      method: 'get',
      body: {
        'hash': torrentHashes.join(','),
        'format': returnFormat?.name,
        'list_files': listFiles,
      },
    );
  }

  Future<TorboxAPIResponse> exportTorrentData(
    int torrentId,
    ExportTorrentDataType exportType,
  ) async {
    return makeRequest(
      'api/torrents/exportdata',
      method: 'get',
      returnType:
          exportType ==
              ExportTorrentDataType
                  .torrentFile // other option is magnet
          ? SuccessReturnType.file
          : SuccessReturnType.jsonResponse,
      body: {'torrent_id': torrentId, 'type': exportType.name},
    );
  }

  Future<TorboxAPIResponse> getTorrentData(
    String torrentHash, {
    int? timeout,
  }) async {
    return makeRequest(
      'api/torrents/torrentinfo',
      method: 'get',
      body: {'hash': torrentHash, 'timeout': timeout},
    );
  }

  // #USENET

  Future<TorboxAPIResponse> createUsenetDownload({
    PlatformFile? nzbFile,
    String? link,
    String? name,
    String? password,
    UsenetPostProcessing? postProcessing,
    bool? asQueued,
  }) async {
    assert(
      nzbFile != null || link != null,
      'Either nzbFile or link must be provided',
    );
    assert(
      nzbFile == null || link == null,
      'Only one of nzbFile or link can be provided',
    );
    return makeRequest(
      'api/usenet/createusenetdownload',
      method: 'post',
      body: {
        'file': nzbFile,
        'link': link,
        'name': name,
        'password': password,
        'post_processing': postProcessing?.index,
        'as_queued': asQueued,
      },
    );
  }

  Future<TorboxAPIResponse> controlUsenetDownload(
    ControlUsenetType operation, {
    int? usenetId,
    bool? all,
  }) async {
    assert(
      usenetId != null || all != null,
      'Either usenetId or all must be provided',
    );
    return makeRequest(
      'api/usenet/controlusenetdownload',
      method: 'post',
      body: {'usenet_id': usenetId, 'operation': operation.name, 'all': all},
    );
  }

  Future<TorboxAPIResponse> getUsenetDownloadUrl(
    int usenetId, {
    int? fileId,
    bool? zipLink,
    bool? returnTorrentFile,
    String? userIP,
  }) async {
    assert(
      fileId != null || zipLink != null,
      'Either fileId or zipLink must be provided',
    );
    assert(
      zipLink == null || returnTorrentFile == null,
      'Only one of zipLink or returnTorrentFile can be provided',
    );
    assert(
      zipLink == null || returnTorrentFile == null,
      'Only one of zipLink or returnTorrentFile can be provided',
    );
    return makeRequest(
      'api/usenet/requestdl',
      method: 'get',
      returnType: returnTorrentFile == null
          ? SuccessReturnType.jsonResponse
          : SuccessReturnType.file,
      body: {
        'token': apiKey,
        'usenet_id': usenetId,
        'file_id': fileId,
        'zip_link': zipLink,
        'torrent_file': returnTorrentFile,
        'user_ip': userIP,
      },
    );
  }

  Future<TorboxAPIResponse> getUsenetDownloadsList({
    bool? bypassCache,
    int? usenetId,
    int? offset,
    int? limit,
  }) async {
    return makeRequest(
      'api/usenet/mylist',
      method: 'get',
      body: {
        'bypass_cache': bypassCache,
        'id': usenetId,
        'offset': offset,
        'limit': limit,
      },
    );
  }

  Future<TorboxAPIResponse> checkIfUsenetCached(
    List<String> usenetHashes, {
    CheckCacheReturnFormat? returnFormat,
  }) async {
    assert(usenetHashes.isNotEmpty, 'At least one nzb id must be provided');
    return makeRequest(
      'api/usenet/checkcached',
      method: 'get',
      body: {'hash': usenetHashes.join(','), 'format': returnFormat?.name},
    );
  }

  // #Web downloads/Debrid

  Future<TorboxAPIResponse> createWebDownload(
    String link, {
    String? name,
    String? password,
    bool? asQueued,
  }) async {
    return makeRequest(
      'api/webdl/createwebdownload',
      method: 'post',
      body: {
        'link': link,
        'name': name,
        'password': password,
        'as_queued': asQueued,
      },
    );
  }

  Future<TorboxAPIResponse> controlWebDownload(
    ControlWebdlType operation, {
    int? webId,
    bool? all,
  }) async {
    assert(
      webId != null || all != null,
      'Either webId or all must be provided',
    );
    return makeRequest(
      'api/webdl/controlwebdownload',
      method: 'post',
      body: {'webdl_id': webId, 'operation': operation.name, 'all': all},
    );
  }

  Future<TorboxAPIResponse> getWebDownloadUrl(
    int webId, {
    int? fileId,
    bool? zipLink,
    bool? returnTorrentFile,
    String? userIP,
  }) async {
    assert(
      fileId != null || zipLink != null,
      'Either fileId or zipLink must be provided',
    );
    assert(
      zipLink == null || returnTorrentFile == null,
      'Only one of zipLink or returnTorrentFile can be provided',
    );
    return makeRequest(
      'api/webdl/requestdl',
      method: 'get',
      returnType: returnTorrentFile == null
          ? SuccessReturnType.jsonResponse
          : SuccessReturnType.file,
      body: {
        'token': apiKey,
        'web_id': webId,
        'file_id': fileId,
        'zip_link': zipLink,
        'torrent_file': returnTorrentFile,
        'user_ip': userIP,
      },
    );
  }

  Future<TorboxAPIResponse> getWebDownloadsList({
    bool? bypassCache,
    int? webId,
    int? offset,
    int? limit,
  }) async {
    return makeRequest(
      'api/webdl/mylist',
      method: 'get',
      body: {
        'bypass_cache': bypassCache,
        'id': webId,
        'offset': offset,
        'limit': limit,
      },
    );
  }

  Future<TorboxAPIResponse> checkIfWebDownloadCached(
    List<String> webLinks, {
    CheckCacheReturnFormat? returnFormat,
  }) async {
    assert(webLinks.isNotEmpty, 'At least one web link must be provided');
    return makeRequest(
      'api/webdl/checkcached',
      method: 'get',
      body: {
        'hash': webLinks
            .map((link) => md5.convert(utf8.encode(link)).toString())
            .join(','),
        'format': returnFormat?.name,
      },
    );
  }

  Future<TorboxAPIResponse> getWebHostersList() async {
    return makeRequest('api/webdl/hosters', method: 'get');
  }

  // #General

  Future<TorboxAPIResponse> checkUpStatus() async {
    throw UnimplementedError(); // needs special handling because it just requests the base url
  }

  Future<TorboxAPIResponse> getStats() async {
    return makeRequest('api/stats', method: 'get');
  }

  // #Notifications
  Future<TorboxAPIResponse> getRSSNotificationFeed() async {
    return makeRequest(
      'api/notifications/rss',
      method: 'get',
      returnType: SuccessReturnType.xml,
      body: {"token": apiKey},
    );
  }

  Future<TorboxAPIResponse> getJSONNotificationFeed() async {
    return makeRequest('api/notifications/mynotifications', method: 'get');
  }

  Future<TorboxAPIResponse> clearAllNotifications() async {
    return makeRequest('api/notifications/clear', method: 'post');
  }

  Future<TorboxAPIResponse> clearNotification(int notificationId) async {
    return makeRequest(
      'api/notifications/clear/$notificationId',
      method: 'post',
    );
  }

  Future<TorboxAPIResponse> sendTestNotification() async {
    return makeRequest('api/notifications/test', method: 'post');
  }

  // #User

  Future<TorboxAPIResponse> getUserData({bool? getSettings}) async {
    return makeRequest(
      'api/user/me',
      method: 'get',
      body: {'settings': getSettings},
    );
  }

  Future<TorboxAPIResponse> addReferralCode(String referralCode) async {
    return makeRequest(
      'api/user/addreferral?referral=$referralCode',
      method: 'post',
    );
  }

  Future<TorboxAPIResponse> requestConfirmationCode() async {
    return makeRequest('api/user/getconfirmation', method: 'get');
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
  }) async {
    assert(
      minutesScanInterval == null || minutesScanInterval >= 10,
      'minutesScanInterval must be at least 10',
    );
    return makeRequest(
      "api/rss/addrss",
      method: 'post',
      body: {
        'url': url,
        'name': name,
        'do_regex': definitelyAddRegex,
        'dont_regex': dontAddRegex,
        'dont_older_than': dontAddifOlderThanDays,
        'scan_interval': minutesScanInterval,
        'pass_check': ensurePassDuplicateCheck,
        'rss_type': rssType?.name,
        'torrent_seeding': seedingPreference?.index,
      },
    );
  }

  Future<TorboxAPIResponse> controlRSSFeed(
    int rssId,
    RssOperation operation,
  ) async {
    return makeRequest(
      "api/rss/controlrss",
      method: 'post',
      body: {'rss_feed_id': rssId, 'operation': operation.name},
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
  }) async {
    assert(
      minutesScanInterval == null || minutesScanInterval >= 10,
      'minutesScanInterval must be at least 10',
    );
    return makeRequest(
      "api/rss/modifyrss",
      method: 'put',
      body: {
        'rss_feed_id': rssId,
        'name': name,
        'do_regex': definitelyAddRegex,
        'dont_regex': dontAddRegex,
        'dont_older_than': dontAddifOlderThanDays,
        'scan_interval': minutesScanInterval,
        'pass_check': ensurePassDuplicateCheck,
        'rss_type': rssType?.name,
        'torrent_seeding': seedingPreference?.index,
      },
    );
  }

  Future<TorboxAPIResponse> getRSSFeeedsList({int? rssId}) async {
    return makeRequest("api/rss/getfeeds", method: 'get', body: {'id': rssId});
  }

  Future<TorboxAPIResponse> getRSSFeedItems(int rssId) async {
    return makeRequest(
      "api/rss/getfeeditems",
      method: 'get',
      body: {'rss_feed_id': rssId},
    );
  }

  // #Integrations

  Future<TorboxAPIResponse> queueIntegration(
    QueueableIntegration integration,
    int id, {
    int? fileId,
    bool? zip,
    IntegrationFileType? type,
  }) async {
    assert(
      fileId != null || zip != null,
      'Either fileId or zip must be provided',
    );
    String? token;
    switch (integration) {
      case QueueableIntegration.google:
        token = googleToken;
        break;
      default:
        token = null;
    }
    assert(
      token != null && token.isNotEmpty,
      'Token for ${integration.name} is not available',
    );
    return makeRequest(
      "api/integration/${integration.name}",
      method: 'post',
      body: {
        'id': id,
        'file_id': fileId,
        'zip': zip,
        'type': type?.name,
        integration.tokenName:
            token, // needs oauth token for google & onedrive, api key for 1fichier and gofile
      },
    );
  }

  Future<TorboxAPIResponse> getAllJobs() async {
    return makeRequest("api/integration/jobs", method: 'get');
  }

  Future<TorboxAPIResponse> getJobStatusById(int jobId) async {
    return makeRequest("api/integration/jobs/$jobId", method: 'get');
  }

  Future<TorboxAPIResponse> getJobStatusByHash(String hash) async {
    return makeRequest("api/integration/jobs/$hash", method: 'get');
  }

  // #Queued

  Future<TorboxAPIResponse> getQueuedItemsList({
    bool? bypassCache,
    int? id,
    int? offset,
    int? limit,
    FileType? type,
  }) async {
    return makeRequest(
      "api/queued/getqueued",
      method: 'get',
      body: {
        'bypass_cache': bypassCache,
        'id': id,
        'offset': offset,
        'limit': limit,
        'type': type?.name,
      },
    );
  }

  // #Search API

  Future<TorboxAPIResponse> getMetadata(IdType idType, String id) async {
    return makeRequest(
      'meta/${idType.name}:$id',
      method: 'get',
      baseUrl: search_api_base,
    );
  }

  Future<TorboxAPIResponse> searchMetadata(
    String query, {
    SearchType? type,
  }) async {
    return makeRequest(
      'search/$query',
      method: 'get',
      baseUrl: search_api_base,
      body: {'type': type?.name},
    );
  }

  Future<TorboxAPIResponse> getTorrentsById(
    IdType idType,
    String id, {
    bool? metadata,
    int? season,
    int? episode,
    bool? checkCache,
    bool? checkOwned,
    bool? searchUserEngines,
  }) async {
    return makeRequest(
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
    return makeRequest(
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

  Future<TorboxAPIResponse> getUsenetById(
    IdType idType,
    String id, {
    bool? metadata,
    int? season,
    int? episode,
    bool? checkCache,
    bool? checkOwned,
    bool? searchUserEngines,
  }) async {
    return makeRequest(
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
    return makeRequest(
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
  }) async {
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
    return makeRequest(
      "api/queued/controlqueued",
      method: 'post',
      body: {'queued_id': queuedId, 'operation': operation.name, 'all': all},
    );
  }

  // Relay
}

enum SuccessReturnType { jsonResponse, file, xml }

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

enum ControlTorrentType { reannounce, delete, resume, pause }

extension ControlTorrentTypeExtension on ControlTorrentType {
  String get name {
    switch (this) {
      case ControlTorrentType.reannounce:
        return 'reannounce';
      case ControlTorrentType.delete:
        return 'delete';
      case ControlTorrentType.resume:
        return 'resume';
      case ControlTorrentType.pause:
        return 'stop_seeding';
    }
  }
}

enum ControlUsenetType { delete, resume, pause }

extension ControlUsenetTypeExtension on ControlUsenetType {
  String get name {
    switch (this) {
      case ControlUsenetType.delete:
        return 'delete';
      case ControlUsenetType.resume:
        return 'resume';
      case ControlUsenetType.pause:
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

  String get tokenName {
    switch (this) {
      case QueueableIntegration.google:
        return 'google_token';
      case QueueableIntegration.onedrive:
        return 'onedrive_token';
      case QueueableIntegration.gofile:
        return 'gofile_token';
      case QueueableIntegration.onefichier:
        return 'onefichier_token';
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

enum SearchType { media, file }

extension SearchTypeExtension on SearchType {
  String get name {
    switch (this) {
      case SearchType.media:
        return 'media';
      case SearchType.file:
        return 'file';
    }
  }
}
