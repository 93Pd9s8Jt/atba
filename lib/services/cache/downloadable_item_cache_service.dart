import 'dart:convert';
import 'package:atba/models/downloadable_item.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/usenet.dart';
import 'package:atba/models/webdownload.dart';
import 'package:drift/drift.dart';

import 'connection.dart';

part 'downloadable_item_cache_service.g.dart';

@DataClassName('DownloadableItemEntry')
class DownloadableItemCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().unique()();
  TextColumn get itemType => text()();
  TextColumn get itemJson => text()();
  DateTimeColumn get lastUpdated => dateTime()();
}

@DriftDatabase(tables: [DownloadableItemCache])
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal() : super(connect());

  @override
  int get schemaVersion => 1;
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationCacheDirectory();
//     final file = File(p.join(dbFolder.path, 'torbox_cache', 'cache-db.sqlite'));
//     return NativeDatabase(file);
//   });
// }

class DownloadableItemCacheService {
  late AppDatabase _db;

  DownloadableItemCacheService() {
    _db = AppDatabase();
  }

  Future<void> saveItems(List<DownloadableItem> items) async {
    await _db.batch((batch) {
      for (var item in items) {
        final itemJson = jsonEncode(item.toJsonGenerated());
        final itemType = _getItemType(item);
        batch.insert(
          _db.downloadableItemCache,
          DownloadableItemCacheCompanion.insert(
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

  Future<List<DownloadableItem>> getItems(List<int> ids) async {
    final query = _db.select(_db.downloadableItemCache)
      ..where((tbl) => tbl.itemId.isIn(ids));
    final entries = await query.get();
    return entries
        .map((entry) => _deserializeItem(entry.itemJson, entry.itemType))
        .toList();
  }

  Future<List<DownloadableItem>> getAllItems() async {
    final entries = await _db.select(_db.downloadableItemCache).get();
    return entries
        .map((entry) => _deserializeItem(entry.itemJson, entry.itemType))
        .toList();
  }

  Future<void> deleteItems(List<int> ids) async {
    final query = _db.delete(_db.downloadableItemCache)
      ..where((tbl) => tbl.itemId.isIn(ids));
    await query.go();
  }

  Future<void> deleteItemByType<T extends DownloadableItem>() async {
    final query = _db.delete(_db.downloadableItemCache)
      ..where((tbl) =>
          tbl.itemType.equals(_getTypeString<T>()));
    await query.go();
  }

  Future<void> clearCache() async {
    await _db.delete(_db.downloadableItemCache).go();
  }

  Future<bool> isNotEmpty() async {
    final countExp = _db.downloadableItemCache.id.count();
    final query = _db.selectOnly(_db.downloadableItemCache)
      ..addColumns([countExp]);
    final result = await query.getSingle();
    final count = result.read(countExp) ?? 0;
    return count > 0;
  }

  String _getItemType(DownloadableItem item) {
    if (item is Torrent) {
      return 'torrent';
    } else if (item is WebDownload) {
      return 'webdownload';
    } else if (item is Usenet) {
      return 'usenet';
    } else if (item is QueuedTorrent) {
      return 'queuedtorrent';
    }
    throw Exception('Unknown DownloadableItem type');
  }

  String _getTypeString<T extends DownloadableItem>() {
    if (T == Torrent) {
      return 'torrent';
    } else if (T == WebDownload) {
      return 'webdownload';
    } else if (T == Usenet) {
      return 'usenet';
    } else if (T == QueuedTorrent) {
      return 'queuedtorrent';
    }
    throw Exception('Unknown DownloadableItem type');
  }

  DownloadableItem _deserializeItem(String json, String type) {
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
        throw Exception('Unknown DownloadableItem type');
    }
  }
}
