import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';
import 'stream_media_metadata.dart';
import 'stream_search_metadata.dart';

part 'stream_info_data.freezed.dart';
part 'stream_info_data.g.dart';

/// Stream playback information returned by
/// `GET /v1/api/stream/getstreamdata` for an existing stream.
@freezed
abstract class StreamInfoData with _$StreamInfoData {
  const factory StreamInfoData({
    required String hlsUrl,
    required String domain,
    required String presignedToken,
    required int subtitleIndex,
    required int audioIndex,
    required int resolutionIndex,
    required String fileToken,
    required String token,
    required bool isTranscoding,
    required bool needsTranscoding,
    StreamMediaMetadata? metadata,
    StreamSearchMetadata? searchMetadata,
  }) = _StreamInfoData;

  factory StreamInfoData.fromJson(Map<String, dynamic> json) =>
      _$StreamInfoDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/stream/getstreamdata`.
TorBoxResponse<StreamInfoData> streamInfoResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => StreamInfoData.fromJson(data as Map<String, dynamic>),
);
