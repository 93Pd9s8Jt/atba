import 'package:dio/dio.dart';

import '../net/torbox_client.dart';
import 'general_service.dart';
import 'integrations_service.dart';
import 'notifications_service.dart';
import 'queued_service.dart';
import 'rss_feeds_service.dart';
import 'stream_service.dart';
import 'torrents_service.dart';
import 'usenet_service.dart';
import 'user_service.dart';
import 'web_downloads_service.dart';

/// The single entry point for all TorBox API calls.
///
/// Create one instance and use the domain-specific service objects to make
/// API calls. The underlying HTTP client is private and not exposed.
///
/// ```dart
/// final api = TorboxApi(token: 'your-api-token');
///
/// final torrents = await api.torrents.getTorrentList();
/// final user = await api.user.getUserData();
/// ```
class TorboxApi {
  final TorboxClient _client;

  /// Torrents service (`/api/torrents/*`).
  late final TorrentsService torrents;

  /// Usenet service (`/api/usenet/*`).
  late final UsenetService usenet;

  /// Web downloads service (`/api/webdl/*`).
  late final WebDownloadsService webDownloads;

  /// General service (`/api/stats`, `/api/changelogs/*`, `/api/speedtest`).
  late final GeneralService general;

  /// Notifications service (`/api/notifications/*`).
  late final NotificationsService notifications;

  /// User service (`/api/user/*`).
  late final UserService user;

  /// RSS feeds service (`/api/rss/*`).
  late final RssFeedsService rssFeeds;

  /// Integrations service (`/api/integration/*`).
  late final IntegrationsService integrations;

  /// Queued downloads service (`/api/queued/*`).
  late final QueuedService queued;

  /// Stream service (`/api/stream/*`).
  late final StreamService stream;

  TorboxApi({
    required String token,
    String baseUrl = "https://api.torbox.app/v1",
    Duration timeout = const Duration(seconds: 60),
    int maxAttempts = 3,
    Duration retryDelay = const Duration(milliseconds: 150),
  }) : _client = TorboxClient(
         baseUrl: baseUrl,
         token: token,
         timeout: timeout,
         maxAttempts: maxAttempts,
         retryDelay: retryDelay,
       ) {
    torrents = TorrentsService(_client);
    usenet = UsenetService(_client);
    webDownloads = WebDownloadsService(_client);
    general = GeneralService(_client);
    notifications = NotificationsService(_client);
    user = UserService(_client);
    rssFeeds = RssFeedsService(_client);
    integrations = IntegrationsService(_client);
    queued = QueuedService(_client);
    stream = StreamService(_client);
  }

  /// Update the API token at runtime.
  void setToken(String? token) => _client.setToken(token);

  /// Registers [interceptor] on the underlying Dio client.
  ///
  /// Lets a host app add cross-cutting behavior — response caching, logging,
  /// offline fallback — without this package depending on it. Interceptors
  /// run in registration order, so one added here runs *after* the built-in
  /// auth and retry interceptors and therefore observes the `Authorization`
  /// header and any retry.
  void addInterceptor(Interceptor interceptor) =>
      _client.dio.interceptors.add(interceptor);

  /// Removes a previously registered [interceptor].
  ///
  /// Has no effect if [interceptor] was never added.
  void removeInterceptor(Interceptor interceptor) =>
      _client.dio.interceptors.remove(interceptor);

  /// Update the base URL at runtime.
  set baseUrl(String url) => _client.baseUrl = url;

  /// The current base URL.
  String get baseUrl => _client.baseUrl;
}
