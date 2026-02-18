import 'package:atba/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class StemioAddonsSettingsWidget extends StatelessWidget {
  const StemioAddonsSettingsWidget({
    super.key,
    required this.providers,
    required this.languages,
    required this.qualities,
  });

  final Map<String, String> providers;
  final Map<String, String> languages;
  final Map<String, String> qualities;

  @override
  Widget build(BuildContext context) {
    return ExpandableSettingsTile(
      title: "Stremio Addons",
      leading: Icon(Icons.language),
      children: [
        CheckboxSettingsTile(
          leading: Icon(Icons.add_box),
          title: "Torbox Addon",
          settingKey: Constants.torboxAddonEnabled,
        ),
        SimpleSettingsTile(
          title: "Torrentio",
          leading: Icon(Icons.language),
          child: SettingsScreen(
            title: 'Torrentio settings',
            children: <Widget>[
              CheckboxSettingsTile(
                title: "Enable torrentio",
                settingKey: Constants.torrentioEnabled,
                childrenIfEnabled: [
                  ExpandableSettingsTile(
                    title: "Providers",
                    children: [
                      for (var provider in providers.keys)
                        CheckboxSettingsTile(
                          settingKey: '${Constants.keyProviderPrefix}$provider',
                          title: providers[provider] ?? provider,
                          defaultValue: true,
                        ),
                    ],
                  ),
                  DropDownSettingsTile<int>(
                    title: "Sort by",
                    settingKey: Constants.torrentioSortBy,
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
                          settingKey: '${Constants.keyLanguagePrefix}$language',
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
                          settingKey:
                              '${Constants.keyExcludeQualityPrefix}$quality',
                          title: qualities[quality] ?? quality,
                          defaultValue: false,
                        ),
                    ],
                  ),
                  TextInputSettingsTile(
                    settingKey: Constants.torrentioMaxResultsPerQuality,
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
                    settingKey: Constants.torrentioVideoSizeLimit,
                    title: 'Video size limit',
                    keyboardType: TextInputType.number,
                    helperText:
                        'Leave empty for no limit; use a comma to have a different size for movies and series e.g. 5GB ; 800MB ; 10GB,2GB',
                    validator: (value) {
                      if (value == null || value.isEmpty) return null;
                      if (!RegExp(r'^([0-9.]*(?:MB|GB),?)+$').hasMatch(value)) {
                        return 'Invalid size';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
