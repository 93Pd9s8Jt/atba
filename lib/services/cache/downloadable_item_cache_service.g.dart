// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloadable_item_cache_service.dart';

// ignore_for_file: type=lint
class $DownloadableItemCacheTable extends DownloadableItemCache
    with TableInfo<$DownloadableItemCacheTable, DownloadableItemEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadableItemCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _itemTypeMeta = const VerificationMeta(
    'itemType',
  );
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
    'item_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemJsonMeta = const VerificationMeta(
    'itemJson',
  );
  @override
  late final GeneratedColumn<String> itemJson = GeneratedColumn<String>(
    'item_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemId,
    itemType,
    itemJson,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'downloadable_item_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<DownloadableItemEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_type')) {
      context.handle(
        _itemTypeMeta,
        itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('item_json')) {
      context.handle(
        _itemJsonMeta,
        itemJson.isAcceptableOrUnknown(data['item_json']!, _itemJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_itemJsonMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DownloadableItemEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DownloadableItemEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      )!,
      itemType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_type'],
      )!,
      itemJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_json'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
    );
  }

  @override
  $DownloadableItemCacheTable createAlias(String alias) {
    return $DownloadableItemCacheTable(attachedDatabase, alias);
  }
}

class DownloadableItemEntry extends DataClass
    implements Insertable<DownloadableItemEntry> {
  final int id;
  final int itemId;
  final String itemType;
  final String itemJson;
  final DateTime lastUpdated;
  const DownloadableItemEntry({
    required this.id,
    required this.itemId,
    required this.itemType,
    required this.itemJson,
    required this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['item_type'] = Variable<String>(itemType);
    map['item_json'] = Variable<String>(itemJson);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  DownloadableItemCacheCompanion toCompanion(bool nullToAbsent) {
    return DownloadableItemCacheCompanion(
      id: Value(id),
      itemId: Value(itemId),
      itemType: Value(itemType),
      itemJson: Value(itemJson),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory DownloadableItemEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadableItemEntry(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      itemType: serializer.fromJson<String>(json['itemType']),
      itemJson: serializer.fromJson<String>(json['itemJson']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'itemType': serializer.toJson<String>(itemType),
      'itemJson': serializer.toJson<String>(itemJson),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  DownloadableItemEntry copyWith({
    int? id,
    int? itemId,
    String? itemType,
    String? itemJson,
    DateTime? lastUpdated,
  }) => DownloadableItemEntry(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    itemType: itemType ?? this.itemType,
    itemJson: itemJson ?? this.itemJson,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  DownloadableItemEntry copyWithCompanion(DownloadableItemCacheCompanion data) {
    return DownloadableItemEntry(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      itemJson: data.itemJson.present ? data.itemJson.value : this.itemJson,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DownloadableItemEntry(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('itemJson: $itemJson, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, itemType, itemJson, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadableItemEntry &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.itemType == this.itemType &&
          other.itemJson == this.itemJson &&
          other.lastUpdated == this.lastUpdated);
}

class DownloadableItemCacheCompanion
    extends UpdateCompanion<DownloadableItemEntry> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> itemType;
  final Value<String> itemJson;
  final Value<DateTime> lastUpdated;
  const DownloadableItemCacheCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemType = const Value.absent(),
    this.itemJson = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  DownloadableItemCacheCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String itemType,
    required String itemJson,
    required DateTime lastUpdated,
  }) : itemId = Value(itemId),
       itemType = Value(itemType),
       itemJson = Value(itemJson),
       lastUpdated = Value(lastUpdated);
  static Insertable<DownloadableItemEntry> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? itemType,
    Expression<String>? itemJson,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (itemType != null) 'item_type': itemType,
      if (itemJson != null) 'item_json': itemJson,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  DownloadableItemCacheCompanion copyWith({
    Value<int>? id,
    Value<int>? itemId,
    Value<String>? itemType,
    Value<String>? itemJson,
    Value<DateTime>? lastUpdated,
  }) {
    return DownloadableItemCacheCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemType: itemType ?? this.itemType,
      itemJson: itemJson ?? this.itemJson,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (itemJson.present) {
      map['item_json'] = Variable<String>(itemJson.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadableItemCacheCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('itemJson: $itemJson, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DownloadableItemCacheTable downloadableItemCache =
      $DownloadableItemCacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [downloadableItemCache];
}

typedef $$DownloadableItemCacheTableCreateCompanionBuilder =
    DownloadableItemCacheCompanion Function({
      Value<int> id,
      required int itemId,
      required String itemType,
      required String itemJson,
      required DateTime lastUpdated,
    });
typedef $$DownloadableItemCacheTableUpdateCompanionBuilder =
    DownloadableItemCacheCompanion Function({
      Value<int> id,
      Value<int> itemId,
      Value<String> itemType,
      Value<String> itemJson,
      Value<DateTime> lastUpdated,
    });

class $$DownloadableItemCacheTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadableItemCacheTable> {
  $$DownloadableItemCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemJson => $composableBuilder(
    column: $table.itemJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DownloadableItemCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadableItemCacheTable> {
  $$DownloadableItemCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemJson => $composableBuilder(
    column: $table.itemJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DownloadableItemCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadableItemCacheTable> {
  $$DownloadableItemCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<String> get itemJson =>
      $composableBuilder(column: $table.itemJson, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );
}

class $$DownloadableItemCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DownloadableItemCacheTable,
          DownloadableItemEntry,
          $$DownloadableItemCacheTableFilterComposer,
          $$DownloadableItemCacheTableOrderingComposer,
          $$DownloadableItemCacheTableAnnotationComposer,
          $$DownloadableItemCacheTableCreateCompanionBuilder,
          $$DownloadableItemCacheTableUpdateCompanionBuilder,
          (
            DownloadableItemEntry,
            BaseReferences<
              _$AppDatabase,
              $DownloadableItemCacheTable,
              DownloadableItemEntry
            >,
          ),
          DownloadableItemEntry,
          PrefetchHooks Function()
        > {
  $$DownloadableItemCacheTableTableManager(
    _$AppDatabase db,
    $DownloadableItemCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadableItemCacheTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DownloadableItemCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DownloadableItemCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> itemId = const Value.absent(),
                Value<String> itemType = const Value.absent(),
                Value<String> itemJson = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
              }) => DownloadableItemCacheCompanion(
                id: id,
                itemId: itemId,
                itemType: itemType,
                itemJson: itemJson,
                lastUpdated: lastUpdated,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int itemId,
                required String itemType,
                required String itemJson,
                required DateTime lastUpdated,
              }) => DownloadableItemCacheCompanion.insert(
                id: id,
                itemId: itemId,
                itemType: itemType,
                itemJson: itemJson,
                lastUpdated: lastUpdated,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DownloadableItemCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DownloadableItemCacheTable,
      DownloadableItemEntry,
      $$DownloadableItemCacheTableFilterComposer,
      $$DownloadableItemCacheTableOrderingComposer,
      $$DownloadableItemCacheTableAnnotationComposer,
      $$DownloadableItemCacheTableCreateCompanionBuilder,
      $$DownloadableItemCacheTableUpdateCompanionBuilder,
      (
        DownloadableItemEntry,
        BaseReferences<
          _$AppDatabase,
          $DownloadableItemCacheTable,
          DownloadableItemEntry
        >,
      ),
      DownloadableItemEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DownloadableItemCacheTableTableManager get downloadableItemCache =>
      $$DownloadableItemCacheTableTableManager(_db, _db.downloadableItemCache);
}
