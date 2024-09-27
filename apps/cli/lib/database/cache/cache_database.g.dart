// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_database.dart';

// ignore_for_file: type=lint
class AnalyzerByteStore extends Table
    with TableInfo<AnalyzerByteStore, AnalyzerByteStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AnalyzerByteStore(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
      'cache_key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<Uint8List> content = GeneratedColumn<Uint8List>(
      'content', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [cacheKey, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'analyzer_byte_store';
  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  AnalyzerByteStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnalyzerByteStoreData(
      cacheKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cache_key'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}content']),
    );
  }

  @override
  AnalyzerByteStore createAlias(String alias) {
    return AnalyzerByteStore(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AnalyzerByteStoreData extends DataClass
    implements Insertable<AnalyzerByteStoreData> {
  /// The entry's key in the cache.
  final String cacheKey;

  /// The content of the entry.
  final Uint8List? content;
  const AnalyzerByteStoreData({required this.cacheKey, this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cache_key'] = Variable<String>(cacheKey);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<Uint8List>(content);
    }
    return map;
  }

  factory AnalyzerByteStoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnalyzerByteStoreData(
      cacheKey: serializer.fromJson<String>(json['cache_key']),
      content: serializer.fromJson<Uint8List?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cache_key': serializer.toJson<String>(cacheKey),
      'content': serializer.toJson<Uint8List?>(content),
    };
  }

  AnalyzerByteStoreData copyWith(
          {String? cacheKey,
          Value<Uint8List?> content = const Value.absent()}) =>
      AnalyzerByteStoreData(
        cacheKey: cacheKey ?? this.cacheKey,
        content: content.present ? content.value : this.content,
      );
  AnalyzerByteStoreData copyWithCompanion(AnalyzerByteStoreCompanion data) {
    return AnalyzerByteStoreData(
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnalyzerByteStoreData(')
          ..write('cacheKey: $cacheKey, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cacheKey, $driftBlobEquality.hash(content));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnalyzerByteStoreData &&
          other.cacheKey == this.cacheKey &&
          $driftBlobEquality.equals(other.content, this.content));
}

class AnalyzerByteStoreCompanion
    extends UpdateCompanion<AnalyzerByteStoreData> {
  final Value<String> cacheKey;
  final Value<Uint8List?> content;
  final Value<int> rowid;
  const AnalyzerByteStoreCompanion({
    this.cacheKey = const Value.absent(),
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnalyzerByteStoreCompanion.insert({
    required String cacheKey,
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey);
  static Insertable<AnalyzerByteStoreData> custom({
    Expression<String>? cacheKey,
    Expression<Uint8List>? content,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cacheKey != null) 'cache_key': cacheKey,
      if (content != null) 'content': content,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnalyzerByteStoreCompanion copyWith(
      {Value<String>? cacheKey,
      Value<Uint8List?>? content,
      Value<int>? rowid}) {
    return AnalyzerByteStoreCompanion(
      cacheKey: cacheKey ?? this.cacheKey,
      content: content ?? this.content,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
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
    return (StringBuffer('AnalyzerByteStoreCompanion(')
          ..write('cacheKey: $cacheKey, ')
          ..write('content: $content, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheDatabase extends GeneratedDatabase {
  _$CacheDatabase(QueryExecutor e) : super(e);
  $CacheDatabaseManager get managers => $CacheDatabaseManager(this);
  late final AnalyzerByteStore analyzerByteStore = AnalyzerByteStore(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [analyzerByteStore];
}

typedef $AnalyzerByteStoreCreateCompanionBuilder = AnalyzerByteStoreCompanion
    Function({
  required String cacheKey,
  Value<Uint8List?> content,
  Value<int> rowid,
});
typedef $AnalyzerByteStoreUpdateCompanionBuilder = AnalyzerByteStoreCompanion
    Function({
  Value<String> cacheKey,
  Value<Uint8List?> content,
  Value<int> rowid,
});

class $AnalyzerByteStoreFilterComposer
    extends FilterComposer<_$CacheDatabase, AnalyzerByteStore> {
  $AnalyzerByteStoreFilterComposer(super.$state);
  ColumnFilters<String> get cacheKey => $state.composableBuilder(
      column: $state.table.cacheKey,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $AnalyzerByteStoreOrderingComposer
    extends OrderingComposer<_$CacheDatabase, AnalyzerByteStore> {
  $AnalyzerByteStoreOrderingComposer(super.$state);
  ColumnOrderings<String> get cacheKey => $state.composableBuilder(
      column: $state.table.cacheKey,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AnalyzerByteStoreTableManager extends RootTableManager<
    _$CacheDatabase,
    AnalyzerByteStore,
    AnalyzerByteStoreData,
    $AnalyzerByteStoreFilterComposer,
    $AnalyzerByteStoreOrderingComposer,
    $AnalyzerByteStoreCreateCompanionBuilder,
    $AnalyzerByteStoreUpdateCompanionBuilder,
    (
      AnalyzerByteStoreData,
      BaseReferences<_$CacheDatabase, AnalyzerByteStore, AnalyzerByteStoreData>
    ),
    AnalyzerByteStoreData,
    PrefetchHooks Function()> {
  $AnalyzerByteStoreTableManager(_$CacheDatabase db, AnalyzerByteStore table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $AnalyzerByteStoreFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $AnalyzerByteStoreOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> cacheKey = const Value.absent(),
            Value<Uint8List?> content = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnalyzerByteStoreCompanion(
            cacheKey: cacheKey,
            content: content,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String cacheKey,
            Value<Uint8List?> content = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnalyzerByteStoreCompanion.insert(
            cacheKey: cacheKey,
            content: content,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $AnalyzerByteStoreProcessedTableManager = ProcessedTableManager<
    _$CacheDatabase,
    AnalyzerByteStore,
    AnalyzerByteStoreData,
    $AnalyzerByteStoreFilterComposer,
    $AnalyzerByteStoreOrderingComposer,
    $AnalyzerByteStoreCreateCompanionBuilder,
    $AnalyzerByteStoreUpdateCompanionBuilder,
    (
      AnalyzerByteStoreData,
      BaseReferences<_$CacheDatabase, AnalyzerByteStore, AnalyzerByteStoreData>
    ),
    AnalyzerByteStoreData,
    PrefetchHooks Function()>;

class $CacheDatabaseManager {
  final _$CacheDatabase _db;
  $CacheDatabaseManager(this._db);
  $AnalyzerByteStoreTableManager get analyzerByteStore =>
      $AnalyzerByteStoreTableManager(_db, _db.analyzerByteStore);
}
