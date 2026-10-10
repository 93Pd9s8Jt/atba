import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'speedtest_file_data.freezed.dart';
part 'speedtest_file_data.g.dart';

/// A speed test file returned by `GET /v1/api/speedtest`.
@freezed
abstract class SpeedtestFileData with _$SpeedtestFileData {
  const factory SpeedtestFileData({
    required String region,
    required String name,
    required String domain,
    required String path,
    required String url,
    required bool closest,
    required SpeedtestCoordinates coordinates,
  }) = _SpeedtestFileData;

  factory SpeedtestFileData.fromJson(Map<String, dynamic> json) =>
      _$SpeedtestFileDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/speedtest`, whose `data`
/// is a list of speed test files.
TorBoxResponse<List<SpeedtestFileData>> speedtestListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => SpeedtestFileData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

/// Geographic location of a speed test server.
@freezed
abstract class SpeedtestCoordinates with _$SpeedtestCoordinates {
  const factory SpeedtestCoordinates({
    required double lat,
    required double lng,
  }) = _SpeedtestCoordinates;

  factory SpeedtestCoordinates.fromJson(Map<String, dynamic> json) =>
      _$SpeedtestCoordinatesFromJson(json);
}
