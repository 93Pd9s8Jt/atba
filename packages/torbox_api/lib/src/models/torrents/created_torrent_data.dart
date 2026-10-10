import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'created_torrent_data.freezed.dart';
part 'created_torrent_data.g.dart';

/// Payload returned when a torrent is successfully queued by
/// `POST /v1/api/torrents/createtorrent`.
@freezed
abstract class CreatedTorrentData with _$CreatedTorrentData {
  const factory CreatedTorrentData({
    required String hash,
    @JsonKey(name: 'torrent_id') required int torrentId,
    required String authId,
    @JsonKey(name: 'active_limit') int? activeLimit,
    @JsonKey(name: 'current_active_downloads') int? currentActiveDownloads,
    @JsonKey(name: 'queued_id') int? queuedId,
  }) = _CreatedTorrentData;

  factory CreatedTorrentData.fromJson(Map<String, dynamic> json) =>
      _$CreatedTorrentDataFromJson(json);
}

/// Parses a full API envelope for `POST /v1/api/torrents/createtorrent`.
TorBoxResponse<CreatedTorrentData> createdTorrentResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => CreatedTorrentData.fromJson(data as Map<String, dynamic>),
);
