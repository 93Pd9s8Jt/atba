import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'rss_feed_item_data.freezed.dart';
part 'rss_feed_item_data.g.dart';

/// An item scraped from an RSS feed, returned by
/// `GET /v1/api/rss/getfeeditems`.
@freezed
abstract class RssFeedItemData with _$RssFeedItemData {
  const factory RssFeedItemData({
    required int id,
    required String createdAt,
    required String rssName,
    required String rssUrl,
    required bool ignored,
    required bool downloaded,
    required String link,
    required String name,
    required String status,
    required String statusMessage,
    required int seedTorrents,
    required String type,
  }) = _RssFeedItemData;

  factory RssFeedItemData.fromJson(Map<String, dynamic> json) =>
      _$RssFeedItemDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/rss/getfeeditems`, whose
/// `data` is a list of RSS feed items.
TorBoxResponse<List<RssFeedItemData>> rssFeedItemListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => RssFeedItemData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
