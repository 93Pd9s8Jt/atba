import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'notification_data.freezed.dart';
part 'notification_data.g.dart';

/// A user notification returned by
/// `GET /v1/api/notifications/mynotifications`.
@freezed
abstract class NotificationData with _$NotificationData {
  const factory NotificationData({
    required int id,
    required String createdAt,
    required String title,
    required String message,
    required String authId,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

/// Parses a full API envelope for
/// `GET /v1/api/notifications/mynotifications`, whose `data` is a list of
/// notifications.
TorBoxResponse<List<NotificationData>> notificationListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
