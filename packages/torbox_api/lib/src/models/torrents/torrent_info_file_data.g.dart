// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_info_file_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TorrentInfoFileData _$TorrentInfoFileDataFromJson(Map<String, dynamic> json) =>
    _TorrentInfoFileData(
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$TorrentInfoFileDataToJson(
  _TorrentInfoFileData instance,
) => <String, dynamic>{'name': instance.name, 'size': instance.size};
