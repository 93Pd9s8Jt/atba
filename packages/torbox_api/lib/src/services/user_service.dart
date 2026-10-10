import '../models/common/torbox_response.dart';
import '../models/user/dashboard_filter.dart';
import '../models/user/device_code_start_data.dart';
import '../models/user/device_token_data.dart';
import '../models/user/referral_data.dart';
import '../models/user/user_data.dart';
import '../models/user/user_stats_data.dart';
import '../models/user/user_subscription.dart';
import '../models/user/user_transaction.dart';
import '../net/torbox_client.dart';

/// User service.
///
/// Wraps all `/v1/api/user/*` endpoints. Accessed via [TorboxApi.user].
class UserService {
  final TorboxClient _client;

  UserService(this._client);

  /// Get the current user's data.
  Future<TorBoxResponse<UserData>> getUserData({bool? settings}) async {
    final response = await _client.get(
      'api/user/me',
      queryParams: {'settings': settings},
    );
    return userDataResponseFromJson(response);
  }

  /// Add a referral code to the account.
  Future<TorBoxResponse<Null>> addReferral(String referralCode) async {
    final response = await _client.post(
      'api/user/addreferral?referral=$referralCode',
    );
    return nullResponseFromJson(response);
  }

  /// Request a confirmation code (email verification).
  Future<TorBoxResponse<Null>> getConfirmation() async {
    final response = await _client.get('api/user/getconfirmation');
    return nullResponseFromJson(response);
  }

  /// Refresh the API token.
  ///
  /// Refresh the API token using a session token.
  ///
  /// Returns the new API token as a string.
  Future<TorBoxResponse<String>> refreshToken({
    required String sessionToken,
  }) async {
    final response = await _client.post(
      'api/user/refreshtoken',
      body: {'session_token': sessionToken},
    );
    return stringResponseFromJson(response);
  }

  /// Start device authentication flow.
  Future<TorBoxResponse<DeviceCodeStartData>> deviceAuthStart({
    String? app,
  }) async {
    final response = await _client.get(
      'api/user/auth/device/start',
      queryParams: {'app': app},
    );
    return deviceCodeStartResponseFromJson(response);
  }

  /// Get an API token after the user approves a device code.
  Future<TorBoxResponse<DeviceTokenData>> deviceToken({
    required String deviceCode,
  }) async {
    final response = await _client.post(
      'api/user/auth/device/token',
      body: {'device_code': deviceCode},
    );
    return deviceTokenResponseFromJson(response);
  }

  /// Delete the current account.
  Future<TorBoxResponse<dynamic>> deleteAccount({
    required String sessionToken,
    required int confirmationCode,
  }) async {
    final response = await _client.delete(
      'api/user/deleteme',
      body: {
        'session_token': sessionToken,
        'confirmation_code': confirmationCode,
      },
    );
    return dynamicResponseFromJson(response);
  }

  /// Get the user's transfer statistics and bandwidth usage.
  Future<TorBoxResponse<UserStatsData>> getStats({
    bool? general,
    bool? bandwidth,
    String? bandwidthGrouping,
  }) async {
    final response = await _client.get(
      'api/user/stats',
      queryParams: {
        'general': general,
        'bandwidth': bandwidth,
        'bandwidth_grouping': bandwidthGrouping,
      },
    );
    return userStatsResponseFromJson(response);
  }

  /// Get the user's referral statistics.
  Future<TorBoxResponse<ReferralData>> getReferralData() async {
    final response = await _client.get('api/user/referraldata');
    return referralDataResponseFromJson(response);
  }

  /// Get the user's subscriptions.
  Future<TorBoxResponse<List<UserSubscription>>> getSubscriptions() async {
    final response = await _client.get('api/user/subscriptions');
    return userSubscriptionListResponseFromJson(response);
  }

  /// Get the user's past transactions.
  Future<TorBoxResponse<List<UserTransaction>>> getTransactions() async {
    final response = await _client.get('api/user/transactions');
    return userTransactionListResponseFromJson(response);
  }

  /// Download a transaction receipt as a PDF file.
  ///
  /// Returns the path the file was saved to.
  Future<String> downloadTransactionPdf({
    required String transactionId,
    required String savePath,
  }) {
    return _client.download(
      'api/user/transaction/pdf',
      savePath: savePath,
      queryParams: {'transaction_id': transactionId},
    );
  }

  /// Update the user's account settings.
  ///
  /// Every field is optional. A field that the caller does not set is sent as
  /// null, which leaves that setting unchanged.
  Future<TorBoxResponse<Null>> editSettings({
    bool? emailNotifications,
    bool? webNotifications,
    bool? mobileNotifications,
    bool? rssNotifications,
    bool? downloadSpeedInTab,
    bool? showTrackerInTorrents,
    List<int>? stremioQuality,
    List<int>? stremioResolution,
    List<int>? stremioLanguage,
    List<int>? stremioCache,
    int? stremioSizeLower,
    int? stremioSizeUpper,
    String? googleDriveFolderId,
    String? onedriveSavePath,
    String? discordId,
    bool? discordNotifications,
    bool? stremioAllowAdult,
    int? stremioSeedTorrents,
    int? seedTorrents,
    bool? allowZipped,
    bool? stremioAllowZipped,
    String? onefichierFolderId,
    String? gofileFolderId,
    bool? jdownloaderNotifications,
    bool? webhookNotifications,
    String? webhookUrl,
    bool? telegramNotifications,
    String? telegramId,
    String? megaEmail,
    String? megaPassword,
    String? stremioSort,
    String? cdnSelection,
    bool? stremioUseCustomSearchEngines,
    String? stremioResultSort,
    bool? webdavUseLocalFiles,
    bool? stremioLegacyYourMedia,
    bool? stremioOnlyYourMediaStreams,
    bool? stremioDisableYourMediaStreams,
    bool? webdavUseFolderView,
    bool? webdavFlatten,
    int? stremioLimitPerResolutionTorrent,
    int? stremioLimitPerResolutionUsenet,
    int? stremioTorrentSeedersCutoff,
    String? pixeldrainApiKey,
    String? onefichierApiKey,
    String? gofileApiKey,
    String? patreonId,
    bool? stremioWaitForDownloadUsenet,
    bool? stremioWaitForDownloadTorrent,
    bool? stremioDisableFilteredNote,
    bool? stremioEmojiInDescription,
    DashboardFilter? dashboardFilter,
    bool? webPlayerAlwaysTranscode,
    bool? webPlayerAlwaysSkipIntro,
    String? webPlayerAudioPreferredLanguage,
    String? webPlayerSubtitlePreferredLanguage,
    bool? webPlayerDisablePrestreamSelector,
    String? dashboardSort,
    bool? webPlayerDisableNextUpDialogue,
    bool? webPlayerEnableScrobbling,
    bool? appendFilenameToLinks,
    List<String>? subscribedEmailSegments,
  }) async {
    final response = await _client.put(
      'api/user/settings/editsettings',
      body: {
        'email_notifications': emailNotifications,
        'web_notifications': webNotifications,
        'mobile_notifications': mobileNotifications,
        'rss_notifications': rssNotifications,
        'download_speed_in_tab': downloadSpeedInTab,
        'show_tracker_in_torrents': showTrackerInTorrents,
        'stremio_quality': stremioQuality,
        'stremio_resolution': stremioResolution,
        'stremio_language': stremioLanguage,
        'stremio_cache': stremioCache,
        'stremio_size_lower': stremioSizeLower,
        'stremio_size_upper': stremioSizeUpper,
        'google_drive_folder_id': googleDriveFolderId,
        'onedrive_save_path': onedriveSavePath,
        'discord_id': discordId,
        'discord_notifications': discordNotifications,
        'stremio_allow_adult': stremioAllowAdult,
        'stremio_seed_torrents': stremioSeedTorrents,
        'seed_torrents': seedTorrents,
        'allow_zipped': allowZipped,
        'stremio_allow_zipped': stremioAllowZipped,
        'onefichier_folder_id': onefichierFolderId,
        'gofile_folder_id': gofileFolderId,
        'jdownloader_notifications': jdownloaderNotifications,
        'webhook_notifications': webhookNotifications,
        'webhook_url': webhookUrl,
        'telegram_notifications': telegramNotifications,
        'telegram_id': telegramId,
        'mega_email': megaEmail,
        'mega_password': megaPassword,
        'stremio_sort': stremioSort,
        'cdn_selection': cdnSelection,
        'stremio_use_custom_search_engines': stremioUseCustomSearchEngines,
        'stremio_result_sort': stremioResultSort,
        'webdav_use_local_files': webdavUseLocalFiles,
        'stremio_legacy_your_media': stremioLegacyYourMedia,
        'stremio_only_your_media_streams': stremioOnlyYourMediaStreams,
        'stremio_disable_your_media_streams': stremioDisableYourMediaStreams,
        'webdav_use_folder_view': webdavUseFolderView,
        'webdav_flatten': webdavFlatten,
        'stremio_limit_per_resolution_torrent': stremioLimitPerResolutionTorrent,
        'stremio_limit_per_resolution_usenet': stremioLimitPerResolutionUsenet,
        'stremio_torrent_seeders_cutoff': stremioTorrentSeedersCutoff,
        'pixeldrain_api_key': pixeldrainApiKey,
        'onefichier_api_key': onefichierApiKey,
        'gofile_api_key': gofileApiKey,
        'patreon_id': patreonId,
        'stremio_wait_for_download_usenet': stremioWaitForDownloadUsenet,
        'stremio_wait_for_download_torrent': stremioWaitForDownloadTorrent,
        'stremio_disable_filtered_note': stremioDisableFilteredNote,
        'stremio_emoji_in_description': stremioEmojiInDescription,
        'dashboard_filter': dashboardFilter,
        'web_player_always_transcode': webPlayerAlwaysTranscode,
        'web_player_always_skip_intro': webPlayerAlwaysSkipIntro,
        'web_player_audio_preferred_language': webPlayerAudioPreferredLanguage,
        'web_player_subtitle_preferred_language': webPlayerSubtitlePreferredLanguage,
        'web_player_disable_prestream_selector': webPlayerDisablePrestreamSelector,
        'dashboard_sort': dashboardSort,
        'web_player_disable_next_up_dialogue': webPlayerDisableNextUpDialogue,
        'web_player_enable_scrobbling': webPlayerEnableScrobbling,
        'append_filename_to_links': appendFilenameToLinks,
        'subscribed_email_segments': subscribedEmailSegments,
      },
    );
    return nullResponseFromJson(response);
  }
}