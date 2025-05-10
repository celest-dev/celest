// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cli/src/database/project/project.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'dart:async' as i3;

typedef $EnvironmentsCreateCompanionBuilder =
    i1.EnvironmentsCompanion Function({
      required String id,
      i0.Value<int> rowid,
    });
typedef $EnvironmentsUpdateCompanionBuilder =
    i1.EnvironmentsCompanion Function({
      i0.Value<String> id,
      i0.Value<int> rowid,
    });

class $EnvironmentsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Environments> {
  $EnvironmentsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $EnvironmentsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Environments> {
  $EnvironmentsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $EnvironmentsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Environments> {
  $EnvironmentsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $EnvironmentsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Environments,
          i1.Environment,
          i1.$EnvironmentsFilterComposer,
          i1.$EnvironmentsOrderingComposer,
          i1.$EnvironmentsAnnotationComposer,
          $EnvironmentsCreateCompanionBuilder,
          $EnvironmentsUpdateCompanionBuilder,
          (
            i1.Environment,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.Environments,
              i1.Environment
            >,
          ),
          i1.Environment,
          i0.PrefetchHooks Function()
        > {
  $EnvironmentsTableManager(i0.GeneratedDatabase db, i1.Environments table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$EnvironmentsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$EnvironmentsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$EnvironmentsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> id = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.EnvironmentsCompanion(id: id, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.EnvironmentsCompanion.insert(id: id, rowid: rowid),
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

typedef $EnvironmentsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Environments,
      i1.Environment,
      i1.$EnvironmentsFilterComposer,
      i1.$EnvironmentsOrderingComposer,
      i1.$EnvironmentsAnnotationComposer,
      $EnvironmentsCreateCompanionBuilder,
      $EnvironmentsUpdateCompanionBuilder,
      (
        i1.Environment,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.Environments,
          i1.Environment
        >,
      ),
      i1.Environment,
      i0.PrefetchHooks Function()
    >;
typedef $EnvironmentVariablesCreateCompanionBuilder =
    i1.EnvironmentVariablesCompanion Function({
      required String environmentId,
      required String name,
      required String value,
      i0.Value<int> rowid,
    });
typedef $EnvironmentVariablesUpdateCompanionBuilder =
    i1.EnvironmentVariablesCompanion Function({
      i0.Value<String> environmentId,
      i0.Value<String> name,
      i0.Value<String> value,
      i0.Value<int> rowid,
    });

class $EnvironmentVariablesFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.EnvironmentVariables> {
  $EnvironmentVariablesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $EnvironmentVariablesOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.EnvironmentVariables> {
  $EnvironmentVariablesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $EnvironmentVariablesAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.EnvironmentVariables> {
  $EnvironmentVariablesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  i0.GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $EnvironmentVariablesTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.EnvironmentVariables,
          i1.EnvironmentVariable,
          i1.$EnvironmentVariablesFilterComposer,
          i1.$EnvironmentVariablesOrderingComposer,
          i1.$EnvironmentVariablesAnnotationComposer,
          $EnvironmentVariablesCreateCompanionBuilder,
          $EnvironmentVariablesUpdateCompanionBuilder,
          (
            i1.EnvironmentVariable,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.EnvironmentVariables,
              i1.EnvironmentVariable
            >,
          ),
          i1.EnvironmentVariable,
          i0.PrefetchHooks Function()
        > {
  $EnvironmentVariablesTableManager(
    i0.GeneratedDatabase db,
    i1.EnvironmentVariables table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$EnvironmentVariablesFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => i1.$EnvironmentVariablesOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => i1.$EnvironmentVariablesAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> environmentId = const i0.Value.absent(),
                i0.Value<String> name = const i0.Value.absent(),
                i0.Value<String> value = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.EnvironmentVariablesCompanion(
                environmentId: environmentId,
                name: name,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String environmentId,
                required String name,
                required String value,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.EnvironmentVariablesCompanion.insert(
                environmentId: environmentId,
                name: name,
                value: value,
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

typedef $EnvironmentVariablesProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.EnvironmentVariables,
      i1.EnvironmentVariable,
      i1.$EnvironmentVariablesFilterComposer,
      i1.$EnvironmentVariablesOrderingComposer,
      i1.$EnvironmentVariablesAnnotationComposer,
      $EnvironmentVariablesCreateCompanionBuilder,
      $EnvironmentVariablesUpdateCompanionBuilder,
      (
        i1.EnvironmentVariable,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.EnvironmentVariables,
          i1.EnvironmentVariable
        >,
      ),
      i1.EnvironmentVariable,
      i0.PrefetchHooks Function()
    >;
typedef $SecretsCreateCompanionBuilder =
    i1.SecretsCompanion Function({
      required String environmentId,
      required String name,
      required String valueRef,
      i0.Value<int> rowid,
    });
typedef $SecretsUpdateCompanionBuilder =
    i1.SecretsCompanion Function({
      i0.Value<String> environmentId,
      i0.Value<String> name,
      i0.Value<String> valueRef,
      i0.Value<int> rowid,
    });

class $SecretsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Secrets> {
  $SecretsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get valueRef => $composableBuilder(
    column: $table.valueRef,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $SecretsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Secrets> {
  $SecretsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get valueRef => $composableBuilder(
    column: $table.valueRef,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $SecretsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Secrets> {
  $SecretsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  i0.GeneratedColumn<String> get valueRef =>
      $composableBuilder(column: $table.valueRef, builder: (column) => column);
}

class $SecretsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Secrets,
          i1.Secret,
          i1.$SecretsFilterComposer,
          i1.$SecretsOrderingComposer,
          i1.$SecretsAnnotationComposer,
          $SecretsCreateCompanionBuilder,
          $SecretsUpdateCompanionBuilder,
          (
            i1.Secret,
            i0.BaseReferences<i0.GeneratedDatabase, i1.Secrets, i1.Secret>,
          ),
          i1.Secret,
          i0.PrefetchHooks Function()
        > {
  $SecretsTableManager(i0.GeneratedDatabase db, i1.Secrets table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$SecretsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$SecretsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$SecretsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> environmentId = const i0.Value.absent(),
                i0.Value<String> name = const i0.Value.absent(),
                i0.Value<String> valueRef = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.SecretsCompanion(
                environmentId: environmentId,
                name: name,
                valueRef: valueRef,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String environmentId,
                required String name,
                required String valueRef,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.SecretsCompanion.insert(
                environmentId: environmentId,
                name: name,
                valueRef: valueRef,
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

typedef $SecretsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Secrets,
      i1.Secret,
      i1.$SecretsFilterComposer,
      i1.$SecretsOrderingComposer,
      i1.$SecretsAnnotationComposer,
      $SecretsCreateCompanionBuilder,
      $SecretsUpdateCompanionBuilder,
      (
        i1.Secret,
        i0.BaseReferences<i0.GeneratedDatabase, i1.Secrets, i1.Secret>,
      ),
      i1.Secret,
      i0.PrefetchHooks Function()
    >;

class Environments extends i0.Table
    with i0.TableInfo<Environments, i1.Environment> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Environments(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> id = i0.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'environments';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Environment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Environment(
      id:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
    );
  }

  @override
  Environments createAlias(String alias) {
    return Environments(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Environment extends i0.DataClass
    implements i0.Insertable<i1.Environment> {
  /// The unique alias for the environment.
  final String id;
  const Environment({required this.id});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    return map;
  }

  factory Environment.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Environment(id: serializer.fromJson<String>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<String>(id)};
  }

  i1.Environment copyWith({String? id}) => i1.Environment(id: id ?? this.id);
  Environment copyWithCompanion(i1.EnvironmentsCompanion data) {
    return Environment(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('Environment(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Environment && other.id == this.id);
}

class EnvironmentsCompanion extends i0.UpdateCompanion<i1.Environment> {
  final i0.Value<String> id;
  final i0.Value<int> rowid;
  const EnvironmentsCompanion({
    this.id = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  EnvironmentsCompanion.insert({
    required String id,
    this.rowid = const i0.Value.absent(),
  }) : id = i0.Value(id);
  static i0.Insertable<i1.Environment> custom({
    i0.Expression<String>? id,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.EnvironmentsCompanion copyWith({
    i0.Value<String>? id,
    i0.Value<int>? rowid,
  }) {
    return i1.EnvironmentsCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<String>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentsCompanion(')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class EnvironmentVariables extends i0.Table
    with i0.TableInfo<EnvironmentVariables, i1.EnvironmentVariable> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  EnvironmentVariables(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> environmentId =
      i0.GeneratedColumn<String>(
        'environment_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumn<String> value = i0.GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [environmentId, name, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'environment_variables';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {environmentId, name};
  @override
  i1.EnvironmentVariable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.EnvironmentVariable(
      environmentId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}environment_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      value:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}value'],
          )!,
    );
  }

  @override
  EnvironmentVariables createAlias(String alias) {
    return EnvironmentVariables(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(environment_id, name)',
    'CONSTRAINT fk_environment_variables_environment_id FOREIGN KEY(environment_id)REFERENCES environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class EnvironmentVariable extends i0.DataClass
    implements i0.Insertable<i1.EnvironmentVariable> {
  /// The environment that the variable belongs to.
  final String environmentId;

  /// The name of the environment variable.
  final String name;

  /// The value of the environment variable.
  final String value;
  const EnvironmentVariable({
    required this.environmentId,
    required this.name,
    required this.value,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['environment_id'] = i0.Variable<String>(environmentId);
    map['name'] = i0.Variable<String>(name);
    map['value'] = i0.Variable<String>(value);
    return map;
  }

  factory EnvironmentVariable.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return EnvironmentVariable(
      environmentId: serializer.fromJson<String>(json['environment_id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'environment_id': serializer.toJson<String>(environmentId),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
    };
  }

  i1.EnvironmentVariable copyWith({
    String? environmentId,
    String? name,
    String? value,
  }) => i1.EnvironmentVariable(
    environmentId: environmentId ?? this.environmentId,
    name: name ?? this.name,
    value: value ?? this.value,
  );
  EnvironmentVariable copyWithCompanion(i1.EnvironmentVariablesCompanion data) {
    return EnvironmentVariable(
      environmentId:
          data.environmentId.present
              ? data.environmentId.value
              : this.environmentId,
      name: data.name.present ? data.name.value : this.name,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentVariable(')
          ..write('environmentId: $environmentId, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(environmentId, name, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.EnvironmentVariable &&
          other.environmentId == this.environmentId &&
          other.name == this.name &&
          other.value == this.value);
}

class EnvironmentVariablesCompanion
    extends i0.UpdateCompanion<i1.EnvironmentVariable> {
  final i0.Value<String> environmentId;
  final i0.Value<String> name;
  final i0.Value<String> value;
  final i0.Value<int> rowid;
  const EnvironmentVariablesCompanion({
    this.environmentId = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.value = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  EnvironmentVariablesCompanion.insert({
    required String environmentId,
    required String name,
    required String value,
    this.rowid = const i0.Value.absent(),
  }) : environmentId = i0.Value(environmentId),
       name = i0.Value(name),
       value = i0.Value(value);
  static i0.Insertable<i1.EnvironmentVariable> custom({
    i0.Expression<String>? environmentId,
    i0.Expression<String>? name,
    i0.Expression<String>? value,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (environmentId != null) 'environment_id': environmentId,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.EnvironmentVariablesCompanion copyWith({
    i0.Value<String>? environmentId,
    i0.Value<String>? name,
    i0.Value<String>? value,
    i0.Value<int>? rowid,
  }) {
    return i1.EnvironmentVariablesCompanion(
      environmentId: environmentId ?? this.environmentId,
      name: name ?? this.name,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (environmentId.present) {
      map['environment_id'] = i0.Variable<String>(environmentId.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = i0.Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnvironmentVariablesCompanion(')
          ..write('environmentId: $environmentId, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Secrets extends i0.Table with i0.TableInfo<Secrets, i1.Secret> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Secrets(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> environmentId =
      i0.GeneratedColumn<String>(
        'environment_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumn<String> valueRef = i0.GeneratedColumn<String>(
    'value_ref',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [environmentId, name, valueRef];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'secrets';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {environmentId, name};
  @override
  i1.Secret map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Secret(
      environmentId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}environment_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      valueRef:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}value_ref'],
          )!,
    );
  }

  @override
  Secrets createAlias(String alias) {
    return Secrets(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(environment_id, name)',
    'CONSTRAINT fk_secrets_environment_id FOREIGN KEY(environment_id)REFERENCES environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Secret extends i0.DataClass implements i0.Insertable<i1.Secret> {
  /// The environment that the secret belongs to.
  final String environmentId;

  /// The name of the secret.
  final String name;

  /// A reference to the value of the secret which is stored in secure storage.
  final String valueRef;
  const Secret({
    required this.environmentId,
    required this.name,
    required this.valueRef,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['environment_id'] = i0.Variable<String>(environmentId);
    map['name'] = i0.Variable<String>(name);
    map['value_ref'] = i0.Variable<String>(valueRef);
    return map;
  }

  factory Secret.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Secret(
      environmentId: serializer.fromJson<String>(json['environment_id']),
      name: serializer.fromJson<String>(json['name']),
      valueRef: serializer.fromJson<String>(json['value_ref']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'environment_id': serializer.toJson<String>(environmentId),
      'name': serializer.toJson<String>(name),
      'value_ref': serializer.toJson<String>(valueRef),
    };
  }

  i1.Secret copyWith({String? environmentId, String? name, String? valueRef}) =>
      i1.Secret(
        environmentId: environmentId ?? this.environmentId,
        name: name ?? this.name,
        valueRef: valueRef ?? this.valueRef,
      );
  Secret copyWithCompanion(i1.SecretsCompanion data) {
    return Secret(
      environmentId:
          data.environmentId.present
              ? data.environmentId.value
              : this.environmentId,
      name: data.name.present ? data.name.value : this.name,
      valueRef: data.valueRef.present ? data.valueRef.value : this.valueRef,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Secret(')
          ..write('environmentId: $environmentId, ')
          ..write('name: $name, ')
          ..write('valueRef: $valueRef')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(environmentId, name, valueRef);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Secret &&
          other.environmentId == this.environmentId &&
          other.name == this.name &&
          other.valueRef == this.valueRef);
}

class SecretsCompanion extends i0.UpdateCompanion<i1.Secret> {
  final i0.Value<String> environmentId;
  final i0.Value<String> name;
  final i0.Value<String> valueRef;
  final i0.Value<int> rowid;
  const SecretsCompanion({
    this.environmentId = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.valueRef = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  SecretsCompanion.insert({
    required String environmentId,
    required String name,
    required String valueRef,
    this.rowid = const i0.Value.absent(),
  }) : environmentId = i0.Value(environmentId),
       name = i0.Value(name),
       valueRef = i0.Value(valueRef);
  static i0.Insertable<i1.Secret> custom({
    i0.Expression<String>? environmentId,
    i0.Expression<String>? name,
    i0.Expression<String>? valueRef,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (environmentId != null) 'environment_id': environmentId,
      if (name != null) 'name': name,
      if (valueRef != null) 'value_ref': valueRef,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.SecretsCompanion copyWith({
    i0.Value<String>? environmentId,
    i0.Value<String>? name,
    i0.Value<String>? valueRef,
    i0.Value<int>? rowid,
  }) {
    return i1.SecretsCompanion(
      environmentId: environmentId ?? this.environmentId,
      name: name ?? this.name,
      valueRef: valueRef ?? this.valueRef,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (environmentId.present) {
      map['environment_id'] = i0.Variable<String>(environmentId.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (valueRef.present) {
      map['value_ref'] = i0.Variable<String>(valueRef.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SecretsCompanion(')
          ..write('environmentId: $environmentId, ')
          ..write('name: $name, ')
          ..write('valueRef: $valueRef, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProjectDrift extends i2.ModularAccessor {
  ProjectDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.Environment> lookupEnvironment({required String id}) {
    return customSelect(
      'SELECT * FROM environments WHERE id = ?1 LIMIT 1',
      variables: [i0.Variable<String>(id)],
      readsFrom: {environments},
    ).asyncMap(environments.mapFromRow);
  }

  i3.Future<List<i1.Environment>> createEnvironment({required String id}) {
    return customWriteReturning(
      'INSERT INTO environments (id) VALUES (?1) RETURNING *',
      variables: [i0.Variable<String>(id)],
      updates: {environments},
    ).then((rows) => Future.wait(rows.map(environments.mapFromRow)));
  }

  i3.Future<List<i1.Environment>> upsertEnvironment({required String id}) {
    return customWriteReturning(
      'INSERT INTO environments (id) VALUES (?1) ON CONFLICT (id) DO NOTHING RETURNING *',
      variables: [i0.Variable<String>(id)],
      updates: {environments},
    ).then((rows) => Future.wait(rows.map(environments.mapFromRow)));
  }

  i3.Future<List<i1.EnvironmentVariable>> upsertEnvironmentVariable({
    required String environmentId,
    required String name,
    required String value,
  }) {
    return customWriteReturning(
      'INSERT INTO environment_variables (environment_id, name, value) VALUES (?1, ?2, ?3) ON CONFLICT (environment_id, name) DO UPDATE SET value = ?3 RETURNING *',
      variables: [
        i0.Variable<String>(environmentId),
        i0.Variable<String>(name),
        i0.Variable<String>(value),
      ],
      updates: {environmentVariables},
    ).then((rows) => Future.wait(rows.map(environmentVariables.mapFromRow)));
  }

  i0.Selectable<i1.EnvironmentVariable> getEnvironmentVariables({
    required String environmentId,
    required List<String> names,
  }) {
    var $arrayStartIndex = 2;
    final expandednames = $expandVar($arrayStartIndex, names.length);
    $arrayStartIndex += names.length;
    return customSelect(
      'SELECT * FROM environment_variables WHERE environment_id = ?1 AND name IN ($expandednames)',
      variables: [
        i0.Variable<String>(environmentId),
        for (var $ in names) i0.Variable<String>($),
      ],
      readsFrom: {environmentVariables},
    ).asyncMap(environmentVariables.mapFromRow);
  }

  i0.Selectable<String> getEnvironmentVariable({
    required String environmentId,
    required String name,
  }) {
    return customSelect(
      'SELECT value FROM environment_variables WHERE environment_id = ?1 AND name = ?2',
      variables: [
        i0.Variable<String>(environmentId),
        i0.Variable<String>(name),
      ],
      readsFrom: {environmentVariables},
    ).map((i0.QueryRow row) => row.read<String>('value'));
  }

  i3.Future<List<i1.Secret>> upsertSecret({
    required String environmentId,
    required String name,
    required String valueRef,
  }) {
    return customWriteReturning(
      'INSERT INTO secrets (environment_id, name, value_ref) VALUES (?1, ?2, ?3) ON CONFLICT (environment_id, name) DO UPDATE SET value_ref = ?3 RETURNING *',
      variables: [
        i0.Variable<String>(environmentId),
        i0.Variable<String>(name),
        i0.Variable<String>(valueRef),
      ],
      updates: {secrets},
    ).then((rows) => Future.wait(rows.map(secrets.mapFromRow)));
  }

  i0.Selectable<i1.Secret> getSecrets({
    required String environmentId,
    required List<String> names,
  }) {
    var $arrayStartIndex = 2;
    final expandednames = $expandVar($arrayStartIndex, names.length);
    $arrayStartIndex += names.length;
    return customSelect(
      'SELECT * FROM secrets WHERE environment_id = ?1 AND name IN ($expandednames)',
      variables: [
        i0.Variable<String>(environmentId),
        for (var $ in names) i0.Variable<String>($),
      ],
      readsFrom: {secrets},
    ).asyncMap(secrets.mapFromRow);
  }

  i0.Selectable<String> getSecret({
    required String environmentId,
    required String name,
  }) {
    return customSelect(
      'SELECT value_ref FROM secrets WHERE environment_id = ?1 AND name = ?2',
      variables: [
        i0.Variable<String>(environmentId),
        i0.Variable<String>(name),
      ],
      readsFrom: {secrets},
    ).map((i0.QueryRow row) => row.read<String>('value_ref'));
  }

  i1.Environments get environments => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.Environments>('environments');
  i1.EnvironmentVariables get environmentVariables => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.EnvironmentVariables>('environment_variables');
  i1.Secrets get secrets => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.Secrets>('secrets');
}
