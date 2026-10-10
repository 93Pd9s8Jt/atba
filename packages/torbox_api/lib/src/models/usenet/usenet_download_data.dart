import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/download_file_data.dart';
import '../common/torbox_response.dart';

part 'usenet_download_data.freezed.dart';
part 'usenet_download_data.g.dart';

/// A Usenet download in the user's list, returned by
/// `GET /v1/api/usenet/mylist`.
@freezed
abstract class UsenetDownloadData with _$UsenetDownloadData {
  const factory UsenetDownloadData({
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
    int? server,
    String? cachedAt,
    List<String>? alternativeHashes,
    List<String>? tags,
    bool? airlocked,
  }) = _UsenetDownloadData;

  factory UsenetDownloadData.fromJson(Map<String, dynamic> json) =>
      _$UsenetDownloadDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/usenet/mylist`, whose
/// `data` is a list of Usenet downloads.
TorBoxResponse<List<UsenetDownloadData>> usenetListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => UsenetDownloadData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

/// Parses a full API envelope for `GET /v1/api/usenet/mylist` when queried
/// with an `id`, in which case `data` is a single Usenet download object
/// rather than a list.
TorBoxResponse<UsenetDownloadData> usenetResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => UsenetDownloadData.fromJson(data as Map<String, dynamic>),
);
