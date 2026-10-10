// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_web_download_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatedWebDownloadData _$CreatedWebDownloadDataFromJson(
  Map<String, dynamic> json,
) => _CreatedWebDownloadData(
  hash: json['hash'] as String,
  webdownloadId: (json['webdownload_id'] as num).toInt(),
  authId: json['auth_id'] as String,
  jdownloaderId: json['jdownloader_id'] as String?,
  linkList: (json['link_list'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CreatedWebDownloadDataToJson(
  _CreatedWebDownloadData instance,
) => <String, dynamic>{
  'hash': instance.hash,
  'webdownload_id': instance.webdownloadId,
  'auth_id': instance.authId,
  'jdownloader_id': instance.jdownloaderId,
  'link_list': instance.linkList,
};
