// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_feed_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RssFeedItemData _$RssFeedItemDataFromJson(Map<String, dynamic> json) =>
    _RssFeedItemData(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      rssName: json['rss_name'] as String,
      rssUrl: json['rss_url'] as String,
      ignored: json['ignored'] as bool,
      downloaded: json['downloaded'] as bool,
      link: json['link'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      statusMessage: json['status_message'] as String,
      seedTorrents: (json['seed_torrents'] as num).toInt(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$RssFeedItemDataToJson(_RssFeedItemData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'rss_name': instance.rssName,
      'rss_url': instance.rssUrl,
      'ignored': instance.ignored,
      'downloaded': instance.downloaded,
      'link': instance.link,
      'name': instance.name,
      'status': instance.status,
      'status_message': instance.statusMessage,
      'seed_torrents': instance.seedTorrents,
      'type': instance.type,
    };
