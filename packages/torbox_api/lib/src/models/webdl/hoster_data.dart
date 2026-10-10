import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'hoster_data.freezed.dart';
part 'hoster_data.g.dart';

/// A supported file hoster or stream site, returned by
/// `GET /v1/api/webdl/hosters`.
///
/// When called with an API token the daily usage fields reflect the
/// authenticated user's consumption.
@freezed
abstract class HosterData with _$HosterData {
  const factory HosterData({
    required int id,
    required String name,

    /// Domains this hoster matches.
    required List<String> domains,
    required String url,
    required String icon,
    required bool status,
    required String type,
    String? note,
    required bool nsfw,
    required int dailyLinkLimit,
    required int dailyLinkUsed,
    required int dailyBandwidthLimit,
    required int dailyBandwidthUsed,
    required int perLinkSizeLimit,
    required String regex,
  }) = _HosterData;

  factory HosterData.fromJson(Map<String, dynamic> json) =>
      _$HosterDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/webdl/hosters`, whose
/// `data` is a list of hosters.
TorBoxResponse<List<HosterData>> hosterListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => HosterData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
