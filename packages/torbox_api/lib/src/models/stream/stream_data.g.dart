// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StreamData _$StreamDataFromJson(Map<String, dynamic> json) => _StreamData(
  id: (json['id'] as num).toInt(),
  fileId: (json['file_id'] as num).toInt(),
  authId: json['auth_id'] as String,
  name: json['name'] as String,
  shortName: json['short_name'] as String,
  s3Path: json['s3_path'] as String,
  size: (json['size'] as num).toInt(),
  mimetype: json['mimetype'] as String,
  hash: json['hash'] as String,
  openSubtitlesHash: json['open_subtitles_hash'] as String,
  type: json['type'] as String,
  region: json['region'] as String,
  domain: json['domain'] as String,
  userToken: json['user_token'] as String,
  webdavUrl: json['webdav_url'] as String,
  introInformation: json['intro_information'] == null
      ? null
      : StreamIntroInformation.fromJson(
          json['intro_information'] as Map<String, dynamic>,
        ),
  scrobblingEnabled: json['scrobbling_enabled'] as bool,
  hlsUrl: json['hls_url'] as String,
  presignedToken: json['presigned_token'] as String,
  subtitleIndex: (json['subtitle_index'] as num).toInt(),
  audioIndex: (json['audio_index'] as num).toInt(),
  resolutionIndex: (json['resolution_index'] as num).toInt(),
  isTranscoding: json['is_transcoding'] as bool,
  needsTranscoding: json['needs_transcoding'] as bool,
  metadata: json['metadata'] == null
      ? null
      : StreamMediaMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  searchMetadata: json['search_metadata'] == null
      ? null
      : StreamSearchMetadata.fromJson(
          json['search_metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$StreamDataToJson(_StreamData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_id': instance.fileId,
      'auth_id': instance.authId,
      'name': instance.name,
      'short_name': instance.shortName,
      's3_path': instance.s3Path,
      'size': instance.size,
      'mimetype': instance.mimetype,
      'hash': instance.hash,
      'open_subtitles_hash': instance.openSubtitlesHash,
      'type': instance.type,
      'region': instance.region,
      'domain': instance.domain,
      'user_token': instance.userToken,
      'webdav_url': instance.webdavUrl,
      'intro_information': instance.introInformation?.toJson(),
      'scrobbling_enabled': instance.scrobblingEnabled,
      'hls_url': instance.hlsUrl,
      'presigned_token': instance.presignedToken,
      'subtitle_index': instance.subtitleIndex,
      'audio_index': instance.audioIndex,
      'resolution_index': instance.resolutionIndex,
      'is_transcoding': instance.isTranscoding,
      'needs_transcoding': instance.needsTranscoding,
      'metadata': instance.metadata?.toJson(),
      'search_metadata': instance.searchMetadata?.toJson(),
    };

_StreamIntroInformation _$StreamIntroInformationFromJson(
  Map<String, dynamic> json,
) => _StreamIntroInformation(
  startTime: (json['start_time'] as num?)?.toInt(),
  endTime: (json['end_time'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$StreamIntroInformationToJson(
  _StreamIntroInformation instance,
) => <String, dynamic>{
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'title': instance.title,
};
