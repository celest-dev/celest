// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/meta.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;

typedef $CelestCloudAuthMetaCreateCompanionBuilder
    = i1.CelestCloudAuthMetaCompanion Function({
  i0.Value<int> schemaVersion,
});
typedef $CelestCloudAuthMetaUpdateCompanionBuilder
    = i1.CelestCloudAuthMetaCompanion Function({
  i0.Value<int> schemaVersion,
});

class $CelestCloudAuthMetaFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestCloudAuthMeta> {
  $CelestCloudAuthMetaFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get schemaVersion => $composableBuilder(
      column: $table.schemaVersion,
      builder: (column) => i0.ColumnFilters(column));
}

class $CelestCloudAuthMetaOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestCloudAuthMeta> {
  $CelestCloudAuthMetaOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get schemaVersion => $composableBuilder(
      column: $table.schemaVersion,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CelestCloudAuthMetaAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestCloudAuthMeta> {
  $CelestCloudAuthMetaAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get schemaVersion => $composableBuilder(
      column: $table.schemaVersion, builder: (column) => column);
}

class $CelestCloudAuthMetaTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CelestCloudAuthMeta,
    i1.CelestCloudAuthMetaData,
    i1.$CelestCloudAuthMetaFilterComposer,
    i1.$CelestCloudAuthMetaOrderingComposer,
    i1.$CelestCloudAuthMetaAnnotationComposer,
    $CelestCloudAuthMetaCreateCompanionBuilder,
    $CelestCloudAuthMetaUpdateCompanionBuilder,
    (
      i1.CelestCloudAuthMetaData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestCloudAuthMeta,
          i1.CelestCloudAuthMetaData>
    ),
    i1.CelestCloudAuthMetaData,
    i0.PrefetchHooks Function()> {
  $CelestCloudAuthMetaTableManager(
      i0.GeneratedDatabase db, i1.CelestCloudAuthMeta table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CelestCloudAuthMetaFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CelestCloudAuthMetaOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CelestCloudAuthMetaAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> schemaVersion = const i0.Value.absent(),
          }) =>
              i1.CelestCloudAuthMetaCompanion(
            schemaVersion: schemaVersion,
          ),
          createCompanionCallback: ({
            i0.Value<int> schemaVersion = const i0.Value.absent(),
          }) =>
              i1.CelestCloudAuthMetaCompanion.insert(
            schemaVersion: schemaVersion,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CelestCloudAuthMetaProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CelestCloudAuthMeta,
    i1.CelestCloudAuthMetaData,
    i1.$CelestCloudAuthMetaFilterComposer,
    i1.$CelestCloudAuthMetaOrderingComposer,
    i1.$CelestCloudAuthMetaAnnotationComposer,
    $CelestCloudAuthMetaCreateCompanionBuilder,
    $CelestCloudAuthMetaUpdateCompanionBuilder,
    (
      i1.CelestCloudAuthMetaData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestCloudAuthMeta,
          i1.CelestCloudAuthMetaData>
    ),
    i1.CelestCloudAuthMetaData,
    i0.PrefetchHooks Function()>;

class CelestCloudAuthMeta extends i0.Table
    with i0.TableInfo<CelestCloudAuthMeta, i1.CelestCloudAuthMetaData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestCloudAuthMeta(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<int> schemaVersion = i0.GeneratedColumn<int>(
      'schema_version', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  @override
  List<i0.GeneratedColumn> get $columns => [schemaVersion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = '_celest_cloud_auth_meta';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {schemaVersion};
  @override
  i1.CelestCloudAuthMetaData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CelestCloudAuthMetaData(
      schemaVersion: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}schema_version'])!,
    );
  }

  @override
  CelestCloudAuthMeta createAlias(String alias) {
    return CelestCloudAuthMeta(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CelestCloudAuthMetaData extends i0.DataClass
    implements i0.Insertable<i1.CelestCloudAuthMetaData> {
  /// The version of the schema.
  final int schemaVersion;
  const CelestCloudAuthMetaData({required this.schemaVersion});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['schema_version'] = i0.Variable<int>(schemaVersion);
    return map;
  }

  factory CelestCloudAuthMetaData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CelestCloudAuthMetaData(
      schemaVersion: serializer.fromJson<int>(json['schema_version']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'schema_version': serializer.toJson<int>(schemaVersion),
    };
  }

  i1.CelestCloudAuthMetaData copyWith({int? schemaVersion}) =>
      i1.CelestCloudAuthMetaData(
        schemaVersion: schemaVersion ?? this.schemaVersion,
      );
  CelestCloudAuthMetaData copyWithCompanion(
      i1.CelestCloudAuthMetaCompanion data) {
    return CelestCloudAuthMetaData(
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestCloudAuthMetaData(')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => schemaVersion.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CelestCloudAuthMetaData &&
          other.schemaVersion == this.schemaVersion);
}

class CelestCloudAuthMetaCompanion
    extends i0.UpdateCompanion<i1.CelestCloudAuthMetaData> {
  final i0.Value<int> schemaVersion;
  const CelestCloudAuthMetaCompanion({
    this.schemaVersion = const i0.Value.absent(),
  });
  CelestCloudAuthMetaCompanion.insert({
    this.schemaVersion = const i0.Value.absent(),
  });
  static i0.Insertable<i1.CelestCloudAuthMetaData> custom({
    i0.Expression<int>? schemaVersion,
  }) {
    return i0.RawValuesInsertable({
      if (schemaVersion != null) 'schema_version': schemaVersion,
    });
  }

  i1.CelestCloudAuthMetaCompanion copyWith({i0.Value<int>? schemaVersion}) {
    return i1.CelestCloudAuthMetaCompanion(
      schemaVersion: schemaVersion ?? this.schemaVersion,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (schemaVersion.present) {
      map['schema_version'] = i0.Variable<int>(schemaVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CelestCloudAuthMetaCompanion(')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }
}

class MetaDrift extends i2.ModularAccessor {
  MetaDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<int?> getSchemaVersion() {
    return customSelect(
        'SELECT max(schema_version) AS _c0 FROM _celest_cloud_auth_meta',
        variables: [],
        readsFrom: {
          celestCloudAuthMeta,
        }).map((i0.QueryRow row) => row.readNullable<int>('_c0'));
  }

  Future<int> setSchemaVersion({required int schemaVersion}) {
    return customInsert(
      'INSERT INTO _celest_cloud_auth_meta (schema_version) VALUES (?1) ON CONFLICT DO NOTHING',
      variables: [i0.Variable<int>(schemaVersion)],
      updates: {celestCloudAuthMeta},
    );
  }

  i1.CelestCloudAuthMeta get celestCloudAuthMeta =>
      i2.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CelestCloudAuthMeta>('_celest_cloud_auth_meta');
}
