// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_feed_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RssFeedData _$RssFeedDataFromJson(Map<String, dynamic> json) => _RssFeedData(
  id: (json['id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  lastChecked: json['last_checked'] as String,
  authId: json['auth_id'] as String,
  name: json['name'] as String,
  url: json['url'] as String,
  source: json['source'] as String?,
  sourceName: json['source_name'] as String?,
  doRegex: json['do_regex'] as String?,
  dontRegex: json['dont_regex'] as String?,
  status: json['status'] as String?,
  scanInterval: (json['scan_interval'] as num?)?.toInt(),
  dontOlderThan: (json['dont_older_than'] as num?)?.toInt(),
  statusMessage: json['status_message'] as String?,
  type: json['type'] as String?,
  torrentSeeding: (json['torrent_seeding'] as num?)?.toInt(),
  state: json['state'] as String?,
);

Map<String, dynamic> _$RssFeedDataToJson(_RssFeedData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'last_checked': instance.lastChecked,
      'auth_id': instance.authId,
      'name': instance.name,
      'url': instance.url,
      'source': instance.source,
      'source_name': instance.sourceName,
      'do_regex': instance.doRegex,
      'dont_regex': instance.dontRegex,
      'status': instance.status,
      'scan_interval': instance.scanInterval,
      'dont_older_than': instance.dontOlderThan,
      'status_message': instance.statusMessage,
      'type': instance.type,
      'torrent_seeding': instance.torrentSeeding,
      'state': instance.state,
    };
