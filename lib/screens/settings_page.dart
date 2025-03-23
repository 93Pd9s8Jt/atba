import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatelessWidget {

  final TextEditingController _apiKeyController = TextEditingController();

  SettingsPage({super.key});
  // yts,eztv,rarbg,1337x,thepiratebay,kickasstorrents,torrentgalaxy,magnetdl,horriblesubs,nyaasi,tokyotosho,anidex,rutor,rutracker,comando,bludv,torrent9,ilcorsaronero,mejortorrent,wolfmax4k,cinecalidad
  static const Map<String, String> providers = {
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

  static const Map<String, String> languages = {
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


  static const Map<String, String> qualities = { // brremux,hdrall,dolbyvision,dolbyvisionwithhdr,threed,nonthreed,4k,1080p,720p,480p,other,scr,cam,unknown
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

  

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(children: [

          SimpleSettingsTile(
            title: 'Account',
            subtitle: 'Change or delete API key',
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
              controller: _apiKeyController,
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
                final apiKey = _apiKeyController.text.trim();
                await apiService.saveApiKey(apiKey);
                final response = await apiService.getUserData();
                if (apiKey.isNotEmpty && response.success) {
                  await apiService.saveApiKey(apiKey);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('API Key saved')),
                  );
                  Navigator.pop(context);
                } else {
                  apiService.deleteApiKey();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(apiKey.isNotEmpty ?  (response.detail.isNotEmpty ? response.detail : "unknown error") : 'API Key is required!')),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('API Key deleted')),
                    );
                  },
                ),
                
              ],
            ),
          ),

          CheckboxSettingsTile(
            settingKey: 'key-use-torrent-name-parsing',
            title: 'Use torrent name parsing',
            defaultValue: true,

          ),
          CheckboxSettingsTile(
            settingKey: 'key-use-internal-video-player',
            title: 'Use internal video player (very buggy)',
            defaultValue: false,
          ),
          SettingsGroup(title: 'Torrentio', children: <Widget>[
            ExpandableSettingsTile(
              title: "Providers",
              children: [
                for (var provider in providers.keys)
                  CheckboxSettingsTile(
                    settingKey: 'key-provider-$provider',
                    title: providers[provider] ?? provider,
                    defaultValue: true,
                  ),
              ],
            ),
            DropDownSettingsTile<int>(
              title: "Sort by",
              settingKey: 'key-sort-by',
              values: <int, String>{
                1: 'By quality then seeders',
                2: 'By quality then size',
                3: 'By seeders',
                4: 'By size',
              },
              selected: 1,
              // onChange: (value) {
              //   debugPrint('key-dropdown-email-view: $value');
              // },
            ),
            ExpandableSettingsTile(
              title: "Priority foreign language",
              children: [

                for (var language in languages.keys.toList()..sort())
                  CheckboxSettingsTile(
                    settingKey: 'key-language-$language',
                    title: languages[language] ?? language,
                    defaultValue: false,
                  ),
              ],
            ),

            ExpandableSettingsTile(
              title: "Exclude qualities",
              children: [
                for (var quality in qualities.keys)
                  CheckboxSettingsTile(
                    settingKey: 'key-exclude-quality-$quality',
                    title: qualities[quality] ?? quality,
                    defaultValue: false,
                  ),
              ],
            ),
            TextInputSettingsTile(
              settingKey: 'key-max-results-per-quality',
              title: 'Max results per quality',
              keyboardType: TextInputType.number,
              helperText: 'Leave empty for unlimited. ',
              validator: (value) {
                if (value == null || value.isEmpty) return null;
                if (int.tryParse(value) == null) {
                  return 'Invalid number';
                }
                return null;
              },
            ),
            TextInputSettingsTile(
              settingKey: 'key-video-size-limit',
              title: 'Video size limit',
              keyboardType: TextInputType.number,
              helperText: 'Leave empty for no limit; use a comma to have a different size for movies and series e.g. 5GB ; 800MB ; 10GB,2GB',
              validator: (value) {
                if (value == null || value.isEmpty) return null;
                if (!RegExp(r'^([0-9.]*(?:MB|GB),?)+$').hasMatch(value)) {
                  return 'Invalid size';
                }
                return null;
              }
            ),

          ]),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Version: ${snapshot.data!.version}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ]));
  }
}
