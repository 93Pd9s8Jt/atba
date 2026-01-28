// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_torrent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueuedTorrent _$QueuedTorrentFromJson(Map<String, dynamic> json) =>
    QueuedTorrent(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        magnet: json['magnet'] as String?,
        torrentFileLink: json['torrentFileLink'] as String?,
        hash: json['hash'] as String,
        type: json['type'] as String?,
      )
      ..itemStatus = $enumDecodeNullable(
        _$DownloadableItemStatusEnumMap,
        json['itemStatus'],
      )
      ..errorMessage = json['errorMessage'] as String?
      ..status = $enumDecode(_$TorrentStatusEnumMap, json['status']);

Map<String, dynamic> _$QueuedTorrentToJson(QueuedTorrent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'itemStatus': _$DownloadableItemStatusEnumMap[instance.itemStatus],
      'errorMessage': instance.errorMessage,
      'magnet': instance.magnet,
      'torrentFileLink': instance.torrentFileLink,
      'hash': instance.hash,
      'type': instance.type,
      'status': _$TorrentStatusEnumMap[instance.status]!,
    };

const _$DownloadableItemStatusEnumMap = {
  DownloadableItemStatus.idle: 'idle',
  DownloadableItemStatus.loading: 'loading',
  DownloadableItemStatus.success: 'success',
  DownloadableItemStatus.error: 'error',
};

const _$TorrentStatusEnumMap = {
  TorrentStatus.idle: 'idle',
  TorrentStatus.loading: 'loading',
  TorrentStatus.success: 'success',
  TorrentStatus.error: 'error',
};
