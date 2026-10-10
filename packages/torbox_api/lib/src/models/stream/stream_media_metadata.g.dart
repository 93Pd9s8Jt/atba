// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_media_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StreamMediaMetadata _$StreamMediaMetadataFromJson(Map<String, dynamic> json) =>
    _StreamMediaMetadata(
      video: json['video'] == null
          ? null
          : StreamVideoMetadata.fromJson(json['video'] as Map<String, dynamic>),
      audios: (json['audios'] as List<dynamic>?)
          ?.map((e) => StreamAudioMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtitles: (json['subtitles'] as List<dynamic>?)
          ?.map(
            (e) => StreamSubtitleMetadata.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      chapters: json['chapters'] as String?,
    );

Map<String, dynamic> _$StreamMediaMetadataToJson(
  _StreamMediaMetadata instance,
) => <String, dynamic>{
  'video': instance.video?.toJson(),
  'audios': instance.audios?.map((e) => e.toJson()).toList(),
  'subtitles': instance.subtitles?.map((e) => e.toJson()).toList(),
  'thumbnail': instance.thumbnail,
  'chapters': instance.chapters,
};

_StreamVideoMetadata _$StreamVideoMetadataFromJson(Map<String, dynamic> json) =>
    _StreamVideoMetadata(
      index: (json['index'] as num?)?.toInt(),
      codecType: json['codec_type'] as String?,
      codec: json['codec'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      frameRate: json['frame_rate'] as String?,
      pixelFormat: json['pixel_format'] as String?,
      bitrate: json['bitrate'] as String?,
      duration: json['duration'] as String?,
      totalChunks: (json['total_chunks'] as num?)?.toInt(),
      fileName: json['file_name'] as String?,
      opensubtitlesHash: json['opensubtitles_hash'] as String?,
      size: (json['size'] as num?)?.toInt(),
      title: json['title'] as String?,
      titleData: json['title_data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StreamVideoMetadataToJson(
  _StreamVideoMetadata instance,
) => <String, dynamic>{
  'index': instance.index,
  'codec_type': instance.codecType,
  'codec': instance.codec,
  'width': instance.width,
  'height': instance.height,
  'frame_rate': instance.frameRate,
  'pixel_format': instance.pixelFormat,
  'bitrate': instance.bitrate,
  'duration': instance.duration,
  'total_chunks': instance.totalChunks,
  'file_name': instance.fileName,
  'opensubtitles_hash': instance.opensubtitlesHash,
  'size': instance.size,
  'title': instance.title,
  'title_data': instance.titleData,
};

_StreamAudioMetadata _$StreamAudioMetadataFromJson(Map<String, dynamic> json) =>
    _StreamAudioMetadata(
      index: (json['index'] as num?)?.toInt(),
      codecType: json['codec_type'] as String?,
      codec: json['codec'] as String?,
      isDefault: json['default'] as bool?,
      sampleRate: json['sample_rate'] as String?,
      channels: (json['channels'] as num?)?.toInt(),
      channelLayout: json['channel_layout'] as String?,
      language: json['language'] as String?,
      languageFull: json['language_full'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$StreamAudioMetadataToJson(
  _StreamAudioMetadata instance,
) => <String, dynamic>{
  'index': instance.index,
  'codec_type': instance.codecType,
  'codec': instance.codec,
  'default': instance.isDefault,
  'sample_rate': instance.sampleRate,
  'channels': instance.channels,
  'channel_layout': instance.channelLayout,
  'language': instance.language,
  'language_full': instance.languageFull,
  'title': instance.title,
};

_StreamSubtitleMetadata _$StreamSubtitleMetadataFromJson(
  Map<String, dynamic> json,
) => _StreamSubtitleMetadata(
  index: (json['index'] as num?)?.toInt(),
  codecType: json['codec_type'] as String?,
  codec: json['codec'] as String?,
  isDefault: json['default'] as bool?,
  language: json['language'] as String?,
  languageFull: json['language_full'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$StreamSubtitleMetadataToJson(
  _StreamSubtitleMetadata instance,
) => <String, dynamic>{
  'index': instance.index,
  'codec_type': instance.codecType,
  'codec': instance.codec,
  'default': instance.isDefault,
  'language': instance.language,
  'language_full': instance.languageFull,
  'title': instance.title,
};
