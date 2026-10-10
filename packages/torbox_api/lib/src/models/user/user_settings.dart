import 'package:freezed_annotation/freezed_annotation.dart';

import 'dashboard_filter.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

/// The user's account settings.
///
/// Returned as part of [UserData]. The request side of the settings endpoint
/// does not use this model; `UserService.editSettings` takes named
/// parameters instead.
@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    bool? emailNotifications,
    bool? webNotifications,
    bool? mobileNotifications,
    bool? rssNotifications,
    bool? downloadSpeedInTab,

    /// Declared as `show_tracker_in_torrents` in the OpenAPI spec.
    @JsonKey(name: 'show_tracker_in_torrents') bool? showTrackerInTorrents,
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
  }) = _UserSettings;
  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
