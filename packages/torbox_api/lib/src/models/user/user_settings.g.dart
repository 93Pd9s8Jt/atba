// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettings _$UserSettingsFromJson(
  Map<String, dynamic> json,
) => _UserSettings(
  emailNotifications: json['email_notifications'] as bool?,
  webNotifications: json['web_notifications'] as bool?,
  mobileNotifications: json['mobile_notifications'] as bool?,
  rssNotifications: json['rss_notifications'] as bool?,
  downloadSpeedInTab: json['download_speed_in_tab'] as bool?,
  showTrackerInTorrents: json['show_tracker_in_torrents'] as bool?,
  stremioQuality: (json['stremio_quality'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  stremioResolution: (json['stremio_resolution'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  stremioLanguage: (json['stremio_language'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  stremioCache: (json['stremio_cache'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  stremioSizeLower: (json['stremio_size_lower'] as num?)?.toInt(),
  stremioSizeUpper: (json['stremio_size_upper'] as num?)?.toInt(),
  googleDriveFolderId: json['google_drive_folder_id'] as String?,
  onedriveSavePath: json['onedrive_save_path'] as String?,
  discordId: json['discord_id'] as String?,
  discordNotifications: json['discord_notifications'] as bool?,
  stremioAllowAdult: json['stremio_allow_adult'] as bool?,
  stremioSeedTorrents: (json['stremio_seed_torrents'] as num?)?.toInt(),
  seedTorrents: (json['seed_torrents'] as num?)?.toInt(),
  allowZipped: json['allow_zipped'] as bool?,
  stremioAllowZipped: json['stremio_allow_zipped'] as bool?,
  onefichierFolderId: json['onefichier_folder_id'] as String?,
  gofileFolderId: json['gofile_folder_id'] as String?,
  jdownloaderNotifications: json['jdownloader_notifications'] as bool?,
  webhookNotifications: json['webhook_notifications'] as bool?,
  webhookUrl: json['webhook_url'] as String?,
  telegramNotifications: json['telegram_notifications'] as bool?,
  telegramId: json['telegram_id'] as String?,
  megaEmail: json['mega_email'] as String?,
  megaPassword: json['mega_password'] as String?,
  stremioSort: json['stremio_sort'] as String?,
  cdnSelection: json['cdn_selection'] as String?,
  stremioUseCustomSearchEngines:
      json['stremio_use_custom_search_engines'] as bool?,
  stremioResultSort: json['stremio_result_sort'] as String?,
  webdavUseLocalFiles: json['webdav_use_local_files'] as bool?,
  stremioLegacyYourMedia: json['stremio_legacy_your_media'] as bool?,
  stremioOnlyYourMediaStreams: json['stremio_only_your_media_streams'] as bool?,
  stremioDisableYourMediaStreams:
      json['stremio_disable_your_media_streams'] as bool?,
  webdavUseFolderView: json['webdav_use_folder_view'] as bool?,
  webdavFlatten: json['webdav_flatten'] as bool?,
  stremioLimitPerResolutionTorrent:
      (json['stremio_limit_per_resolution_torrent'] as num?)?.toInt(),
  stremioLimitPerResolutionUsenet:
      (json['stremio_limit_per_resolution_usenet'] as num?)?.toInt(),
  stremioTorrentSeedersCutoff: (json['stremio_torrent_seeders_cutoff'] as num?)
      ?.toInt(),
  pixeldrainApiKey: json['pixeldrain_api_key'] as String?,
  onefichierApiKey: json['onefichier_api_key'] as String?,
  gofileApiKey: json['gofile_api_key'] as String?,
  patreonId: json['patreon_id'] as String?,
  stremioWaitForDownloadUsenet:
      json['stremio_wait_for_download_usenet'] as bool?,
  stremioWaitForDownloadTorrent:
      json['stremio_wait_for_download_torrent'] as bool?,
  stremioDisableFilteredNote: json['stremio_disable_filtered_note'] as bool?,
  stremioEmojiInDescription: json['stremio_emoji_in_description'] as bool?,
  dashboardFilter: json['dashboard_filter'] == null
      ? null
      : DashboardFilter.fromJson(
          json['dashboard_filter'] as Map<String, dynamic>,
        ),
  webPlayerAlwaysTranscode: json['web_player_always_transcode'] as bool?,
  webPlayerAlwaysSkipIntro: json['web_player_always_skip_intro'] as bool?,
  webPlayerAudioPreferredLanguage:
      json['web_player_audio_preferred_language'] as String?,
  webPlayerSubtitlePreferredLanguage:
      json['web_player_subtitle_preferred_language'] as String?,
  webPlayerDisablePrestreamSelector:
      json['web_player_disable_prestream_selector'] as bool?,
  dashboardSort: json['dashboard_sort'] as String?,
  webPlayerDisableNextUpDialogue:
      json['web_player_disable_next_up_dialogue'] as bool?,
  webPlayerEnableScrobbling: json['web_player_enable_scrobbling'] as bool?,
  appendFilenameToLinks: json['append_filename_to_links'] as bool?,
  subscribedEmailSegments: (json['subscribed_email_segments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UserSettingsToJson(
  _UserSettings instance,
) => <String, dynamic>{
  'email_notifications': instance.emailNotifications,
  'web_notifications': instance.webNotifications,
  'mobile_notifications': instance.mobileNotifications,
  'rss_notifications': instance.rssNotifications,
  'download_speed_in_tab': instance.downloadSpeedInTab,
  'show_tracker_in_torrents': instance.showTrackerInTorrents,
  'stremio_quality': instance.stremioQuality,
  'stremio_resolution': instance.stremioResolution,
  'stremio_language': instance.stremioLanguage,
  'stremio_cache': instance.stremioCache,
  'stremio_size_lower': instance.stremioSizeLower,
  'stremio_size_upper': instance.stremioSizeUpper,
  'google_drive_folder_id': instance.googleDriveFolderId,
  'onedrive_save_path': instance.onedriveSavePath,
  'discord_id': instance.discordId,
  'discord_notifications': instance.discordNotifications,
  'stremio_allow_adult': instance.stremioAllowAdult,
  'stremio_seed_torrents': instance.stremioSeedTorrents,
  'seed_torrents': instance.seedTorrents,
  'allow_zipped': instance.allowZipped,
  'stremio_allow_zipped': instance.stremioAllowZipped,
  'onefichier_folder_id': instance.onefichierFolderId,
  'gofile_folder_id': instance.gofileFolderId,
  'jdownloader_notifications': instance.jdownloaderNotifications,
  'webhook_notifications': instance.webhookNotifications,
  'webhook_url': instance.webhookUrl,
  'telegram_notifications': instance.telegramNotifications,
  'telegram_id': instance.telegramId,
  'mega_email': instance.megaEmail,
  'mega_password': instance.megaPassword,
  'stremio_sort': instance.stremioSort,
  'cdn_selection': instance.cdnSelection,
  'stremio_use_custom_search_engines': instance.stremioUseCustomSearchEngines,
  'stremio_result_sort': instance.stremioResultSort,
  'webdav_use_local_files': instance.webdavUseLocalFiles,
  'stremio_legacy_your_media': instance.stremioLegacyYourMedia,
  'stremio_only_your_media_streams': instance.stremioOnlyYourMediaStreams,
  'stremio_disable_your_media_streams': instance.stremioDisableYourMediaStreams,
  'webdav_use_folder_view': instance.webdavUseFolderView,
  'webdav_flatten': instance.webdavFlatten,
  'stremio_limit_per_resolution_torrent':
      instance.stremioLimitPerResolutionTorrent,
  'stremio_limit_per_resolution_usenet':
      instance.stremioLimitPerResolutionUsenet,
  'stremio_torrent_seeders_cutoff': instance.stremioTorrentSeedersCutoff,
  'pixeldrain_api_key': instance.pixeldrainApiKey,
  'onefichier_api_key': instance.onefichierApiKey,
  'gofile_api_key': instance.gofileApiKey,
  'patreon_id': instance.patreonId,
  'stremio_wait_for_download_usenet': instance.stremioWaitForDownloadUsenet,
  'stremio_wait_for_download_torrent': instance.stremioWaitForDownloadTorrent,
  'stremio_disable_filtered_note': instance.stremioDisableFilteredNote,
  'stremio_emoji_in_description': instance.stremioEmojiInDescription,
  'dashboard_filter': instance.dashboardFilter?.toJson(),
  'web_player_always_transcode': instance.webPlayerAlwaysTranscode,
  'web_player_always_skip_intro': instance.webPlayerAlwaysSkipIntro,
  'web_player_audio_preferred_language':
      instance.webPlayerAudioPreferredLanguage,
  'web_player_subtitle_preferred_language':
      instance.webPlayerSubtitlePreferredLanguage,
  'web_player_disable_prestream_selector':
      instance.webPlayerDisablePrestreamSelector,
  'dashboard_sort': instance.dashboardSort,
  'web_player_disable_next_up_dialogue':
      instance.webPlayerDisableNextUpDialogue,
  'web_player_enable_scrobbling': instance.webPlayerEnableScrobbling,
  'append_filename_to_links': instance.appendFilenameToLinks,
  'subscribed_email_segments': instance.subscribedEmailSegments,
};
