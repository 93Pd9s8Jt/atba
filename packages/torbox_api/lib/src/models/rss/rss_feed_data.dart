import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'rss_feed_data.freezed.dart';
part 'rss_feed_data.g.dart';

/// An RSS feed belonging to the user, returned by
/// `GET /v1/api/rss/getfeeds`.
@freezed
abstract class RssFeedData with _$RssFeedData {
  const factory RssFeedData({
    required int id,
    required String createdAt,
    required String lastChecked,
    required String authId,
    required String name,
    required String url,

    /// The site the feed originates from.
    String? source,
    String? sourceName,
    String? doRegex,
    String? dontRegex,
    String? status,
    int? scanInterval,
    int? dontOlderThan,
    String? statusMessage,
    String? type,
    int? torrentSeeding,
    String? state,
  }) = _RssFeedData;

  factory RssFeedData.fromJson(Map<String, dynamic> json) =>
      _$RssFeedDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/rss/getfeeds`, whose
/// `data` is a list of RSS feeds.
TorBoxResponse<List<RssFeedData>> rssFeedListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => RssFeedData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
