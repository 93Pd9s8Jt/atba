import 'dart:convert';

import 'package:atba/config/constants.dart';
import 'package:atba/models/widgets/multi_value_change_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class LibrarySettingsTile extends StatefulWidget {
  const LibrarySettingsTile({super.key});
  static List<String> iconNames = [
    LibraryIcons.jobs.name,
    LibraryIcons.reload.name,
    LibraryIcons.search.name,
    LibraryIcons.sort.name,
    LibraryIcons.filter.name,
    LibraryIcons.blur.name,
  ];
  static final valueMaps = {
    Constants.libraryIconsOrdering: jsonEncode(iconNames),
    Constants.libraryIconsEnabled: jsonEncode({
      for (var e in iconNames) e: true,
    }),
  };

  @override
  State<LibrarySettingsTile> createState() => _LibrarySettingsTileState();
}

class _LibrarySettingsTileState extends State<LibrarySettingsTile> {
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Library",
      leading: Icon(Icons.library_books),
      child: SettingsScreen(
        title: "Library settings",
        children: <Widget>[
          CheckboxSettingsTile(
            title: "Update items in the foreground",
            settingKey: Constants.libraryForegroundUpdate,
            defaultValue: true,
            childrenIfEnabled: <Widget>[
              CheckboxSettingsTile(
                title: "Show update animation",
                settingKey: Constants.libraryForegroundUpdateAnimation,
                defaultValue: true,
              ),
            ],
          ),
          CheckboxSettingsTile(
            settingKey: Constants.useTorrentNameParsing,
            title: 'Use torrent name parsing',
            defaultValue: true,
          ),
          CheckboxSettingsTile(
            settingKey: Constants.loadUncachedLibraryOnStart,
            title: 'Bypass cache on initial startup',
            defaultValue: true,
          ),
          ExpandableSettingsTile(
            title: "Icons",
            subtitle: "Reorder and disable icons from the top bar",
            children: [
              MultiValueChangeObserver(
                cacheKeysWithDefaultValues: LibrarySettingsTile.valueMaps,
                builder: (context, values) {
                  Map mappedValues = jsonDecode(
                    values[Constants.libraryIconsEnabled],
                  );
                  List valuesOrder = jsonDecode(
                    values[Constants.libraryIconsOrdering],
                  );
                  return SettingsContainer(
                    children: [
                      ReorderableListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          for (final key in valuesOrder)
                            ListTile(
                              key: Key("$key"),
                              title: Text(key),
                              leading: LibraryIcons.fromString(key).icon,
                              trailing: Checkbox(
                                value: mappedValues[key],
                                onChanged: (value) async {
                                  mappedValues[key] = !mappedValues[key]!;
                                  await Settings.setValue<String>(
                                    Constants.libraryIconsEnabled,
                                    jsonEncode(mappedValues),
                                    notify: true,
                                  );
                                },
                              ),
                            ),
                        ],
                        onReorder: (int oldIndex, int newIndex) async {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final String item = valuesOrder.removeAt(oldIndex);
                          valuesOrder.insert(newIndex, item);
                          await Settings.setValue<String>(
                            Constants.libraryIconsOrdering,
                            jsonEncode(valuesOrder),
                            notify: true,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum LibraryIcons {
  jobs,
  reload,
  search,
  sort,
  filter,
  blur;

  factory LibraryIcons.fromString(String value) {
    switch (value) {
      case "Jobs":
        return LibraryIcons.jobs;
      case "Reload":
        return LibraryIcons.reload;
      case "Search":
        return LibraryIcons.search;
      case "Sort":
        return LibraryIcons.sort;
      case "Filter":
        return LibraryIcons.filter;
      case "Blur":
        return LibraryIcons.blur;
      default:
        throw Exception("Unrecognised value: $value");
    }
  }
}

extension LibraryIconsData on LibraryIcons {
  String get name {
    switch (this) {
      case LibraryIcons.jobs:
        return "Jobs";
      case LibraryIcons.reload:
        return "Reload";
      case LibraryIcons.search:
        return "Search";
      case LibraryIcons.sort:
        return "Sort";
      case LibraryIcons.filter:
        return "Filter";
      case LibraryIcons.blur:
        return "Blur";
    }
  }

  Icon get icon {
    switch (this) {
      case LibraryIcons.jobs:
        return Icon(Icons.work);
      case LibraryIcons.reload:
        return Icon(Icons.refresh);
      case LibraryIcons.search:
        return Icon(Icons.search);
      case LibraryIcons.sort:
        return Icon(Icons.sort);
      case LibraryIcons.filter:
        return Icon(Icons.filter_list);
      case LibraryIcons.blur:
        return Icon(Icons.visibility);
    }
  }
}
