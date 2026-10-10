import '../models/common/cached_availability_data.dart';
import '../models/common/torbox_file_upload.dart';
import '../models/common/torbox_request_validation_exception.dart';
import '../models/common/torbox_response.dart';
import '../models/torrents/created_torrent_data.dart';
import '../models/torrents/torrent_data.dart';
import '../models/torrents/torrent_info_data.dart';
import '../net/torbox_client.dart';

/// Torrents service.
///
/// Wraps all `/v1/api/torrents/*` endpoints. Accessed via
/// [TorboxApi.torrents].
class TorrentsService {
  final TorboxClient _client;

  TorrentsService(this._client);

  /// Create a torrent from a magnet link or an uploaded `.torrent` file.
  ///
  /// Pass [magnet] for a magnet link, or [file] for an upload. Exactly one of
  /// the two must be provided. Throws
  /// [TorboxRequestValidationException] otherwise.
  ///
  /// Involves potentially uploading a file so the request is sent as multipart
  /// (otherwise the api won't recognise it).
  Future<TorBoxResponse<CreatedTorrentData>> createTorrent({
    TorboxFileUpload? file,
    String? magnet,
    int? seed,
    bool? allowZip,
    String? name,
    bool? asQueued,
    bool? addOnlyIfCached,
  }) async {
    _requireExactlyOne(file: file, magnet: magnet);
    final response = await _client.postMultipart(
      'api/torrents/createtorrent',
      fields: {
        'magnet': magnet,
        'seed': seed,
        'allow_zip': allowZip,
        'name': name,
        'as_queued': asQueued,
        'add_only_if_cached': addOnlyIfCached,
      },
      file: file,
    );
    return createdTorrentResponseFromJson(response);
  }

  /// Queue a torrent creation asynchronously from a magnet link or an
  /// uploaded `.torrent` file.
  ///
  /// Unlike [createTorrent], this returns immediately without waiting for
  /// the torrent to be processed. Exactly one of [file] and [magnet] must be
  /// provided.
  Future<TorBoxResponse<Null>> asyncCreateTorrent({
    TorboxFileUpload? file,
    String? magnet,
    int? seed,
    bool? allowZip,
    String? name,
    bool? asQueued,
    bool? addOnlyIfCached,
  }) async {
    _requireExactlyOne(file: file, magnet: magnet);
    final response = await _client.postMultipart(
      'api/torrents/asynccreatetorrent',
      fields: {
        'magnet': magnet,
        'seed': seed,
        'allow_zip': allowZip,
        'name': name,
        'as_queued': asQueued,
        'add_only_if_cached': addOnlyIfCached,
      },
      file: file,
    );
    return nullResponseFromJson(response);
  }

  /// Control a torrent (pause, resume, delete, reannounce).
  ///
  /// Either [torrentId] or [all] must be provided.
  Future<TorBoxResponse<Null>> controlTorrent({
    required String operation,
    int? torrentId,
    bool? all,
  }) async {
    if (torrentId == null && all == null) {
      throw TorboxRequestValidationException(
        'Either torrentId or all must be provided.',
      );
    }
    final response = await _client.post(
      'api/torrents/controltorrent',
      body: {'operation': operation, 'torrent_id': torrentId, 'all': all},
    );
    return nullResponseFromJson(response);
  }

  /// The create endpoints accept a magnet link or an upload, never both and
  /// never neither.
  void _requireExactlyOne({TorboxFileUpload? file, String? magnet}) {
    if (file == null && magnet == null) {
      throw TorboxRequestValidationException(
        'Either file or magnet must be provided.',
      );
    }
    if (file != null && magnet != null) {
      throw TorboxRequestValidationException(
        'Only one of file or magnet can be provided.',
      );
    }
  }

  /// Get a direct download link for a torrent file or specific file within
  /// a torrent.
  Future<TorBoxResponse<Uri>> requestDownloadLink({
    required int torrentId,
    int? fileId,
    bool? zipLink,
    String? userIP,
    // Not sure why it wants this in addition to the Bearer authorization.
    String? token,
    bool? redirect,
    bool? appendName,
  }) async {
    final response = await _client.get(
      'api/torrents/requestdl',
      queryParams: {
        'token': token,
        'torrent_id': torrentId,
        'file_id': fileId,
        'zip_link': zipLink,
        'user_ip': userIP,
        'redirect': redirect,
        'append_name': appendName,
      },
    );
    return uriResponseFromJson(response);
  }

  /// Get the user's torrent list.
  Future<TorBoxResponse<List<TorrentData>>> getTorrentList({
    bool? bypassCache,
    int? id,
    int? offset,
    int? limit,
  }) async {
    final response = await _client.get(
      'api/torrents/mylist',
      queryParams: {
        'bypass_cache': bypassCache,
        'id': id,
        'offset': offset,
        'limit': limit,
      },
    );
    return torrentListResponseFromJson(response);
  }

  /// Get a single torrent by ID.
  ///
  /// Unlike [getTorrentList], the API returns a single object (not a
  /// list) when `id` is specified.
  Future<TorBoxResponse<TorrentData>> getTorrent({
    required int id,
    bool? bypassCache,
  }) async {
    final response = await _client.get(
      'api/torrents/mylist',
      queryParams: {'bypass_cache': bypassCache, 'id': id},
    );
    return torrentResponseFromJson(response);
  }

  /// Check cached availability for a list of torrent hashes.
  Future<TorBoxResponse<Map<String, CachedAvailabilityData>>>
  checkCachedAvailability({
    required List<String> hashes,
    String? format,
    bool? listFiles,
  }) async {
    final response = await _client.get(
      'api/torrents/checkcached',
      queryParams: {
        'hash': hashes.join(','),
        'format': format,
        'list_files': listFiles,
      },
    );
    return cachedAvailabilityResponseFromJson(response);
  }

  /// Check cached availability with `format=list`, whose `data` is a
  /// plain list of availability entries rather than a hash-keyed map.
  Future<TorBoxResponse<List<CachedAvailabilityData>>>
  checkCachedAvailabilityList({
    required List<String> hashes,
    String? format,
    bool? listFiles,
  }) async {
    final response = await _client.get(
      'api/torrents/checkcached',
      queryParams: {
        'hash': hashes.join(','),
        'format': format,
        'list_files': listFiles,
      },
    );
    return cachedAvailabilityListResponseFromJson(response);
  }

  /// Check cached availability via POST with a JSON body.
  Future<TorBoxResponse<Map<String, CachedAvailabilityData>>>
  checkCachedAvailabilityPost({
    required List<String> hashes,
    String? hash,
    String? format,
    bool? listFiles,
  }) async {
    final response = await _client.post(
      'api/torrents/checkcached',
      queryParams: {'hash': hash, 'format': format, 'list_files': listFiles},
      body: {'hashes': hashes},
    );
    return cachedAvailabilityResponseFromJson(response);
  }

  /// Export a torrent's magnet link (`type=magnet`).
  ///
  /// The response body is the magnet link itself; see
  /// [exportTorrentDataAsTorrentFile] for the `type=torrent` variant, which
  /// returns a file rather than JSON.
  Future<TorBoxResponse<String>> exportTorrentDataAsMagnet({
    required int torrentId,
  }) async {
    final response = await _client.get(
      'api/torrents/exportdata',
      queryParams: {'torrent_id': torrentId, 'type': 'magnet'},
    );
    return stringResponseFromJson(response);
  }

  /// Export a torrent as a `.torrent` file (`type=torrent`).
  ///
  /// This endpoint answers with the file itself, not a JSON envelope, so the
  /// bytes are streamed straight to [savePath] and the saved path is
  /// returned. Callers own the destination, which keeps this package free of
  /// platform-specific download directories.
  ///
  /// Throws [TorboxApiException] if the request fails.
  Future<String> exportTorrentDataAsTorrentFile({
    required int torrentId,
    required String savePath,
  }) {
    return _client.download(
      'api/torrents/exportdata',
      savePath: savePath,
      queryParams: {'torrent_id': torrentId, 'type': 'torrent'},
    );
  }

  /// Get metadata info for a torrent hash.
  Future<TorBoxResponse<TorrentInfoData>> getTorrentInfo({
    required String hash,
    int? timeout,
  }) async {
    final response = await _client.get(
      'api/torrents/torrentinfo',
      queryParams: {'hash': hash, 'timeout': timeout},
    );
    return torrentInfoResponseFromJson(response);
  }

  /// Get torrent info via POST (with request body).
  ///
  /// Always sent as multipart (otherwise the api won't recognise it). At
  /// least one of [hash], [magnet] and [file] must be provided.
  Future<TorBoxResponse<TorrentInfoData>> getTorrentInfoPost({
    int? timeout,
    String? hash,
    String? magnet,
    TorboxFileUpload? file,
    bool? useCacheLookup,
    bool? peersOnly,
  }) async {
    if (hash == null && magnet == null && file == null) {
      throw TorboxRequestValidationException(
        'At least one of hash, magnet or file must be provided.',
      );
    }
    final response = await _client.postMultipart(
      'api/torrents/torrentinfo',
      fields: {
        'timeout': timeout,
        'hash': hash,
        'magnet': magnet,
        'use_cache_lookup': useCacheLookup,
        'peers_only': peersOnly,
      },
      file: file,
    );
    return torrentInfoResponseFromJson(response);
  }

  /// Edit a torrent's name, tags, or other metadata.
  Future<TorBoxResponse<Null>> editTorrent({
    required int torrentId,
    String? name,
    List<String>? tags,
    List<String>? alternativeHashes,
    bool? airlocked,
  }) async {
    final response = await _client.put(
      'api/torrents/edittorrent',
      body: {
        'torrent_id': torrentId,
        'name': name,
        'tags': tags,
        'alternative_hashes': alternativeHashes,
        'airlocked': airlocked,
      },
    );
    return nullResponseFromJson(response);
  }

  /// Convert a magnet link to a torrent file.
  Future<TorBoxResponse<dynamic>> magnetToFile({required String magnet}) async {
    final response = await _client.post(
      'api/torrents/magnettofile',
      body: {'magnet': magnet},
    );
    return dynamicResponseFromJson(response);
  }
}
