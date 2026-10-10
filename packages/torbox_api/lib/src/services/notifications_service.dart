import '../models/common/torbox_response.dart';
import '../models/common/xml_document.dart';
import '../models/notifications/notification_data.dart';
import '../net/torbox_api_exception.dart';
import '../net/torbox_client.dart';

/// Notifications service.
///
/// Wraps all `/v1/api/notifications/*` endpoints. Accessed via
/// [TorboxApi.notifications].
class NotificationsService {
  final TorboxClient _client;

  NotificationsService(this._client);

  /// Get the RSS notification feed.
  ///
  /// Returns the feed as an [XmlDocument]: this endpoint answers with XML
  /// rather than the standard JSON envelope, so there is no envelope to
  /// parse and no `success`/`detail` pair to report. A failed request still
  /// throws [TorboxApiException].
  Future<XmlDocument> getRssNotificationFeed({String? token}) async {
    final xml = await _client.getRaw(
      'api/notifications/rss',
      queryParams: {'token': token},
    );
    return XmlDocument(xml);
  }

  /// Get the JSON notification feed.
  Future<TorBoxResponse<List<NotificationData>>> getNotificationFeed() async {
    final response = await _client.get('api/notifications/mynotifications');
    return notificationListResponseFromJson(response);
  }

  /// Clear all notifications.
  Future<TorBoxResponse<Null>> clearAllNotifications() async {
    final response = await _client.post('api/notifications/clear');
    return nullResponseFromJson(response);
  }

  /// Clear a single notification by ID.
  Future<TorBoxResponse<Null>> clearNotification(int notificationId) async {
    final response = await _client.post(
      'api/notifications/clear/$notificationId',
    );
    return nullResponseFromJson(response);
  }

  /// Send a test notification.
  Future<TorBoxResponse<Null>> sendTestNotification() async {
    final response = await _client.post('api/notifications/test');
    return nullResponseFromJson(response);
  }
}
