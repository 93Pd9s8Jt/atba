// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSettings {

 bool? get emailNotifications; bool? get webNotifications; bool? get mobileNotifications; bool? get rssNotifications; bool? get downloadSpeedInTab;/// Declared as `show_tracker_in_torrents` in the OpenAPI spec.
@JsonKey(name: 'show_tracker_in_torrents') bool? get showTrackerInTorrents; List<int>? get stremioQuality; List<int>? get stremioResolution; List<int>? get stremioLanguage; List<int>? get stremioCache; int? get stremioSizeLower; int? get stremioSizeUpper; String? get googleDriveFolderId; String? get onedriveSavePath; String? get discordId; bool? get discordNotifications; bool? get stremioAllowAdult; int? get stremioSeedTorrents; int? get seedTorrents; bool? get allowZipped; bool? get stremioAllowZipped; String? get onefichierFolderId; String? get gofileFolderId; bool? get jdownloaderNotifications; bool? get webhookNotifications; String? get webhookUrl; bool? get telegramNotifications; String? get telegramId; String? get megaEmail; String? get megaPassword; String? get stremioSort; String? get cdnSelection; bool? get stremioUseCustomSearchEngines; String? get stremioResultSort; bool? get webdavUseLocalFiles; bool? get stremioLegacyYourMedia; bool? get stremioOnlyYourMediaStreams; bool? get stremioDisableYourMediaStreams; bool? get webdavUseFolderView; bool? get webdavFlatten; int? get stremioLimitPerResolutionTorrent; int? get stremioLimitPerResolutionUsenet; int? get stremioTorrentSeedersCutoff; String? get pixeldrainApiKey; String? get onefichierApiKey; String? get gofileApiKey; String? get patreonId; bool? get stremioWaitForDownloadUsenet; bool? get stremioWaitForDownloadTorrent; bool? get stremioDisableFilteredNote; bool? get stremioEmojiInDescription; DashboardFilter? get dashboardFilter; bool? get webPlayerAlwaysTranscode; bool? get webPlayerAlwaysSkipIntro; String? get webPlayerAudioPreferredLanguage; String? get webPlayerSubtitlePreferredLanguage; bool? get webPlayerDisablePrestreamSelector; String? get dashboardSort; bool? get webPlayerDisableNextUpDialogue; bool? get webPlayerEnableScrobbling; bool? get appendFilenameToLinks; List<String>? get subscribedEmailSegments;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.webNotifications, webNotifications) || other.webNotifications == webNotifications)&&(identical(other.mobileNotifications, mobileNotifications) || other.mobileNotifications == mobileNotifications)&&(identical(other.rssNotifications, rssNotifications) || other.rssNotifications == rssNotifications)&&(identical(other.downloadSpeedInTab, downloadSpeedInTab) || other.downloadSpeedInTab == downloadSpeedInTab)&&(identical(other.showTrackerInTorrents, showTrackerInTorrents) || other.showTrackerInTorrents == showTrackerInTorrents)&&const DeepCollectionEquality().equals(other.stremioQuality, stremioQuality)&&const DeepCollectionEquality().equals(other.stremioResolution, stremioResolution)&&const DeepCollectionEquality().equals(other.stremioLanguage, stremioLanguage)&&const DeepCollectionEquality().equals(other.stremioCache, stremioCache)&&(identical(other.stremioSizeLower, stremioSizeLower) || other.stremioSizeLower == stremioSizeLower)&&(identical(other.stremioSizeUpper, stremioSizeUpper) || other.stremioSizeUpper == stremioSizeUpper)&&(identical(other.googleDriveFolderId, googleDriveFolderId) || other.googleDriveFolderId == googleDriveFolderId)&&(identical(other.onedriveSavePath, onedriveSavePath) || other.onedriveSavePath == onedriveSavePath)&&(identical(other.discordId, discordId) || other.discordId == discordId)&&(identical(other.discordNotifications, discordNotifications) || other.discordNotifications == discordNotifications)&&(identical(other.stremioAllowAdult, stremioAllowAdult) || other.stremioAllowAdult == stremioAllowAdult)&&(identical(other.stremioSeedTorrents, stremioSeedTorrents) || other.stremioSeedTorrents == stremioSeedTorrents)&&(identical(other.seedTorrents, seedTorrents) || other.seedTorrents == seedTorrents)&&(identical(other.allowZipped, allowZipped) || other.allowZipped == allowZipped)&&(identical(other.stremioAllowZipped, stremioAllowZipped) || other.stremioAllowZipped == stremioAllowZipped)&&(identical(other.onefichierFolderId, onefichierFolderId) || other.onefichierFolderId == onefichierFolderId)&&(identical(other.gofileFolderId, gofileFolderId) || other.gofileFolderId == gofileFolderId)&&(identical(other.jdownloaderNotifications, jdownloaderNotifications) || other.jdownloaderNotifications == jdownloaderNotifications)&&(identical(other.webhookNotifications, webhookNotifications) || other.webhookNotifications == webhookNotifications)&&(identical(other.webhookUrl, webhookUrl) || other.webhookUrl == webhookUrl)&&(identical(other.telegramNotifications, telegramNotifications) || other.telegramNotifications == telegramNotifications)&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.megaEmail, megaEmail) || other.megaEmail == megaEmail)&&(identical(other.megaPassword, megaPassword) || other.megaPassword == megaPassword)&&(identical(other.stremioSort, stremioSort) || other.stremioSort == stremioSort)&&(identical(other.cdnSelection, cdnSelection) || other.cdnSelection == cdnSelection)&&(identical(other.stremioUseCustomSearchEngines, stremioUseCustomSearchEngines) || other.stremioUseCustomSearchEngines == stremioUseCustomSearchEngines)&&(identical(other.stremioResultSort, stremioResultSort) || other.stremioResultSort == stremioResultSort)&&(identical(other.webdavUseLocalFiles, webdavUseLocalFiles) || other.webdavUseLocalFiles == webdavUseLocalFiles)&&(identical(other.stremioLegacyYourMedia, stremioLegacyYourMedia) || other.stremioLegacyYourMedia == stremioLegacyYourMedia)&&(identical(other.stremioOnlyYourMediaStreams, stremioOnlyYourMediaStreams) || other.stremioOnlyYourMediaStreams == stremioOnlyYourMediaStreams)&&(identical(other.stremioDisableYourMediaStreams, stremioDisableYourMediaStreams) || other.stremioDisableYourMediaStreams == stremioDisableYourMediaStreams)&&(identical(other.webdavUseFolderView, webdavUseFolderView) || other.webdavUseFolderView == webdavUseFolderView)&&(identical(other.webdavFlatten, webdavFlatten) || other.webdavFlatten == webdavFlatten)&&(identical(other.stremioLimitPerResolutionTorrent, stremioLimitPerResolutionTorrent) || other.stremioLimitPerResolutionTorrent == stremioLimitPerResolutionTorrent)&&(identical(other.stremioLimitPerResolutionUsenet, stremioLimitPerResolutionUsenet) || other.stremioLimitPerResolutionUsenet == stremioLimitPerResolutionUsenet)&&(identical(other.stremioTorrentSeedersCutoff, stremioTorrentSeedersCutoff) || other.stremioTorrentSeedersCutoff == stremioTorrentSeedersCutoff)&&(identical(other.pixeldrainApiKey, pixeldrainApiKey) || other.pixeldrainApiKey == pixeldrainApiKey)&&(identical(other.onefichierApiKey, onefichierApiKey) || other.onefichierApiKey == onefichierApiKey)&&(identical(other.gofileApiKey, gofileApiKey) || other.gofileApiKey == gofileApiKey)&&(identical(other.patreonId, patreonId) || other.patreonId == patreonId)&&(identical(other.stremioWaitForDownloadUsenet, stremioWaitForDownloadUsenet) || other.stremioWaitForDownloadUsenet == stremioWaitForDownloadUsenet)&&(identical(other.stremioWaitForDownloadTorrent, stremioWaitForDownloadTorrent) || other.stremioWaitForDownloadTorrent == stremioWaitForDownloadTorrent)&&(identical(other.stremioDisableFilteredNote, stremioDisableFilteredNote) || other.stremioDisableFilteredNote == stremioDisableFilteredNote)&&(identical(other.stremioEmojiInDescription, stremioEmojiInDescription) || other.stremioEmojiInDescription == stremioEmojiInDescription)&&(identical(other.dashboardFilter, dashboardFilter) || other.dashboardFilter == dashboardFilter)&&(identical(other.webPlayerAlwaysTranscode, webPlayerAlwaysTranscode) || other.webPlayerAlwaysTranscode == webPlayerAlwaysTranscode)&&(identical(other.webPlayerAlwaysSkipIntro, webPlayerAlwaysSkipIntro) || other.webPlayerAlwaysSkipIntro == webPlayerAlwaysSkipIntro)&&(identical(other.webPlayerAudioPreferredLanguage, webPlayerAudioPreferredLanguage) || other.webPlayerAudioPreferredLanguage == webPlayerAudioPreferredLanguage)&&(identical(other.webPlayerSubtitlePreferredLanguage, webPlayerSubtitlePreferredLanguage) || other.webPlayerSubtitlePreferredLanguage == webPlayerSubtitlePreferredLanguage)&&(identical(other.webPlayerDisablePrestreamSelector, webPlayerDisablePrestreamSelector) || other.webPlayerDisablePrestreamSelector == webPlayerDisablePrestreamSelector)&&(identical(other.dashboardSort, dashboardSort) || other.dashboardSort == dashboardSort)&&(identical(other.webPlayerDisableNextUpDialogue, webPlayerDisableNextUpDialogue) || other.webPlayerDisableNextUpDialogue == webPlayerDisableNextUpDialogue)&&(identical(other.webPlayerEnableScrobbling, webPlayerEnableScrobbling) || other.webPlayerEnableScrobbling == webPlayerEnableScrobbling)&&(identical(other.appendFilenameToLinks, appendFilenameToLinks) || other.appendFilenameToLinks == appendFilenameToLinks)&&const DeepCollectionEquality().equals(other.subscribedEmailSegments, subscribedEmailSegments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,emailNotifications,webNotifications,mobileNotifications,rssNotifications,downloadSpeedInTab,showTrackerInTorrents,const DeepCollectionEquality().hash(stremioQuality),const DeepCollectionEquality().hash(stremioResolution),const DeepCollectionEquality().hash(stremioLanguage),const DeepCollectionEquality().hash(stremioCache),stremioSizeLower,stremioSizeUpper,googleDriveFolderId,onedriveSavePath,discordId,discordNotifications,stremioAllowAdult,stremioSeedTorrents,seedTorrents,allowZipped,stremioAllowZipped,onefichierFolderId,gofileFolderId,jdownloaderNotifications,webhookNotifications,webhookUrl,telegramNotifications,telegramId,megaEmail,megaPassword,stremioSort,cdnSelection,stremioUseCustomSearchEngines,stremioResultSort,webdavUseLocalFiles,stremioLegacyYourMedia,stremioOnlyYourMediaStreams,stremioDisableYourMediaStreams,webdavUseFolderView,webdavFlatten,stremioLimitPerResolutionTorrent,stremioLimitPerResolutionUsenet,stremioTorrentSeedersCutoff,pixeldrainApiKey,onefichierApiKey,gofileApiKey,patreonId,stremioWaitForDownloadUsenet,stremioWaitForDownloadTorrent,stremioDisableFilteredNote,stremioEmojiInDescription,dashboardFilter,webPlayerAlwaysTranscode,webPlayerAlwaysSkipIntro,webPlayerAudioPreferredLanguage,webPlayerSubtitlePreferredLanguage,webPlayerDisablePrestreamSelector,dashboardSort,webPlayerDisableNextUpDialogue,webPlayerEnableScrobbling,appendFilenameToLinks,const DeepCollectionEquality().hash(subscribedEmailSegments)]);

@override
String toString() {
  return 'UserSettings(emailNotifications: $emailNotifications, webNotifications: $webNotifications, mobileNotifications: $mobileNotifications, rssNotifications: $rssNotifications, downloadSpeedInTab: $downloadSpeedInTab, showTrackerInTorrents: $showTrackerInTorrents, stremioQuality: $stremioQuality, stremioResolution: $stremioResolution, stremioLanguage: $stremioLanguage, stremioCache: $stremioCache, stremioSizeLower: $stremioSizeLower, stremioSizeUpper: $stremioSizeUpper, googleDriveFolderId: $googleDriveFolderId, onedriveSavePath: $onedriveSavePath, discordId: $discordId, discordNotifications: $discordNotifications, stremioAllowAdult: $stremioAllowAdult, stremioSeedTorrents: $stremioSeedTorrents, seedTorrents: $seedTorrents, allowZipped: $allowZipped, stremioAllowZipped: $stremioAllowZipped, onefichierFolderId: $onefichierFolderId, gofileFolderId: $gofileFolderId, jdownloaderNotifications: $jdownloaderNotifications, webhookNotifications: $webhookNotifications, webhookUrl: $webhookUrl, telegramNotifications: $telegramNotifications, telegramId: $telegramId, megaEmail: $megaEmail, megaPassword: $megaPassword, stremioSort: $stremioSort, cdnSelection: $cdnSelection, stremioUseCustomSearchEngines: $stremioUseCustomSearchEngines, stremioResultSort: $stremioResultSort, webdavUseLocalFiles: $webdavUseLocalFiles, stremioLegacyYourMedia: $stremioLegacyYourMedia, stremioOnlyYourMediaStreams: $stremioOnlyYourMediaStreams, stremioDisableYourMediaStreams: $stremioDisableYourMediaStreams, webdavUseFolderView: $webdavUseFolderView, webdavFlatten: $webdavFlatten, stremioLimitPerResolutionTorrent: $stremioLimitPerResolutionTorrent, stremioLimitPerResolutionUsenet: $stremioLimitPerResolutionUsenet, stremioTorrentSeedersCutoff: $stremioTorrentSeedersCutoff, pixeldrainApiKey: $pixeldrainApiKey, onefichierApiKey: $onefichierApiKey, gofileApiKey: $gofileApiKey, patreonId: $patreonId, stremioWaitForDownloadUsenet: $stremioWaitForDownloadUsenet, stremioWaitForDownloadTorrent: $stremioWaitForDownloadTorrent, stremioDisableFilteredNote: $stremioDisableFilteredNote, stremioEmojiInDescription: $stremioEmojiInDescription, dashboardFilter: $dashboardFilter, webPlayerAlwaysTranscode: $webPlayerAlwaysTranscode, webPlayerAlwaysSkipIntro: $webPlayerAlwaysSkipIntro, webPlayerAudioPreferredLanguage: $webPlayerAudioPreferredLanguage, webPlayerSubtitlePreferredLanguage: $webPlayerSubtitlePreferredLanguage, webPlayerDisablePrestreamSelector: $webPlayerDisablePrestreamSelector, dashboardSort: $dashboardSort, webPlayerDisableNextUpDialogue: $webPlayerDisableNextUpDialogue, webPlayerEnableScrobbling: $webPlayerEnableScrobbling, appendFilenameToLinks: $appendFilenameToLinks, subscribedEmailSegments: $subscribedEmailSegments)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
 bool? emailNotifications, bool? webNotifications, bool? mobileNotifications, bool? rssNotifications, bool? downloadSpeedInTab,@JsonKey(name: 'show_tracker_in_torrents') bool? showTrackerInTorrents, List<int>? stremioQuality, List<int>? stremioResolution, List<int>? stremioLanguage, List<int>? stremioCache, int? stremioSizeLower, int? stremioSizeUpper, String? googleDriveFolderId, String? onedriveSavePath, String? discordId, bool? discordNotifications, bool? stremioAllowAdult, int? stremioSeedTorrents, int? seedTorrents, bool? allowZipped, bool? stremioAllowZipped, String? onefichierFolderId, String? gofileFolderId, bool? jdownloaderNotifications, bool? webhookNotifications, String? webhookUrl, bool? telegramNotifications, String? telegramId, String? megaEmail, String? megaPassword, String? stremioSort, String? cdnSelection, bool? stremioUseCustomSearchEngines, String? stremioResultSort, bool? webdavUseLocalFiles, bool? stremioLegacyYourMedia, bool? stremioOnlyYourMediaStreams, bool? stremioDisableYourMediaStreams, bool? webdavUseFolderView, bool? webdavFlatten, int? stremioLimitPerResolutionTorrent, int? stremioLimitPerResolutionUsenet, int? stremioTorrentSeedersCutoff, String? pixeldrainApiKey, String? onefichierApiKey, String? gofileApiKey, String? patreonId, bool? stremioWaitForDownloadUsenet, bool? stremioWaitForDownloadTorrent, bool? stremioDisableFilteredNote, bool? stremioEmojiInDescription, DashboardFilter? dashboardFilter, bool? webPlayerAlwaysTranscode, bool? webPlayerAlwaysSkipIntro, String? webPlayerAudioPreferredLanguage, String? webPlayerSubtitlePreferredLanguage, bool? webPlayerDisablePrestreamSelector, String? dashboardSort, bool? webPlayerDisableNextUpDialogue, bool? webPlayerEnableScrobbling, bool? appendFilenameToLinks, List<String>? subscribedEmailSegments
});


$DashboardFilterCopyWith<$Res>? get dashboardFilter;

}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailNotifications = freezed,Object? webNotifications = freezed,Object? mobileNotifications = freezed,Object? rssNotifications = freezed,Object? downloadSpeedInTab = freezed,Object? showTrackerInTorrents = freezed,Object? stremioQuality = freezed,Object? stremioResolution = freezed,Object? stremioLanguage = freezed,Object? stremioCache = freezed,Object? stremioSizeLower = freezed,Object? stremioSizeUpper = freezed,Object? googleDriveFolderId = freezed,Object? onedriveSavePath = freezed,Object? discordId = freezed,Object? discordNotifications = freezed,Object? stremioAllowAdult = freezed,Object? stremioSeedTorrents = freezed,Object? seedTorrents = freezed,Object? allowZipped = freezed,Object? stremioAllowZipped = freezed,Object? onefichierFolderId = freezed,Object? gofileFolderId = freezed,Object? jdownloaderNotifications = freezed,Object? webhookNotifications = freezed,Object? webhookUrl = freezed,Object? telegramNotifications = freezed,Object? telegramId = freezed,Object? megaEmail = freezed,Object? megaPassword = freezed,Object? stremioSort = freezed,Object? cdnSelection = freezed,Object? stremioUseCustomSearchEngines = freezed,Object? stremioResultSort = freezed,Object? webdavUseLocalFiles = freezed,Object? stremioLegacyYourMedia = freezed,Object? stremioOnlyYourMediaStreams = freezed,Object? stremioDisableYourMediaStreams = freezed,Object? webdavUseFolderView = freezed,Object? webdavFlatten = freezed,Object? stremioLimitPerResolutionTorrent = freezed,Object? stremioLimitPerResolutionUsenet = freezed,Object? stremioTorrentSeedersCutoff = freezed,Object? pixeldrainApiKey = freezed,Object? onefichierApiKey = freezed,Object? gofileApiKey = freezed,Object? patreonId = freezed,Object? stremioWaitForDownloadUsenet = freezed,Object? stremioWaitForDownloadTorrent = freezed,Object? stremioDisableFilteredNote = freezed,Object? stremioEmojiInDescription = freezed,Object? dashboardFilter = freezed,Object? webPlayerAlwaysTranscode = freezed,Object? webPlayerAlwaysSkipIntro = freezed,Object? webPlayerAudioPreferredLanguage = freezed,Object? webPlayerSubtitlePreferredLanguage = freezed,Object? webPlayerDisablePrestreamSelector = freezed,Object? dashboardSort = freezed,Object? webPlayerDisableNextUpDialogue = freezed,Object? webPlayerEnableScrobbling = freezed,Object? appendFilenameToLinks = freezed,Object? subscribedEmailSegments = freezed,}) {
  return _then(_self.copyWith(
emailNotifications: freezed == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool?,webNotifications: freezed == webNotifications ? _self.webNotifications : webNotifications // ignore: cast_nullable_to_non_nullable
as bool?,mobileNotifications: freezed == mobileNotifications ? _self.mobileNotifications : mobileNotifications // ignore: cast_nullable_to_non_nullable
as bool?,rssNotifications: freezed == rssNotifications ? _self.rssNotifications : rssNotifications // ignore: cast_nullable_to_non_nullable
as bool?,downloadSpeedInTab: freezed == downloadSpeedInTab ? _self.downloadSpeedInTab : downloadSpeedInTab // ignore: cast_nullable_to_non_nullable
as bool?,showTrackerInTorrents: freezed == showTrackerInTorrents ? _self.showTrackerInTorrents : showTrackerInTorrents // ignore: cast_nullable_to_non_nullable
as bool?,stremioQuality: freezed == stremioQuality ? _self.stremioQuality : stremioQuality // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioResolution: freezed == stremioResolution ? _self.stremioResolution : stremioResolution // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioLanguage: freezed == stremioLanguage ? _self.stremioLanguage : stremioLanguage // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioCache: freezed == stremioCache ? _self.stremioCache : stremioCache // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioSizeLower: freezed == stremioSizeLower ? _self.stremioSizeLower : stremioSizeLower // ignore: cast_nullable_to_non_nullable
as int?,stremioSizeUpper: freezed == stremioSizeUpper ? _self.stremioSizeUpper : stremioSizeUpper // ignore: cast_nullable_to_non_nullable
as int?,googleDriveFolderId: freezed == googleDriveFolderId ? _self.googleDriveFolderId : googleDriveFolderId // ignore: cast_nullable_to_non_nullable
as String?,onedriveSavePath: freezed == onedriveSavePath ? _self.onedriveSavePath : onedriveSavePath // ignore: cast_nullable_to_non_nullable
as String?,discordId: freezed == discordId ? _self.discordId : discordId // ignore: cast_nullable_to_non_nullable
as String?,discordNotifications: freezed == discordNotifications ? _self.discordNotifications : discordNotifications // ignore: cast_nullable_to_non_nullable
as bool?,stremioAllowAdult: freezed == stremioAllowAdult ? _self.stremioAllowAdult : stremioAllowAdult // ignore: cast_nullable_to_non_nullable
as bool?,stremioSeedTorrents: freezed == stremioSeedTorrents ? _self.stremioSeedTorrents : stremioSeedTorrents // ignore: cast_nullable_to_non_nullable
as int?,seedTorrents: freezed == seedTorrents ? _self.seedTorrents : seedTorrents // ignore: cast_nullable_to_non_nullable
as int?,allowZipped: freezed == allowZipped ? _self.allowZipped : allowZipped // ignore: cast_nullable_to_non_nullable
as bool?,stremioAllowZipped: freezed == stremioAllowZipped ? _self.stremioAllowZipped : stremioAllowZipped // ignore: cast_nullable_to_non_nullable
as bool?,onefichierFolderId: freezed == onefichierFolderId ? _self.onefichierFolderId : onefichierFolderId // ignore: cast_nullable_to_non_nullable
as String?,gofileFolderId: freezed == gofileFolderId ? _self.gofileFolderId : gofileFolderId // ignore: cast_nullable_to_non_nullable
as String?,jdownloaderNotifications: freezed == jdownloaderNotifications ? _self.jdownloaderNotifications : jdownloaderNotifications // ignore: cast_nullable_to_non_nullable
as bool?,webhookNotifications: freezed == webhookNotifications ? _self.webhookNotifications : webhookNotifications // ignore: cast_nullable_to_non_nullable
as bool?,webhookUrl: freezed == webhookUrl ? _self.webhookUrl : webhookUrl // ignore: cast_nullable_to_non_nullable
as String?,telegramNotifications: freezed == telegramNotifications ? _self.telegramNotifications : telegramNotifications // ignore: cast_nullable_to_non_nullable
as bool?,telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as String?,megaEmail: freezed == megaEmail ? _self.megaEmail : megaEmail // ignore: cast_nullable_to_non_nullable
as String?,megaPassword: freezed == megaPassword ? _self.megaPassword : megaPassword // ignore: cast_nullable_to_non_nullable
as String?,stremioSort: freezed == stremioSort ? _self.stremioSort : stremioSort // ignore: cast_nullable_to_non_nullable
as String?,cdnSelection: freezed == cdnSelection ? _self.cdnSelection : cdnSelection // ignore: cast_nullable_to_non_nullable
as String?,stremioUseCustomSearchEngines: freezed == stremioUseCustomSearchEngines ? _self.stremioUseCustomSearchEngines : stremioUseCustomSearchEngines // ignore: cast_nullable_to_non_nullable
as bool?,stremioResultSort: freezed == stremioResultSort ? _self.stremioResultSort : stremioResultSort // ignore: cast_nullable_to_non_nullable
as String?,webdavUseLocalFiles: freezed == webdavUseLocalFiles ? _self.webdavUseLocalFiles : webdavUseLocalFiles // ignore: cast_nullable_to_non_nullable
as bool?,stremioLegacyYourMedia: freezed == stremioLegacyYourMedia ? _self.stremioLegacyYourMedia : stremioLegacyYourMedia // ignore: cast_nullable_to_non_nullable
as bool?,stremioOnlyYourMediaStreams: freezed == stremioOnlyYourMediaStreams ? _self.stremioOnlyYourMediaStreams : stremioOnlyYourMediaStreams // ignore: cast_nullable_to_non_nullable
as bool?,stremioDisableYourMediaStreams: freezed == stremioDisableYourMediaStreams ? _self.stremioDisableYourMediaStreams : stremioDisableYourMediaStreams // ignore: cast_nullable_to_non_nullable
as bool?,webdavUseFolderView: freezed == webdavUseFolderView ? _self.webdavUseFolderView : webdavUseFolderView // ignore: cast_nullable_to_non_nullable
as bool?,webdavFlatten: freezed == webdavFlatten ? _self.webdavFlatten : webdavFlatten // ignore: cast_nullable_to_non_nullable
as bool?,stremioLimitPerResolutionTorrent: freezed == stremioLimitPerResolutionTorrent ? _self.stremioLimitPerResolutionTorrent : stremioLimitPerResolutionTorrent // ignore: cast_nullable_to_non_nullable
as int?,stremioLimitPerResolutionUsenet: freezed == stremioLimitPerResolutionUsenet ? _self.stremioLimitPerResolutionUsenet : stremioLimitPerResolutionUsenet // ignore: cast_nullable_to_non_nullable
as int?,stremioTorrentSeedersCutoff: freezed == stremioTorrentSeedersCutoff ? _self.stremioTorrentSeedersCutoff : stremioTorrentSeedersCutoff // ignore: cast_nullable_to_non_nullable
as int?,pixeldrainApiKey: freezed == pixeldrainApiKey ? _self.pixeldrainApiKey : pixeldrainApiKey // ignore: cast_nullable_to_non_nullable
as String?,onefichierApiKey: freezed == onefichierApiKey ? _self.onefichierApiKey : onefichierApiKey // ignore: cast_nullable_to_non_nullable
as String?,gofileApiKey: freezed == gofileApiKey ? _self.gofileApiKey : gofileApiKey // ignore: cast_nullable_to_non_nullable
as String?,patreonId: freezed == patreonId ? _self.patreonId : patreonId // ignore: cast_nullable_to_non_nullable
as String?,stremioWaitForDownloadUsenet: freezed == stremioWaitForDownloadUsenet ? _self.stremioWaitForDownloadUsenet : stremioWaitForDownloadUsenet // ignore: cast_nullable_to_non_nullable
as bool?,stremioWaitForDownloadTorrent: freezed == stremioWaitForDownloadTorrent ? _self.stremioWaitForDownloadTorrent : stremioWaitForDownloadTorrent // ignore: cast_nullable_to_non_nullable
as bool?,stremioDisableFilteredNote: freezed == stremioDisableFilteredNote ? _self.stremioDisableFilteredNote : stremioDisableFilteredNote // ignore: cast_nullable_to_non_nullable
as bool?,stremioEmojiInDescription: freezed == stremioEmojiInDescription ? _self.stremioEmojiInDescription : stremioEmojiInDescription // ignore: cast_nullable_to_non_nullable
as bool?,dashboardFilter: freezed == dashboardFilter ? _self.dashboardFilter : dashboardFilter // ignore: cast_nullable_to_non_nullable
as DashboardFilter?,webPlayerAlwaysTranscode: freezed == webPlayerAlwaysTranscode ? _self.webPlayerAlwaysTranscode : webPlayerAlwaysTranscode // ignore: cast_nullable_to_non_nullable
as bool?,webPlayerAlwaysSkipIntro: freezed == webPlayerAlwaysSkipIntro ? _self.webPlayerAlwaysSkipIntro : webPlayerAlwaysSkipIntro // ignore: cast_nullable_to_non_nullable
as bool?,webPlayerAudioPreferredLanguage: freezed == webPlayerAudioPreferredLanguage ? _self.webPlayerAudioPreferredLanguage : webPlayerAudioPreferredLanguage // ignore: cast_nullable_to_non_nullable
as String?,webPlayerSubtitlePreferredLanguage: freezed == webPlayerSubtitlePreferredLanguage ? _self.webPlayerSubtitlePreferredLanguage : webPlayerSubtitlePreferredLanguage // ignore: cast_nullable_to_non_nullable
as String?,webPlayerDisablePrestreamSelector: freezed == webPlayerDisablePrestreamSelector ? _self.webPlayerDisablePrestreamSelector : webPlayerDisablePrestreamSelector // ignore: cast_nullable_to_non_nullable
as bool?,dashboardSort: freezed == dashboardSort ? _self.dashboardSort : dashboardSort // ignore: cast_nullable_to_non_nullable
as String?,webPlayerDisableNextUpDialogue: freezed == webPlayerDisableNextUpDialogue ? _self.webPlayerDisableNextUpDialogue : webPlayerDisableNextUpDialogue // ignore: cast_nullable_to_non_nullable
as bool?,webPlayerEnableScrobbling: freezed == webPlayerEnableScrobbling ? _self.webPlayerEnableScrobbling : webPlayerEnableScrobbling // ignore: cast_nullable_to_non_nullable
as bool?,appendFilenameToLinks: freezed == appendFilenameToLinks ? _self.appendFilenameToLinks : appendFilenameToLinks // ignore: cast_nullable_to_non_nullable
as bool?,subscribedEmailSegments: freezed == subscribedEmailSegments ? _self.subscribedEmailSegments : subscribedEmailSegments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardFilterCopyWith<$Res>? get dashboardFilter {
    if (_self.dashboardFilter == null) {
    return null;
  }

  return $DashboardFilterCopyWith<$Res>(_self.dashboardFilter!, (value) {
    return _then(_self.copyWith(dashboardFilter: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettings value)  $default,){
final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettings value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? emailNotifications,  bool? webNotifications,  bool? mobileNotifications,  bool? rssNotifications,  bool? downloadSpeedInTab, @JsonKey(name: 'show_tracker_in_torrents')  bool? showTrackerInTorrents,  List<int>? stremioQuality,  List<int>? stremioResolution,  List<int>? stremioLanguage,  List<int>? stremioCache,  int? stremioSizeLower,  int? stremioSizeUpper,  String? googleDriveFolderId,  String? onedriveSavePath,  String? discordId,  bool? discordNotifications,  bool? stremioAllowAdult,  int? stremioSeedTorrents,  int? seedTorrents,  bool? allowZipped,  bool? stremioAllowZipped,  String? onefichierFolderId,  String? gofileFolderId,  bool? jdownloaderNotifications,  bool? webhookNotifications,  String? webhookUrl,  bool? telegramNotifications,  String? telegramId,  String? megaEmail,  String? megaPassword,  String? stremioSort,  String? cdnSelection,  bool? stremioUseCustomSearchEngines,  String? stremioResultSort,  bool? webdavUseLocalFiles,  bool? stremioLegacyYourMedia,  bool? stremioOnlyYourMediaStreams,  bool? stremioDisableYourMediaStreams,  bool? webdavUseFolderView,  bool? webdavFlatten,  int? stremioLimitPerResolutionTorrent,  int? stremioLimitPerResolutionUsenet,  int? stremioTorrentSeedersCutoff,  String? pixeldrainApiKey,  String? onefichierApiKey,  String? gofileApiKey,  String? patreonId,  bool? stremioWaitForDownloadUsenet,  bool? stremioWaitForDownloadTorrent,  bool? stremioDisableFilteredNote,  bool? stremioEmojiInDescription,  DashboardFilter? dashboardFilter,  bool? webPlayerAlwaysTranscode,  bool? webPlayerAlwaysSkipIntro,  String? webPlayerAudioPreferredLanguage,  String? webPlayerSubtitlePreferredLanguage,  bool? webPlayerDisablePrestreamSelector,  String? dashboardSort,  bool? webPlayerDisableNextUpDialogue,  bool? webPlayerEnableScrobbling,  bool? appendFilenameToLinks,  List<String>? subscribedEmailSegments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.emailNotifications,_that.webNotifications,_that.mobileNotifications,_that.rssNotifications,_that.downloadSpeedInTab,_that.showTrackerInTorrents,_that.stremioQuality,_that.stremioResolution,_that.stremioLanguage,_that.stremioCache,_that.stremioSizeLower,_that.stremioSizeUpper,_that.googleDriveFolderId,_that.onedriveSavePath,_that.discordId,_that.discordNotifications,_that.stremioAllowAdult,_that.stremioSeedTorrents,_that.seedTorrents,_that.allowZipped,_that.stremioAllowZipped,_that.onefichierFolderId,_that.gofileFolderId,_that.jdownloaderNotifications,_that.webhookNotifications,_that.webhookUrl,_that.telegramNotifications,_that.telegramId,_that.megaEmail,_that.megaPassword,_that.stremioSort,_that.cdnSelection,_that.stremioUseCustomSearchEngines,_that.stremioResultSort,_that.webdavUseLocalFiles,_that.stremioLegacyYourMedia,_that.stremioOnlyYourMediaStreams,_that.stremioDisableYourMediaStreams,_that.webdavUseFolderView,_that.webdavFlatten,_that.stremioLimitPerResolutionTorrent,_that.stremioLimitPerResolutionUsenet,_that.stremioTorrentSeedersCutoff,_that.pixeldrainApiKey,_that.onefichierApiKey,_that.gofileApiKey,_that.patreonId,_that.stremioWaitForDownloadUsenet,_that.stremioWaitForDownloadTorrent,_that.stremioDisableFilteredNote,_that.stremioEmojiInDescription,_that.dashboardFilter,_that.webPlayerAlwaysTranscode,_that.webPlayerAlwaysSkipIntro,_that.webPlayerAudioPreferredLanguage,_that.webPlayerSubtitlePreferredLanguage,_that.webPlayerDisablePrestreamSelector,_that.dashboardSort,_that.webPlayerDisableNextUpDialogue,_that.webPlayerEnableScrobbling,_that.appendFilenameToLinks,_that.subscribedEmailSegments);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? emailNotifications,  bool? webNotifications,  bool? mobileNotifications,  bool? rssNotifications,  bool? downloadSpeedInTab, @JsonKey(name: 'show_tracker_in_torrents')  bool? showTrackerInTorrents,  List<int>? stremioQuality,  List<int>? stremioResolution,  List<int>? stremioLanguage,  List<int>? stremioCache,  int? stremioSizeLower,  int? stremioSizeUpper,  String? googleDriveFolderId,  String? onedriveSavePath,  String? discordId,  bool? discordNotifications,  bool? stremioAllowAdult,  int? stremioSeedTorrents,  int? seedTorrents,  bool? allowZipped,  bool? stremioAllowZipped,  String? onefichierFolderId,  String? gofileFolderId,  bool? jdownloaderNotifications,  bool? webhookNotifications,  String? webhookUrl,  bool? telegramNotifications,  String? telegramId,  String? megaEmail,  String? megaPassword,  String? stremioSort,  String? cdnSelection,  bool? stremioUseCustomSearchEngines,  String? stremioResultSort,  bool? webdavUseLocalFiles,  bool? stremioLegacyYourMedia,  bool? stremioOnlyYourMediaStreams,  bool? stremioDisableYourMediaStreams,  bool? webdavUseFolderView,  bool? webdavFlatten,  int? stremioLimitPerResolutionTorrent,  int? stremioLimitPerResolutionUsenet,  int? stremioTorrentSeedersCutoff,  String? pixeldrainApiKey,  String? onefichierApiKey,  String? gofileApiKey,  String? patreonId,  bool? stremioWaitForDownloadUsenet,  bool? stremioWaitForDownloadTorrent,  bool? stremioDisableFilteredNote,  bool? stremioEmojiInDescription,  DashboardFilter? dashboardFilter,  bool? webPlayerAlwaysTranscode,  bool? webPlayerAlwaysSkipIntro,  String? webPlayerAudioPreferredLanguage,  String? webPlayerSubtitlePreferredLanguage,  bool? webPlayerDisablePrestreamSelector,  String? dashboardSort,  bool? webPlayerDisableNextUpDialogue,  bool? webPlayerEnableScrobbling,  bool? appendFilenameToLinks,  List<String>? subscribedEmailSegments)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.emailNotifications,_that.webNotifications,_that.mobileNotifications,_that.rssNotifications,_that.downloadSpeedInTab,_that.showTrackerInTorrents,_that.stremioQuality,_that.stremioResolution,_that.stremioLanguage,_that.stremioCache,_that.stremioSizeLower,_that.stremioSizeUpper,_that.googleDriveFolderId,_that.onedriveSavePath,_that.discordId,_that.discordNotifications,_that.stremioAllowAdult,_that.stremioSeedTorrents,_that.seedTorrents,_that.allowZipped,_that.stremioAllowZipped,_that.onefichierFolderId,_that.gofileFolderId,_that.jdownloaderNotifications,_that.webhookNotifications,_that.webhookUrl,_that.telegramNotifications,_that.telegramId,_that.megaEmail,_that.megaPassword,_that.stremioSort,_that.cdnSelection,_that.stremioUseCustomSearchEngines,_that.stremioResultSort,_that.webdavUseLocalFiles,_that.stremioLegacyYourMedia,_that.stremioOnlyYourMediaStreams,_that.stremioDisableYourMediaStreams,_that.webdavUseFolderView,_that.webdavFlatten,_that.stremioLimitPerResolutionTorrent,_that.stremioLimitPerResolutionUsenet,_that.stremioTorrentSeedersCutoff,_that.pixeldrainApiKey,_that.onefichierApiKey,_that.gofileApiKey,_that.patreonId,_that.stremioWaitForDownloadUsenet,_that.stremioWaitForDownloadTorrent,_that.stremioDisableFilteredNote,_that.stremioEmojiInDescription,_that.dashboardFilter,_that.webPlayerAlwaysTranscode,_that.webPlayerAlwaysSkipIntro,_that.webPlayerAudioPreferredLanguage,_that.webPlayerSubtitlePreferredLanguage,_that.webPlayerDisablePrestreamSelector,_that.dashboardSort,_that.webPlayerDisableNextUpDialogue,_that.webPlayerEnableScrobbling,_that.appendFilenameToLinks,_that.subscribedEmailSegments);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? emailNotifications,  bool? webNotifications,  bool? mobileNotifications,  bool? rssNotifications,  bool? downloadSpeedInTab, @JsonKey(name: 'show_tracker_in_torrents')  bool? showTrackerInTorrents,  List<int>? stremioQuality,  List<int>? stremioResolution,  List<int>? stremioLanguage,  List<int>? stremioCache,  int? stremioSizeLower,  int? stremioSizeUpper,  String? googleDriveFolderId,  String? onedriveSavePath,  String? discordId,  bool? discordNotifications,  bool? stremioAllowAdult,  int? stremioSeedTorrents,  int? seedTorrents,  bool? allowZipped,  bool? stremioAllowZipped,  String? onefichierFolderId,  String? gofileFolderId,  bool? jdownloaderNotifications,  bool? webhookNotifications,  String? webhookUrl,  bool? telegramNotifications,  String? telegramId,  String? megaEmail,  String? megaPassword,  String? stremioSort,  String? cdnSelection,  bool? stremioUseCustomSearchEngines,  String? stremioResultSort,  bool? webdavUseLocalFiles,  bool? stremioLegacyYourMedia,  bool? stremioOnlyYourMediaStreams,  bool? stremioDisableYourMediaStreams,  bool? webdavUseFolderView,  bool? webdavFlatten,  int? stremioLimitPerResolutionTorrent,  int? stremioLimitPerResolutionUsenet,  int? stremioTorrentSeedersCutoff,  String? pixeldrainApiKey,  String? onefichierApiKey,  String? gofileApiKey,  String? patreonId,  bool? stremioWaitForDownloadUsenet,  bool? stremioWaitForDownloadTorrent,  bool? stremioDisableFilteredNote,  bool? stremioEmojiInDescription,  DashboardFilter? dashboardFilter,  bool? webPlayerAlwaysTranscode,  bool? webPlayerAlwaysSkipIntro,  String? webPlayerAudioPreferredLanguage,  String? webPlayerSubtitlePreferredLanguage,  bool? webPlayerDisablePrestreamSelector,  String? dashboardSort,  bool? webPlayerDisableNextUpDialogue,  bool? webPlayerEnableScrobbling,  bool? appendFilenameToLinks,  List<String>? subscribedEmailSegments)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.emailNotifications,_that.webNotifications,_that.mobileNotifications,_that.rssNotifications,_that.downloadSpeedInTab,_that.showTrackerInTorrents,_that.stremioQuality,_that.stremioResolution,_that.stremioLanguage,_that.stremioCache,_that.stremioSizeLower,_that.stremioSizeUpper,_that.googleDriveFolderId,_that.onedriveSavePath,_that.discordId,_that.discordNotifications,_that.stremioAllowAdult,_that.stremioSeedTorrents,_that.seedTorrents,_that.allowZipped,_that.stremioAllowZipped,_that.onefichierFolderId,_that.gofileFolderId,_that.jdownloaderNotifications,_that.webhookNotifications,_that.webhookUrl,_that.telegramNotifications,_that.telegramId,_that.megaEmail,_that.megaPassword,_that.stremioSort,_that.cdnSelection,_that.stremioUseCustomSearchEngines,_that.stremioResultSort,_that.webdavUseLocalFiles,_that.stremioLegacyYourMedia,_that.stremioOnlyYourMediaStreams,_that.stremioDisableYourMediaStreams,_that.webdavUseFolderView,_that.webdavFlatten,_that.stremioLimitPerResolutionTorrent,_that.stremioLimitPerResolutionUsenet,_that.stremioTorrentSeedersCutoff,_that.pixeldrainApiKey,_that.onefichierApiKey,_that.gofileApiKey,_that.patreonId,_that.stremioWaitForDownloadUsenet,_that.stremioWaitForDownloadTorrent,_that.stremioDisableFilteredNote,_that.stremioEmojiInDescription,_that.dashboardFilter,_that.webPlayerAlwaysTranscode,_that.webPlayerAlwaysSkipIntro,_that.webPlayerAudioPreferredLanguage,_that.webPlayerSubtitlePreferredLanguage,_that.webPlayerDisablePrestreamSelector,_that.dashboardSort,_that.webPlayerDisableNextUpDialogue,_that.webPlayerEnableScrobbling,_that.appendFilenameToLinks,_that.subscribedEmailSegments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({this.emailNotifications, this.webNotifications, this.mobileNotifications, this.rssNotifications, this.downloadSpeedInTab, @JsonKey(name: 'show_tracker_in_torrents') this.showTrackerInTorrents, final  List<int>? stremioQuality, final  List<int>? stremioResolution, final  List<int>? stremioLanguage, final  List<int>? stremioCache, this.stremioSizeLower, this.stremioSizeUpper, this.googleDriveFolderId, this.onedriveSavePath, this.discordId, this.discordNotifications, this.stremioAllowAdult, this.stremioSeedTorrents, this.seedTorrents, this.allowZipped, this.stremioAllowZipped, this.onefichierFolderId, this.gofileFolderId, this.jdownloaderNotifications, this.webhookNotifications, this.webhookUrl, this.telegramNotifications, this.telegramId, this.megaEmail, this.megaPassword, this.stremioSort, this.cdnSelection, this.stremioUseCustomSearchEngines, this.stremioResultSort, this.webdavUseLocalFiles, this.stremioLegacyYourMedia, this.stremioOnlyYourMediaStreams, this.stremioDisableYourMediaStreams, this.webdavUseFolderView, this.webdavFlatten, this.stremioLimitPerResolutionTorrent, this.stremioLimitPerResolutionUsenet, this.stremioTorrentSeedersCutoff, this.pixeldrainApiKey, this.onefichierApiKey, this.gofileApiKey, this.patreonId, this.stremioWaitForDownloadUsenet, this.stremioWaitForDownloadTorrent, this.stremioDisableFilteredNote, this.stremioEmojiInDescription, this.dashboardFilter, this.webPlayerAlwaysTranscode, this.webPlayerAlwaysSkipIntro, this.webPlayerAudioPreferredLanguage, this.webPlayerSubtitlePreferredLanguage, this.webPlayerDisablePrestreamSelector, this.dashboardSort, this.webPlayerDisableNextUpDialogue, this.webPlayerEnableScrobbling, this.appendFilenameToLinks, final  List<String>? subscribedEmailSegments}): _stremioQuality = stremioQuality,_stremioResolution = stremioResolution,_stremioLanguage = stremioLanguage,_stremioCache = stremioCache,_subscribedEmailSegments = subscribedEmailSegments;
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override final  bool? emailNotifications;
@override final  bool? webNotifications;
@override final  bool? mobileNotifications;
@override final  bool? rssNotifications;
@override final  bool? downloadSpeedInTab;
/// Declared as `show_tracker_in_torrents` in the OpenAPI spec.
@override@JsonKey(name: 'show_tracker_in_torrents') final  bool? showTrackerInTorrents;
 final  List<int>? _stremioQuality;
@override List<int>? get stremioQuality {
  final value = _stremioQuality;
  if (value == null) return null;
  if (_stremioQuality is EqualUnmodifiableListView) return _stremioQuality;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _stremioResolution;
@override List<int>? get stremioResolution {
  final value = _stremioResolution;
  if (value == null) return null;
  if (_stremioResolution is EqualUnmodifiableListView) return _stremioResolution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _stremioLanguage;
@override List<int>? get stremioLanguage {
  final value = _stremioLanguage;
  if (value == null) return null;
  if (_stremioLanguage is EqualUnmodifiableListView) return _stremioLanguage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _stremioCache;
@override List<int>? get stremioCache {
  final value = _stremioCache;
  if (value == null) return null;
  if (_stremioCache is EqualUnmodifiableListView) return _stremioCache;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? stremioSizeLower;
@override final  int? stremioSizeUpper;
@override final  String? googleDriveFolderId;
@override final  String? onedriveSavePath;
@override final  String? discordId;
@override final  bool? discordNotifications;
@override final  bool? stremioAllowAdult;
@override final  int? stremioSeedTorrents;
@override final  int? seedTorrents;
@override final  bool? allowZipped;
@override final  bool? stremioAllowZipped;
@override final  String? onefichierFolderId;
@override final  String? gofileFolderId;
@override final  bool? jdownloaderNotifications;
@override final  bool? webhookNotifications;
@override final  String? webhookUrl;
@override final  bool? telegramNotifications;
@override final  String? telegramId;
@override final  String? megaEmail;
@override final  String? megaPassword;
@override final  String? stremioSort;
@override final  String? cdnSelection;
@override final  bool? stremioUseCustomSearchEngines;
@override final  String? stremioResultSort;
@override final  bool? webdavUseLocalFiles;
@override final  bool? stremioLegacyYourMedia;
@override final  bool? stremioOnlyYourMediaStreams;
@override final  bool? stremioDisableYourMediaStreams;
@override final  bool? webdavUseFolderView;
@override final  bool? webdavFlatten;
@override final  int? stremioLimitPerResolutionTorrent;
@override final  int? stremioLimitPerResolutionUsenet;
@override final  int? stremioTorrentSeedersCutoff;
@override final  String? pixeldrainApiKey;
@override final  String? onefichierApiKey;
@override final  String? gofileApiKey;
@override final  String? patreonId;
@override final  bool? stremioWaitForDownloadUsenet;
@override final  bool? stremioWaitForDownloadTorrent;
@override final  bool? stremioDisableFilteredNote;
@override final  bool? stremioEmojiInDescription;
@override final  DashboardFilter? dashboardFilter;
@override final  bool? webPlayerAlwaysTranscode;
@override final  bool? webPlayerAlwaysSkipIntro;
@override final  String? webPlayerAudioPreferredLanguage;
@override final  String? webPlayerSubtitlePreferredLanguage;
@override final  bool? webPlayerDisablePrestreamSelector;
@override final  String? dashboardSort;
@override final  bool? webPlayerDisableNextUpDialogue;
@override final  bool? webPlayerEnableScrobbling;
@override final  bool? appendFilenameToLinks;
 final  List<String>? _subscribedEmailSegments;
@override List<String>? get subscribedEmailSegments {
  final value = _subscribedEmailSegments;
  if (value == null) return null;
  if (_subscribedEmailSegments is EqualUnmodifiableListView) return _subscribedEmailSegments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.webNotifications, webNotifications) || other.webNotifications == webNotifications)&&(identical(other.mobileNotifications, mobileNotifications) || other.mobileNotifications == mobileNotifications)&&(identical(other.rssNotifications, rssNotifications) || other.rssNotifications == rssNotifications)&&(identical(other.downloadSpeedInTab, downloadSpeedInTab) || other.downloadSpeedInTab == downloadSpeedInTab)&&(identical(other.showTrackerInTorrents, showTrackerInTorrents) || other.showTrackerInTorrents == showTrackerInTorrents)&&const DeepCollectionEquality().equals(other._stremioQuality, _stremioQuality)&&const DeepCollectionEquality().equals(other._stremioResolution, _stremioResolution)&&const DeepCollectionEquality().equals(other._stremioLanguage, _stremioLanguage)&&const DeepCollectionEquality().equals(other._stremioCache, _stremioCache)&&(identical(other.stremioSizeLower, stremioSizeLower) || other.stremioSizeLower == stremioSizeLower)&&(identical(other.stremioSizeUpper, stremioSizeUpper) || other.stremioSizeUpper == stremioSizeUpper)&&(identical(other.googleDriveFolderId, googleDriveFolderId) || other.googleDriveFolderId == googleDriveFolderId)&&(identical(other.onedriveSavePath, onedriveSavePath) || other.onedriveSavePath == onedriveSavePath)&&(identical(other.discordId, discordId) || other.discordId == discordId)&&(identical(other.discordNotifications, discordNotifications) || other.discordNotifications == discordNotifications)&&(identical(other.stremioAllowAdult, stremioAllowAdult) || other.stremioAllowAdult == stremioAllowAdult)&&(identical(other.stremioSeedTorrents, stremioSeedTorrents) || other.stremioSeedTorrents == stremioSeedTorrents)&&(identical(other.seedTorrents, seedTorrents) || other.seedTorrents == seedTorrents)&&(identical(other.allowZipped, allowZipped) || other.allowZipped == allowZipped)&&(identical(other.stremioAllowZipped, stremioAllowZipped) || other.stremioAllowZipped == stremioAllowZipped)&&(identical(other.onefichierFolderId, onefichierFolderId) || other.onefichierFolderId == onefichierFolderId)&&(identical(other.gofileFolderId, gofileFolderId) || other.gofileFolderId == gofileFolderId)&&(identical(other.jdownloaderNotifications, jdownloaderNotifications) || other.jdownloaderNotifications == jdownloaderNotifications)&&(identical(other.webhookNotifications, webhookNotifications) || other.webhookNotifications == webhookNotifications)&&(identical(other.webhookUrl, webhookUrl) || other.webhookUrl == webhookUrl)&&(identical(other.telegramNotifications, telegramNotifications) || other.telegramNotifications == telegramNotifications)&&(identical(other.telegramId, telegramId) || other.telegramId == telegramId)&&(identical(other.megaEmail, megaEmail) || other.megaEmail == megaEmail)&&(identical(other.megaPassword, megaPassword) || other.megaPassword == megaPassword)&&(identical(other.stremioSort, stremioSort) || other.stremioSort == stremioSort)&&(identical(other.cdnSelection, cdnSelection) || other.cdnSelection == cdnSelection)&&(identical(other.stremioUseCustomSearchEngines, stremioUseCustomSearchEngines) || other.stremioUseCustomSearchEngines == stremioUseCustomSearchEngines)&&(identical(other.stremioResultSort, stremioResultSort) || other.stremioResultSort == stremioResultSort)&&(identical(other.webdavUseLocalFiles, webdavUseLocalFiles) || other.webdavUseLocalFiles == webdavUseLocalFiles)&&(identical(other.stremioLegacyYourMedia, stremioLegacyYourMedia) || other.stremioLegacyYourMedia == stremioLegacyYourMedia)&&(identical(other.stremioOnlyYourMediaStreams, stremioOnlyYourMediaStreams) || other.stremioOnlyYourMediaStreams == stremioOnlyYourMediaStreams)&&(identical(other.stremioDisableYourMediaStreams, stremioDisableYourMediaStreams) || other.stremioDisableYourMediaStreams == stremioDisableYourMediaStreams)&&(identical(other.webdavUseFolderView, webdavUseFolderView) || other.webdavUseFolderView == webdavUseFolderView)&&(identical(other.webdavFlatten, webdavFlatten) || other.webdavFlatten == webdavFlatten)&&(identical(other.stremioLimitPerResolutionTorrent, stremioLimitPerResolutionTorrent) || other.stremioLimitPerResolutionTorrent == stremioLimitPerResolutionTorrent)&&(identical(other.stremioLimitPerResolutionUsenet, stremioLimitPerResolutionUsenet) || other.stremioLimitPerResolutionUsenet == stremioLimitPerResolutionUsenet)&&(identical(other.stremioTorrentSeedersCutoff, stremioTorrentSeedersCutoff) || other.stremioTorrentSeedersCutoff == stremioTorrentSeedersCutoff)&&(identical(other.pixeldrainApiKey, pixeldrainApiKey) || other.pixeldrainApiKey == pixeldrainApiKey)&&(identical(other.onefichierApiKey, onefichierApiKey) || other.onefichierApiKey == onefichierApiKey)&&(identical(other.gofileApiKey, gofileApiKey) || other.gofileApiKey == gofileApiKey)&&(identical(other.patreonId, patreonId) || other.patreonId == patreonId)&&(identical(other.stremioWaitForDownloadUsenet, stremioWaitForDownloadUsenet) || other.stremioWaitForDownloadUsenet == stremioWaitForDownloadUsenet)&&(identical(other.stremioWaitForDownloadTorrent, stremioWaitForDownloadTorrent) || other.stremioWaitForDownloadTorrent == stremioWaitForDownloadTorrent)&&(identical(other.stremioDisableFilteredNote, stremioDisableFilteredNote) || other.stremioDisableFilteredNote == stremioDisableFilteredNote)&&(identical(other.stremioEmojiInDescription, stremioEmojiInDescription) || other.stremioEmojiInDescription == stremioEmojiInDescription)&&(identical(other.dashboardFilter, dashboardFilter) || other.dashboardFilter == dashboardFilter)&&(identical(other.webPlayerAlwaysTranscode, webPlayerAlwaysTranscode) || other.webPlayerAlwaysTranscode == webPlayerAlwaysTranscode)&&(identical(other.webPlayerAlwaysSkipIntro, webPlayerAlwaysSkipIntro) || other.webPlayerAlwaysSkipIntro == webPlayerAlwaysSkipIntro)&&(identical(other.webPlayerAudioPreferredLanguage, webPlayerAudioPreferredLanguage) || other.webPlayerAudioPreferredLanguage == webPlayerAudioPreferredLanguage)&&(identical(other.webPlayerSubtitlePreferredLanguage, webPlayerSubtitlePreferredLanguage) || other.webPlayerSubtitlePreferredLanguage == webPlayerSubtitlePreferredLanguage)&&(identical(other.webPlayerDisablePrestreamSelector, webPlayerDisablePrestreamSelector) || other.webPlayerDisablePrestreamSelector == webPlayerDisablePrestreamSelector)&&(identical(other.dashboardSort, dashboardSort) || other.dashboardSort == dashboardSort)&&(identical(other.webPlayerDisableNextUpDialogue, webPlayerDisableNextUpDialogue) || other.webPlayerDisableNextUpDialogue == webPlayerDisableNextUpDialogue)&&(identical(other.webPlayerEnableScrobbling, webPlayerEnableScrobbling) || other.webPlayerEnableScrobbling == webPlayerEnableScrobbling)&&(identical(other.appendFilenameToLinks, appendFilenameToLinks) || other.appendFilenameToLinks == appendFilenameToLinks)&&const DeepCollectionEquality().equals(other._subscribedEmailSegments, _subscribedEmailSegments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,emailNotifications,webNotifications,mobileNotifications,rssNotifications,downloadSpeedInTab,showTrackerInTorrents,const DeepCollectionEquality().hash(_stremioQuality),const DeepCollectionEquality().hash(_stremioResolution),const DeepCollectionEquality().hash(_stremioLanguage),const DeepCollectionEquality().hash(_stremioCache),stremioSizeLower,stremioSizeUpper,googleDriveFolderId,onedriveSavePath,discordId,discordNotifications,stremioAllowAdult,stremioSeedTorrents,seedTorrents,allowZipped,stremioAllowZipped,onefichierFolderId,gofileFolderId,jdownloaderNotifications,webhookNotifications,webhookUrl,telegramNotifications,telegramId,megaEmail,megaPassword,stremioSort,cdnSelection,stremioUseCustomSearchEngines,stremioResultSort,webdavUseLocalFiles,stremioLegacyYourMedia,stremioOnlyYourMediaStreams,stremioDisableYourMediaStreams,webdavUseFolderView,webdavFlatten,stremioLimitPerResolutionTorrent,stremioLimitPerResolutionUsenet,stremioTorrentSeedersCutoff,pixeldrainApiKey,onefichierApiKey,gofileApiKey,patreonId,stremioWaitForDownloadUsenet,stremioWaitForDownloadTorrent,stremioDisableFilteredNote,stremioEmojiInDescription,dashboardFilter,webPlayerAlwaysTranscode,webPlayerAlwaysSkipIntro,webPlayerAudioPreferredLanguage,webPlayerSubtitlePreferredLanguage,webPlayerDisablePrestreamSelector,dashboardSort,webPlayerDisableNextUpDialogue,webPlayerEnableScrobbling,appendFilenameToLinks,const DeepCollectionEquality().hash(_subscribedEmailSegments)]);

@override
String toString() {
  return 'UserSettings(emailNotifications: $emailNotifications, webNotifications: $webNotifications, mobileNotifications: $mobileNotifications, rssNotifications: $rssNotifications, downloadSpeedInTab: $downloadSpeedInTab, showTrackerInTorrents: $showTrackerInTorrents, stremioQuality: $stremioQuality, stremioResolution: $stremioResolution, stremioLanguage: $stremioLanguage, stremioCache: $stremioCache, stremioSizeLower: $stremioSizeLower, stremioSizeUpper: $stremioSizeUpper, googleDriveFolderId: $googleDriveFolderId, onedriveSavePath: $onedriveSavePath, discordId: $discordId, discordNotifications: $discordNotifications, stremioAllowAdult: $stremioAllowAdult, stremioSeedTorrents: $stremioSeedTorrents, seedTorrents: $seedTorrents, allowZipped: $allowZipped, stremioAllowZipped: $stremioAllowZipped, onefichierFolderId: $onefichierFolderId, gofileFolderId: $gofileFolderId, jdownloaderNotifications: $jdownloaderNotifications, webhookNotifications: $webhookNotifications, webhookUrl: $webhookUrl, telegramNotifications: $telegramNotifications, telegramId: $telegramId, megaEmail: $megaEmail, megaPassword: $megaPassword, stremioSort: $stremioSort, cdnSelection: $cdnSelection, stremioUseCustomSearchEngines: $stremioUseCustomSearchEngines, stremioResultSort: $stremioResultSort, webdavUseLocalFiles: $webdavUseLocalFiles, stremioLegacyYourMedia: $stremioLegacyYourMedia, stremioOnlyYourMediaStreams: $stremioOnlyYourMediaStreams, stremioDisableYourMediaStreams: $stremioDisableYourMediaStreams, webdavUseFolderView: $webdavUseFolderView, webdavFlatten: $webdavFlatten, stremioLimitPerResolutionTorrent: $stremioLimitPerResolutionTorrent, stremioLimitPerResolutionUsenet: $stremioLimitPerResolutionUsenet, stremioTorrentSeedersCutoff: $stremioTorrentSeedersCutoff, pixeldrainApiKey: $pixeldrainApiKey, onefichierApiKey: $onefichierApiKey, gofileApiKey: $gofileApiKey, patreonId: $patreonId, stremioWaitForDownloadUsenet: $stremioWaitForDownloadUsenet, stremioWaitForDownloadTorrent: $stremioWaitForDownloadTorrent, stremioDisableFilteredNote: $stremioDisableFilteredNote, stremioEmojiInDescription: $stremioEmojiInDescription, dashboardFilter: $dashboardFilter, webPlayerAlwaysTranscode: $webPlayerAlwaysTranscode, webPlayerAlwaysSkipIntro: $webPlayerAlwaysSkipIntro, webPlayerAudioPreferredLanguage: $webPlayerAudioPreferredLanguage, webPlayerSubtitlePreferredLanguage: $webPlayerSubtitlePreferredLanguage, webPlayerDisablePrestreamSelector: $webPlayerDisablePrestreamSelector, dashboardSort: $dashboardSort, webPlayerDisableNextUpDialogue: $webPlayerDisableNextUpDialogue, webPlayerEnableScrobbling: $webPlayerEnableScrobbling, appendFilenameToLinks: $appendFilenameToLinks, subscribedEmailSegments: $subscribedEmailSegments)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool? emailNotifications, bool? webNotifications, bool? mobileNotifications, bool? rssNotifications, bool? downloadSpeedInTab,@JsonKey(name: 'show_tracker_in_torrents') bool? showTrackerInTorrents, List<int>? stremioQuality, List<int>? stremioResolution, List<int>? stremioLanguage, List<int>? stremioCache, int? stremioSizeLower, int? stremioSizeUpper, String? googleDriveFolderId, String? onedriveSavePath, String? discordId, bool? discordNotifications, bool? stremioAllowAdult, int? stremioSeedTorrents, int? seedTorrents, bool? allowZipped, bool? stremioAllowZipped, String? onefichierFolderId, String? gofileFolderId, bool? jdownloaderNotifications, bool? webhookNotifications, String? webhookUrl, bool? telegramNotifications, String? telegramId, String? megaEmail, String? megaPassword, String? stremioSort, String? cdnSelection, bool? stremioUseCustomSearchEngines, String? stremioResultSort, bool? webdavUseLocalFiles, bool? stremioLegacyYourMedia, bool? stremioOnlyYourMediaStreams, bool? stremioDisableYourMediaStreams, bool? webdavUseFolderView, bool? webdavFlatten, int? stremioLimitPerResolutionTorrent, int? stremioLimitPerResolutionUsenet, int? stremioTorrentSeedersCutoff, String? pixeldrainApiKey, String? onefichierApiKey, String? gofileApiKey, String? patreonId, bool? stremioWaitForDownloadUsenet, bool? stremioWaitForDownloadTorrent, bool? stremioDisableFilteredNote, bool? stremioEmojiInDescription, DashboardFilter? dashboardFilter, bool? webPlayerAlwaysTranscode, bool? webPlayerAlwaysSkipIntro, String? webPlayerAudioPreferredLanguage, String? webPlayerSubtitlePreferredLanguage, bool? webPlayerDisablePrestreamSelector, String? dashboardSort, bool? webPlayerDisableNextUpDialogue, bool? webPlayerEnableScrobbling, bool? appendFilenameToLinks, List<String>? subscribedEmailSegments
});


@override $DashboardFilterCopyWith<$Res>? get dashboardFilter;

}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailNotifications = freezed,Object? webNotifications = freezed,Object? mobileNotifications = freezed,Object? rssNotifications = freezed,Object? downloadSpeedInTab = freezed,Object? showTrackerInTorrents = freezed,Object? stremioQuality = freezed,Object? stremioResolution = freezed,Object? stremioLanguage = freezed,Object? stremioCache = freezed,Object? stremioSizeLower = freezed,Object? stremioSizeUpper = freezed,Object? googleDriveFolderId = freezed,Object? onedriveSavePath = freezed,Object? discordId = freezed,Object? discordNotifications = freezed,Object? stremioAllowAdult = freezed,Object? stremioSeedTorrents = freezed,Object? seedTorrents = freezed,Object? allowZipped = freezed,Object? stremioAllowZipped = freezed,Object? onefichierFolderId = freezed,Object? gofileFolderId = freezed,Object? jdownloaderNotifications = freezed,Object? webhookNotifications = freezed,Object? webhookUrl = freezed,Object? telegramNotifications = freezed,Object? telegramId = freezed,Object? megaEmail = freezed,Object? megaPassword = freezed,Object? stremioSort = freezed,Object? cdnSelection = freezed,Object? stremioUseCustomSearchEngines = freezed,Object? stremioResultSort = freezed,Object? webdavUseLocalFiles = freezed,Object? stremioLegacyYourMedia = freezed,Object? stremioOnlyYourMediaStreams = freezed,Object? stremioDisableYourMediaStreams = freezed,Object? webdavUseFolderView = freezed,Object? webdavFlatten = freezed,Object? stremioLimitPerResolutionTorrent = freezed,Object? stremioLimitPerResolutionUsenet = freezed,Object? stremioTorrentSeedersCutoff = freezed,Object? pixeldrainApiKey = freezed,Object? onefichierApiKey = freezed,Object? gofileApiKey = freezed,Object? patreonId = freezed,Object? stremioWaitForDownloadUsenet = freezed,Object? stremioWaitForDownloadTorrent = freezed,Object? stremioDisableFilteredNote = freezed,Object? stremioEmojiInDescription = freezed,Object? dashboardFilter = freezed,Object? webPlayerAlwaysTranscode = freezed,Object? webPlayerAlwaysSkipIntro = freezed,Object? webPlayerAudioPreferredLanguage = freezed,Object? webPlayerSubtitlePreferredLanguage = freezed,Object? webPlayerDisablePrestreamSelector = freezed,Object? dashboardSort = freezed,Object? webPlayerDisableNextUpDialogue = freezed,Object? webPlayerEnableScrobbling = freezed,Object? appendFilenameToLinks = freezed,Object? subscribedEmailSegments = freezed,}) {
  return _then(_UserSettings(
emailNotifications: freezed == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool?,webNotifications: freezed == webNotifications ? _self.webNotifications : webNotifications // ignore: cast_nullable_to_non_nullable
as bool?,mobileNotifications: freezed == mobileNotifications ? _self.mobileNotifications : mobileNotifications // ignore: cast_nullable_to_non_nullable
as bool?,rssNotifications: freezed == rssNotifications ? _self.rssNotifications : rssNotifications // ignore: cast_nullable_to_non_nullable
as bool?,downloadSpeedInTab: freezed == downloadSpeedInTab ? _self.downloadSpeedInTab : downloadSpeedInTab // ignore: cast_nullable_to_non_nullable
as bool?,showTrackerInTorrents: freezed == showTrackerInTorrents ? _self.showTrackerInTorrents : showTrackerInTorrents // ignore: cast_nullable_to_non_nullable
as bool?,stremioQuality: freezed == stremioQuality ? _self._stremioQuality : stremioQuality // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioResolution: freezed == stremioResolution ? _self._stremioResolution : stremioResolution // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioLanguage: freezed == stremioLanguage ? _self._stremioLanguage : stremioLanguage // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioCache: freezed == stremioCache ? _self._stremioCache : stremioCache // ignore: cast_nullable_to_non_nullable
as List<int>?,stremioSizeLower: freezed == stremioSizeLower ? _self.stremioSizeLower : stremioSizeLower // ignore: cast_nullable_to_non_nullable
as int?,stremioSizeUpper: freezed == stremioSizeUpper ? _self.stremioSizeUpper : stremioSizeUpper // ignore: cast_nullable_to_non_nullable
as int?,googleDriveFolderId: freezed == googleDriveFolderId ? _self.googleDriveFolderId : googleDriveFolderId // ignore: cast_nullable_to_non_nullable
as String?,onedriveSavePath: freezed == onedriveSavePath ? _self.onedriveSavePath : onedriveSavePath // ignore: cast_nullable_to_non_nullable
as String?,discordId: freezed == discordId ? _self.discordId : discordId // ignore: cast_nullable_to_non_nullable
as String?,discordNotifications: freezed == discordNotifications ? _self.discordNotifications : discordNotifications // ignore: cast_nullable_to_non_nullable
as bool?,stremioAllowAdult: freezed == stremioAllowAdult ? _self.stremioAllowAdult : stremioAllowAdult // ignore: cast_nullable_to_non_nullable
as bool?,stremioSeedTorrents: freezed == stremioSeedTorrents ? _self.stremioSeedTorrents : stremioSeedTorrents // ignore: cast_nullable_to_non_nullable
as int?,seedTorrents: freezed == seedTorrents ? _self.seedTorrents : seedTorrents // ignore: cast_nullable_to_non_nullable
as int?,allowZipped: freezed == allowZipped ? _self.allowZipped : allowZipped // ignore: cast_nullable_to_non_nullable
as bool?,stremioAllowZipped: freezed == stremioAllowZipped ? _self.stremioAllowZipped : stremioAllowZipped // ignore: cast_nullable_to_non_nullable
as bool?,onefichierFolderId: freezed == onefichierFolderId ? _self.onefichierFolderId : onefichierFolderId // ignore: cast_nullable_to_non_nullable
as String?,gofileFolderId: freezed == gofileFolderId ? _self.gofileFolderId : gofileFolderId // ignore: cast_nullable_to_non_nullable
as String?,jdownloaderNotifications: freezed == jdownloaderNotifications ? _self.jdownloaderNotifications : jdownloaderNotifications // ignore: cast_nullable_to_non_nullable
as bool?,webhookNotifications: freezed == webhookNotifications ? _self.webhookNotifications : webhookNotifications // ignore: cast_nullable_to_non_nullable
as bool?,webhookUrl: freezed == webhookUrl ? _self.webhookUrl : webhookUrl // ignore: cast_nullable_to_non_nullable
as String?,telegramNotifications: freezed == telegramNotifications ? _self.telegramNotifications : telegramNotifications // ignore: cast_nullable_to_non_nullable
as bool?,telegramId: freezed == telegramId ? _self.telegramId : telegramId // ignore: cast_nullable_to_non_nullable
as String?,megaEmail: freezed == megaEmail ? _self.megaEmail : megaEmail // ignore: cast_nullable_to_non_nullable
as String?,megaPassword: freezed == megaPassword ? _self.megaPassword : megaPassword // ignore: cast_nullable_to_non_nullable
as String?,stremioSort: freezed == stremioSort ? _self.stremioSort : stremioSort // ignore: cast_nullable_to_non_nullable
as String?,cdnSelection: freezed == cdnSelection ? _self.cdnSelection : cdnSelection // ignore: cast_nullable_to_non_nullable
as String?,stremioUseCustomSearchEngines: freezed == stremioUseCustomSearchEngines ? _self.stremioUseCustomSearchEngines : stremioUseCustomSearchEngines // ignore: cast_nullable_to_non_nullable
as bool?,stremioResultSort: freezed == stremioResultSort ? _self.stremioResultSort : stremioResultSort // ignore: cast_nullable_to_non_nullable
as String?,webdavUseLocalFiles: freezed == webdavUseLocalFiles ? _self.webdavUseLocalFiles : webdavUseLocalFiles // ignore: cast_nullable_to_non_nullable
as bool?,stremioLegacyYourMedia: freezed == stremioLegacyYourMedia ? _self.stremioLegacyYourMedia : stremioLegacyYourMedia // ignore: cast_nullable_to_non_nullable
as bool?,stremioOnlyYourMediaStreams: freezed == stremioOnlyYourMediaStreams ? _self.stremioOnlyYourMediaStreams : stremioOnlyYourMediaStreams // ignore: cast_nullable_to_non_nullable
as bool?,stremioDisableYourMediaStreams: freezed == stremioDisableYourMediaStreams ? _self.stremioDisableYourMediaStreams : stremioDisableYourMediaStreams // ignore: cast_nullable_to_non_nullable
as bool?,webdavUseFolderView: freezed == webdavUseFolderView ? _self.webdavUseFolderView : webdavUseFolderView // ignore: cast_nullable_to_non_nullable
as bool?,webdavFlatten: freezed == webdavFlatten ? _self.webdavFlatten : webdavFlatten // ignore: cast_nullable_to_non_nullable
as bool?,stremioLimitPerResolutionTorrent: freezed == stremioLimitPerResolutionTorrent ? _self.stremioLimitPerResolutionTorrent : stremioLimitPerResolutionTorrent // ignore: cast_nullable_to_non_nullable
as int?,stremioLimitPerResolutionUsenet: freezed == stremioLimitPerResolutionUsenet ? _self.stremioLimitPerResolutionUsenet : stremioLimitPerResolutionUsenet // ignore: cast_nullable_to_non_nullable
as int?,stremioTorrentSeedersCutoff: freezed == stremioTorrentSeedersCutoff ? _self.stremioTorrentSeedersCutoff : stremioTorrentSeedersCutoff // ignore: cast_nullable_to_non_nullable
as int?,pixeldrainApiKey: freezed == pixeldrainApiKey ? _self.pixeldrainApiKey : pixeldrainApiKey // ignore: cast_nullable_to_non_nullable
as String?,onefichierApiKey: freezed == onefichierApiKey ? _self.onefichierApiKey : onefichierApiKey // ignore: cast_nullable_to_non_nullable
as String?,gofileApiKey: freezed == gofileApiKey ? _self.gofileApiKey : gofileApiKey // ignore: cast_nullable_to_non_nullable
as String?,patreonId: freezed == patreonId ? _self.patreonId : patreonId // ignore: cast_nullable_to_non_nullable
as String?,stremioWaitForDownloadUsenet: freezed == stremioWaitForDownloadUsenet ? _self.stremioWaitForDownloadUsenet : stremioWaitForDownloadUsenet // ignore: cast_nullable_to_non_nullable
as bool?,stremioWaitForDownloadTorrent: freezed == stremioWaitForDownloadTorrent ? _self.stremioWaitForDownloadTorrent : stremioWaitForDownloadTorrent // ignore: cast_nullable_to_non_nullable
as bool?,stremioDisableFilteredNote: freezed == stremioDisableFilteredNote ? _self.stremioDisableFilteredNote : stremioDisableFilteredNote // ignore: cast_nullable_to_non_nullable
as bool?,stremioEmojiInDescription: freezed == stremioEmojiInDescription ? _self.stremioEmojiInDescription : stremioEmojiInDescription // ignore: cast_nullable_to_non_nullable
as bool?,dashboardFilter: freezed == dashboardFilter ? _self.dashboardFilter : dashboardFilter // ignore: cast_nullable_to_non_nullable
as DashboardFilter?,webPlayerAlwaysTranscode: freezed == webPlayerAlwaysTranscode ? _self.webPlayerAlwaysTranscode : webPlayerAlwaysTranscode // ignore: cast_nullable_to_non_nullable
as bool?,webPlayerAlwaysSkipIntro: freezed == webPlayerAlwaysSkipIntro ? _self.webPlayerAlwaysSkipIntro : webPlayerAlwaysSkipIntro // ignore: cast_nullable_to_non_nullable
as bool?,webPlayerAudioPreferredLanguage: freezed == webPlayerAudioPreferredLanguage ? _self.webPlayerAudioPreferredLanguage : webPlayerAudioPreferredLanguage // ignore: cast_nullable_to_non_nullable
as String?,webPlayerSubtitlePreferredLanguage: freezed == webPlayerSubtitlePreferredLanguage ? _self.webPlayerSubtitlePreferredLanguage : webPlayerSubtitlePreferredLanguage // ignore: cast_nullable_to_non_nullable
as String?,webPlayerDisablePrestreamSelector: freezed == webPlayerDisablePrestreamSelector ? _self.webPlayerDisablePrestreamSelector : webPlayerDisablePrestreamSelector // ignore: cast_nullable_to_non_nullable
as bool?,dashboardSort: freezed == dashboardSort ? _self.dashboardSort : dashboardSort // ignore: cast_nullable_to_non_nullable
as String?,webPlayerDisableNextUpDialogue: freezed == webPlayerDisableNextUpDialogue ? _self.webPlayerDisableNextUpDialogue : webPlayerDisableNextUpDialogue // ignore: cast_nullable_to_non_nullable
as bool?,webPlayerEnableScrobbling: freezed == webPlayerEnableScrobbling ? _self.webPlayerEnableScrobbling : webPlayerEnableScrobbling // ignore: cast_nullable_to_non_nullable
as bool?,appendFilenameToLinks: freezed == appendFilenameToLinks ? _self.appendFilenameToLinks : appendFilenameToLinks // ignore: cast_nullable_to_non_nullable
as bool?,subscribedEmailSegments: freezed == subscribedEmailSegments ? _self._subscribedEmailSegments : subscribedEmailSegments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardFilterCopyWith<$Res>? get dashboardFilter {
    if (_self.dashboardFilter == null) {
    return null;
  }

  return $DashboardFilterCopyWith<$Res>(_self.dashboardFilter!, (value) {
    return _then(_self.copyWith(dashboardFilter: value));
  });
}
}

// dart format on
