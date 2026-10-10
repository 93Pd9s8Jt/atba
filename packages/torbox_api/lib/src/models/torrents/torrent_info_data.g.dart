// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TorrentInfoData _$TorrentInfoDataFromJson(Map<String, dynamic> json) =>
    _TorrentInfoData(
      name: json['name'] as String?,
      hash: json['hash'] as String,
      size: (json['size'] as num?)?.toInt(),
      trackers: (json['trackers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      seeds: (json['seeds'] as num?)?.toInt(),
      peers: (json['peers'] as num?)?.toInt(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => TorrentInfoFileData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TorrentInfoDataToJson(_TorrentInfoData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hash': instance.hash,
      'size': instance.size,
      'trackers': instance.trackers,
      'seeds': instance.seeds,
      'peers': instance.peers,
      'files': instance.files?.map((e) => e.toJson()).toList(),
    };
