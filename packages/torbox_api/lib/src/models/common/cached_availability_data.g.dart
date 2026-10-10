// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_availability_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CachedAvailabilityData _$CachedAvailabilityDataFromJson(
  Map<String, dynamic> json,
) => _CachedAvailabilityData(
  name: json['name'] as String,
  size: (json['size'] as num).toInt(),
  hash: json['hash'] as String,
  files: (json['files'] as List<dynamic>?)
      ?.map((e) => CachedFileData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CachedAvailabilityDataToJson(
  _CachedAvailabilityData instance,
) => <String, dynamic>{
  'name': instance.name,
  'size': instance.size,
  'hash': instance.hash,
  'files': instance.files?.map((e) => e.toJson()).toList(),
};

_CachedFileData _$CachedFileDataFromJson(Map<String, dynamic> json) =>
    _CachedFileData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      opensubtitlesHash: json['opensubtitles_hash'] as String?,
      shortName: json['short_name'] as String?,
      mimetype: json['mimetype'] as String?,
    );

Map<String, dynamic> _$CachedFileDataToJson(_CachedFileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'opensubtitles_hash': instance.opensubtitlesHash,
      'short_name': instance.shortName,
      'mimetype': instance.mimetype,
    };
