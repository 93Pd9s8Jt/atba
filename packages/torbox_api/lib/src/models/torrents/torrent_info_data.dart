import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';
import 'torrent_info_file_data.dart';

part 'torrent_info_data.freezed.dart';
part 'torrent_info_data.g.dart';

/// Metadata about a torrent, retrieved from the BitTorrent network by
/// `GET|POST /v1/api/torrents/torrentinfo`.
///
/// When the API cannot fetch full metadata it may still return partial data
/// (`success=false` with an `UNKNOWN_ERROR`), in which case some fields such
/// as [name] or [files] can be `null`. All fields are therefore nullable
/// except the identifying hash.
@freezed
abstract class TorrentInfoData with _$TorrentInfoData {
  const factory TorrentInfoData({
    String? name,
    required String hash,
    int? size,
    List<String>? trackers,
    int? seeds,
    int? peers,
    List<TorrentInfoFileData>? files,
  }) = _TorrentInfoData;

  factory TorrentInfoData.fromJson(Map<String, dynamic> json) =>
      _$TorrentInfoDataFromJson(json);
}

/// Parses a full API envelope for `GET|POST /v1/api/torrents/torrentinfo`.
TorBoxResponse<TorrentInfoData> torrentInfoResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => TorrentInfoData.fromJson(data as Map<String, dynamic>),
);
