import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'user_stats_data.freezed.dart';
part 'user_stats_data.g.dart';

/// User statistics returned by `GET /v1/api/user/stats`.
@freezed
abstract class UserStatsData with _$UserStatsData {
  const factory UserStatsData({
    /// Present when the request used `general=true`.
    UserGeneralStats? general,

    /// Present when the request used `bandwidth=true`.
    List<UserBandwidthPoint>? bandwidth,
  }) = _UserStatsData;

  factory UserStatsData.fromJson(Map<String, dynamic> json) =>
      _$UserStatsDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/user/stats`.
TorBoxResponse<UserStatsData> userStatsResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => UserStatsData.fromJson(data as Map<String, dynamic>),
);

/// Aggregate transfer statistics for the account.
@freezed
abstract class UserGeneralStats with _$UserGeneralStats {
  const factory UserGeneralStats({
    required int totalDownloaded,
    required int totalUploaded,
    required double ratio,
    required int totalItemsDownloaded,
  }) = _UserGeneralStats;

  factory UserGeneralStats.fromJson(Map<String, dynamic> json) =>
      _$UserGeneralStatsFromJson(json);
}

/// Bandwidth usage grouped by day/week/month depending on the
/// `bandwidth_grouping` query parameter.
@freezed
abstract class UserBandwidthPoint with _$UserBandwidthPoint {
  const factory UserBandwidthPoint({
    required String date,
    required int bytesDownloaded,
  }) = _UserBandwidthPoint;

  factory UserBandwidthPoint.fromJson(Map<String, dynamic> json) =>
      _$UserBandwidthPointFromJson(json);
}
