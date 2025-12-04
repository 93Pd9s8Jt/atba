// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Torrent _$TorrentFromJson(Map<String, dynamic> json) =>
    Torrent(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        size: (json['size'] as num).toInt(),
        active: json['active'] as bool,
        authId: json['authId'] as String,
        downloadState: json['downloadState'] as String,
        progress: (json['progress'] as num).toDouble(),
        downloadSpeed: (json['downloadSpeed'] as num).toInt(),
        uploadSpeed: (json['uploadSpeed'] as num).toInt(),
        eta: (json['eta'] as num).toInt(),
        torrentFile: json['torrentFile'] as bool,
        expiresAt: json['expiresAt'] == null
            ? null
            : DateTime.parse(json['expiresAt'] as String),
        downloadPresent: json['downloadPresent'] as bool,
        downloadFinished: json['downloadFinished'] as bool,
        files: (json['files'] as List<dynamic>)
            .map((e) => DownloadableFile.fromJson(e as Map<String, dynamic>))
            .toList(),
        inactiveCheck: (json['inactiveCheck'] as num?)?.toInt(),
        availability: json['availability'] as num?,
        hash: json['hash'] as String,
        magnet: json['magnet'] as String?,
        seeds: (json['seeds'] as num).toInt(),
        peers: (json['peers'] as num).toInt(),
        ratio: (json['ratio'] as num).toDouble(),
        downloadPath: json['downloadPath'] as String?,
        tracker: json['tracker'] as String?,
        totalUploaded: (json['totalUploaded'] as num).toInt(),
        totalDownloaded: (json['totalDownloaded'] as num).toInt(),
        cached: json['cached'] as bool,
        owner: json['owner'] as String,
        seedTorrent: json['seedTorrent'] as bool,
        allowZipped: json['allowZipped'] as bool,
        longTermSeeding: json['longTermSeeding'] as bool,
        trackerMessage: json['trackerMessage'] as String?,
      )
      ..status = $enumDecode(_$TorrentStatusEnumMap, json['status'])
      ..itemStatus = $enumDecodeNullable(
        _$DownloadableItemStatusEnumMap,
        json['itemStatus'],
      )
      ..errorMessage = json['errorMessage'] as String?;

Map<String, dynamic> _$TorrentToJson(Torrent instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'size': instance.size,
  'active': instance.active,
  'authId': instance.authId,
  'downloadState': instance.downloadState,
  'progress': instance.progress,
  'downloadSpeed': instance.downloadSpeed,
  'uploadSpeed': instance.uploadSpeed,
  'eta': instance.eta,
  'torrentFile': instance.torrentFile,
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'downloadPresent': instance.downloadPresent,
  'downloadFinished': instance.downloadFinished,
  'files': instance.files,
  'inactiveCheck': instance.inactiveCheck,
  'availability': instance.availability,
  'hash': instance.hash,
  'magnet': instance.magnet,
  'seeds': instance.seeds,
  'peers': instance.peers,
  'ratio': instance.ratio,
  'downloadPath': instance.downloadPath,
  'tracker': instance.tracker,
  'totalUploaded': instance.totalUploaded,
  'totalDownloaded': instance.totalDownloaded,
  'cached': instance.cached,
  'owner': instance.owner,
  'seedTorrent': instance.seedTorrent,
  'allowZipped': instance.allowZipped,
  'longTermSeeding': instance.longTermSeeding,
  'trackerMessage': instance.trackerMessage,
  'status': _$TorrentStatusEnumMap[instance.status]!,
  'itemStatus': _$DownloadableItemStatusEnumMap[instance.itemStatus],
  'errorMessage': instance.errorMessage,
};

const _$TorrentStatusEnumMap = {
  TorrentStatus.idle: 'idle',
  TorrentStatus.loading: 'loading',
  TorrentStatus.success: 'success',
  TorrentStatus.error: 'error',
};

const _$DownloadableItemStatusEnumMap = {
  DownloadableItemStatus.idle: 'idle',
  DownloadableItemStatus.loading: 'loading',
  DownloadableItemStatus.success: 'success',
  DownloadableItemStatus.error: 'error',
};

QueuedTorrent _$QueuedTorrentFromJson(Map<String, dynamic> json) =>
    QueuedTorrent(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        magnet: json['magnet'] as String,
        torrentFileLink: json['torrentFileLink'] as String?,
        hash: json['hash'] as String,
        type: json['type'] as String,
      )
      ..status = $enumDecode(_$TorrentStatusEnumMap, json['status'])
      ..itemStatus = $enumDecodeNullable(
        _$DownloadableItemStatusEnumMap,
        json['itemStatus'],
      )
      ..errorMessage = json['errorMessage'] as String?;

Map<String, dynamic> _$QueuedTorrentToJson(QueuedTorrent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'magnet': instance.magnet,
      'torrentFileLink': instance.torrentFileLink,
      'hash': instance.hash,
      'type': instance.type,
      'status': _$TorrentStatusEnumMap[instance.status]!,
      'itemStatus': _$DownloadableItemStatusEnumMap[instance.itemStatus],
      'errorMessage': instance.errorMessage,
    };
