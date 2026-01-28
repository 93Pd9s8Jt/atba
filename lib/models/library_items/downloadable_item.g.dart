// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloadable_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadableFile _$DownloadableFileFromJson(Map<String, dynamic> json) =>
    DownloadableFile(
      id: (json['id'] as num).toInt(),
      md5: json['md5'] as String?,
      s3Path: json['s3Path'] as String,
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      mimetype: json['mimetype'] as String,
      shortName: json['shortName'] as String,
    );

Map<String, dynamic> _$DownloadableFileToJson(DownloadableFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'md5': instance.md5,
      's3Path': instance.s3Path,
      'name': instance.name,
      'size': instance.size,
      'mimetype': instance.mimetype,
      'shortName': instance.shortName,
    };
