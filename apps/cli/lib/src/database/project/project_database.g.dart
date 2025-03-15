// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_database.dart';

// ignore_for_file: type=lint
class Environments extends Table with TableInfo<Environments, Environment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Environments(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'environments';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Environment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Environment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
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

class Environment extends DataClass implements Insertable<Environment> {
  /// The unique alias for the environment.
  final String id;
  const Environment({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    return map;
  }

  factory Environment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Environment(id: serializer.fromJson<String>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<String>(id)};
  }

  Environment copyWith({String? id}) => Environment(id: id ?? this.id);
  Environment copyWithCompanion(EnvironmentsCompanion data) {
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
      identical(this, other) || (other is Environment && other.id == this.id);
}

class EnvironmentsCompanion extends UpdateCompanion<Environment> {
  final Value<String> id;
  final Value<int> rowid;
  const EnvironmentsCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnvironmentsCompanion.insert({
    required String id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Environment> custom({
    Expression<String>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnvironmentsCompanion copyWith({Value<String>? id, Value<int>? rowid}) {
    return EnvironmentsCompanion(id: id ?? this.id, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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

class EnvironmentVariables extends Table
    with TableInfo<EnvironmentVariables, EnvironmentVariable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  EnvironmentVariables(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> environmentId = GeneratedColumn<String>(
    'environment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [environmentId, name, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'environment_variables';
  @override
  Set<GeneratedColumn> get $primaryKey => {environmentId, name};
  @override
  EnvironmentVariable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnvironmentVariable(
      environmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}environment_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
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

class EnvironmentVariable extends DataClass
    implements Insertable<EnvironmentVariable> {
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['environment_id'] = Variable<String>(environmentId);
    map['name'] = Variable<String>(name);
    map['value'] = Variable<String>(value);
    return map;
  }

  factory EnvironmentVariable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnvironmentVariable(
      environmentId: serializer.fromJson<String>(json['environment_id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'environment_id': serializer.toJson<String>(environmentId),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
    };
  }

  EnvironmentVariable copyWith({
    String? environmentId,
    String? name,
    String? value,
  }) =>
      EnvironmentVariable(
        environmentId: environmentId ?? this.environmentId,
        name: name ?? this.name,
        value: value ?? this.value,
      );
  EnvironmentVariable copyWithCompanion(EnvironmentVariablesCompanion data) {
    return EnvironmentVariable(
      environmentId: data.environmentId.present
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
      (other is EnvironmentVariable &&
          other.environmentId == this.environmentId &&
          other.name == this.name &&
          other.value == this.value);
}

class EnvironmentVariablesCompanion
    extends UpdateCompanion<EnvironmentVariable> {
  final Value<String> environmentId;
  final Value<String> name;
  final Value<String> value;
  final Value<int> rowid;
  const EnvironmentVariablesCompanion({
    this.environmentId = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnvironmentVariablesCompanion.insert({
    required String environmentId,
    required String name,
    required String value,
    this.rowid = const Value.absent(),
  })  : environmentId = Value(environmentId),
        name = Value(name),
        value = Value(value);
  static Insertable<EnvironmentVariable> custom({
    Expression<String>? environmentId,
    Expression<String>? name,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (environmentId != null) 'environment_id': environmentId,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnvironmentVariablesCompanion copyWith({
    Value<String>? environmentId,
    Value<String>? name,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return EnvironmentVariablesCompanion(
      environmentId: environmentId ?? this.environmentId,
      name: name ?? this.name,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (environmentId.present) {
      map['environment_id'] = Variable<String>(environmentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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

class Secrets extends Table with TableInfo<Secrets, Secret> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Secrets(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> environmentId = GeneratedColumn<String>(
    'environment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> valueRef = GeneratedColumn<String>(
    'value_ref',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [environmentId, name, valueRef];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'secrets';
  @override
  Set<GeneratedColumn> get $primaryKey => {environmentId, name};
  @override
  Secret map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Secret(
      environmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}environment_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      valueRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
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

class Secret extends DataClass implements Insertable<Secret> {
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['environment_id'] = Variable<String>(environmentId);
    map['name'] = Variable<String>(name);
    map['value_ref'] = Variable<String>(valueRef);
    return map;
  }

  factory Secret.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Secret(
      environmentId: serializer.fromJson<String>(json['environment_id']),
      name: serializer.fromJson<String>(json['name']),
      valueRef: serializer.fromJson<String>(json['value_ref']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'environment_id': serializer.toJson<String>(environmentId),
      'name': serializer.toJson<String>(name),
      'value_ref': serializer.toJson<String>(valueRef),
    };
  }

  Secret copyWith({String? environmentId, String? name, String? valueRef}) =>
      Secret(
        environmentId: environmentId ?? this.environmentId,
        name: name ?? this.name,
        valueRef: valueRef ?? this.valueRef,
      );
  Secret copyWithCompanion(SecretsCompanion data) {
    return Secret(
      environmentId: data.environmentId.present
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
      (other is Secret &&
          other.environmentId == this.environmentId &&
          other.name == this.name &&
          other.valueRef == this.valueRef);
}

class SecretsCompanion extends UpdateCompanion<Secret> {
  final Value<String> environmentId;
  final Value<String> name;
  final Value<String> valueRef;
  final Value<int> rowid;
  const SecretsCompanion({
    this.environmentId = const Value.absent(),
    this.name = const Value.absent(),
    this.valueRef = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SecretsCompanion.insert({
    required String environmentId,
    required String name,
    required String valueRef,
    this.rowid = const Value.absent(),
  })  : environmentId = Value(environmentId),
        name = Value(name),
        valueRef = Value(valueRef);
  static Insertable<Secret> custom({
    Expression<String>? environmentId,
    Expression<String>? name,
    Expression<String>? valueRef,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (environmentId != null) 'environment_id': environmentId,
      if (name != null) 'name': name,
      if (valueRef != null) 'value_ref': valueRef,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SecretsCompanion copyWith({
    Value<String>? environmentId,
    Value<String>? name,
    Value<String>? valueRef,
    Value<int>? rowid,
  }) {
    return SecretsCompanion(
      environmentId: environmentId ?? this.environmentId,
      name: name ?? this.name,
      valueRef: valueRef ?? this.valueRef,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (environmentId.present) {
      map['environment_id'] = Variable<String>(environmentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (valueRef.present) {
      map['value_ref'] = Variable<String>(valueRef.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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

abstract class _$ProjectDatabase extends GeneratedDatabase {
  _$ProjectDatabase(QueryExecutor e) : super(e);
  $ProjectDatabaseManager get managers => $ProjectDatabaseManager(this);
  late final Environments environments = Environments(this);
  late final EnvironmentVariables environmentVariables = EnvironmentVariables(
    this,
  );
  late final Secrets secrets = Secrets(this);
  Selectable<Environment> lookupEnvironment({required String id}) {
    return customSelect(
      'SELECT * FROM environments WHERE id = ?1 LIMIT 1',
      variables: [Variable<String>(id)],
      readsFrom: {environments},
    ).asyncMap(environments.mapFromRow);
  }

  Future<List<Environment>> createEnvironment({required String id}) {
    return customWriteReturning(
      'INSERT INTO environments (id) VALUES (?1) RETURNING *',
      variables: [Variable<String>(id)],
      updates: {environments},
    ).then((rows) => Future.wait(rows.map(environments.mapFromRow)));
  }

  Future<List<Environment>> upsertEnvironment({required String id}) {
    return customWriteReturning(
      'INSERT INTO environments (id) VALUES (?1) ON CONFLICT (id) DO NOTHING RETURNING *',
      variables: [Variable<String>(id)],
      updates: {environments},
    ).then((rows) => Future.wait(rows.map(environments.mapFromRow)));
  }

  Future<List<EnvironmentVariable>> upsertEnvironmentVariable({
    required String environmentId,
    required String name,
    required String value,
  }) {
    return customWriteReturning(
      'INSERT INTO environment_variables (environment_id, name, value) VALUES (?1, ?2, ?3) ON CONFLICT (environment_id, name) DO UPDATE SET value = ?3 RETURNING *',
      variables: [
        Variable<String>(environmentId),
        Variable<String>(name),
        Variable<String>(value),
      ],
      updates: {environmentVariables},
    ).then((rows) => Future.wait(rows.map(environmentVariables.mapFromRow)));
  }

  Selectable<EnvironmentVariable> getEnvironmentVariables({
    required String environmentId,
    required List<String> names,
  }) {
    var $arrayStartIndex = 2;
    final expandednames = $expandVar($arrayStartIndex, names.length);
    $arrayStartIndex += names.length;
    return customSelect(
      'SELECT * FROM environment_variables WHERE environment_id = ?1 AND name IN ($expandednames)',
      variables: [
        Variable<String>(environmentId),
        for (var $ in names) Variable<String>($),
      ],
      readsFrom: {environmentVariables},
    ).asyncMap(environmentVariables.mapFromRow);
  }

  Selectable<String> getEnvironmentVariable({
    required String environmentId,
    required String name,
  }) {
    return customSelect(
      'SELECT value FROM environment_variables WHERE environment_id = ?1 AND name = ?2',
      variables: [Variable<String>(environmentId), Variable<String>(name)],
      readsFrom: {environmentVariables},
    ).map((QueryRow row) => row.read<String>('value'));
  }

  Future<List<Secret>> upsertSecret({
    required String environmentId,
    required String name,
    required String valueRef,
  }) {
    return customWriteReturning(
      'INSERT INTO secrets (environment_id, name, value_ref) VALUES (?1, ?2, ?3) ON CONFLICT (environment_id, name) DO UPDATE SET value_ref = ?3 RETURNING *',
      variables: [
        Variable<String>(environmentId),
        Variable<String>(name),
        Variable<String>(valueRef),
      ],
      updates: {secrets},
    ).then((rows) => Future.wait(rows.map(secrets.mapFromRow)));
  }

  Selectable<Secret> getSecrets({
    required String environmentId,
    required List<String> names,
  }) {
    var $arrayStartIndex = 2;
    final expandednames = $expandVar($arrayStartIndex, names.length);
    $arrayStartIndex += names.length;
    return customSelect(
      'SELECT * FROM secrets WHERE environment_id = ?1 AND name IN ($expandednames)',
      variables: [
        Variable<String>(environmentId),
        for (var $ in names) Variable<String>($),
      ],
      readsFrom: {secrets},
    ).asyncMap(secrets.mapFromRow);
  }

  Selectable<String> getSecret({
    required String environmentId,
    required String name,
  }) {
    return customSelect(
      'SELECT value_ref FROM secrets WHERE environment_id = ?1 AND name = ?2',
      variables: [Variable<String>(environmentId), Variable<String>(name)],
      readsFrom: {secrets},
    ).map((QueryRow row) => row.read<String>('value_ref'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        environments,
        environmentVariables,
        secrets,
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
        WritePropagation(
          on: TableUpdateQuery.onTableName(
            'environments',
            limitUpdateKind: UpdateKind.delete,
          ),
          result: [
            TableUpdate('environment_variables', kind: UpdateKind.delete)
          ],
        ),
        WritePropagation(
          on: TableUpdateQuery.onTableName(
            'environments',
            limitUpdateKind: UpdateKind.update,
          ),
          result: [
            TableUpdate('environment_variables', kind: UpdateKind.update)
          ],
        ),
        WritePropagation(
          on: TableUpdateQuery.onTableName(
            'environments',
            limitUpdateKind: UpdateKind.delete,
          ),
          result: [TableUpdate('secrets', kind: UpdateKind.delete)],
        ),
        WritePropagation(
          on: TableUpdateQuery.onTableName(
            'environments',
            limitUpdateKind: UpdateKind.update,
          ),
          result: [TableUpdate('secrets', kind: UpdateKind.update)],
        ),
      ]);
}

typedef $EnvironmentsCreateCompanionBuilder = EnvironmentsCompanion Function(
    {required String id, Value<int> rowid});
typedef $EnvironmentsUpdateCompanionBuilder = EnvironmentsCompanion Function(
    {Value<String> id, Value<int> rowid});

class $EnvironmentsFilterComposer
    extends Composer<_$ProjectDatabase, Environments> {
  $EnvironmentsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
        column: $table.id,
        builder: (column) => ColumnFilters(column),
      );
}

class $EnvironmentsOrderingComposer
    extends Composer<_$ProjectDatabase, Environments> {
  $EnvironmentsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
        column: $table.id,
        builder: (column) => ColumnOrderings(column),
      );
}

class $EnvironmentsAnnotationComposer
    extends Composer<_$ProjectDatabase, Environments> {
  $EnvironmentsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $EnvironmentsTableManager extends RootTableManager<
    _$ProjectDatabase,
    Environments,
    Environment,
    $EnvironmentsFilterComposer,
    $EnvironmentsOrderingComposer,
    $EnvironmentsAnnotationComposer,
    $EnvironmentsCreateCompanionBuilder,
    $EnvironmentsUpdateCompanionBuilder,
    (
      Environment,
      BaseReferences<_$ProjectDatabase, Environments, Environment>,
    ),
    Environment,
    PrefetchHooks Function()> {
  $EnvironmentsTableManager(_$ProjectDatabase db, Environments table)
      : super(
          TableManagerState(
            db: db,
            table: table,
            createFilteringComposer: () =>
                $EnvironmentsFilterComposer($db: db, $table: table),
            createOrderingComposer: () =>
                $EnvironmentsOrderingComposer($db: db, $table: table),
            createComputedFieldComposer: () =>
                $EnvironmentsAnnotationComposer($db: db, $table: table),
            updateCompanionCallback: ({
              Value<String> id = const Value.absent(),
              Value<int> rowid = const Value.absent(),
            }) =>
                EnvironmentsCompanion(id: id, rowid: rowid),
            createCompanionCallback: (
                    {required String id,
                    Value<int> rowid = const Value.absent()}) =>
                EnvironmentsCompanion.insert(id: id, rowid: rowid),
            withReferenceMapper: (p0) => p0
                .map(
                  (e) => (
                    e.readTable(table),
                    BaseReferences(db, table, e),
                  ),
                )
                .toList(),
            prefetchHooksCallback: null,
          ),
        );
}

typedef $EnvironmentsProcessedTableManager = ProcessedTableManager<
    _$ProjectDatabase,
    Environments,
    Environment,
    $EnvironmentsFilterComposer,
    $EnvironmentsOrderingComposer,
    $EnvironmentsAnnotationComposer,
    $EnvironmentsCreateCompanionBuilder,
    $EnvironmentsUpdateCompanionBuilder,
    (
      Environment,
      BaseReferences<_$ProjectDatabase, Environments, Environment>,
    ),
    Environment,
    PrefetchHooks Function()>;
typedef $EnvironmentVariablesCreateCompanionBuilder
    = EnvironmentVariablesCompanion Function({
  required String environmentId,
  required String name,
  required String value,
  Value<int> rowid,
});
typedef $EnvironmentVariablesUpdateCompanionBuilder
    = EnvironmentVariablesCompanion Function({
  Value<String> environmentId,
  Value<String> name,
  Value<String> value,
  Value<int> rowid,
});

class $EnvironmentVariablesFilterComposer
    extends Composer<_$ProjectDatabase, EnvironmentVariables> {
  $EnvironmentVariablesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get environmentId => $composableBuilder(
        column: $table.environmentId,
        builder: (column) => ColumnFilters(column),
      );

  ColumnFilters<String> get name => $composableBuilder(
        column: $table.name,
        builder: (column) => ColumnFilters(column),
      );

  ColumnFilters<String> get value => $composableBuilder(
        column: $table.value,
        builder: (column) => ColumnFilters(column),
      );
}

class $EnvironmentVariablesOrderingComposer
    extends Composer<_$ProjectDatabase, EnvironmentVariables> {
  $EnvironmentVariablesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get environmentId => $composableBuilder(
        column: $table.environmentId,
        builder: (column) => ColumnOrderings(column),
      );

  ColumnOrderings<String> get name => $composableBuilder(
        column: $table.name,
        builder: (column) => ColumnOrderings(column),
      );

  ColumnOrderings<String> get value => $composableBuilder(
        column: $table.value,
        builder: (column) => ColumnOrderings(column),
      );
}

class $EnvironmentVariablesAnnotationComposer
    extends Composer<_$ProjectDatabase, EnvironmentVariables> {
  $EnvironmentVariablesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get environmentId => $composableBuilder(
        column: $table.environmentId,
        builder: (column) => column,
      );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $EnvironmentVariablesTableManager extends RootTableManager<
    _$ProjectDatabase,
    EnvironmentVariables,
    EnvironmentVariable,
    $EnvironmentVariablesFilterComposer,
    $EnvironmentVariablesOrderingComposer,
    $EnvironmentVariablesAnnotationComposer,
    $EnvironmentVariablesCreateCompanionBuilder,
    $EnvironmentVariablesUpdateCompanionBuilder,
    (
      EnvironmentVariable,
      BaseReferences<_$ProjectDatabase, EnvironmentVariables,
          EnvironmentVariable>,
    ),
    EnvironmentVariable,
    PrefetchHooks Function()> {
  $EnvironmentVariablesTableManager(
    _$ProjectDatabase db,
    EnvironmentVariables table,
  ) : super(
          TableManagerState(
            db: db,
            table: table,
            createFilteringComposer: () =>
                $EnvironmentVariablesFilterComposer($db: db, $table: table),
            createOrderingComposer: () =>
                $EnvironmentVariablesOrderingComposer($db: db, $table: table),
            createComputedFieldComposer: () =>
                $EnvironmentVariablesAnnotationComposer(
              $db: db,
              $table: table,
            ),
            updateCompanionCallback: ({
              Value<String> environmentId = const Value.absent(),
              Value<String> name = const Value.absent(),
              Value<String> value = const Value.absent(),
              Value<int> rowid = const Value.absent(),
            }) =>
                EnvironmentVariablesCompanion(
              environmentId: environmentId,
              name: name,
              value: value,
              rowid: rowid,
            ),
            createCompanionCallback: ({
              required String environmentId,
              required String name,
              required String value,
              Value<int> rowid = const Value.absent(),
            }) =>
                EnvironmentVariablesCompanion.insert(
              environmentId: environmentId,
              name: name,
              value: value,
              rowid: rowid,
            ),
            withReferenceMapper: (p0) => p0
                .map(
                  (e) => (
                    e.readTable(table),
                    BaseReferences(db, table, e),
                  ),
                )
                .toList(),
            prefetchHooksCallback: null,
          ),
        );
}

typedef $EnvironmentVariablesProcessedTableManager = ProcessedTableManager<
    _$ProjectDatabase,
    EnvironmentVariables,
    EnvironmentVariable,
    $EnvironmentVariablesFilterComposer,
    $EnvironmentVariablesOrderingComposer,
    $EnvironmentVariablesAnnotationComposer,
    $EnvironmentVariablesCreateCompanionBuilder,
    $EnvironmentVariablesUpdateCompanionBuilder,
    (
      EnvironmentVariable,
      BaseReferences<_$ProjectDatabase, EnvironmentVariables,
          EnvironmentVariable>,
    ),
    EnvironmentVariable,
    PrefetchHooks Function()>;
typedef $SecretsCreateCompanionBuilder = SecretsCompanion Function({
  required String environmentId,
  required String name,
  required String valueRef,
  Value<int> rowid,
});
typedef $SecretsUpdateCompanionBuilder = SecretsCompanion Function({
  Value<String> environmentId,
  Value<String> name,
  Value<String> valueRef,
  Value<int> rowid,
});

class $SecretsFilterComposer extends Composer<_$ProjectDatabase, Secrets> {
  $SecretsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get environmentId => $composableBuilder(
        column: $table.environmentId,
        builder: (column) => ColumnFilters(column),
      );

  ColumnFilters<String> get name => $composableBuilder(
        column: $table.name,
        builder: (column) => ColumnFilters(column),
      );

  ColumnFilters<String> get valueRef => $composableBuilder(
        column: $table.valueRef,
        builder: (column) => ColumnFilters(column),
      );
}

class $SecretsOrderingComposer extends Composer<_$ProjectDatabase, Secrets> {
  $SecretsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get environmentId => $composableBuilder(
        column: $table.environmentId,
        builder: (column) => ColumnOrderings(column),
      );

  ColumnOrderings<String> get name => $composableBuilder(
        column: $table.name,
        builder: (column) => ColumnOrderings(column),
      );

  ColumnOrderings<String> get valueRef => $composableBuilder(
        column: $table.valueRef,
        builder: (column) => ColumnOrderings(column),
      );
}

class $SecretsAnnotationComposer extends Composer<_$ProjectDatabase, Secrets> {
  $SecretsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get environmentId => $composableBuilder(
        column: $table.environmentId,
        builder: (column) => column,
      );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get valueRef =>
      $composableBuilder(column: $table.valueRef, builder: (column) => column);
}

class $SecretsTableManager extends RootTableManager<
    _$ProjectDatabase,
    Secrets,
    Secret,
    $SecretsFilterComposer,
    $SecretsOrderingComposer,
    $SecretsAnnotationComposer,
    $SecretsCreateCompanionBuilder,
    $SecretsUpdateCompanionBuilder,
    (Secret, BaseReferences<_$ProjectDatabase, Secrets, Secret>),
    Secret,
    PrefetchHooks Function()> {
  $SecretsTableManager(_$ProjectDatabase db, Secrets table)
      : super(
          TableManagerState(
            db: db,
            table: table,
            createFilteringComposer: () =>
                $SecretsFilterComposer($db: db, $table: table),
            createOrderingComposer: () =>
                $SecretsOrderingComposer($db: db, $table: table),
            createComputedFieldComposer: () =>
                $SecretsAnnotationComposer($db: db, $table: table),
            updateCompanionCallback: ({
              Value<String> environmentId = const Value.absent(),
              Value<String> name = const Value.absent(),
              Value<String> valueRef = const Value.absent(),
              Value<int> rowid = const Value.absent(),
            }) =>
                SecretsCompanion(
              environmentId: environmentId,
              name: name,
              valueRef: valueRef,
              rowid: rowid,
            ),
            createCompanionCallback: ({
              required String environmentId,
              required String name,
              required String valueRef,
              Value<int> rowid = const Value.absent(),
            }) =>
                SecretsCompanion.insert(
              environmentId: environmentId,
              name: name,
              valueRef: valueRef,
              rowid: rowid,
            ),
            withReferenceMapper: (p0) => p0
                .map(
                  (e) => (
                    e.readTable(table),
                    BaseReferences(db, table, e),
                  ),
                )
                .toList(),
            prefetchHooksCallback: null,
          ),
        );
}

typedef $SecretsProcessedTableManager = ProcessedTableManager<
    _$ProjectDatabase,
    Secrets,
    Secret,
    $SecretsFilterComposer,
    $SecretsOrderingComposer,
    $SecretsAnnotationComposer,
    $SecretsCreateCompanionBuilder,
    $SecretsUpdateCompanionBuilder,
    (Secret, BaseReferences<_$ProjectDatabase, Secrets, Secret>),
    Secret,
    PrefetchHooks Function()>;

class $ProjectDatabaseManager {
  final _$ProjectDatabase _db;
  $ProjectDatabaseManager(this._db);
  $EnvironmentsTableManager get environments =>
      $EnvironmentsTableManager(_db, _db.environments);
  $EnvironmentVariablesTableManager get environmentVariables =>
      $EnvironmentVariablesTableManager(_db, _db.environmentVariables);
  $SecretsTableManager get secrets => $SecretsTableManager(_db, _db.secrets);
}
