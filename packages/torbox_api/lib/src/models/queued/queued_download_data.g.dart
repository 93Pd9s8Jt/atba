// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_download_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueuedDownloadData _$QueuedDownloadDataFromJson(Map<String, dynamic> json) =>
    _QueuedDownloadData(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      magnet: json['magnet'] as String?,
      torrentFile: json['torrent_file'] as String?,
      hash: json['hash'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String,
      nameOverride: json['name_override'] as String?,
      seedTorrentOverride: (json['seed_torrent_override'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QueuedDownloadDataToJson(_QueuedDownloadData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'magnet': instance.magnet,
      'torrent_file': instance.torrentFile,
      'hash': instance.hash,
      'name': instance.name,
      'type': instance.type,
      'name_override': instance.nameOverride,
      'seed_torrent_override': instance.seedTorrentOverride,
    };
