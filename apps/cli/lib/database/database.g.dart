// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class DartAnalyzerCache extends Table
    with TableInfo<DartAnalyzerCache, DartAnalyzerCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DartAnalyzerCache(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> entryKey = GeneratedColumn<String>(
      'entry_key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<Uint8List> content = GeneratedColumn<Uint8List>(
      'content', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [entryKey, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dart_analyzer_cache';
  @override
  Set<GeneratedColumn> get $primaryKey => {entryKey};
  @override
  DartAnalyzerCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DartAnalyzerCacheData(
      entryKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entry_key'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}content']),
    );
  }

  @override
  DartAnalyzerCache createAlias(String alias) {
    return DartAnalyzerCache(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DartAnalyzerCacheData extends DataClass
    implements Insertable<DartAnalyzerCacheData> {
  /// The entry's key in the cache.
  final String entryKey;

  /// The content of the entry.
  final Uint8List? content;
  const DartAnalyzerCacheData({required this.entryKey, this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entry_key'] = Variable<String>(entryKey);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<Uint8List>(content);
    }
    return map;
  }

  factory DartAnalyzerCacheData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DartAnalyzerCacheData(
      entryKey: serializer.fromJson<String>(json['entry_key']),
      content: serializer.fromJson<Uint8List?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entry_key': serializer.toJson<String>(entryKey),
      'content': serializer.toJson<Uint8List?>(content),
    };
  }

  DartAnalyzerCacheData copyWith(
          {String? entryKey,
          Value<Uint8List?> content = const Value.absent()}) =>
      DartAnalyzerCacheData(
        entryKey: entryKey ?? this.entryKey,
        content: content.present ? content.value : this.content,
      );
  DartAnalyzerCacheData copyWithCompanion(DartAnalyzerCacheCompanion data) {
    return DartAnalyzerCacheData(
      entryKey: data.entryKey.present ? data.entryKey.value : this.entryKey,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DartAnalyzerCacheData(')
          ..write('entryKey: $entryKey, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(entryKey, $driftBlobEquality.hash(content));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DartAnalyzerCacheData &&
          other.entryKey == this.entryKey &&
          $driftBlobEquality.equals(other.content, this.content));
}

class DartAnalyzerCacheCompanion
    extends UpdateCompanion<DartAnalyzerCacheData> {
  final Value<String> entryKey;
  final Value<Uint8List?> content;
  final Value<int> rowid;
  const DartAnalyzerCacheCompanion({
    this.entryKey = const Value.absent(),
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DartAnalyzerCacheCompanion.insert({
    required String entryKey,
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : entryKey = Value(entryKey);
  static Insertable<DartAnalyzerCacheData> custom({
    Expression<String>? entryKey,
    Expression<Uint8List>? content,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (entryKey != null) 'entry_key': entryKey,
      if (content != null) 'content': content,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DartAnalyzerCacheCompanion copyWith(
      {Value<String>? entryKey,
      Value<Uint8List?>? content,
      Value<int>? rowid}) {
    return DartAnalyzerCacheCompanion(
      entryKey: entryKey ?? this.entryKey,
      content: content ?? this.content,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryKey.present) {
      map['entry_key'] = Variable<String>(entryKey.value);
    }
    if (content.present) {
      map['content'] = Variable<Uint8List>(content.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DartAnalyzerCacheCompanion(')
          ..write('entryKey: $entryKey, ')
          ..write('content: $content, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CelestDatabase extends GeneratedDatabase {
  _$CelestDatabase(QueryExecutor e) : super(e);
  $CelestDatabaseManager get managers => $CelestDatabaseManager(this);
  late final DartAnalyzerCache dartAnalyzerCache = DartAnalyzerCache(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dartAnalyzerCache];
}

typedef $DartAnalyzerCacheCreateCompanionBuilder = DartAnalyzerCacheCompanion
    Function({
  required String entryKey,
  Value<Uint8List?> content,
  Value<int> rowid,
});
typedef $DartAnalyzerCacheUpdateCompanionBuilder = DartAnalyzerCacheCompanion
    Function({
  Value<String> entryKey,
  Value<Uint8List?> content,
  Value<int> rowid,
});

class $DartAnalyzerCacheFilterComposer
    extends FilterComposer<_$CelestDatabase, DartAnalyzerCache> {
  $DartAnalyzerCacheFilterComposer(super.$state);
  ColumnFilters<String> get entryKey => $state.composableBuilder(
      column: $state.table.entryKey,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $DartAnalyzerCacheOrderingComposer
    extends OrderingComposer<_$CelestDatabase, DartAnalyzerCache> {
  $DartAnalyzerCacheOrderingComposer(super.$state);
  ColumnOrderings<String> get entryKey => $state.composableBuilder(
      column: $state.table.entryKey,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $DartAnalyzerCacheTableManager extends RootTableManager<
    _$CelestDatabase,
    DartAnalyzerCache,
    DartAnalyzerCacheData,
    $DartAnalyzerCacheFilterComposer,
    $DartAnalyzerCacheOrderingComposer,
    $DartAnalyzerCacheCreateCompanionBuilder,
    $DartAnalyzerCacheUpdateCompanionBuilder,
    (
      DartAnalyzerCacheData,
      BaseReferences<_$CelestDatabase, DartAnalyzerCache, DartAnalyzerCacheData>
    ),
    DartAnalyzerCacheData,
    PrefetchHooks Function()> {
  $DartAnalyzerCacheTableManager(_$CelestDatabase db, DartAnalyzerCache table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $DartAnalyzerCacheFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $DartAnalyzerCacheOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> entryKey = const Value.absent(),
            Value<Uint8List?> content = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DartAnalyzerCacheCompanion(
            entryKey: entryKey,
            content: content,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String entryKey,
            Value<Uint8List?> content = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DartAnalyzerCacheCompanion.insert(
            entryKey: entryKey,
            content: content,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $DartAnalyzerCacheProcessedTableManager = ProcessedTableManager<
    _$CelestDatabase,
    DartAnalyzerCache,
    DartAnalyzerCacheData,
    $DartAnalyzerCacheFilterComposer,
    $DartAnalyzerCacheOrderingComposer,
    $DartAnalyzerCacheCreateCompanionBuilder,
    $DartAnalyzerCacheUpdateCompanionBuilder,
    (
      DartAnalyzerCacheData,
      BaseReferences<_$CelestDatabase, DartAnalyzerCache, DartAnalyzerCacheData>
    ),
    DartAnalyzerCacheData,
    PrefetchHooks Function()>;

class $CelestDatabaseManager {
  final _$CelestDatabase _db;
  $CelestDatabaseManager(this._db);
  $DartAnalyzerCacheTableManager get dartAnalyzerCache =>
      $DartAnalyzerCacheTableManager(_db, _db.dartAnalyzerCache);
}
