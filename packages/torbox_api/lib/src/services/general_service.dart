import '../models/common/torbox_response.dart';
import '../models/general/changelog_entry.dart';
import '../models/general/service_stats_data.dart';
import '../models/general/speedtest_file_data.dart';
import '../net/torbox_client.dart';

/// General service.
///
/// Wraps `/v1/api/stats`, `/v1/api/changelogs/*`, `/v1/api/speedtest`
/// endpoints. Accessed via [TorboxApi.general].
class GeneralService {
  final TorboxClient _client;

  GeneralService(this._client);

  /// Get service-wide statistics.
  Future<TorBoxResponse<ServiceStatsData>> getStats() async {
    final response = await _client.get('api/stats');
    return serviceStatsResponseFromJson(response);
  }

  /// Get changelogs as RSS feed (returns raw XML string).
  Future<String> getChangelogsRss() {
    return _client.getRaw('api/changelogs/rss');
  }

  /// Get changelogs as JSON.
  Future<TorBoxResponse<List<ChangelogEntry>>> getChangelogsJson() async {
    final response = await _client.get('api/changelogs/json');
    return changelogListResponseFromJson(response);
  }

  /// Get available speedtest files.
  Future<TorBoxResponse<List<SpeedtestFileData>>> getSpeedtestFiles({
    int? testLength,
    String? region,
  }) async {
    final response = await _client.get(
      'api/speedtest',
      queryParams: {'test_length': testLength, 'region': region},
    );
    return speedtestListResponseFromJson(response);
  }
}
