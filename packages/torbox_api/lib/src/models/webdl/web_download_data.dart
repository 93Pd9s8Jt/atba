import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/download_file_data.dart';
import '../common/torbox_response.dart';

part 'web_download_data.freezed.dart';
part 'web_download_data.g.dart';

/// A web download in the user's list, returned by
/// `GET /v1/api/webdl/mylist`.
@freezed
abstract class WebDownloadData with _$WebDownloadData {
  const factory WebDownloadData({
    required int id,
    String? createdAt,
    String? updatedAt,
    String? authId,
    String? name,
    String? hash,
    String? downloadState,
    int? downloadSpeed,
    String? originalUrl,
    int? eta,
    double? progress,
    int? size,
    String? downloadId,
    List<DownloadFileData>? files,
    bool? active,
    bool? cached,
    bool? downloadPresent,
    bool? downloadFinished,
    String? expiresAt,

    /// Error message if the web download failed.
    @JsonKey(name: 'error') String? error,
    String? cachedAt,
    int? server,
    List<String>? alternativeHashes,
    List<String>? tags,
    bool? airlocked,
  }) = _WebDownloadData;

  factory WebDownloadData.fromJson(Map<String, dynamic> json) =>
      _$WebDownloadDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/webdl/mylist`, whose
/// `data` is a list of web downloads.
TorBoxResponse<List<WebDownloadData>> webDownloadListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => WebDownloadData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

/// Parses a full API envelope for `GET /v1/api/webdl/mylist` when queried
/// with an `id`, in which case `data` is a single web download object rather
/// than a list.
TorBoxResponse<WebDownloadData> webDownloadResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => WebDownloadData.fromJson(data as Map<String, dynamic>),
);
