import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/download_file_data.dart';
import '../common/torbox_response.dart';

part 'torrent_data.freezed.dart';
part 'torrent_data.g.dart';

/// A torrent in the user's list, returned by `GET /v1/api/torrents/mylist`.
@freezed
abstract class TorrentData with _$TorrentData {
  const factory TorrentData({
    required int id,
    String? authId,
    int? server,
    String? hash,
    String? name,
    String? magnet,
    int? size,
    bool? active,
    String? createdAt,
    String? updatedAt,
    String? downloadState,
    int? seeds,
    int? peers,
    double? ratio,
    double? progress,
    int? downloadSpeed,
    int? uploadSpeed,
    int? eta,
    bool? torrentFile,
    String? expiresAt,
    bool? downloadPresent,
    List<DownloadFileData>? files,
    String? downloadPath,
    double? availability,
    bool? downloadFinished,
    String? tracker,
    int? totalUploaded,
    int? totalDownloaded,
    bool? cached,
    String? owner,
    bool? seedTorrent,
    bool? allowZipped,
    bool? longTermSeeding,
    String? trackerMessage,
    String? cachedAt,
    bool? private,
    List<String>? alternativeHashes,
    List<String>? tags,
    bool? airlocked,
  }) = _TorrentData;

  factory TorrentData.fromJson(Map<String, dynamic> json) =>
      _$TorrentDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/torrents/mylist` when
/// queried with an `id`, in which case `data` is a single torrent object
/// rather than a list.
TorBoxResponse<TorrentData> torrentResponseFromJson(
  Map<String, dynamic> json,
) =>
    TorBoxResponse.fromJson(
      json,
      (data) => TorrentData.fromJson(data as Map<String, dynamic>),
    );

/// Parses a full API envelope for `GET /v1/api/torrents/mylist`, whose
/// `data` is a list of torrents.
TorBoxResponse<List<TorrentData>> torrentListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => TorrentData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
