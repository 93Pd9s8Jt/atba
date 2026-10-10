import '../models/common/cached_availability_data.dart';
import '../models/common/torbox_file_upload.dart';
import '../models/common/torbox_request_validation_exception.dart';
import '../models/common/torbox_response.dart';
import '../models/usenet/created_usenet_download_data.dart';
import '../models/usenet/usenet_download_data.dart';
import '../models/usenet/usenet_provider_account_data.dart';
import '../models/usenet/usenet_provider_connection_data.dart';
import '../net/torbox_client.dart';

/// Usenet service.
///
/// Wraps all `/v1/api/usenet/*` endpoints. Accessed via
/// [TorboxApi.usenet].
class UsenetService {
  final TorboxClient _client;

  UsenetService(this._client);

  /// Create a usenet download from an NZB link or an uploaded `.nzb` file.
  ///
  /// Pass [link] for an NZB link, or [file] for an upload. Exactly one of the
  /// two must be provided. Throws [TorboxRequestValidationException]
  /// otherwise. Always sent as multipart (otherwise the api won't recognise
  /// it).
  Future<TorBoxResponse<CreatedUsenetDownloadData>> createUsenetDownload({
    String? link,
    TorboxFileUpload? file,
    String? name,
    String? password,
    int? postProcessing,
    bool? asQueued,
    bool? addOnlyIfCached,
  }) async {
    _requireExactlyOne(file: file, link: link);
    final response = await _client.postMultipart(
      'api/usenet/createusenetdownload',
      fields: {
        'link': link,
        'name': name,
        'password': password,
        'post_processing': postProcessing,
        'as_queued': asQueued,
        'add_only_if_cached': addOnlyIfCached,
      },
      file: file,
    );
    return createdUsenetDownloadResponseFromJson(response);
  }

  /// Queue a usenet download creation asynchronously from an NZB link or
  /// an uploaded `.nzb` file.
  ///
  /// Exactly one of [file] and [link] must be provided.
  Future<TorBoxResponse<Null>> asyncCreateUsenetDownload({
    String? link,
    TorboxFileUpload? file,
    String? name,
    String? password,
    int? postProcessing,
    bool? asQueued,
    bool? addOnlyIfCached,
  }) async {
    _requireExactlyOne(file: file, link: link);
    final response = await _client.postMultipart(
      'api/usenet/asynccreateusenetdownload',
      fields: {
        'link': link,
        'name': name,
        'password': password,
        'post_processing': postProcessing,
        'as_queued': asQueued,
        'add_only_if_cached': addOnlyIfCached,
      },
      file: file,
    );
    return nullResponseFromJson(response);
  }

  /// Control a usenet download (pause, resume, delete).
  ///
  /// Either [usenetId] or [all] must be provided.
  Future<TorBoxResponse<Null>> controlUsenetDownload({
    required String operation,
    int? usenetId,
    bool? all,
  }) async {
    if (usenetId == null && all == null) {
      throw TorboxRequestValidationException(
        'Either usenetId or all must be provided.',
      );
    }
    final response = await _client.post(
      'api/usenet/controlusenetdownload',
      body: {'operation': operation, 'usenet_id': usenetId, 'all': all},
    );
    return nullResponseFromJson(response);
  }

  /// The create endpoints accept an NZB link or an upload, never both and
  /// never neither.
  void _requireExactlyOne({TorboxFileUpload? file, String? link}) {
    if (file == null && link == null) {
      throw TorboxRequestValidationException(
        'Either file or link must be provided.',
      );
    }
    if (file != null && link != null) {
      throw TorboxRequestValidationException(
        'Only one of file or link can be provided.',
      );
    }
  }

  /// Get a direct download link for a usenet file.
  Future<TorBoxResponse<Uri>> requestDownloadLink({
    required int usenetId,
    int? fileId,
    bool? zipLink,
    String? userIP,
    // Not sure why it wants this in addition to the Bearer authorization.
    String? token,
    bool? redirect,
    bool? appendName,
  }) async {
    final response = await _client.get(
      'api/usenet/requestdl',
      queryParams: {
        'token': token,
        'usenet_id': usenetId,
        'file_id': fileId,
        'zip_link': zipLink,
        'user_ip': userIP,
        'redirect': redirect,
        'append_name': appendName,
      },
    );
    return uriResponseFromJson(response);
  }

  /// Get the user's usenet download list.
  Future<TorBoxResponse<List<UsenetDownloadData>>> getUsenetList({
    bool? bypassCache,
    int? id,
    int? offset,
    int? limit,
  }) async {
    final response = await _client.get(
      'api/usenet/mylist',
      queryParams: {
        'bypass_cache': bypassCache,
        'id': id,
        'offset': offset,
        'limit': limit,
      },
    );
    return usenetListResponseFromJson(response);
  }

  /// Get a single usenet download by ID.
  ///
  /// Unlike [getUsenetList], the API returns a single object (not a list)
  /// when `id` is specified.
  Future<TorBoxResponse<UsenetDownloadData>> getUsenet({
    required int id,
    bool? bypassCache,
  }) async {
    final response = await _client.get(
      'api/usenet/mylist',
      queryParams: {'bypass_cache': bypassCache, 'id': id},
    );
    return usenetResponseFromJson(response);
  }

  /// Check cached availability for a list of usenet hashes.
  Future<TorBoxResponse<Map<String, CachedAvailabilityData>>>
  checkCachedAvailability({
    required List<String> hashes,
    String? format,
  }) async {
    final response = await _client.get(
      'api/usenet/checkcached',
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
      'api/usenet/checkcached',
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
      'api/usenet/checkcached',
      queryParams: {'hash': hash, 'format': format},
      body: {'hashes': hashes},
    );
    return cachedAvailabilityResponseFromJson(response);
  }

  /// Edit a usenet download's name, tags, or other metadata.
  Future<TorBoxResponse<Null>> editUsenetDownload({
    required int usenetDownloadId,
    String? name,
    List<String>? tags,
    List<String>? alternativeHashes,
    bool? airlocked,
  }) async {
    final response = await _client.put(
      'api/usenet/editusenetdownload',
      body: {
        'usenet_download_id': usenetDownloadId,
        'name': name,
        'tags': tags,
        'alternative_hashes': alternativeHashes,
        'airlocked': airlocked,
      },
    );
    return nullResponseFromJson(response);
  }

  /// Get the TorBox Usenet provider connection details.
  Future<TorBoxResponse<UsenetProviderConnectionData>>
  getProviderConnection() async {
    final response = await _client.get('api/usenet/provider/connection');
    return usenetProviderConnectionResponseFromJson(response);
  }

  /// Get the user's TorBox Usenet provider account credentials.
  Future<TorBoxResponse<UsenetProviderAccountData>> getProviderAccount() async {
    final response = await _client.get('api/usenet/provider/account');
    return usenetProviderAccountResponseFromJson(response);
  }

  /// Reset the password of the user's TorBox Usenet provider account.
  Future<TorBoxResponse<UsenetProviderAccountData>>
  resetProviderPassword() async {
    final response = await _client.post('api/usenet/provider/account/resetpw');
    return usenetProviderAccountResponseFromJson(response);
  }
}
