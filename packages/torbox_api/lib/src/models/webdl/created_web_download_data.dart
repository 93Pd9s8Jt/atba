import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'created_web_download_data.freezed.dart';
part 'created_web_download_data.g.dart';

/// Payload returned when a web download is successfully created by
/// `POST /v1/api/webdl/createwebdownload`.
@freezed
abstract class CreatedWebDownloadData with _$CreatedWebDownloadData {
  const factory CreatedWebDownloadData({
    required String hash,
    @JsonKey(name: 'webdownload_id') required int webdownloadId,
    required String authId,
    String? jdownloaderId,

    /// Individual links extracted from the submitted link.
    List<String>? linkList,
  }) = _CreatedWebDownloadData;

  factory CreatedWebDownloadData.fromJson(Map<String, dynamic> json) =>
      _$CreatedWebDownloadDataFromJson(json);
}

/// Parses a full API envelope for
/// `POST /v1/api/webdl/createwebdownload`.
TorBoxResponse<CreatedWebDownloadData> createdWebDownloadResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => CreatedWebDownloadData.fromJson(data as Map<String, dynamic>),
);
