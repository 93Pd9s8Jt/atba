// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_torrent_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatedTorrentData _$CreatedTorrentDataFromJson(Map<String, dynamic> json) =>
    _CreatedTorrentData(
      hash: json['hash'] as String,
      torrentId: (json['torrent_id'] as num).toInt(),
      authId: json['auth_id'] as String,
      activeLimit: (json['active_limit'] as num?)?.toInt(),
      currentActiveDownloads: (json['current_active_downloads'] as num?)
          ?.toInt(),
      queuedId: (json['queued_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreatedTorrentDataToJson(_CreatedTorrentData instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'torrent_id': instance.torrentId,
      'auth_id': instance.authId,
      'active_limit': instance.activeLimit,
      'current_active_downloads': instance.currentActiveDownloads,
      'queued_id': instance.queuedId,
    };
