import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_media_metadata.freezed.dart';
part 'stream_media_metadata.g.dart';

/// Media probe metadata for a stream (video, audio and subtitle tracks).
///
/// Returned by both `GET /v1/api/stream/createstream` and
/// `GET /v1/api/stream/getstreamdata`.
@freezed
abstract class StreamMediaMetadata with _$StreamMediaMetadata {
  const factory StreamMediaMetadata({
    StreamVideoMetadata? video,
    List<StreamAudioMetadata>? audios,

    /// Subtitle track metadata. The API does not document this shape; only
    /// the fields below are mapped and unknown keys are ignored.
    List<StreamSubtitleMetadata>? subtitles,
    String? thumbnail,
    String? chapters,
  }) = _StreamMediaMetadata;

  factory StreamMediaMetadata.fromJson(Map<String, dynamic> json) =>
      _$StreamMediaMetadataFromJson(json);
}

/// The primary video track of a stream.
///
/// Probe-derived data may be partial; all fields are nullable.
@freezed
abstract class StreamVideoMetadata with _$StreamVideoMetadata {
  const factory StreamVideoMetadata({
    int? index,
    String? codecType,
    String? codec,
    int? width,
    int? height,
    String? frameRate,
    String? pixelFormat,
    String? bitrate,
    String? duration,
    int? totalChunks,
    String? fileName,
    String? opensubtitlesHash,
    int? size,
    String? title,
    Map<String, dynamic>? titleData,
  }) = _StreamVideoMetadata;

  factory StreamVideoMetadata.fromJson(Map<String, dynamic> json) =>
      _$StreamVideoMetadataFromJson(json);
}

/// An audio track of a stream.
///
/// Probe-derived data may be partial; all fields are nullable.
@freezed
abstract class StreamAudioMetadata with _$StreamAudioMetadata {
  const factory StreamAudioMetadata({
    int? index,
    String? codecType,
    String? codec,
    @JsonKey(name: 'default') bool? isDefault,
    String? sampleRate,
    int? channels,
    String? channelLayout,
    String? language,
    String? languageFull,
    String? title,
  }) = _StreamAudioMetadata;

  factory StreamAudioMetadata.fromJson(Map<String, dynamic> json) =>
      _$StreamAudioMetadataFromJson(json);
}

/// A subtitle track of a stream.
@freezed
abstract class StreamSubtitleMetadata with _$StreamSubtitleMetadata {
  const factory StreamSubtitleMetadata({
    int? index,
    String? codecType,
    String? codec,
    @JsonKey(name: 'default') bool? isDefault,
    String? language,
    String? languageFull,
    String? title,
  }) = _StreamSubtitleMetadata;

  factory StreamSubtitleMetadata.fromJson(Map<String, dynamic> json) =>
      _$StreamSubtitleMetadataFromJson(json);
}
