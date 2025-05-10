// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cli/src/database/cache/cache.drift.dart' as i1;
import 'dart:typed_data' as i2;
import 'package:drift/internal/modular.dart' as i3;

typedef $AnalyzerByteStoreCreateCompanionBuilder =
    i1.AnalyzerByteStoreCompanion Function({
      required String cacheKey,
      i0.Value<i2.Uint8List?> content,
      i0.Value<int> rowid,
    });
typedef $AnalyzerByteStoreUpdateCompanionBuilder =
    i1.AnalyzerByteStoreCompanion Function({
      i0.Value<String> cacheKey,
      i0.Value<i2.Uint8List?> content,
      i0.Value<int> rowid,
    });

class $AnalyzerByteStoreFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.AnalyzerByteStore> {
  $AnalyzerByteStoreFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<i2.Uint8List> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $AnalyzerByteStoreOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.AnalyzerByteStore> {
  $AnalyzerByteStoreOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<i2.Uint8List> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $AnalyzerByteStoreAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.AnalyzerByteStore> {
  $AnalyzerByteStoreAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  i0.GeneratedColumn<i2.Uint8List> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $AnalyzerByteStoreTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.AnalyzerByteStore,
          i1.AnalyzerByteStoreData,
          i1.$AnalyzerByteStoreFilterComposer,
          i1.$AnalyzerByteStoreOrderingComposer,
          i1.$AnalyzerByteStoreAnnotationComposer,
          $AnalyzerByteStoreCreateCompanionBuilder,
          $AnalyzerByteStoreUpdateCompanionBuilder,
          (
            i1.AnalyzerByteStoreData,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.AnalyzerByteStore,
              i1.AnalyzerByteStoreData
            >,
          ),
          i1.AnalyzerByteStoreData,
          i0.PrefetchHooks Function()
        > {
  $AnalyzerByteStoreTableManager(
    i0.GeneratedDatabase db,
    i1.AnalyzerByteStore table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$AnalyzerByteStoreFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  i1.$AnalyzerByteStoreOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$AnalyzerByteStoreAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> cacheKey = const i0.Value.absent(),
                i0.Value<i2.Uint8List?> content = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.AnalyzerByteStoreCompanion(
                cacheKey: cacheKey,
                content: content,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cacheKey,
                i0.Value<i2.Uint8List?> content = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.AnalyzerByteStoreCompanion.insert(
                cacheKey: cacheKey,
                content: content,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $AnalyzerByteStoreProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.AnalyzerByteStore,
      i1.AnalyzerByteStoreData,
      i1.$AnalyzerByteStoreFilterComposer,
      i1.$AnalyzerByteStoreOrderingComposer,
      i1.$AnalyzerByteStoreAnnotationComposer,
      $AnalyzerByteStoreCreateCompanionBuilder,
      $AnalyzerByteStoreUpdateCompanionBuilder,
      (
        i1.AnalyzerByteStoreData,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.AnalyzerByteStore,
          i1.AnalyzerByteStoreData
        >,
      ),
      i1.AnalyzerByteStoreData,
      i0.PrefetchHooks Function()
    >;
typedef $VersionInfoCreateCompanionBuilder =
    i1.VersionInfoCompanion Function({
      required String celest,
      required String dart,
      i0.Value<String?> flutter,
      i0.Value<int> rowid,
    });
typedef $VersionInfoUpdateCompanionBuilder =
    i1.VersionInfoCompanion Function({
      i0.Value<String> celest,
      i0.Value<String> dart,
      i0.Value<String?> flutter,
      i0.Value<int> rowid,
    });

class $VersionInfoFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.VersionInfo> {
  $VersionInfoFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get celest => $composableBuilder(
    column: $table.celest,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get dart => $composableBuilder(
    column: $table.dart,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get flutter => $composableBuilder(
    column: $table.flutter,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $VersionInfoOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.VersionInfo> {
  $VersionInfoOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get celest => $composableBuilder(
    column: $table.celest,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get dart => $composableBuilder(
    column: $table.dart,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get flutter => $composableBuilder(
    column: $table.flutter,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $VersionInfoAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.VersionInfo> {
  $VersionInfoAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get celest =>
      $composableBuilder(column: $table.celest, builder: (column) => column);

  i0.GeneratedColumn<String> get dart =>
      $composableBuilder(column: $table.dart, builder: (column) => column);

  i0.GeneratedColumn<String> get flutter =>
      $composableBuilder(column: $table.flutter, builder: (column) => column);
}

class $VersionInfoTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.VersionInfo,
          i1.VersionInfoData,
          i1.$VersionInfoFilterComposer,
          i1.$VersionInfoOrderingComposer,
          i1.$VersionInfoAnnotationComposer,
          $VersionInfoCreateCompanionBuilder,
          $VersionInfoUpdateCompanionBuilder,
          (
            i1.VersionInfoData,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.VersionInfo,
              i1.VersionInfoData
            >,
          ),
          i1.VersionInfoData,
          i0.PrefetchHooks Function()
        > {
  $VersionInfoTableManager(i0.GeneratedDatabase db, i1.VersionInfo table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$VersionInfoFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$VersionInfoOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$VersionInfoAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> celest = const i0.Value.absent(),
                i0.Value<String> dart = const i0.Value.absent(),
                i0.Value<String?> flutter = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.VersionInfoCompanion(
                celest: celest,
                dart: dart,
                flutter: flutter,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String celest,
                required String dart,
                i0.Value<String?> flutter = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.VersionInfoCompanion.insert(
                celest: celest,
                dart: dart,
                flutter: flutter,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $VersionInfoProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.VersionInfo,
      i1.VersionInfoData,
      i1.$VersionInfoFilterComposer,
      i1.$VersionInfoOrderingComposer,
      i1.$VersionInfoAnnotationComposer,
      $VersionInfoCreateCompanionBuilder,
      $VersionInfoUpdateCompanionBuilder,
      (
        i1.VersionInfoData,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.VersionInfo,
          i1.VersionInfoData
        >,
      ),
      i1.VersionInfoData,
      i0.PrefetchHooks Function()
    >;

class AnalyzerByteStore extends i0.Table
    with i0.TableInfo<AnalyzerByteStore, i1.AnalyzerByteStoreData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  AnalyzerByteStore(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> cacheKey = i0.GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final i0.GeneratedColumn<i2.Uint8List> content =
      i0.GeneratedColumn<i2.Uint8List>(
        'content',
        aliasedName,
        true,
        type: i0.DriftSqlType.blob,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  @override
  List<i0.GeneratedColumn> get $columns => [cacheKey, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'analyzer_byte_store';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  i1.AnalyzerByteStoreData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.AnalyzerByteStoreData(
      cacheKey:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}cache_key'],
          )!,
      content: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.blob,
        data['${effectivePrefix}content'],
      ),
    );
  }

  @override
  AnalyzerByteStore createAlias(String alias) {
    return AnalyzerByteStore(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AnalyzerByteStoreData extends i0.DataClass
    implements i0.Insertable<i1.AnalyzerByteStoreData> {
  /// The entry's key in the cache.
  final String cacheKey;

  /// The content of the entry.
  final i2.Uint8List? content;
  const AnalyzerByteStoreData({required this.cacheKey, this.content});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['cache_key'] = i0.Variable<String>(cacheKey);
    if (!nullToAbsent || content != null) {
      map['content'] = i0.Variable<i2.Uint8List>(content);
    }
    return map;
  }

  factory AnalyzerByteStoreData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return AnalyzerByteStoreData(
      cacheKey: serializer.fromJson<String>(json['cache_key']),
      content: serializer.fromJson<i2.Uint8List?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cache_key': serializer.toJson<String>(cacheKey),
      'content': serializer.toJson<i2.Uint8List?>(content),
    };
  }

  i1.AnalyzerByteStoreData copyWith({
    String? cacheKey,
    i0.Value<i2.Uint8List?> content = const i0.Value.absent(),
  }) => i1.AnalyzerByteStoreData(
    cacheKey: cacheKey ?? this.cacheKey,
    content: content.present ? content.value : this.content,
  );
  AnalyzerByteStoreData copyWithCompanion(i1.AnalyzerByteStoreCompanion data) {
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
  int get hashCode =>
      Object.hash(cacheKey, i0.$driftBlobEquality.hash(content));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.AnalyzerByteStoreData &&
          other.cacheKey == this.cacheKey &&
          i0.$driftBlobEquality.equals(other.content, this.content));
}

class AnalyzerByteStoreCompanion
    extends i0.UpdateCompanion<i1.AnalyzerByteStoreData> {
  final i0.Value<String> cacheKey;
  final i0.Value<i2.Uint8List?> content;
  final i0.Value<int> rowid;
  const AnalyzerByteStoreCompanion({
    this.cacheKey = const i0.Value.absent(),
    this.content = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  AnalyzerByteStoreCompanion.insert({
    required String cacheKey,
    this.content = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : cacheKey = i0.Value(cacheKey);
  static i0.Insertable<i1.AnalyzerByteStoreData> custom({
    i0.Expression<String>? cacheKey,
    i0.Expression<i2.Uint8List>? content,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (cacheKey != null) 'cache_key': cacheKey,
      if (content != null) 'content': content,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.AnalyzerByteStoreCompanion copyWith({
    i0.Value<String>? cacheKey,
    i0.Value<i2.Uint8List?>? content,
    i0.Value<int>? rowid,
  }) {
    return i1.AnalyzerByteStoreCompanion(
      cacheKey: cacheKey ?? this.cacheKey,
      content: content ?? this.content,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (cacheKey.present) {
      map['cache_key'] = i0.Variable<String>(cacheKey.value);
    }
    if (content.present) {
      map['content'] = i0.Variable<i2.Uint8List>(content.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
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

class VersionInfo extends i0.Table
    with i0.TableInfo<VersionInfo, i1.VersionInfoData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  VersionInfo(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> celest = i0.GeneratedColumn<String>(
    'celest',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumn<String> dart = i0.GeneratedColumn<String>(
    'dart',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumn<String> flutter = i0.GeneratedColumn<String>(
    'flutter',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [celest, dart, flutter];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'version_info';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => const {};
  @override
  i1.VersionInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.VersionInfoData(
      celest:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}celest'],
          )!,
      dart:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}dart'],
          )!,
      flutter: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}flutter'],
      ),
    );
  }

  @override
  VersionInfo createAlias(String alias) {
    return VersionInfo(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class VersionInfoData extends i0.DataClass
    implements i0.Insertable<i1.VersionInfoData> {
  /// The version of the Celest CLI.
  final String celest;

  /// The version of the Dart SDK.
  final String dart;

  /// The version of the Flutter SDK.
  final String? flutter;
  const VersionInfoData({
    required this.celest,
    required this.dart,
    this.flutter,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['celest'] = i0.Variable<String>(celest);
    map['dart'] = i0.Variable<String>(dart);
    if (!nullToAbsent || flutter != null) {
      map['flutter'] = i0.Variable<String>(flutter);
    }
    return map;
  }

  factory VersionInfoData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return VersionInfoData(
      celest: serializer.fromJson<String>(json['celest']),
      dart: serializer.fromJson<String>(json['dart']),
      flutter: serializer.fromJson<String?>(json['flutter']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'celest': serializer.toJson<String>(celest),
      'dart': serializer.toJson<String>(dart),
      'flutter': serializer.toJson<String?>(flutter),
    };
  }

  i1.VersionInfoData copyWith({
    String? celest,
    String? dart,
    i0.Value<String?> flutter = const i0.Value.absent(),
  }) => i1.VersionInfoData(
    celest: celest ?? this.celest,
    dart: dart ?? this.dart,
    flutter: flutter.present ? flutter.value : this.flutter,
  );
  VersionInfoData copyWithCompanion(i1.VersionInfoCompanion data) {
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
      (other is i1.VersionInfoData &&
          other.celest == this.celest &&
          other.dart == this.dart &&
          other.flutter == this.flutter);
}

class VersionInfoCompanion extends i0.UpdateCompanion<i1.VersionInfoData> {
  final i0.Value<String> celest;
  final i0.Value<String> dart;
  final i0.Value<String?> flutter;
  final i0.Value<int> rowid;
  const VersionInfoCompanion({
    this.celest = const i0.Value.absent(),
    this.dart = const i0.Value.absent(),
    this.flutter = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  VersionInfoCompanion.insert({
    required String celest,
    required String dart,
    this.flutter = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : celest = i0.Value(celest),
       dart = i0.Value(dart);
  static i0.Insertable<i1.VersionInfoData> custom({
    i0.Expression<String>? celest,
    i0.Expression<String>? dart,
    i0.Expression<String>? flutter,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (celest != null) 'celest': celest,
      if (dart != null) 'dart': dart,
      if (flutter != null) 'flutter': flutter,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.VersionInfoCompanion copyWith({
    i0.Value<String>? celest,
    i0.Value<String>? dart,
    i0.Value<String?>? flutter,
    i0.Value<int>? rowid,
  }) {
    return i1.VersionInfoCompanion(
      celest: celest ?? this.celest,
      dart: dart ?? this.dart,
      flutter: flutter ?? this.flutter,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (celest.present) {
      map['celest'] = i0.Variable<String>(celest.value);
    }
    if (dart.present) {
      map['dart'] = i0.Variable<String>(dart.value);
    }
    if (flutter.present) {
      map['flutter'] = i0.Variable<String>(flutter.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
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

class CacheDrift extends i3.ModularAccessor {
  CacheDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.VersionInfoData> getVersionInfo() {
    return customSelect(
      'SELECT * FROM version_info WHERE "rowid" = 1 LIMIT 1',
      variables: [],
      readsFrom: {versionInfo},
    ).asyncMap(versionInfo.mapFromRow);
  }

  Future<int> setVersionInfo({
    required String celest,
    required String dart,
    String? flutter,
  }) {
    return customInsert(
      'INSERT INTO version_info (celest, dart, flutter) VALUES (?1, ?2, ?3)',
      variables: [
        i0.Variable<String>(celest),
        i0.Variable<String>(dart),
        i0.Variable<String>(flutter),
      ],
      updates: {versionInfo},
    );
  }

  Future<int> updateVersionInfo({
    required String celest,
    required String dart,
    String? flutter,
  }) {
    return customUpdate(
      'UPDATE version_info SET celest = ?1, dart = ?2, flutter = ?3 WHERE "rowid" = 1',
      variables: [
        i0.Variable<String>(celest),
        i0.Variable<String>(dart),
        i0.Variable<String>(flutter),
      ],
      updates: {versionInfo},
      updateKind: i0.UpdateKind.update,
    );
  }

  i1.VersionInfo get versionInfo => i3.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.VersionInfo>('version_info');
}
