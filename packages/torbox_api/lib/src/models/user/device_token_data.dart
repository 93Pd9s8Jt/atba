import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'device_token_data.freezed.dart';
part 'device_token_data.g.dart';

/// API token issued by `POST /v1/api/user/auth/device/token` after the user
/// approves a device code.
@freezed
abstract class DeviceTokenData with _$DeviceTokenData {
  const factory DeviceTokenData({
    required String accessToken,
    required String tokenType,
  }) = _DeviceTokenData;

  factory DeviceTokenData.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenDataFromJson(json);
}

/// Parses a full API envelope for
/// `POST /v1/api/user/auth/device/token`.
TorBoxResponse<DeviceTokenData> deviceTokenResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => DeviceTokenData.fromJson(data as Map<String, dynamic>),
);
