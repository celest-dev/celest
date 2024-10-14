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

class VersionInfo extends Table with TableInfo<VersionInfo, VersionInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VersionInfo(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> celest = GeneratedColumn<String>(
      'celest', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> dart = GeneratedColumn<String>(
      'dart', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> flutter = GeneratedColumn<String>(
      'flutter', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [celest, dart, flutter];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'version_info';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  VersionInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VersionInfoData(
      celest: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}celest'])!,
      dart: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dart'])!,
      flutter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flutter']),
    );
  }

  @override
  VersionInfo createAlias(String alias) {
    return VersionInfo(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class VersionInfoData extends DataClass implements Insertable<VersionInfoData> {
  /// The version of the Celest CLI.
  final String celest;

  /// The version of the Dart SDK.
  final String dart;

  /// The version of the Flutter SDK.
  final String? flutter;
  const VersionInfoData(
      {required this.celest, required this.dart, this.flutter});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['celest'] = Variable<String>(celest);
    map['dart'] = Variable<String>(dart);
    if (!nullToAbsent || flutter != null) {
      map['flutter'] = Variable<String>(flutter);
    }
    return map;
  }

  factory VersionInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VersionInfoData(
      celest: serializer.fromJson<String>(json['celest']),
      dart: serializer.fromJson<String>(json['dart']),
      flutter: serializer.fromJson<String?>(json['flutter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'celest': serializer.toJson<String>(celest),
      'dart': serializer.toJson<String>(dart),
      'flutter': serializer.toJson<String?>(flutter),
    };
  }

  VersionInfoData copyWith(
          {String? celest,
          String? dart,
          Value<String?> flutter = const Value.absent()}) =>
      VersionInfoData(
        celest: celest ?? this.celest,
        dart: dart ?? this.dart,
        flutter: flutter.present ? flutter.value : this.flutter,
      );
  VersionInfoData copyWithCompanion(VersionInfoCompanion data) {
    return VersionInfoData(
      celest: data.celest.present ? data.celest.value : this.celest,
      dart: data.dart.present ? data.dart.value : this.dart,
      flutter: data.flutter.present ? data.flutter.value : this.flutter,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VersionInfoData(')
          ..write('celest: $celest, ')
          ..write('dart: $dart, ')
          ..write('flutter: $flutter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(celest, dart, flutter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VersionInfoData &&
          other.celest == this.celest &&
          other.dart == this.dart &&
          other.flutter == this.flutter);
}

class VersionInfoCompanion extends UpdateCompanion<VersionInfoData> {
  final Value<String> celest;
  final Value<String> dart;
  final Value<String?> flutter;
  final Value<int> rowid;
  const VersionInfoCompanion({
    this.celest = const Value.absent(),
    this.dart = const Value.absent(),
    this.flutter = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VersionInfoCompanion.insert({
    required String celest,
    required String dart,
    this.flutter = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : celest = Value(celest),
        dart = Value(dart);
  static Insertable<VersionInfoData> custom({
    Expression<String>? celest,
    Expression<String>? dart,
    Expression<String>? flutter,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (celest != null) 'celest': celest,
      if (dart != null) 'dart': dart,
      if (flutter != null) 'flutter': flutter,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VersionInfoCompanion copyWith(
      {Value<String>? celest,
      Value<String>? dart,
      Value<String?>? flutter,
      Value<int>? rowid}) {
    return VersionInfoCompanion(
      celest: celest ?? this.celest,
      dart: dart ?? this.dart,
      flutter: flutter ?? this.flutter,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (celest.present) {
      map['celest'] = Variable<String>(celest.value);
    }
    if (dart.present) {
      map['dart'] = Variable<String>(dart.value);
    }
    if (flutter.present) {
      map['flutter'] = Variable<String>(flutter.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VersionInfoCompanion(')
          ..write('celest: $celest, ')
          ..write('dart: $dart, ')
          ..write('flutter: $flutter, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheDatabase extends GeneratedDatabase {
  _$CacheDatabase(QueryExecutor e) : super(e);
  $CacheDatabaseManager get managers => $CacheDatabaseManager(this);
  late final AnalyzerByteStore analyzerByteStore = AnalyzerByteStore(this);
  late final VersionInfo versionInfo = VersionInfo(this);
  Selectable<VersionInfoData> getVersionInfo() {
    return customSelect('SELECT * FROM version_info WHERE "rowid" = 1 LIMIT 1',
        variables: [],
        readsFrom: {
          versionInfo,
        }).asyncMap(versionInfo.mapFromRow);
  }

  Future<int> setVersionInfo(
      {required String celest, required String dart, String? flutter}) {
    return customInsert(
      'INSERT INTO version_info (celest, dart, flutter) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(celest),
        Variable<String>(dart),
        Variable<String>(flutter)
      ],
      updates: {versionInfo},
    );
  }

  Future<int> updateVersionInfo(
      {required String celest, required String dart, String? flutter}) {
    return customUpdate(
      'UPDATE version_info SET celest = ?1, dart = ?2, flutter = ?3 WHERE "rowid" = 1',
      variables: [
        Variable<String>(celest),
        Variable<String>(dart),
        Variable<String>(flutter)
      ],
      updates: {versionInfo},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [analyzerByteStore, versionInfo];
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
    extends Composer<_$CacheDatabase, AnalyzerByteStore> {
  $AnalyzerByteStoreFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cacheKey => $composableBuilder(
      column: $table.cacheKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));
}

class $AnalyzerByteStoreOrderingComposer
    extends Composer<_$CacheDatabase, AnalyzerByteStore> {
  $AnalyzerByteStoreOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cacheKey => $composableBuilder(
      column: $table.cacheKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));
}

class $AnalyzerByteStoreAnnotationComposer
    extends Composer<_$CacheDatabase, AnalyzerByteStore> {
  $AnalyzerByteStoreAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<Uint8List> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $AnalyzerByteStoreTableManager extends RootTableManager<
    _$CacheDatabase,
    AnalyzerByteStore,
    AnalyzerByteStoreData,
    $AnalyzerByteStoreFilterComposer,
    $AnalyzerByteStoreOrderingComposer,
    $AnalyzerByteStoreAnnotationComposer,
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
          createFilteringComposer: () =>
              $AnalyzerByteStoreFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AnalyzerByteStoreOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AnalyzerByteStoreAnnotationComposer($db: db, $table: table),
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
    $AnalyzerByteStoreAnnotationComposer,
    $AnalyzerByteStoreCreateCompanionBuilder,
    $AnalyzerByteStoreUpdateCompanionBuilder,
    (
      AnalyzerByteStoreData,
      BaseReferences<_$CacheDatabase, AnalyzerByteStore, AnalyzerByteStoreData>
    ),
    AnalyzerByteStoreData,
    PrefetchHooks Function()>;
typedef $VersionInfoCreateCompanionBuilder = VersionInfoCompanion Function({
  required String celest,
  required String dart,
  Value<String?> flutter,
  Value<int> rowid,
});
typedef $VersionInfoUpdateCompanionBuilder = VersionInfoCompanion Function({
  Value<String> celest,
  Value<String> dart,
  Value<String?> flutter,
  Value<int> rowid,
});

class $VersionInfoFilterComposer
    extends Composer<_$CacheDatabase, VersionInfo> {
  $VersionInfoFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get celest => $composableBuilder(
      column: $table.celest, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dart => $composableBuilder(
      column: $table.dart, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get flutter => $composableBuilder(
      column: $table.flutter, builder: (column) => ColumnFilters(column));
}

class $VersionInfoOrderingComposer
    extends Composer<_$CacheDatabase, VersionInfo> {
  $VersionInfoOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get celest => $composableBuilder(
      column: $table.celest, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dart => $composableBuilder(
      column: $table.dart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get flutter => $composableBuilder(
      column: $table.flutter, builder: (column) => ColumnOrderings(column));
}

class $VersionInfoAnnotationComposer
    extends Composer<_$CacheDatabase, VersionInfo> {
  $VersionInfoAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get celest =>
      $composableBuilder(column: $table.celest, builder: (column) => column);

  GeneratedColumn<String> get dart =>
      $composableBuilder(column: $table.dart, builder: (column) => column);

  GeneratedColumn<String> get flutter =>
      $composableBuilder(column: $table.flutter, builder: (column) => column);
}

class $VersionInfoTableManager extends RootTableManager<
    _$CacheDatabase,
    VersionInfo,
    VersionInfoData,
    $VersionInfoFilterComposer,
    $VersionInfoOrderingComposer,
    $VersionInfoAnnotationComposer,
    $VersionInfoCreateCompanionBuilder,
    $VersionInfoUpdateCompanionBuilder,
    (
      VersionInfoData,
      BaseReferences<_$CacheDatabase, VersionInfo, VersionInfoData>
    ),
    VersionInfoData,
    PrefetchHooks Function()> {
  $VersionInfoTableManager(_$CacheDatabase db, VersionInfo table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $VersionInfoFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $VersionInfoOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $VersionInfoAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> celest = const Value.absent(),
            Value<String> dart = const Value.absent(),
            Value<String?> flutter = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VersionInfoCompanion(
            celest: celest,
            dart: dart,
            flutter: flutter,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String celest,
            required String dart,
            Value<String?> flutter = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VersionInfoCompanion.insert(
            celest: celest,
            dart: dart,
            flutter: flutter,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $VersionInfoProcessedTableManager = ProcessedTableManager<
    _$CacheDatabase,
    VersionInfo,
    VersionInfoData,
    $VersionInfoFilterComposer,
    $VersionInfoOrderingComposer,
    $VersionInfoAnnotationComposer,
    $VersionInfoCreateCompanionBuilder,
    $VersionInfoUpdateCompanionBuilder,
    (
      VersionInfoData,
      BaseReferences<_$CacheDatabase, VersionInfo, VersionInfoData>
    ),
    VersionInfoData,
    PrefetchHooks Function()>;

class $CacheDatabaseManager {
  final _$CacheDatabase _db;
  $CacheDatabaseManager(this._db);
  $AnalyzerByteStoreTableManager get analyzerByteStore =>
      $AnalyzerByteStoreTableManager(_db, _db.analyzerByteStore);
  $VersionInfoTableManager get versionInfo =>
      $VersionInfoTableManager(_db, _db.versionInfo);
}
