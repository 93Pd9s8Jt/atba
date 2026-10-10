import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'user_subscription.freezed.dart';
part 'user_subscription.g.dart';

/// A subscription record returned by `GET /v1/api/user/subscriptions`.
@freezed
abstract class UserSubscription with _$UserSubscription {
  const factory UserSubscription({
    String? createdAt,
    String? updatedAt,
    String? subscriptionCode,
    String? emailToken,
    String? authId,
    String? planCode,
    String? status,
    String? gateway,
    String? planName,
  }) = _UserSubscription;

  factory UserSubscription.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/user/subscriptions`, whose
/// `data` is a list of subscriptions.
TorBoxResponse<List<UserSubscription>> userSubscriptionListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => UserSubscription.fromJson(e as Map<String, dynamic>))
      .toList(),
);
