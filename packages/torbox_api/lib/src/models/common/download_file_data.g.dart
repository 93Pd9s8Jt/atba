// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_file_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownloadFileData _$DownloadFileDataFromJson(Map<String, dynamic> json) =>
    _DownloadFileData(
      id: (json['id'] as num).toInt(),
      md5: json['md5'] as String?,
      hash: json['hash'] as String?,
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      zipped: json['zipped'] as bool?,
      s3Path: json['s3_path'] as String?,
      infected: json['infected'] as bool?,
      mimetype: json['mimetype'] as String?,
      shortName: json['short_name'] as String?,
      absolutePath: json['absolute_path'] as String?,
      opensubtitlesHash: json['opensubtitles_hash'] as String?,
    );

Map<String, dynamic> _$DownloadFileDataToJson(_DownloadFileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'md5': instance.md5,
      'hash': instance.hash,
      'name': instance.name,
      'size': instance.size,
      'zipped': instance.zipped,
      's3_path': instance.s3Path,
      'infected': instance.infected,
      'mimetype': instance.mimetype,
      'short_name': instance.shortName,
      'absolute_path': instance.absolutePath,
      'opensubtitles_hash': instance.opensubtitlesHash,
    };
