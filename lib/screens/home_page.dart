import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import 'downloads_page.dart';
import 'watch_page.dart';
import 'settings_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
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
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system, // Use system theme (light or dark)
          home: const MyHomePage(),
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
  final _storage = const FlutterSecureStorage();

  


  static const List<Widget> _pages = <Widget>[
    DownloadsPage(),
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
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,        backgroundColor: Theme.of(context).colorScheme.surface,
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() => runApp( const HomeScreen());