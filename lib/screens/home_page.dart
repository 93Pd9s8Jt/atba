import 'dart:async' show StreamSubscription;
import 'dart:io';

import 'package:atba/models/widgets/multi_value_change_observer.dart';
import 'package:atba/services/torbox_service.dart' show TorboxAPI;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart'
    show ConversionUtils;
import 'package:provider/provider.dart';
import 'package:listen_sharing_intent/listen_sharing_intent.dart';

import 'package:atba/screens/library_page.dart';
import 'package:atba/screens/watch_page.dart';
import 'package:atba/screens/settings/settings_page.dart';
import 'package:atba/config/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiValueChangeObserver(
      cacheKeysWithDefaultValues: {
        Constants.useMaterial3: true,
        Constants.useTorboxFontFamily: false,
        Constants.theme: "system",
        Constants.useCustomColorTheme: false,
        Constants.colorTheme: ConversionUtils.stringFromColor(
          Color.fromRGBO(0, 246, 33, 1),
        ),
      },
      builder: (context, values) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ColorScheme lightColorScheme;
            ColorScheme darkColorScheme;

            if (values[Constants.useCustomColorTheme]) {
              lightColorScheme = ColorScheme.fromSeed(
                seedColor: ConversionUtils.colorFromString(
                  values[Constants.colorTheme],
                ),
                brightness: Brightness.light,
              );
              darkColorScheme = ColorScheme.fromSeed(
                seedColor: ConversionUtils.colorFromString(
                  values[Constants.colorTheme],
                ),
                brightness: Brightness.dark,
              );
            } else if (lightDynamic != null && darkDynamic != null) {
              lightColorScheme = lightDynamic;
              darkColorScheme = darkDynamic;
            } else {
              lightColorScheme = ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(0, 246, 33, 1),
              );
              darkColorScheme = ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(0, 246, 33, 1),
                brightness: Brightness.dark,
              );
            }

            return MaterialApp(
              title: 'TorBox',
              theme: ThemeData(
                colorScheme: lightColorScheme,
                useMaterial3: values[Constants.useMaterial3],
                fontFamily: (values[Constants.useTorboxFontFamily])
                    ? 'torbox-dotted-all'
                    : null,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: values[Constants.useMaterial3],
                fontFamily: (values[Constants.useTorboxFontFamily])
                    ? 'torbox-dotted-all'
                    : null,
              ),
              themeMode:
                  ThemeMode.values[[
                    "system",
                    "light",
                    "dark",
                  ].indexOf(values[Constants.theme])],
              home: const MyHomePage(),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  StreamSubscription<Uri>? _linkSubscription;
  StreamSubscription? _intentSubscription;

  @override
  void initState() {
    super.initState();

    initDeepLinks();
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      // Only initialize sharing intent on mobile platforms
      initHandleIntent();
    }
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    _intentSubscription?.cancel();
    super.dispose();
  }

  Future<void> handleTorrentFiles(List<SharedMediaFile> value) async {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);
    for (final file in value) {
      if (file.type == SharedMediaType.file) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Adding torrent from file: ${file.path}')),
        );
        final platformFile = PlatformFile(
          name: file.path.split(Platform.pathSeparator).last,
          path: file.path,
          size: await File(file.path).length(),
          bytes: await File(file.path).readAsBytes(),
        );
        final response = await apiService.createTorrent(
          dotTorrentFile: platformFile,
        );
        if (response.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Torrent added successfully!')),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(response.detailOrUnknown)));
        }
      } else if (file.type == SharedMediaType.text) {
        final uri = Uri.tryParse(file.path);
        if (uri == null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Invalid link: ${file.path}')));
          continue;
        }
        // Handle text sharing (for links)
        if (uri.scheme == "magnet") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Adding torrent from link: ${file.path}')),
          );
          final response = await apiService.createTorrent(
            magnetLink: file.path,
          );
          if (response.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Torrent added successfully!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to add torrent: ${response.error}'),
              ),
            );
          }
        } else {
          // add as web download
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Adding download from link: ${file.path}')),
          );
          final response = await apiService.createWebDownload(uri.toString());
          if (response.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Download added successfully!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to add download: ${response.error}'),
              ),
            );
          }
        }
      }
    }
  }

  Future<void> initHandleIntent() async {
    _intentSubscription = ReceiveSharingIntent.instance.getMediaStream().listen(
      (value) async {
        await handleTorrentFiles(value);
      },
      onError: (err) {
        print("getIntentDataStream error: $err");
      },
    );

    // Get the media sharing coming from outside the app while the app is closed (e.g. open torrent file in file app)
    ReceiveSharingIntent.instance.getInitialMedia().then((value) async {
      if (value.isEmpty) return;
      await handleTorrentFiles(value);
      // Tell the library that we are done processing the intent.
      ReceiveSharingIntent.instance.reset();
    });
  }

  Future<void> initDeepLinks() async {
    // Handle links
    _linkSubscription = AppLinks().uriLinkStream.listen((uri) async {
      if (uri.scheme != "magnet") {
        return; // this will also catch opening files, but not sharing files, so we only use it for links
      }
      final apiService = Provider.of<TorboxAPI>(context, listen: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Adding torrent from link: ${uri.toString()}')),
      );
      final response = await apiService.createTorrent(
        magnetLink: uri.toString(),
      );
      if (response.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Torrent added successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add torrent: ${response.error}')),
        );
      }
    });
  }

  static final List<Widget> _pages = <Widget>[
    LibraryPage(),
    WatchPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: 'Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Watch'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'More'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        backgroundColor: Theme.of(context).colorScheme.surface,
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() => runApp(const HomeScreen());
