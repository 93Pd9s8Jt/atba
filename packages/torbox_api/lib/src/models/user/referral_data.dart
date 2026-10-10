import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'referral_data.freezed.dart';
part 'referral_data.g.dart';

/// Referral statistics returned by `GET /v1/api/user/referraldata`.
@freezed
abstract class ReferralData with _$ReferralData {
  const factory ReferralData({
    required int referredAccounts,
    required String referralCode,
    required int purchasesReferred,
  }) = _ReferralData;

  factory ReferralData.fromJson(Map<String, dynamic> json) =>
      _$ReferralDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/user/referraldata`.
TorBoxResponse<ReferralData> referralDataResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => ReferralData.fromJson(data as Map<String, dynamic>),
);
