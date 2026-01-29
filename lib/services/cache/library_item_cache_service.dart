import 'dart:convert';
import 'package:atba/models/library_items/library_item.dart';
import 'package:atba/models/library_items/queued_torrent.dart';
import 'package:atba/models/library_items/torrent.dart';
import 'package:atba/models/library_items/usenet.dart';
import 'package:atba/models/library_items/webdownload.dart';
import 'package:drift/drift.dart';

import 'connection.dart';

part 'library_item_cache_service.g.dart';

@DataClassName('LibraryItemEntry')
class LibraryItemCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().unique()();
  TextColumn get itemType => text()();
  TextColumn get itemJson => text()();
  DateTimeColumn get lastUpdated => dateTime()();
}

@DriftDatabase(tables: [LibraryItemCache])
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal() : super(connect());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.deleteTable('downloadable_item_cache');
          await m.createTable(libraryItemCache);
        }
      },
    );
  }
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationCacheDirectory();
//     final file = File(p.join(dbFolder.path, 'torbox_cache', 'cache-db.sqlite'));
//     return NativeDatabase(file);
//   });
// }

class LibraryItemCacheService {
  late AppDatabase _db;

  LibraryItemCacheService() {
    _db = AppDatabase();
  }

  Future<void> saveItems(List<LibraryItem> items) async {
    await _db.batch((batch) {
      for (var item in items) {
        final itemJson = jsonEncode(item.toJsonGenerated());
        final itemType = _getItemType(item);
        batch.insert(
          _db.libraryItemCache,
          LibraryItemCacheCompanion.insert(
            itemId: item.id,
            itemType: itemType,
            itemJson: itemJson,
            lastUpdated: DateTime.now(),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Future<List<LibraryItem>> getItems(List<int> ids) async {
    final query = _db.select(_db.libraryItemCache)
      ..where((tbl) => tbl.itemId.isIn(ids));
    final entries = await query.get();
    return entries
        .map((entry) => _deserializeItem(entry.itemJson, entry.itemType))
        .toList();
  }

  Future<List<LibraryItem>> getAllItems() async {
    final entries = await _db.select(_db.libraryItemCache).get();
    return entries
        .map((entry) => _deserializeItem(entry.itemJson, entry.itemType))
        .toList();
  }

  Future<void> deleteItems(List<int> ids) async {
    final query = _db.delete(_db.libraryItemCache)
      ..where((tbl) => tbl.itemId.isIn(ids));
    await query.go();
  }

  Future<void> deleteItemByType<T extends LibraryItem>() async {
    final query = _db.delete(_db.libraryItemCache)
      ..where((tbl) => tbl.itemType.equals(_getTypeString<T>()));
    await query.go();
  }

  Future<void> clearCache() async {
    await _db.delete(_db.libraryItemCache).go();
  }

  Future<bool> isNotEmpty() async {
    final countExp = _db.libraryItemCache.id.count();
    final query = _db.selectOnly(_db.libraryItemCache)..addColumns([countExp]);
    final result = await query.getSingle();
    final count = result.read(countExp) ?? 0;
    return count > 0;
  }

  String _getItemType(LibraryItem item) {
    if (item is Torrent) {
      return 'torrent';
    } else if (item is WebDownload) {
      return 'webdownload';
    } else if (item is Usenet) {
      return 'usenet';
    } else if (item is QueuedTorrent) {
      return 'queuedtorrent';
    }
    throw Exception('Unknown LibraryItem type');
  }

  String _getTypeString<T extends LibraryItem>() {
    if (T == Torrent) {
      return 'torrent';
    } else if (T == WebDownload) {
      return 'webdownload';
    } else if (T == Usenet) {
      return 'usenet';
    } else if (T == QueuedTorrent) {
      return 'queuedtorrent';
    }
    throw Exception('Unknown LibraryItem type');
  }

  LibraryItem _deserializeItem(String json, String type) {
    final Map<String, dynamic> itemJson = jsonDecode(json);
    switch (type) {
      case 'torrent':
        return Torrent.fromJsonGenerated(itemJson);
      case 'webdownload':
        return WebDownload.fromJsonGenerated(itemJson);
      case 'usenet':
        return Usenet.fromJsonGenerated(itemJson);
      case 'queuedtorrent':
        return QueuedTorrent.fromJsonGenerated(itemJson);
      default:
        throw Exception('Unknown LibraryItem type');
    }
  }
}
