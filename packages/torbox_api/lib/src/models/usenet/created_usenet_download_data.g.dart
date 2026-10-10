// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_usenet_download_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatedUsenetDownloadData _$CreatedUsenetDownloadDataFromJson(
  Map<String, dynamic> json,
) => _CreatedUsenetDownloadData(
  hash: json['hash'] as String,
  usenetDownloadId: (json['usenetdownload_id'] as num).toInt(),
  authId: json['auth_id'] as String,
);

Map<String, dynamic> _$CreatedUsenetDownloadDataToJson(
  _CreatedUsenetDownloadData instance,
) => <String, dynamic>{
  'hash': instance.hash,
  'usenetdownload_id': instance.usenetDownloadId,
  'auth_id': instance.authId,
};
