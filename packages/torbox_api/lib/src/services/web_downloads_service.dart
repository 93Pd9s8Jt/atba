import '../models/common/cached_availability_data.dart';
import '../models/common/torbox_request_validation_exception.dart';
import '../models/common/torbox_response.dart';
import '../models/webdl/created_web_download_data.dart';
import '../models/webdl/hoster_data.dart';
import '../models/webdl/web_download_data.dart';
import '../net/torbox_client.dart';

/// Web downloads service.
///
/// Wraps all `/v1/api/webdl/*` endpoints. Accessed via
/// [TorboxApi.webDownloads].
class WebDownloadsService {
  final TorboxClient _client;

  WebDownloadsService(this._client);

  /// Create a web download from a URL.
  Future<TorBoxResponse<CreatedWebDownloadData>> createWebDownload({
    required String link,
    String? password,
    String? name,
    bool? asQueued,
    bool? addOnlyIfCached,
  }) async {
    final response = await _client.post(
      'api/webdl/createwebdownload',
      body: {
        'link': link,
        'password': password,
        'name': name,
        'as_queued': asQueued,
        'add_only_if_cached': addOnlyIfCached,
      },
    );
    return createdWebDownloadResponseFromJson(response);
  }

  /// Queue a web download creation asynchronously from a URL.
  Future<TorBoxResponse<Null>> asyncCreateWebDownload({
    required String link,
    String? password,
    String? name,
    bool? asQueued,
    bool? addOnlyIfCached,
  }) async {
    final response = await _client.postMultipart(
      'api/webdl/asynccreatewebdownload',
      fields: {
        'link': link,
        'password': password,
        'name': name,
        'as_queued': asQueued,
        'add_only_if_cached': addOnlyIfCached,
      },
    );
    return nullResponseFromJson(response);
  }

  /// Control a web download (delete).
  ///
  /// Either [webdlId] or [all] must be provided.
  Future<TorBoxResponse<Null>> controlWebDownload({
    required String operation,
    int? webdlId,
    bool? all,
  }) async {
    if (webdlId == null && all == null) {
      throw TorboxRequestValidationException(
        'Either webdlId or all must be provided.',
      );
    }
    final response = await _client.post(
      'api/webdl/controlwebdownload',
      body: {'operation': operation, 'webdl_id': webdlId, 'all': all},
    );
    return nullResponseFromJson(response);
  }

  /// Get a direct download link for a web download file.
  Future<TorBoxResponse<Uri>> requestDownloadLink({
    required int webId,
    int? fileId,
    bool? zipLink,
    String? userIP,
    // Not sure why it wants this in addition to the Bearer authorization.
    String? token,
    bool? redirect,
    bool? appendName,
  }) async {
    final response = await _client.get(
      'api/webdl/requestdl',
      queryParams: {
        'token': token,
        'web_id': webId,
        'file_id': fileId,
        'zip_link': zipLink,
        'user_ip': userIP,
        'redirect': redirect,
        'append_name': appendName,
      },
    );
    return uriResponseFromJson(response);
  }

  /// Get the user's web download list.
  Future<TorBoxResponse<List<WebDownloadData>>> getWebDownloadList({
    bool? bypassCache,
    int? id,
    int? offset,
    int? limit,
  }) async {
    final response = await _client.get(
      'api/webdl/mylist',
      queryParams: {
        'bypass_cache': bypassCache,
        'id': id,
        'offset': offset,
        'limit': limit,
      },
    );
    return webDownloadListResponseFromJson(response);
  }

  /// Get a single web download by ID.
  ///
  /// Unlike [getWebDownloadList], the API returns a single object (not a
  /// list) when `id` is specified.
  Future<TorBoxResponse<WebDownloadData>> getWebDownload({
    required int id,
    bool? bypassCache,
  }) async {
    final response = await _client.get(
      'api/webdl/mylist',
      queryParams: {'bypass_cache': bypassCache, 'id': id},
    );
    return webDownloadResponseFromJson(response);
  }

  /// Check cached availability for a list of web download links.
  Future<TorBoxResponse<Map<String, CachedAvailabilityData>>>
  checkCachedAvailability({
    required List<String> hashes,
    String? format,
  }) async {
    final response = await _client.get(
      'api/webdl/checkcached',
      queryParams: {'hash': hashes.join(','), 'format': format},
    );
    return cachedAvailabilityResponseFromJson(response);
  }

  /// Check cached availability with `format=list`, whose `data` is a plain
  /// list of availability entries rather than a hash-keyed map.
  Future<TorBoxResponse<List<CachedAvailabilityData>>>
  checkCachedAvailabilityList({
    required List<String> hashes,
    String? format,
  }) async {
    final response = await _client.get(
      'api/webdl/checkcached',
      queryParams: {'hash': hashes.join(','), 'format': format},
    );
    return cachedAvailabilityListResponseFromJson(response);
  }

  /// Check cached availability via POST with a JSON body.
  Future<TorBoxResponse<Map<String, CachedAvailabilityData>>>
  checkCachedAvailabilityPost({
    required List<String> hashes,
    String? hash,
    String? format,
  }) async {
    final response = await _client.post(
      'api/webdl/checkcached',
      queryParams: {'hash': hash, 'format': format},
      body: {'hashes': hashes},
    );
    return cachedAvailabilityResponseFromJson(response);
  }

  /// Edit a web download's name, tags, or other metadata.
  Future<TorBoxResponse<Null>> editWebDownload({
    required int webdlId,
    String? name,
    List<String>? tags,
    List<String>? alternativeHashes,
    bool? airlocked,
  }) async {
    final response = await _client.put(
      'api/webdl/editwebdownload',
      body: {
        'webdl_id': webdlId,
        'name': name,
        'tags': tags,
        'alternative_hashes': alternativeHashes,
        'airlocked': airlocked,
      },
    );
    return nullResponseFromJson(response);
  }

  /// Get the list of supported web hosts.
  Future<TorBoxResponse<List<HosterData>>> getHosters() async {
    final response = await _client.get('api/webdl/hosters');
    return hosterListResponseFromJson(response);
  }
}
