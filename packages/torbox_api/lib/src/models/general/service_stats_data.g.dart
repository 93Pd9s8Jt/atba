// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_stats_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceStatsData _$ServiceStatsDataFromJson(Map<String, dynamic> json) =>
    _ServiceStatsData(
      activeTorrents: (json['active_torrents'] as num?)?.toInt(),
      totalUsers: (json['total_users'] as num).toInt(),
      totalServers: (json['total_servers'] as num).toInt(),
      totalDownloads: (json['total_downloads'] as num?)?.toInt(),
      downloadSpeed: (json['download_speed'] as num?)?.toInt(),
      uploadSpeed: (json['upload_speed'] as num?)?.toInt(),
      totalPlaybacks: (json['total_playbacks'] as num?)?.toInt(),
      totalStreams: (json['total_streams'] as num?)?.toInt(),
      totalFetches: (json['total_fetches'] as num?)?.toInt(),
      p95FetchTime: (json['p95_fetch_time'] as num?)?.toInt(),
      p95StreamTime: (json['p95_stream_time'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ServiceStatsDataToJson(_ServiceStatsData instance) =>
    <String, dynamic>{
      'active_torrents': instance.activeTorrents,
      'total_users': instance.totalUsers,
      'total_servers': instance.totalServers,
      'total_downloads': instance.totalDownloads,
      'download_speed': instance.downloadSpeed,
      'upload_speed': instance.uploadSpeed,
      'total_playbacks': instance.totalPlaybacks,
      'total_streams': instance.totalStreams,
      'total_fetches': instance.totalFetches,
      'p95_fetch_time': instance.p95FetchTime,
      'p95_stream_time': instance.p95StreamTime,
    };
