// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StreamInfoData _$StreamInfoDataFromJson(Map<String, dynamic> json) =>
    _StreamInfoData(
      hlsUrl: json['hls_url'] as String,
      domain: json['domain'] as String,
      presignedToken: json['presigned_token'] as String,
      subtitleIndex: (json['subtitle_index'] as num).toInt(),
      audioIndex: (json['audio_index'] as num).toInt(),
      resolutionIndex: (json['resolution_index'] as num).toInt(),
      fileToken: json['file_token'] as String,
      token: json['token'] as String,
      isTranscoding: json['is_transcoding'] as bool,
      needsTranscoding: json['needs_transcoding'] as bool,
      metadata: json['metadata'] == null
          ? null
          : StreamMediaMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      searchMetadata: json['search_metadata'] == null
          ? null
          : StreamSearchMetadata.fromJson(
              json['search_metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StreamInfoDataToJson(_StreamInfoData instance) =>
    <String, dynamic>{
      'hls_url': instance.hlsUrl,
      'domain': instance.domain,
      'presigned_token': instance.presignedToken,
      'subtitle_index': instance.subtitleIndex,
      'audio_index': instance.audioIndex,
      'resolution_index': instance.resolutionIndex,
      'file_token': instance.fileToken,
      'token': instance.token,
      'is_transcoding': instance.isTranscoding,
      'needs_transcoding': instance.needsTranscoding,
      'metadata': instance.metadata?.toJson(),
      'search_metadata': instance.searchMetadata?.toJson(),
    };
