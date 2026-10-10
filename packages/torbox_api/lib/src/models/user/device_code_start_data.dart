import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'device_code_start_data.freezed.dart';
part 'device_code_start_data.g.dart';

/// Device authorization session created by
/// `GET /v1/api/user/auth/device/start`.
@freezed
abstract class DeviceCodeStartData with _$DeviceCodeStartData {
  const factory DeviceCodeStartData({
    required String deviceCode,

    /// Polling interval in seconds.
    required int interval,

    /// ISO-8601 timestamp when the device code expires.
    required String expiresAt,
    required String verificationUrl,

    /// Short URL suitable for manual entry.
    required String friendlyVerificationUrl,

    /// Human-friendly code the user enters on the verification page.
    required String code,
  }) = _DeviceCodeStartData;

  factory DeviceCodeStartData.fromJson(Map<String, dynamic> json) =>
      _$DeviceCodeStartDataFromJson(json);
}

/// Parses a full API envelope for
/// `GET /v1/api/user/auth/device/start`.
TorBoxResponse<DeviceCodeStartData> deviceCodeStartResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => DeviceCodeStartData.fromJson(data as Map<String, dynamic>),
);
