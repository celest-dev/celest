// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_meta.drift.dart'
    as i1;
import 'package:drift/internal/modular.dart' as i2;

typedef $CloudAuthMetaCreateCompanionBuilder = i1.CloudAuthMetaCompanion
    Function({
  i0.Value<int> schemaVersion,
});
typedef $CloudAuthMetaUpdateCompanionBuilder = i1.CloudAuthMetaCompanion
    Function({
  i0.Value<int> schemaVersion,
});

class $CloudAuthMetaFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthMeta> {
  $CloudAuthMetaFilterComposer({
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

class $CloudAuthMetaOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthMeta> {
  $CloudAuthMetaOrderingComposer({
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

class $CloudAuthMetaAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthMeta> {
  $CloudAuthMetaAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get schemaVersion => $composableBuilder(
      column: $table.schemaVersion, builder: (column) => column);
}

class $CloudAuthMetaTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CloudAuthMeta,
    i1.CloudAuthMetaData,
    i1.$CloudAuthMetaFilterComposer,
    i1.$CloudAuthMetaOrderingComposer,
    i1.$CloudAuthMetaAnnotationComposer,
    $CloudAuthMetaCreateCompanionBuilder,
    $CloudAuthMetaUpdateCompanionBuilder,
    (
      i1.CloudAuthMetaData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CloudAuthMeta,
          i1.CloudAuthMetaData>
    ),
    i1.CloudAuthMetaData,
    i0.PrefetchHooks Function()> {
  $CloudAuthMetaTableManager(i0.GeneratedDatabase db, i1.CloudAuthMeta table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CloudAuthMetaFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CloudAuthMetaOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CloudAuthMetaAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> schemaVersion = const i0.Value.absent(),
          }) =>
              i1.CloudAuthMetaCompanion(
            schemaVersion: schemaVersion,
          ),
          createCompanionCallback: ({
            i0.Value<int> schemaVersion = const i0.Value.absent(),
          }) =>
              i1.CloudAuthMetaCompanion.insert(
            schemaVersion: schemaVersion,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CloudAuthMetaProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CloudAuthMeta,
    i1.CloudAuthMetaData,
    i1.$CloudAuthMetaFilterComposer,
    i1.$CloudAuthMetaOrderingComposer,
    i1.$CloudAuthMetaAnnotationComposer,
    $CloudAuthMetaCreateCompanionBuilder,
    $CloudAuthMetaUpdateCompanionBuilder,
    (
      i1.CloudAuthMetaData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CloudAuthMeta,
          i1.CloudAuthMetaData>
    ),
    i1.CloudAuthMetaData,
    i0.PrefetchHooks Function()>;

class CloudAuthMeta extends i0.Table
    with i0.TableInfo<CloudAuthMeta, i1.CloudAuthMetaData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthMeta(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'cloud_auth_meta';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {schemaVersion};
  @override
  i1.CloudAuthMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CloudAuthMetaData(
      schemaVersion: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}schema_version'])!,
    );
  }

  @override
  CloudAuthMeta createAlias(String alias) {
    return CloudAuthMeta(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthMetaData extends i0.DataClass
    implements i0.Insertable<i1.CloudAuthMetaData> {
  /// The version of the schema.
  final int schemaVersion;
  const CloudAuthMetaData({required this.schemaVersion});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['schema_version'] = i0.Variable<int>(schemaVersion);
    return map;
  }

  factory CloudAuthMetaData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CloudAuthMetaData(
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

  i1.CloudAuthMetaData copyWith({int? schemaVersion}) => i1.CloudAuthMetaData(
        schemaVersion: schemaVersion ?? this.schemaVersion,
      );
  CloudAuthMetaData copyWithCompanion(i1.CloudAuthMetaCompanion data) {
    return CloudAuthMetaData(
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthMetaData(')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => schemaVersion.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CloudAuthMetaData &&
          other.schemaVersion == this.schemaVersion);
}

class CloudAuthMetaCompanion extends i0.UpdateCompanion<i1.CloudAuthMetaData> {
  final i0.Value<int> schemaVersion;
  const CloudAuthMetaCompanion({
    this.schemaVersion = const i0.Value.absent(),
  });
  CloudAuthMetaCompanion.insert({
    this.schemaVersion = const i0.Value.absent(),
  });
  static i0.Insertable<i1.CloudAuthMetaData> custom({
    i0.Expression<int>? schemaVersion,
  }) {
    return i0.RawValuesInsertable({
      if (schemaVersion != null) 'schema_version': schemaVersion,
    });
  }

  i1.CloudAuthMetaCompanion copyWith({i0.Value<int>? schemaVersion}) {
    return i1.CloudAuthMetaCompanion(
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
    return (StringBuffer('CloudAuthMetaCompanion(')
          ..write('schemaVersion: $schemaVersion')
          ..write(')'))
        .toString();
  }
}

i0.OnCreateQuery get $drift0 => i0.OnCreateQuery(
    'INSERT INTO cloud_auth_meta (schema_version) VALUES (6) ON CONFLICT DO NOTHING');

class CloudAuthMetaDrift extends i2.ModularAccessor {
  CloudAuthMetaDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<int?> getSchemaVersion() {
    return customSelect(
        'SELECT max(schema_version) AS _c0 FROM cloud_auth_meta',
        variables: [],
        readsFrom: {
          cloudAuthMeta,
        }).map((i0.QueryRow row) => row.readNullable<int>('_c0'));
  }

  Future<int> setSchemaVersion({required int schemaVersion}) {
    return customInsert(
      'INSERT INTO cloud_auth_meta (schema_version) VALUES (?1) ON CONFLICT DO NOTHING',
      variables: [i0.Variable<int>(schemaVersion)],
      updates: {cloudAuthMeta},
    );
  }

  i1.CloudAuthMeta get cloudAuthMeta =>
      i2.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CloudAuthMeta>('cloud_auth_meta');
}
