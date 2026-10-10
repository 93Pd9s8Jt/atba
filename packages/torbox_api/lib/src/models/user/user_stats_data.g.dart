// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatsData _$UserStatsDataFromJson(Map<String, dynamic> json) =>
    _UserStatsData(
      general: json['general'] == null
          ? null
          : UserGeneralStats.fromJson(json['general'] as Map<String, dynamic>),
      bandwidth: (json['bandwidth'] as List<dynamic>?)
          ?.map((e) => UserBandwidthPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStatsDataToJson(_UserStatsData instance) =>
    <String, dynamic>{
      'general': instance.general?.toJson(),
      'bandwidth': instance.bandwidth?.map((e) => e.toJson()).toList(),
    };

_UserGeneralStats _$UserGeneralStatsFromJson(Map<String, dynamic> json) =>
    _UserGeneralStats(
      totalDownloaded: (json['total_downloaded'] as num).toInt(),
      totalUploaded: (json['total_uploaded'] as num).toInt(),
      ratio: (json['ratio'] as num).toDouble(),
      totalItemsDownloaded: (json['total_items_downloaded'] as num).toInt(),
    );

Map<String, dynamic> _$UserGeneralStatsToJson(_UserGeneralStats instance) =>
    <String, dynamic>{
      'total_downloaded': instance.totalDownloaded,
      'total_uploaded': instance.totalUploaded,
      'ratio': instance.ratio,
      'total_items_downloaded': instance.totalItemsDownloaded,
    };

_UserBandwidthPoint _$UserBandwidthPointFromJson(Map<String, dynamic> json) =>
    _UserBandwidthPoint(
      date: json['date'] as String,
      bytesDownloaded: (json['bytes_downloaded'] as num).toInt(),
    );

Map<String, dynamic> _$UserBandwidthPointToJson(_UserBandwidthPoint instance) =>
    <String, dynamic>{
      'date': instance.date,
      'bytes_downloaded': instance.bytesDownloaded,
    };
