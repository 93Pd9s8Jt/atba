import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'queued_download_data.freezed.dart';
part 'queued_download_data.g.dart';

/// A queued download returned by `GET /v1/api/queued/getqueued`.
///
/// Queued items can be of any download type; [type] indicates which
/// (`torrent`, `usenet`, `webdl`).
@freezed
abstract class QueuedDownloadData with _$QueuedDownloadData {
  const factory QueuedDownloadData({
    required int id,
    required String createdAt,
    String? magnet,

    /// Contents of the queued `.torrent` file, if any.
    String? torrentFile,
    String? hash,
    String? name,
    required String type,
    String? nameOverride,
    int? seedTorrentOverride,
  }) = _QueuedDownloadData;

  factory QueuedDownloadData.fromJson(Map<String, dynamic> json) =>
      _$QueuedDownloadDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/queued/getqueued`, whose
/// `data` is a list of queued downloads.
TorBoxResponse<List<QueuedDownloadData>> queuedDownloadListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => QueuedDownloadData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
