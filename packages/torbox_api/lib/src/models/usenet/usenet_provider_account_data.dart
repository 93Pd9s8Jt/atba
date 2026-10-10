import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'usenet_provider_account_data.freezed.dart';
part 'usenet_provider_account_data.g.dart';

/// The user's TorBox Usenet provider account credentials, returned by
/// `GET /v1/api/usenet/provider/account` and after password reset via
/// `POST /v1/api/usenet/provider/account/resetpw`.
@freezed
abstract class UsenetProviderAccountData with _$UsenetProviderAccountData {
  const factory UsenetProviderAccountData({
    required String host,
    required int port,
    required bool ssl,
    required int connections,
    required String username,
    required String password,
  }) = _UsenetProviderAccountData;

  factory UsenetProviderAccountData.fromJson(Map<String, dynamic> json) =>
      _$UsenetProviderAccountDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/usenet/provider/account`
/// and `POST /v1/api/usenet/provider/account/resetpw`.
TorBoxResponse<UsenetProviderAccountData> usenetProviderAccountResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => UsenetProviderAccountData.fromJson(data as Map<String, dynamic>),
);
