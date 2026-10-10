import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'created_usenet_download_data.freezed.dart';
part 'created_usenet_download_data.g.dart';

/// Payload returned when a Usenet download is successfully created by
/// `POST /v1/api/usenet/createusenetdownload`.
@freezed
abstract class CreatedUsenetDownloadData with _$CreatedUsenetDownloadData {
  const factory CreatedUsenetDownloadData({
    required String hash,

    /// Declared as `usenetdownload_id` by the API.
    @JsonKey(name: 'usenetdownload_id') required int usenetDownloadId,
    required String authId,
  }) = _CreatedUsenetDownloadData;

  factory CreatedUsenetDownloadData.fromJson(Map<String, dynamic> json) =>
      _$CreatedUsenetDownloadDataFromJson(json);
}

/// Parses a full API envelope for
/// `POST /v1/api/usenet/createusenetdownload`.
TorBoxResponse<CreatedUsenetDownloadData> createdUsenetDownloadResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => CreatedUsenetDownloadData.fromJson(data as Map<String, dynamic>),
);
