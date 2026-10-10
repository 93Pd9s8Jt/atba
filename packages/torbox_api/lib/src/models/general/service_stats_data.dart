import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'service_stats_data.freezed.dart';
part 'service_stats_data.g.dart';

/// Service-wide statistics returned by `GET /v1/api/stats`.
@freezed
abstract class ServiceStatsData with _$ServiceStatsData {
  const factory ServiceStatsData({
    @JsonKey(name: 'active_torrents') int? activeTorrents,
    @JsonKey(name: 'total_users') required int totalUsers,
    @JsonKey(name: 'total_servers') required int totalServers,
    @JsonKey(name: 'total_downloads') int? totalDownloads,
    @JsonKey(name: 'download_speed') int? downloadSpeed,
    @JsonKey(name: 'upload_speed') int? uploadSpeed,
    @JsonKey(name: 'total_playbacks') int? totalPlaybacks,
    @JsonKey(name: 'total_streams') int? totalStreams,
    @JsonKey(name: 'total_fetches') int? totalFetches,
    @JsonKey(name: 'p95_fetch_time') int? p95FetchTime,
    @JsonKey(name: 'p95_stream_time') int? p95StreamTime,
  }) = _ServiceStatsData;

  factory ServiceStatsData.fromJson(Map<String, dynamic> json) =>
      _$ServiceStatsDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/stats`.
TorBoxResponse<ServiceStatsData> serviceStatsResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => ServiceStatsData.fromJson(data as Map<String, dynamic>),
);
