import 'dart:io';

import 'package:atba/models/saf_uri.dart';
import 'package:atba/screens/jobs_status_page.dart';
import 'package:atba/screens/settings/google_oauth.dart';
import 'package:atba/screens/settings/library_settings_widget.dart';
import 'package:atba/screens/settings/stremio_addons.dart';
import 'package:atba/services/cache/library_item_cache_service.dart';
import 'package:atba/config/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:atba/models/permission_model.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);
    final cacheService = LibraryItemCacheService();
    final TextEditingController apiKeyController = TextEditingController();
    final TextEditingController googleTokenController = TextEditingController();
    // yts,eztv,rarbg,1337x,thepiratebay,kickasstorrents,torrentgalaxy,magnetdl,horriblesubs,nyaasi,tokyotosho,anidex,rutor,rutracker,comando,bludv,torrent9,ilcorsaronero,mejortorrent,wolfmax4k,cinecalidad
    const Map<String, String> providers = {
      // value, name
      'yts': 'YTS',
      'eztv': 'EZTV',
      'rarbg': 'RARBG',
      '1337x': '1337x',
      'thepiratebay': 'The Pirate Bay',
      'kickasstorrents': 'KickassTorrents',
      'torrentgalaxy': 'TorrentGalaxy',
      'magnetdl': 'MagnetDL',
      'horriblesubs': 'HorribleSubs',
      'nyaasi': 'NyaaSi',
      'tokyotosho': 'TokyoTosho',
      'anidex': 'Anidex',
      'rutor': '🇷🇺 Rutor',
      'rutracker': '🇷🇺 RuTracker',
      'comando': '🇵🇹 Comando',
      'bludv': '🇵🇹 BluDV',
      'torrent9': '🇫🇷 Torrent9',
      'ilcorsaronero': '🇮🇹 IlCorSaRoNeRo',
      'mejortorrent': '🇪🇸 MejorTorrent',
      'wolfmax4k': '🇪🇸 WolfMax4K',
      'cinecalidad': '🇲🇽 CineCalidad',
    };

    const Map<String, String> languages = {
      'japanese': '🇯🇵 Japanese',
      'russian': '🇷🇺 Russian',
      'italian': '🇮🇹 Italian',
      'portuguese': '🇵🇹 Portuguese',
      'spanish': '🇪🇸 Spanish',
      'latino': '🇲🇽 Latino',
      'korean': '🇰🇷 Korean',
      'chinese': '🇨🇳 Chinese',
      'taiwanese': '🇹🇼 Taiwanese',
      'french': '🇫🇷 French',
      'german': '🇩🇪 German',
      'dutch': '🇳🇱 Dutch',
      'hindi': '🇮🇳 Hindi',
      'telugu': '🇮🇳 Telugu',
      'tamil': '🇮🇳 Tamil',
      'polish': '🇵🇱 Polish',
      'lithuanian': '🇱🇹 Lithuanian',
      'latvian': '🇱🇻 Latvian',
      'estonian': '🇪🇪 Estonian',
      'czech': '🇨🇿 Czech',
      'slovakian': '🇸🇰 Slovakian',
      'slovenian': '🇸🇮 Slovenian',
      'hungarian': '🇭🇺 Hungarian',
      'romanian': '🇷🇴 Romanian',
      'bulgarian': '🇧🇬 Bulgarian',
      'serbian': '🇷🇸 Serbian',
      'croatian': '🇭🇷 Croatian',
      'ukrainian': '🇺🇦 Ukrainian',
      'greek': '🇬🇷 Greek',
      'danish': '🇩🇰 Danish',
      'finnish': '🇫🇮 Finnish',
      'swedish': '🇸🇪 Swedish',
      'norwegian': '🇳🇴 Norwegian',
      'turkish': '🇹🇷 Turkish',
      'arabic': '🇸🇦 Arabic',
      'persian': '🇮🇷 Persian',
      'hebrew': '🇮🇱 Hebrew',
      'vietnamese': '🇻🇳 Vietnamese',
      'indonesian': '🇮🇩 Indonesian',
      'malay': '🇲🇾 Malay',
      'thai': '🇹🇭 Thai',
    };

    const Map<String, String> qualities = {
      // brremux,hdrall,dolbyvision,dolbyvisionwithhdr,threed,nonthreed,4k,1080p,720p,480p,other,scr,cam,unknown
      'brremux': 'BluRay REMUX',
      'hdrall': 'HDR/HDR10+/Dolby Vision',
      'dolbyvision': 'Dolby Vision',
      'dolbyvisionwithhdr': 'Dolby Vision + HDR',
      'threed': '3D',
      'nonthreed': 'Non 3D (DO NOT SELECT IF NOT SURE)',
      '4k': '4K',
      '1080p': '1080p',
      '720p': '720p',
      '480p': '480p',
      'other': 'Other (DVDRip/HDRIp/BDRip...)',
      'scr': 'Screener',
      'cam': 'Cam',
      'unknown': 'Unknown',
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SimpleSettingsTile(
            title: 'Account',
            leading: Icon(Icons.account_circle),
            child: SettingsScreen(
              title: 'Account settings',
              children: <Widget>[
                // We're using secure storage to store the API key, so we would need to implement a custom storage on top of SharedPreferences to combine it with secure storage
                // in this case, it's easier just to use a custom widget
                // to change the api key, especially with verifying it

                // could probably share with setup/api_screen.dart
                // TODO: make look less ugly & share code
                TextField(
                  controller: apiKeyController,
                  decoration: const InputDecoration(
                    labelText: 'API Key',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final apiKey = apiKeyController.text.trim();
                    await apiService.saveApiKey(apiKey);
                    final response = await apiService.getUserData();
                    if (apiKey.isNotEmpty && response.success) {
                      await apiService.saveApiKey(apiKey);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('API Key saved')));
                      Navigator.pop(context);
                    } else {
                      apiService.deleteApiKey();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            apiKey.isNotEmpty
                                ? (response.detailOrUnknown)
                                : 'API Key is required!',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Continue'),
                ),

                SimpleSettingsTile(
                  title: 'Delete API Key',
                  leading: Icon(Icons.delete),
                  onTap: () async {
                    await apiService.deleteApiKey();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('API Key deleted')));
                  },
                ),
              ],
            ),
          ),
          SimpleSettingsTile(
            title: "Appearance",
            leading: Icon(Icons.color_lens),
            child: SettingsScreen(
              title: 'Appearance settings',
              children: <Widget>[
                DropDownSettingsTile<String>(
                  title: 'Theme',
                  settingKey: Constants.theme,
                  values: <String, String>{
                    'system': 'System default',
                    'light': 'Light',
                    'dark': 'Dark',
                  },
                  selected: 'system',
                ),
                CheckboxSettingsTile(
                  title: "Use custom colour theme",
                  settingKey: Constants.useCustomColorTheme,
                  defaultValue: false,
                  childrenIfEnabled: [
                    ColorPickerSettingsTile(
                      settingKey: Constants.colorTheme,
                      title: 'Accent Color',
                      defaultValue: Colors.green,
                    ),
                  ],
                ),

                CheckboxSettingsTile(
                  settingKey: Constants.useMaterial3,
                  title: 'Use Material3 theming',
                  defaultValue: true,
                ),
                CheckboxSettingsTile(
                  settingKey: Constants.useTorboxFontFamily,
                  title: 'Use torbox\'s dotted font',
                  defaultValue: false,
                ),
              ],
            ),
          ),
          SimpleSettingsTile(
            title: "Integrations",
            leading: Icon(Icons.integration_instructions),
            child: SettingsScreen(
              title: "Integrations settings",
              children: <Widget>[
                SimpleSettingsTile(
                  title: "Jobs status",
                  leading: Icon(Icons.work),
                  child: JobsStatusPage(),
                ),
                GoogleDriveIntegrationSection(
                  apiService: apiService,
                  googleTokenController: googleTokenController,
                ),
                StemioAddonsSettingsWidget(
                  providers: providers,
                  languages: languages,
                  qualities: qualities,
                ),
              ],
            ),
          ),
          LibrarySettingsTile(),
          SimpleSettingsTile(
            title: "Storage",
            leading: Icon(Icons.storage),
            child: SettingsScreen(
              title: "Storage settings",
              children: <Widget>[
                if (!kIsWeb) ...[
                  ValueChangeObserver<String>(
                    cacheKey: Constants.folderPath,
                    defaultValue: 'No download folder set',
                    builder:
                        (
                          BuildContext context,
                          String value,
                          OnChanged<String> onChanged,
                        ) {
                          return ListTile(
                            title: const Text("Storage location"),
                            leading: Icon(Icons.storage),
                            onTap: () async {
                              // TODO: niceify with methods in permission model
                              PermissionModel permissionModel =
                                  PermissionModel();
                              final folderPath = await permissionModel
                                  .selectFolder();
                              if (folderPath == null) return;
                              await Settings.setValue<String>(
                                Constants.folderPath,
                                folderPath,
                                notify: true,
                              );
                              setState(() {});
                            },
                            subtitle: Text(parseStorageFolderPath(value)),
                          );
                        },
                  ),

                  const Divider(),
                ],
                CheckboxSettingsTile(
                  title: "Use caching",
                  settingKey: Constants.useCache,
                  defaultValue: true,
                ),
                ListTile(
                  title: const Text("Clear cache"),
                  leading: Icon(Icons.delete),
                  onTap: () async {
                    await apiService.deleteTorboxCache();
                    await cacheService.clearCache();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Cache cleared')));
                  },
                ),
              ],
            ),
          ),
          if (!kIsWeb && Platform.isAndroid)
            CheckboxSettingsTile(
              settingKey: Constants.useInternalVideoPlayer,
              title: 'Use internal video player',
              defaultValue: (kIsWeb || !Platform.isAndroid),
            ),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return ListTile(
                    title: const Text('About'),
                    leading: const Icon(Icons.info),
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'ATBA',
                        applicationVersion: snapshot.data!.version,
                      );
                    },
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  String parseStorageFolderPath(String path) {
    final parsed = SafUriInfo.tryParseUri(path);
    if (parsed == null) return path;
    return "/${parsed.volume!}/${parsed.relativePath!}";
  }
}
