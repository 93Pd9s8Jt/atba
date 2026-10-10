// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardFilter _$DashboardFilterFromJson(Map<String, dynamic> json) =>
    _DashboardFilter(
      active: json['active'] as bool?,
      cached: json['cached'] as bool?,
      queued: json['queued'] as bool?,
      private: json['private'] as bool?,
      borrowed: json['borrowed'] as bool?,
      inactive: json['inactive'] as bool?,
      torrents: json['torrents'] as bool?,
      uncached: json['uncached'] as bool?,
      uploading: json['uploading'] as bool?,
      processing: json['processing'] as bool?,
      downloading: json['downloading'] as bool?,
      webDownloads: json['web_downloads'] as bool?,
      downloadReady: json['download_ready'] as bool?,
      usenetDownloads: json['usenet_downloads'] as bool?,
    );

Map<String, dynamic> _$DashboardFilterToJson(_DashboardFilter instance) =>
    <String, dynamic>{
      'active': instance.active,
      'cached': instance.cached,
      'queued': instance.queued,
      'private': instance.private,
      'borrowed': instance.borrowed,
      'inactive': instance.inactive,
      'torrents': instance.torrents,
      'uncached': instance.uncached,
      'uploading': instance.uploading,
      'processing': instance.processing,
      'downloading': instance.downloading,
      'web_downloads': instance.webDownloads,
      'download_ready': instance.downloadReady,
      'usenet_downloads': instance.usenetDownloads,
    };
