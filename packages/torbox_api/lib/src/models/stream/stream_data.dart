import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';
import 'stream_media_metadata.dart';
import 'stream_search_metadata.dart';

part 'stream_data.freezed.dart';
part 'stream_data.g.dart';

/// A fully initialized stream returned by
/// `GET /v1/api/stream/createstream`.
@freezed
abstract class StreamData with _$StreamData {
  const factory StreamData({
    required int id,
    required int fileId,
    required String authId,
    required String name,
    required String shortName,
    required String s3Path,
    required int size,
    required String mimetype,
    required String hash,
    required String openSubtitlesHash,
    required String type,
    required String region,
    required String domain,
    required String userToken,
    required String webdavUrl,
    StreamIntroInformation? introInformation,
    required bool scrobblingEnabled,
    required String hlsUrl,
    required String presignedToken,
    required int subtitleIndex,
    required int audioIndex,
    required int resolutionIndex,
    required bool isTranscoding,
    required bool needsTranscoding,
    StreamMediaMetadata? metadata,
    StreamSearchMetadata? searchMetadata,
  }) = _StreamData;

  factory StreamData.fromJson(Map<String, dynamic> json) =>
      _$StreamDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/stream/createstream`.
TorBoxResponse<StreamData> streamDataResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => StreamData.fromJson(data as Map<String, dynamic>),
);

/// Detected intro segment of a stream, used for skip-intro functionality.
@freezed
abstract class StreamIntroInformation with _$StreamIntroInformation {
  const factory StreamIntroInformation({
    int? startTime,
    int? endTime,
    String? title,
  }) = _StreamIntroInformation;

  factory StreamIntroInformation.fromJson(Map<String, dynamic> json) =>
      _$StreamIntroInformationFromJson(json);
}
