import 'package:atba/services/update_service.dart';
import 'package:atba/models/downloadable_item.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'services/shared_prefs_service.dart';
import 'services/secure_storage_service.dart';
import 'services/torbox_service.dart';
import 'services/stremio_service.dart';
import 'services/torrentio_service.dart';

import 'package:dynamic_color/dynamic_color.dart';
import 'screens/setup/api_screen.dart';
import 'screens/home_page.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSettings();

  final sharedPrefsService = SharedPrefsService();
  await sharedPrefsService.init();

  final secureStorageService = SecureStorageService();

  final isFirstRun = sharedPrefsService.getString('isFirstRun') == null;

  final apiService = TorboxAPI(secureStorageService: secureStorageService);
  await apiService.init();

  final hasApiKey = apiService.apiKey != null;

  DownloadableItem.initApiService(apiService);
  final stremioService = StremioRequests();
  final torrentioService = TorrentioAPI(secureStorageService);

  FileDownloader().configureNotification(
    tapOpensFile: true,
    progressBar: true,
    running: TaskNotification('Downloading', '{progress} | {filename}'),
    complete: TaskNotification('Download finished', '{filename}'),
    error: TaskNotification("Error", "{filename}"),
    paused: TaskNotification("Paused", "{filename}"),
    canceled: TaskNotification("Canceled", "{filename}"),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPrefsService>.value(value: sharedPrefsService),
        Provider<SecureStorageService>.value(value: secureStorageService),
        Provider<TorboxAPI>.value(value: apiService),
        ProxyProvider<TorboxAPI, UpdateService>(
          update: (_, torboxApi, __) => UpdateService(torboxApi),
        ),
        ChangeNotifierProvider<StremioRequests>.value(value: stremioService),
        ChangeNotifierProvider<TorrentioAPI>.value(value: torrentioService),
        ChangeNotifierProvider<AppState>(
          create: (_) => AppState(
            sharedPrefsService: sharedPrefsService,
            secureStorageService: secureStorageService,
            apiService: apiService,
          )..initializeApp(),
        ),
      ],
      child: AtbaApp(isFirstRun: isFirstRun, hasApiKey: hasApiKey),
    ),
  );
}

Future<void> initSettings() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
}

class AtbaApp extends StatelessWidget {
  final bool isFirstRun;
  final bool hasApiKey;
  const AtbaApp({required this.isFirstRun, required this.hasApiKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        if (appState.isLoading) {
          return const MaterialApp(home: SplashScreen());
        }
        if (appState.hasError) {
          return const MaterialApp(home: ErrorScreen());
        }

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
              title: '',
              theme: ThemeData(
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: <TargetPlatform, PageTransitionsBuilder>{
                    // Set the predictive back transitions for Android.
                    TargetPlatform.android:
                        PredictiveBackPageTransitionsBuilder(),
                  },
                ),
                useMaterial3: true,
                colorScheme: lightColorScheme,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme,
              ),
              themeMode: ThemeMode.system,
              home: isFirstRun
                  ? (hasApiKey ? const HomeScreen() : ApiKeyScreen())
                  : const HomeScreen(),
            );
          },
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('An error occurred. Please restart the app.')),
    );
  }
}
