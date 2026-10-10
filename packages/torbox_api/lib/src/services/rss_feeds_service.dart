import '../models/common/torbox_response.dart';
import '../models/rss/rss_feed_data.dart';
import '../models/rss/rss_feed_item_data.dart';
import '../net/torbox_client.dart';

/// RSS feeds service.
///
/// Wraps all `/v1/api/rss/*` endpoints. Accessed via [TorboxApi.rssFeeds].
class RssFeedsService {
  final TorboxClient _client;

  RssFeedsService(this._client);

  /// Add a new RSS feed.
  Future<TorBoxResponse<Null>> addRssFeed({
    required String url,
    required String name,
    String? doRegex,
    String? dontRegex,
    int? dontOlderThan,
    bool? passCheck,
    int? scanInterval,
    String? rssType,
    int? torrentSeeding,
  }) async {
    final response = await _client.post(
      'api/rss/addrss',
      body: {
        'url': url,
        'name': name,
        'do_regex': doRegex,
        'dont_regex': dontRegex,
        'dont_older_than': dontOlderThan,
        'pass_check': passCheck,
        'scan_interval': scanInterval,
        'rss_type': rssType,
        'torrent_seeding': torrentSeeding,
      },
    );
    return nullResponseFromJson(response);
  }

  /// Control an RSS feed (pause, resume, delete, update).
  Future<TorBoxResponse<Null>> controlRssFeed({
    required String operation,
    required int rssFeedId,
  }) async {
    final response = await _client.post(
      'api/rss/controlrss',
      body: {'operation': operation, 'rss_feed_id': rssFeedId},
    );
    return nullResponseFromJson(response);
  }

  /// Modify an existing RSS feed.
  Future<TorBoxResponse<Null>> modifyRssFeed({
    required int rssFeedId,
    String? name,
    String? doRegex,
    String? dontRegex,
    int? scanInterval,
    int? dontOlderThan,
    String? rssType,
    int? torrentSeeding,
    bool? passCheck,
  }) async {
    final response = await _client.post(
      'api/rss/modifyrss',
      body: {
        'rss_feed_id': rssFeedId,
        'name': name,
        'do_regex': doRegex,
        'dont_regex': dontRegex,
        'scan_interval': scanInterval,
        'dont_older_than': dontOlderThan,
        'rss_type': rssType,
        'torrent_seeding': torrentSeeding,
        'pass_check': passCheck,
      },
    );
    return nullResponseFromJson(response);
  }

  /// Get the user's RSS feeds.
  Future<TorBoxResponse<List<RssFeedData>>> getRssFeeds({int? id}) async {
    final response = await _client.get(
      'api/rss/getfeeds',
      queryParams: {'id': id},
    );
    return rssFeedListResponseFromJson(response);
  }

  /// Get items from a specific RSS feed.
  Future<TorBoxResponse<List<RssFeedItemData>>> getRssFeedItems({
    required int rssFeedId,
  }) async {
    final response = await _client.get(
      'api/rss/getfeeditems',
      queryParams: {'rss_feed_id': rssFeedId},
    );
    return rssFeedItemListResponseFromJson(response);
  }
}
