import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';
import 'user_settings.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

/// The authenticated user's information.
///
/// Returned by `GET /v1/api/user/me`. When requested with `settings=true`,
/// [settings] is populated as well.
@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required int id,
    required String authId,
    String? createdAt,
    String? updatedAt,

    /// Plan tier identifier (0 = free).
    int? plan,
    int? totalDownloaded,
    String? customer,
    bool? isSubscribed,

    /// ISO-8601 timestamp of when premium expires.
    String? premiumExpiresAt,

    /// ISO-8601 timestamp of when a cooldown ends.
    String? cooldownUntil,
    String? email,
    String? userReferral,
    String? baseEmail,
    int? totalBytesDownloaded,
    int? totalBytesUploaded,
    int? torrentsDownloaded,
    int? webDownloadsDownloaded,
    int? usenetDownloadsDownloaded,
    int? additionalConcurrentSlots,
    bool? longTermSeeding,
    bool? longTermStorage,
    bool? isVendor,
    int? vendorId,
    int? purchasesReferred,
    UserSettings? settings,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/user/me`.
TorBoxResponse<UserData> userDataResponseFromJson(Map<String, dynamic> json) =>
    TorBoxResponse.fromJson(
      json,
      (data) => UserData.fromJson(data as Map<String, dynamic>),
    );
