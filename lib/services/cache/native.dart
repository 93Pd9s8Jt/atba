import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

Future<File> get databaseFile async {
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/cache.db');
}

DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      final dbFolder = await getApplicationCacheDirectory();
      final cachebase = p.join(dbFolder.path, 'torbox_cache', 'cache-db.sqlite');

      // We can't access /tmp on Android, which sqlite3 would try by default.
      // Explicitly tell it about the correct temporary directory.
      sqlite3.tempDirectory = cachebase;
    }

    return NativeDatabase.createBackgroundConnection(
      await databaseFile,
    );
  }));
}
