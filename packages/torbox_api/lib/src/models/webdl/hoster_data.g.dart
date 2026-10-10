// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoster_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HosterData _$HosterDataFromJson(Map<String, dynamic> json) => _HosterData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  domains: (json['domains'] as List<dynamic>).map((e) => e as String).toList(),
  url: json['url'] as String,
  icon: json['icon'] as String,
  status: json['status'] as bool,
  type: json['type'] as String,
  note: json['note'] as String?,
  nsfw: json['nsfw'] as bool,
  dailyLinkLimit: (json['daily_link_limit'] as num).toInt(),
  dailyLinkUsed: (json['daily_link_used'] as num).toInt(),
  dailyBandwidthLimit: (json['daily_bandwidth_limit'] as num).toInt(),
  dailyBandwidthUsed: (json['daily_bandwidth_used'] as num).toInt(),
  perLinkSizeLimit: (json['per_link_size_limit'] as num).toInt(),
  regex: json['regex'] as String,
);

Map<String, dynamic> _$HosterDataToJson(_HosterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'domains': instance.domains,
      'url': instance.url,
      'icon': instance.icon,
      'status': instance.status,
      'type': instance.type,
      'note': instance.note,
      'nsfw': instance.nsfw,
      'daily_link_limit': instance.dailyLinkLimit,
      'daily_link_used': instance.dailyLinkUsed,
      'daily_bandwidth_limit': instance.dailyBandwidthLimit,
      'daily_bandwidth_used': instance.dailyBandwidthUsed,
      'per_link_size_limit': instance.perLinkSizeLimit,
      'regex': instance.regex,
    };
