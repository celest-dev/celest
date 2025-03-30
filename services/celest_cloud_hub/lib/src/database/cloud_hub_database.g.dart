// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_hub_database.dart';

// ignore_for_file: type=lint
class ProjectEnvironments extends Table
    with TableInfo<ProjectEnvironments, ProjectEnvironment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironments(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _parentTypeMeta = const VerificationMeta(
    'parentType',
  );
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _projectEnvironmentIdMeta =
      const VerificationMeta('projectEnvironmentId');
  late final GeneratedColumn<String> projectEnvironmentId =
      GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumnWithTypeConverter<LifecycleState, int> state =
      GeneratedColumn<int>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT 1',
        defaultValue: const CustomExpression('1'),
      ).withConverter<LifecycleState>(ProjectEnvironments.$converterstate);
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _createTimeMeta = const VerificationMeta(
    'createTime',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  static const VerificationMeta _updateTimeMeta = const VerificationMeta(
    'updateTime',
  );
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
    'update_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  static const VerificationMeta _deleteTimeMeta = const VerificationMeta(
    'deleteTime',
  );
  late final GeneratedColumn<DateTime> deleteTime = GeneratedColumn<DateTime>(
    'delete_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _annotationsMeta = const VerificationMeta(
    'annotations',
  );
  late final GeneratedColumn<String> annotations = GeneratedColumn<String>(
    'annotations',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _reconcilingMeta = const VerificationMeta(
    'reconciling',
  );
  late final GeneratedColumn<bool> reconciling = GeneratedColumn<bool>(
    'reconciling',
    aliasedName,
    false,
    generatedAs: GeneratedAs(
      const CustomExpression('state IN (1, 4, 6)'),
      false,
    ),
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (state IN (1, 4, 6)) VIRTUAL',
  );
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    generatedAs: GeneratedAs(
      const CustomExpression(
        'hex(md5(json_array(id, parent_type, parent_id, project_environment_id, state, display_name, create_time, update_time, delete_time, annotations, reconciling)))',
      ),
      true,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (hex(md5(json_array(id, parent_type, parent_id, project_environment_id, state, display_name, create_time, update_time, delete_time, annotations, reconciling)))) STORED',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentType,
    parentId,
    projectEnvironmentId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    annotations,
    reconciling,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environments';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectEnvironment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('parent_type')) {
      context.handle(
        _parentTypeMeta,
        parentType.isAcceptableOrUnknown(data['parent_type']!, _parentTypeMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('project_environment_id')) {
      context.handle(
        _projectEnvironmentIdMeta,
        projectEnvironmentId.isAcceptableOrUnknown(
          data['project_environment_id']!,
          _projectEnvironmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectEnvironmentIdMeta);
    }
    context.handle(_stateMeta, const VerificationResult.success());
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('create_time')) {
      context.handle(
        _createTimeMeta,
        createTime.isAcceptableOrUnknown(data['create_time']!, _createTimeMeta),
      );
    }
    if (data.containsKey('update_time')) {
      context.handle(
        _updateTimeMeta,
        updateTime.isAcceptableOrUnknown(data['update_time']!, _updateTimeMeta),
      );
    }
    if (data.containsKey('delete_time')) {
      context.handle(
        _deleteTimeMeta,
        deleteTime.isAcceptableOrUnknown(data['delete_time']!, _deleteTimeMeta),
      );
    }
    if (data.containsKey('annotations')) {
      context.handle(
        _annotationsMeta,
        annotations.isAcceptableOrUnknown(
          data['annotations']!,
          _annotationsMeta,
        ),
      );
    }
    if (data.containsKey('reconciling')) {
      context.handle(
        _reconcilingMeta,
        reconciling.isAcceptableOrUnknown(
          data['reconciling']!,
          _reconcilingMeta,
        ),
      );
    }
    if (data.containsKey('etag')) {
      context.handle(
        _etagMeta,
        etag.isAcceptableOrUnknown(data['etag']!, _etagMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectEnvironment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironment(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      parentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_type'],
      ),
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      state: ProjectEnvironments.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}state'],
        )!,
      ),
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}update_time'],
          )!,
      deleteTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delete_time'],
      ),
      annotations: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}annotations'],
      ),
      reconciling:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}reconciling'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  ProjectEnvironments createAlias(String alias) {
    return ProjectEnvironments(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LifecycleState, int, int> $converterstate =
      const EnumIndexConverter<LifecycleState>(LifecycleState.values);
  @override
  List<String> get customConstraints => const [
    'CHECK(parent_type IS NULL OR parent_type = \'Celest::Project\')',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironment extends DataClass
    implements Insertable<ProjectEnvironment> {
  /// Immutable. The unique identifier for the project environment.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: env_<typeid>
  final String id;

  /// The Cedar type of the parent entity.
  ///
  /// Must be `Celest::Project`.
  final String? parentType;

  /// The unique identifier of the parent entity.
  ///
  /// Must be an existing project.
  final String? parentId;

  /// The primary alias for the environment.
  final String projectEnvironmentId;

  /// The state of the environment.
  ///
  /// Defaults to `LifecycleState.CREATING`.
  final LifecycleState state;

  /// A human-readable name for the environment.
  final String? displayName;
  final DateTime createTime;
  final DateTime updateTime;
  final DateTime? deleteTime;

  /// User-defined annotations for the environment.
  ///
  /// Type: map[string]string
  final String? annotations;

  /// Whether the environment is in the process of being reconciled.
  final bool reconciling;

  /// The environment's etag.
  final String etag;
  const ProjectEnvironment({
    required this.id,
    this.parentType,
    this.parentId,
    required this.projectEnvironmentId,
    required this.state,
    this.displayName,
    required this.createTime,
    required this.updateTime,
    this.deleteTime,
    this.annotations,
    required this.reconciling,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || parentType != null) {
      map['parent_type'] = Variable<String>(parentType);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['project_environment_id'] = Variable<String>(projectEnvironmentId);
    {
      map['state'] = Variable<int>(
        ProjectEnvironments.$converterstate.toSql(state),
      );
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    map['create_time'] = Variable<DateTime>(createTime);
    map['update_time'] = Variable<DateTime>(updateTime);
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || annotations != null) {
      map['annotations'] = Variable<String>(annotations);
    }
    return map;
  }

  ProjectEnvironmentsCompanion toCompanion(bool nullToAbsent) {
    return ProjectEnvironmentsCompanion(
      id: Value(id),
      parentType:
          parentType == null && nullToAbsent
              ? const Value.absent()
              : Value(parentType),
      parentId:
          parentId == null && nullToAbsent
              ? const Value.absent()
              : Value(parentId),
      projectEnvironmentId: Value(projectEnvironmentId),
      state: Value(state),
      displayName:
          displayName == null && nullToAbsent
              ? const Value.absent()
              : Value(displayName),
      createTime: Value(createTime),
      updateTime: Value(updateTime),
      deleteTime:
          deleteTime == null && nullToAbsent
              ? const Value.absent()
              : Value(deleteTime),
      annotations:
          annotations == null && nullToAbsent
              ? const Value.absent()
              : Value(annotations),
    );
  }

  factory ProjectEnvironment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironment(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String?>(json['parent_type']),
      parentId: serializer.fromJson<String?>(json['parent_id']),
      projectEnvironmentId: serializer.fromJson<String>(
        json['project_environment_id'],
      ),
      state: ProjectEnvironments.$converterstate.fromJson(
        serializer.fromJson<int>(json['state']),
      ),
      displayName: serializer.fromJson<String?>(json['display_name']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      updateTime: serializer.fromJson<DateTime>(json['update_time']),
      deleteTime: serializer.fromJson<DateTime?>(json['delete_time']),
      annotations: serializer.fromJson<String?>(json['annotations']),
      reconciling: serializer.fromJson<bool>(json['reconciling']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parent_type': serializer.toJson<String?>(parentType),
      'parent_id': serializer.toJson<String?>(parentId),
      'project_environment_id': serializer.toJson<String>(projectEnvironmentId),
      'state': serializer.toJson<int>(
        ProjectEnvironments.$converterstate.toJson(state),
      ),
      'display_name': serializer.toJson<String?>(displayName),
      'create_time': serializer.toJson<DateTime>(createTime),
      'update_time': serializer.toJson<DateTime>(updateTime),
      'delete_time': serializer.toJson<DateTime?>(deleteTime),
      'annotations': serializer.toJson<String?>(annotations),
      'reconciling': serializer.toJson<bool>(reconciling),
      'etag': serializer.toJson<String>(etag),
    };
  }

  ProjectEnvironment copyWith({
    String? id,
    Value<String?> parentType = const Value.absent(),
    Value<String?> parentId = const Value.absent(),
    String? projectEnvironmentId,
    LifecycleState? state,
    Value<String?> displayName = const Value.absent(),
    DateTime? createTime,
    DateTime? updateTime,
    Value<DateTime?> deleteTime = const Value.absent(),
    Value<String?> annotations = const Value.absent(),
    bool? reconciling,
    String? etag,
  }) => ProjectEnvironment(
    id: id ?? this.id,
    parentType: parentType.present ? parentType.value : this.parentType,
    parentId: parentId.present ? parentId.value : this.parentId,
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    state: state ?? this.state,
    displayName: displayName.present ? displayName.value : this.displayName,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
    deleteTime: deleteTime.present ? deleteTime.value : this.deleteTime,
    annotations: annotations.present ? annotations.value : this.annotations,
    reconciling: reconciling ?? this.reconciling,
    etag: etag ?? this.etag,
  );
  @override
  String toString() {
    return (StringBuffer('ProjectEnvironment(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('annotations: $annotations, ')
          ..write('reconciling: $reconciling, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentType,
    parentId,
    projectEnvironmentId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    annotations,
    reconciling,
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironment &&
          other.id == this.id &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          other.state == this.state &&
          other.displayName == this.displayName &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.deleteTime == this.deleteTime &&
          other.annotations == this.annotations &&
          other.reconciling == this.reconciling &&
          other.etag == this.etag);
}

class ProjectEnvironmentsCompanion extends UpdateCompanion<ProjectEnvironment> {
  final Value<String> id;
  final Value<String?> parentType;
  final Value<String?> parentId;
  final Value<String> projectEnvironmentId;
  final Value<LifecycleState> state;
  final Value<String?> displayName;
  final Value<DateTime> createTime;
  final Value<DateTime> updateTime;
  final Value<DateTime?> deleteTime;
  final Value<String?> annotations;
  final Value<int> rowid;
  const ProjectEnvironmentsCompanion({
    this.id = const Value.absent(),
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.projectEnvironmentId = const Value.absent(),
    this.state = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.annotations = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectEnvironmentsCompanion.insert({
    required String id,
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    required String projectEnvironmentId,
    this.state = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.deleteTime = const Value.absent(),
    this.annotations = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectEnvironmentId = Value(projectEnvironmentId);
  static Insertable<ProjectEnvironment> custom({
    Expression<String>? id,
    Expression<String>? parentType,
    Expression<String>? parentId,
    Expression<String>? projectEnvironmentId,
    Expression<int>? state,
    Expression<String>? displayName,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<DateTime>? deleteTime,
    Expression<String>? annotations,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (state != null) 'state': state,
      if (displayName != null) 'display_name': displayName,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (annotations != null) 'annotations': annotations,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectEnvironmentsCompanion copyWith({
    Value<String>? id,
    Value<String?>? parentType,
    Value<String?>? parentId,
    Value<String>? projectEnvironmentId,
    Value<LifecycleState>? state,
    Value<String?>? displayName,
    Value<DateTime>? createTime,
    Value<DateTime>? updateTime,
    Value<DateTime?>? deleteTime,
    Value<String?>? annotations,
    Value<int>? rowid,
  }) {
    return ProjectEnvironmentsCompanion(
      id: id ?? this.id,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      state: state ?? this.state,
      displayName: displayName ?? this.displayName,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      deleteTime: deleteTime ?? this.deleteTime,
      annotations: annotations ?? this.annotations,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (parentType.present) {
      map['parent_type'] = Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (state.present) {
      map['state'] = Variable<int>(
        ProjectEnvironments.$converterstate.toSql(state.value),
      );
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (deleteTime.present) {
      map['delete_time'] = Variable<DateTime>(deleteTime.value);
    }
    if (annotations.present) {
      map['annotations'] = Variable<String>(annotations.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentsCompanion(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('annotations: $annotations, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironmentAsts extends Table
    with TableInfo<ProjectEnvironmentAsts, ProjectEnvironmentAst> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentAsts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _projectEnvironmentIdMeta =
      const VerificationMeta('projectEnvironmentId');
  late final GeneratedColumn<String> projectEnvironmentId =
      GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      );
  static const VerificationMeta _astMeta = const VerificationMeta('ast');
  late final GeneratedColumn<Uint8List> ast = GeneratedColumn<Uint8List>(
    'ast',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _digestMeta = const VerificationMeta('digest');
  late final GeneratedColumn<String> digest = GeneratedColumn<String>(
    'digest',
    aliasedName,
    false,
    generatedAs: GeneratedAs(const CustomExpression('hex(md5(ast))'), true),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL GENERATED ALWAYS AS (hex(md5(ast))) STORED',
  );
  @override
  List<GeneratedColumn> get $columns => [
    projectEnvironmentId,
    ast,
    version,
    digest,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environment_asts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectEnvironmentAst> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('project_environment_id')) {
      context.handle(
        _projectEnvironmentIdMeta,
        projectEnvironmentId.isAcceptableOrUnknown(
          data['project_environment_id']!,
          _projectEnvironmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectEnvironmentIdMeta);
    }
    if (data.containsKey('ast')) {
      context.handle(
        _astMeta,
        ast.isAcceptableOrUnknown(data['ast']!, _astMeta),
      );
    } else if (isInserting) {
      context.missing(_astMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('digest')) {
      context.handle(
        _digestMeta,
        digest.isAcceptableOrUnknown(data['digest']!, _digestMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {projectEnvironmentId};
  @override
  ProjectEnvironmentAst map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironmentAst(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      ast:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}ast'],
          )!,
      version:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}version'],
          )!,
      digest:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}digest'],
          )!,
    );
  }

  @override
  ProjectEnvironmentAsts createAlias(String alias) {
    return ProjectEnvironmentAsts(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT fk_environment_metadata_project_environment_id FOREIGN KEY(project_environment_id)REFERENCES project_environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentAst extends DataClass
    implements Insertable<ProjectEnvironmentAst> {
  /// The ID of the linked environment.
  final String projectEnvironmentId;

  /// The environment's project AST.
  ///
  /// Format: ProtoAny[celest.ast.<version>.ResolvedProject]
  final Uint8List ast;

  /// The environment's project AST version.
  final int version;

  /// The environment's project AST digest.
  final String digest;
  const ProjectEnvironmentAst({
    required this.projectEnvironmentId,
    required this.ast,
    required this.version,
    required this.digest,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_environment_id'] = Variable<String>(projectEnvironmentId);
    map['ast'] = Variable<Uint8List>(ast);
    map['version'] = Variable<int>(version);
    return map;
  }

  ProjectEnvironmentAstsCompanion toCompanion(bool nullToAbsent) {
    return ProjectEnvironmentAstsCompanion(
      projectEnvironmentId: Value(projectEnvironmentId),
      ast: Value(ast),
      version: Value(version),
    );
  }

  factory ProjectEnvironmentAst.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentAst(
      projectEnvironmentId: serializer.fromJson<String>(
        json['project_environment_id'],
      ),
      ast: serializer.fromJson<Uint8List>(json['ast']),
      version: serializer.fromJson<int>(json['version']),
      digest: serializer.fromJson<String>(json['digest']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'project_environment_id': serializer.toJson<String>(projectEnvironmentId),
      'ast': serializer.toJson<Uint8List>(ast),
      'version': serializer.toJson<int>(version),
      'digest': serializer.toJson<String>(digest),
    };
  }

  ProjectEnvironmentAst copyWith({
    String? projectEnvironmentId,
    Uint8List? ast,
    int? version,
    String? digest,
  }) => ProjectEnvironmentAst(
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    ast: ast ?? this.ast,
    version: version ?? this.version,
    digest: digest ?? this.digest,
  );
  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAst(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('ast: $ast, ')
          ..write('version: $version, ')
          ..write('digest: $digest')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    projectEnvironmentId,
    $driftBlobEquality.hash(ast),
    version,
    digest,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironmentAst &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          $driftBlobEquality.equals(other.ast, this.ast) &&
          other.version == this.version &&
          other.digest == this.digest);
}

class ProjectEnvironmentAstsCompanion
    extends UpdateCompanion<ProjectEnvironmentAst> {
  final Value<String> projectEnvironmentId;
  final Value<Uint8List> ast;
  final Value<int> version;
  const ProjectEnvironmentAstsCompanion({
    this.projectEnvironmentId = const Value.absent(),
    this.ast = const Value.absent(),
    this.version = const Value.absent(),
  });
  ProjectEnvironmentAstsCompanion.insert({
    required String projectEnvironmentId,
    required Uint8List ast,
    required int version,
  }) : projectEnvironmentId = Value(projectEnvironmentId),
       ast = Value(ast),
       version = Value(version);
  static Insertable<ProjectEnvironmentAst> custom({
    Expression<String>? projectEnvironmentId,
    Expression<Uint8List>? ast,
    Expression<int>? version,
  }) {
    return RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (ast != null) 'ast': ast,
      if (version != null) 'version': version,
    });
  }

  ProjectEnvironmentAstsCompanion copyWith({
    Value<String>? projectEnvironmentId,
    Value<Uint8List>? ast,
    Value<int>? version,
  }) {
    return ProjectEnvironmentAstsCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      ast: ast ?? this.ast,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (ast.present) {
      map['ast'] = Variable<Uint8List>(ast.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAstsCompanion(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('ast: $ast, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironmentAssets extends Table
    with TableInfo<ProjectEnvironmentAssets, ProjectEnvironmentAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentAssets(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _projectEnvironmentIdMeta =
      const VerificationMeta('projectEnvironmentId');
  late final GeneratedColumn<String> projectEnvironmentId =
      GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _bucketMeta = const VerificationMeta('bucket');
  late final GeneratedColumn<String> bucket = GeneratedColumn<String>(
    'bucket',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    projectEnvironmentId,
    type,
    bucket,
    name,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environment_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectEnvironmentAsset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('project_environment_id')) {
      context.handle(
        _projectEnvironmentIdMeta,
        projectEnvironmentId.isAcceptableOrUnknown(
          data['project_environment_id']!,
          _projectEnvironmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectEnvironmentIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('bucket')) {
      context.handle(
        _bucketMeta,
        bucket.isAcceptableOrUnknown(data['bucket']!, _bucketMeta),
      );
    } else if (isInserting) {
      context.missing(_bucketMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('etag')) {
      context.handle(
        _etagMeta,
        etag.isAcceptableOrUnknown(data['etag']!, _etagMeta),
      );
    } else if (isInserting) {
      context.missing(_etagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {projectEnvironmentId, name};
  @override
  ProjectEnvironmentAsset map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironmentAsset(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      bucket:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}bucket'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  ProjectEnvironmentAssets createAlias(String alias) {
    return ProjectEnvironmentAssets(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(project_environment_id, name)',
    'CONSTRAINT fk_environment_assets_project_environment_id FOREIGN KEY(project_environment_id)REFERENCES project_environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentAsset extends DataClass
    implements Insertable<ProjectEnvironmentAsset> {
  /// The ID of the linked environment.
  final String projectEnvironmentId;

  /// The asset's type.
  final String type;

  /// The bucket storing the asset.
  final String bucket;

  /// The asset's name in the bucket.
  final String name;

  /// The asset's digest.
  final String etag;
  const ProjectEnvironmentAsset({
    required this.projectEnvironmentId,
    required this.type,
    required this.bucket,
    required this.name,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_environment_id'] = Variable<String>(projectEnvironmentId);
    map['type'] = Variable<String>(type);
    map['bucket'] = Variable<String>(bucket);
    map['name'] = Variable<String>(name);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  ProjectEnvironmentAssetsCompanion toCompanion(bool nullToAbsent) {
    return ProjectEnvironmentAssetsCompanion(
      projectEnvironmentId: Value(projectEnvironmentId),
      type: Value(type),
      bucket: Value(bucket),
      name: Value(name),
      etag: Value(etag),
    );
  }

  factory ProjectEnvironmentAsset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentAsset(
      projectEnvironmentId: serializer.fromJson<String>(
        json['project_environment_id'],
      ),
      type: serializer.fromJson<String>(json['type']),
      bucket: serializer.fromJson<String>(json['bucket']),
      name: serializer.fromJson<String>(json['name']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'project_environment_id': serializer.toJson<String>(projectEnvironmentId),
      'type': serializer.toJson<String>(type),
      'bucket': serializer.toJson<String>(bucket),
      'name': serializer.toJson<String>(name),
      'etag': serializer.toJson<String>(etag),
    };
  }

  ProjectEnvironmentAsset copyWith({
    String? projectEnvironmentId,
    String? type,
    String? bucket,
    String? name,
    String? etag,
  }) => ProjectEnvironmentAsset(
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    type: type ?? this.type,
    bucket: bucket ?? this.bucket,
    name: name ?? this.name,
    etag: etag ?? this.etag,
  );
  ProjectEnvironmentAsset copyWithCompanion(
    ProjectEnvironmentAssetsCompanion data,
  ) {
    return ProjectEnvironmentAsset(
      projectEnvironmentId:
          data.projectEnvironmentId.present
              ? data.projectEnvironmentId.value
              : this.projectEnvironmentId,
      type: data.type.present ? data.type.value : this.type,
      bucket: data.bucket.present ? data.bucket.value : this.bucket,
      name: data.name.present ? data.name.value : this.name,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAsset(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('type: $type, ')
          ..write('bucket: $bucket, ')
          ..write('name: $name, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(projectEnvironmentId, type, bucket, name, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironmentAsset &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          other.type == this.type &&
          other.bucket == this.bucket &&
          other.name == this.name &&
          other.etag == this.etag);
}

class ProjectEnvironmentAssetsCompanion
    extends UpdateCompanion<ProjectEnvironmentAsset> {
  final Value<String> projectEnvironmentId;
  final Value<String> type;
  final Value<String> bucket;
  final Value<String> name;
  final Value<String> etag;
  const ProjectEnvironmentAssetsCompanion({
    this.projectEnvironmentId = const Value.absent(),
    this.type = const Value.absent(),
    this.bucket = const Value.absent(),
    this.name = const Value.absent(),
    this.etag = const Value.absent(),
  });
  ProjectEnvironmentAssetsCompanion.insert({
    required String projectEnvironmentId,
    required String type,
    required String bucket,
    required String name,
    required String etag,
  }) : projectEnvironmentId = Value(projectEnvironmentId),
       type = Value(type),
       bucket = Value(bucket),
       name = Value(name),
       etag = Value(etag);
  static Insertable<ProjectEnvironmentAsset> custom({
    Expression<String>? projectEnvironmentId,
    Expression<String>? type,
    Expression<String>? bucket,
    Expression<String>? name,
    Expression<String>? etag,
  }) {
    return RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (type != null) 'type': type,
      if (bucket != null) 'bucket': bucket,
      if (name != null) 'name': name,
      if (etag != null) 'etag': etag,
    });
  }

  ProjectEnvironmentAssetsCompanion copyWith({
    Value<String>? projectEnvironmentId,
    Value<String>? type,
    Value<String>? bucket,
    Value<String>? name,
    Value<String>? etag,
  }) {
    return ProjectEnvironmentAssetsCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      type: type ?? this.type,
      bucket: bucket ?? this.bucket,
      name: name ?? this.name,
      etag: etag ?? this.etag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (bucket.present) {
      map['bucket'] = Variable<String>(bucket.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentAssetsCompanion(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('type: $type, ')
          ..write('bucket: $bucket, ')
          ..write('name: $name, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }
}

class CelestOperations extends Table
    with TableInfo<CelestOperations, CelestOperation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestOperations(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _responseMeta = const VerificationMeta(
    'response',
  );
  late final GeneratedColumn<String> response = GeneratedColumn<String>(
    'response',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    generatedAs: GeneratedAs(
      const CustomExpression('response IS NOT NULL OR error IS NOT NULL'),
      false,
    ),
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (response IS NOT NULL OR error IS NOT NULL) VIRTUAL',
  );
  static const VerificationMeta _createTimeMeta = const VerificationMeta(
    'createTime',
  );
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
    'create_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
    defaultValue: const CustomExpression('unixepoch(\'now\', \'subsec\')'),
  );
  static const VerificationMeta _fullResourceNameMeta = const VerificationMeta(
    'fullResourceName',
  );
  late final GeneratedColumn<String> fullResourceName = GeneratedColumn<String>(
    'full_resource_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _ownerTypeMeta = const VerificationMeta(
    'ownerType',
  );
  late final GeneratedColumn<String> ownerType = GeneratedColumn<String>(
    'owner_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _resourceTypeMeta = const VerificationMeta(
    'resourceType',
  );
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
    'resource_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _resourceIdMeta = const VerificationMeta(
    'resourceId',
  );
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
    'resource_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    metadata,
    response,
    error,
    done,
    createTime,
    fullResourceName,
    ownerType,
    ownerId,
    resourceType,
    resourceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_operations';
  @override
  VerificationContext validateIntegrity(
    Insertable<CelestOperation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    }
    if (data.containsKey('response')) {
      context.handle(
        _responseMeta,
        response.isAcceptableOrUnknown(data['response']!, _responseMeta),
      );
    }
    if (data.containsKey('error')) {
      context.handle(
        _errorMeta,
        error.isAcceptableOrUnknown(data['error']!, _errorMeta),
      );
    }
    if (data.containsKey('done')) {
      context.handle(
        _doneMeta,
        done.isAcceptableOrUnknown(data['done']!, _doneMeta),
      );
    }
    if (data.containsKey('create_time')) {
      context.handle(
        _createTimeMeta,
        createTime.isAcceptableOrUnknown(data['create_time']!, _createTimeMeta),
      );
    }
    if (data.containsKey('full_resource_name')) {
      context.handle(
        _fullResourceNameMeta,
        fullResourceName.isAcceptableOrUnknown(
          data['full_resource_name']!,
          _fullResourceNameMeta,
        ),
      );
    }
    if (data.containsKey('owner_type')) {
      context.handle(
        _ownerTypeMeta,
        ownerType.isAcceptableOrUnknown(data['owner_type']!, _ownerTypeMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    }
    if (data.containsKey('resource_type')) {
      context.handle(
        _resourceTypeMeta,
        resourceType.isAcceptableOrUnknown(
          data['resource_type']!,
          _resourceTypeMeta,
        ),
      );
    }
    if (data.containsKey('resource_id')) {
      context.handle(
        _resourceIdMeta,
        resourceId.isAcceptableOrUnknown(data['resource_id']!, _resourceIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CelestOperation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CelestOperation(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
      response: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response'],
      ),
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      done:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}done'],
          )!,
      createTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      fullResourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_resource_name'],
      ),
      ownerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_type'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      ),
      resourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_type'],
      ),
      resourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_id'],
      ),
    );
  }

  @override
  CelestOperations createAlias(String alias) {
    return CelestOperations(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CelestOperation extends DataClass implements Insertable<CelestOperation> {
  /// Immutable. The unique identifier for the organization.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: op_<typeid>
  final String id;

  /// Optional metadata associated with the operation.
  ///
  /// For all Celest operations, this will be a protobuf Any message
  /// wrapping the operation-specific metadata.
  ///
  /// Type: JSON
  /// JSON: google.protobuf.Any
  final String? metadata;

  /// The operation's response, present if the operation completed successfully.
  ///
  /// For all Celest operations, this will be a protobuf Any message
  /// wrapping the operation-specific response.
  ///
  /// Type: JSON
  /// JSON: google.protobuf.Any
  final String? response;

  /// The operation's error, present if the operation failed.
  ///
  /// For all Celest operations, this will be a google.rpc.Status message.
  ///
  /// Type: JSON
  /// JSON: google.rpc.Status
  final String? error;

  /// Whether the operation is done, meaning it hass reached a success or
  /// error state.
  final bool done;
  final DateTime createTime;

  /// The full resource name of the operation in GCP, including the project, location and service.
  ///
  /// Format: //cloudresourcemanager.googleapis.com/projects/<project>/locations/<location>/operations/<operation>
  final String? fullResourceName;

  /// The type of the operation's owner.
  ///
  /// For example, this could be `Celest::User`.
  final String? ownerType;

  /// The ID of the operation's owner.
  ///
  /// For example, this could be the ID of a user for a user operation.
  final String? ownerId;

  /// The type of the resource that the operation is associated with.
  ///
  /// For example, this could be `Celest::Function` for a function operation.
  final String? resourceType;

  /// The ID of the resource that the operation is associated with.
  ///
  /// For example, this could be the ID of a function for a function operation.
  final String? resourceId;
  const CelestOperation({
    required this.id,
    this.metadata,
    this.response,
    this.error,
    required this.done,
    required this.createTime,
    this.fullResourceName,
    this.ownerType,
    this.ownerId,
    this.resourceType,
    this.resourceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    if (!nullToAbsent || response != null) {
      map['response'] = Variable<String>(response);
    }
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || fullResourceName != null) {
      map['full_resource_name'] = Variable<String>(fullResourceName);
    }
    if (!nullToAbsent || ownerType != null) {
      map['owner_type'] = Variable<String>(ownerType);
    }
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = Variable<String>(ownerId);
    }
    if (!nullToAbsent || resourceType != null) {
      map['resource_type'] = Variable<String>(resourceType);
    }
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = Variable<String>(resourceId);
    }
    return map;
  }

  CelestOperationsCompanion toCompanion(bool nullToAbsent) {
    return CelestOperationsCompanion(
      id: Value(id),
      metadata:
          metadata == null && nullToAbsent
              ? const Value.absent()
              : Value(metadata),
      response:
          response == null && nullToAbsent
              ? const Value.absent()
              : Value(response),
      error:
          error == null && nullToAbsent ? const Value.absent() : Value(error),
      createTime: Value(createTime),
      fullResourceName:
          fullResourceName == null && nullToAbsent
              ? const Value.absent()
              : Value(fullResourceName),
      ownerType:
          ownerType == null && nullToAbsent
              ? const Value.absent()
              : Value(ownerType),
      ownerId:
          ownerId == null && nullToAbsent
              ? const Value.absent()
              : Value(ownerId),
      resourceType:
          resourceType == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceType),
      resourceId:
          resourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(resourceId),
    );
  }

  factory CelestOperation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CelestOperation(
      id: serializer.fromJson<String>(json['id']),
      metadata: serializer.fromJson<String?>(json['metadata']),
      response: serializer.fromJson<String?>(json['response']),
      error: serializer.fromJson<String?>(json['error']),
      done: serializer.fromJson<bool>(json['done']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      fullResourceName: serializer.fromJson<String?>(
        json['full_resource_name'],
      ),
      ownerType: serializer.fromJson<String?>(json['owner_type']),
      ownerId: serializer.fromJson<String?>(json['owner_id']),
      resourceType: serializer.fromJson<String?>(json['resource_type']),
      resourceId: serializer.fromJson<String?>(json['resource_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'metadata': serializer.toJson<String?>(metadata),
      'response': serializer.toJson<String?>(response),
      'error': serializer.toJson<String?>(error),
      'done': serializer.toJson<bool>(done),
      'create_time': serializer.toJson<DateTime>(createTime),
      'full_resource_name': serializer.toJson<String?>(fullResourceName),
      'owner_type': serializer.toJson<String?>(ownerType),
      'owner_id': serializer.toJson<String?>(ownerId),
      'resource_type': serializer.toJson<String?>(resourceType),
      'resource_id': serializer.toJson<String?>(resourceId),
    };
  }

  CelestOperation copyWith({
    String? id,
    Value<String?> metadata = const Value.absent(),
    Value<String?> response = const Value.absent(),
    Value<String?> error = const Value.absent(),
    bool? done,
    DateTime? createTime,
    Value<String?> fullResourceName = const Value.absent(),
    Value<String?> ownerType = const Value.absent(),
    Value<String?> ownerId = const Value.absent(),
    Value<String?> resourceType = const Value.absent(),
    Value<String?> resourceId = const Value.absent(),
  }) => CelestOperation(
    id: id ?? this.id,
    metadata: metadata.present ? metadata.value : this.metadata,
    response: response.present ? response.value : this.response,
    error: error.present ? error.value : this.error,
    done: done ?? this.done,
    createTime: createTime ?? this.createTime,
    fullResourceName:
        fullResourceName.present
            ? fullResourceName.value
            : this.fullResourceName,
    ownerType: ownerType.present ? ownerType.value : this.ownerType,
    ownerId: ownerId.present ? ownerId.value : this.ownerId,
    resourceType: resourceType.present ? resourceType.value : this.resourceType,
    resourceId: resourceId.present ? resourceId.value : this.resourceId,
  );
  @override
  String toString() {
    return (StringBuffer('CelestOperation(')
          ..write('id: $id, ')
          ..write('metadata: $metadata, ')
          ..write('response: $response, ')
          ..write('error: $error, ')
          ..write('done: $done, ')
          ..write('createTime: $createTime, ')
          ..write('fullResourceName: $fullResourceName, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    metadata,
    response,
    error,
    done,
    createTime,
    fullResourceName,
    ownerType,
    ownerId,
    resourceType,
    resourceId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CelestOperation &&
          other.id == this.id &&
          other.metadata == this.metadata &&
          other.response == this.response &&
          other.error == this.error &&
          other.done == this.done &&
          other.createTime == this.createTime &&
          other.fullResourceName == this.fullResourceName &&
          other.ownerType == this.ownerType &&
          other.ownerId == this.ownerId &&
          other.resourceType == this.resourceType &&
          other.resourceId == this.resourceId);
}

class CelestOperationsCompanion extends UpdateCompanion<CelestOperation> {
  final Value<String> id;
  final Value<String?> metadata;
  final Value<String?> response;
  final Value<String?> error;
  final Value<DateTime> createTime;
  final Value<String?> fullResourceName;
  final Value<String?> ownerType;
  final Value<String?> ownerId;
  final Value<String?> resourceType;
  final Value<String?> resourceId;
  final Value<int> rowid;
  const CelestOperationsCompanion({
    this.id = const Value.absent(),
    this.metadata = const Value.absent(),
    this.response = const Value.absent(),
    this.error = const Value.absent(),
    this.createTime = const Value.absent(),
    this.fullResourceName = const Value.absent(),
    this.ownerType = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CelestOperationsCompanion.insert({
    required String id,
    this.metadata = const Value.absent(),
    this.response = const Value.absent(),
    this.error = const Value.absent(),
    this.createTime = const Value.absent(),
    this.fullResourceName = const Value.absent(),
    this.ownerType = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CelestOperation> custom({
    Expression<String>? id,
    Expression<String>? metadata,
    Expression<String>? response,
    Expression<String>? error,
    Expression<DateTime>? createTime,
    Expression<String>? fullResourceName,
    Expression<String>? ownerType,
    Expression<String>? ownerId,
    Expression<String>? resourceType,
    Expression<String>? resourceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (metadata != null) 'metadata': metadata,
      if (response != null) 'response': response,
      if (error != null) 'error': error,
      if (createTime != null) 'create_time': createTime,
      if (fullResourceName != null) 'full_resource_name': fullResourceName,
      if (ownerType != null) 'owner_type': ownerType,
      if (ownerId != null) 'owner_id': ownerId,
      if (resourceType != null) 'resource_type': resourceType,
      if (resourceId != null) 'resource_id': resourceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CelestOperationsCompanion copyWith({
    Value<String>? id,
    Value<String?>? metadata,
    Value<String?>? response,
    Value<String?>? error,
    Value<DateTime>? createTime,
    Value<String?>? fullResourceName,
    Value<String?>? ownerType,
    Value<String?>? ownerId,
    Value<String?>? resourceType,
    Value<String?>? resourceId,
    Value<int>? rowid,
  }) {
    return CelestOperationsCompanion(
      id: id ?? this.id,
      metadata: metadata ?? this.metadata,
      response: response ?? this.response,
      error: error ?? this.error,
      createTime: createTime ?? this.createTime,
      fullResourceName: fullResourceName ?? this.fullResourceName,
      ownerType: ownerType ?? this.ownerType,
      ownerId: ownerId ?? this.ownerId,
      resourceType: resourceType ?? this.resourceType,
      resourceId: resourceId ?? this.resourceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (response.present) {
      map['response'] = Variable<String>(response.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (fullResourceName.present) {
      map['full_resource_name'] = Variable<String>(fullResourceName.value);
    }
    if (ownerType.present) {
      map['owner_type'] = Variable<String>(ownerType.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CelestOperationsCompanion(')
          ..write('id: $id, ')
          ..write('metadata: $metadata, ')
          ..write('response: $response, ')
          ..write('error: $error, ')
          ..write('createTime: $createTime, ')
          ..write('fullResourceName: $fullResourceName, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CloudHubDatabase extends GeneratedDatabase {
  _$CloudHubDatabase(QueryExecutor e) : super(e);
  $CloudHubDatabaseManager get managers => $CloudHubDatabaseManager(this);
  late final ProjectEnvironments projectEnvironments = ProjectEnvironments(
    this,
  );
  late final Trigger projectEnvironmentsTriggerUpdateTime = Trigger(
    'CREATE TRIGGER IF NOT EXISTS project_environments_trigger_update_time AFTER UPDATE ON project_environments BEGIN UPDATE project_environments SET update_time = unixepoch(\'now\', \'subsec\') WHERE id = OLD.id;END',
    'project_environments_trigger_update_time',
  );
  late final ProjectEnvironmentAsts projectEnvironmentAsts =
      ProjectEnvironmentAsts(this);
  late final ProjectEnvironmentAssets projectEnvironmentAssets =
      ProjectEnvironmentAssets(this);
  late final CelestOperations celestOperations = CelestOperations(this);
  Selectable<CelestOperation> getOperation({required String id}) {
    return customSelect(
      'SELECT * FROM celest_operations WHERE id = ?1',
      variables: [Variable<String>(id)],
      readsFrom: {celestOperations},
    ).asyncMap(celestOperations.mapFromRow);
  }

  Future<List<CelestOperation>> createOperation({
    required String id,
    String? metadata,
    String? response,
    String? error,
    String? fullResourceName,
    String? ownerType,
    String? ownerId,
    String? resourceType,
    String? resourceId,
  }) {
    return customWriteReturning(
      'INSERT INTO celest_operations (id, metadata, response, error, full_resource_name, owner_type, owner_id, resource_type, resource_id) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9) RETURNING *',
      variables: [
        Variable<String>(id),
        Variable<String>(metadata),
        Variable<String>(response),
        Variable<String>(error),
        Variable<String>(fullResourceName),
        Variable<String>(ownerType),
        Variable<String>(ownerId),
        Variable<String>(resourceType),
        Variable<String>(resourceId),
      ],
      updates: {celestOperations},
    ).then((rows) => Future.wait(rows.map(celestOperations.mapFromRow)));
  }

  Future<List<CelestOperation>> updateOperation({
    String? metadata,
    String? response,
    String? error,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE celest_operations SET metadata = coalesce(?1, metadata), response = coalesce(?2, response), error = coalesce(?3, error) WHERE id = ?4 RETURNING *',
      variables: [
        Variable<String>(metadata),
        Variable<String>(response),
        Variable<String>(error),
        Variable<String>(id),
      ],
      updates: {celestOperations},
      updateKind: UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(celestOperations.mapFromRow)));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    projectEnvironments,
    projectEnvironmentsTriggerUpdateTime,
    projectEnvironmentAsts,
    projectEnvironmentAssets,
    celestOperations,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('project_environments', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('project_environment_asts', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('project_environment_asts', kind: UpdateKind.update),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('project_environment_assets', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('project_environment_assets', kind: UpdateKind.update),
      ],
    ),
  ]);
}

typedef $ProjectEnvironmentsCreateCompanionBuilder =
    ProjectEnvironmentsCompanion Function({
      required String id,
      Value<String?> parentType,
      Value<String?> parentId,
      required String projectEnvironmentId,
      Value<LifecycleState> state,
      Value<String?> displayName,
      Value<DateTime> createTime,
      Value<DateTime> updateTime,
      Value<DateTime?> deleteTime,
      Value<String?> annotations,
      Value<int> rowid,
    });
typedef $ProjectEnvironmentsUpdateCompanionBuilder =
    ProjectEnvironmentsCompanion Function({
      Value<String> id,
      Value<String?> parentType,
      Value<String?> parentId,
      Value<String> projectEnvironmentId,
      Value<LifecycleState> state,
      Value<String?> displayName,
      Value<DateTime> createTime,
      Value<DateTime> updateTime,
      Value<DateTime?> deleteTime,
      Value<String?> annotations,
      Value<int> rowid,
    });

class $ProjectEnvironmentsFilterComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironments> {
  $ProjectEnvironmentsFilterComposer({
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

  ColumnFilters<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LifecycleState, LifecycleState, int>
  get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deleteTime => $composableBuilder(
    column: $table.deleteTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get annotations => $composableBuilder(
    column: $table.annotations,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProjectEnvironmentsOrderingComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironments> {
  $ProjectEnvironmentsOrderingComposer({
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

  ColumnOrderings<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deleteTime => $composableBuilder(
    column: $table.deleteTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get annotations => $composableBuilder(
    column: $table.annotations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProjectEnvironmentsAnnotationComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironments> {
  $ProjectEnvironmentsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<LifecycleState, int> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deleteTime => $composableBuilder(
    column: $table.deleteTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get annotations => $composableBuilder(
    column: $table.annotations,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => column,
  );

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $ProjectEnvironmentsTableManager
    extends
        RootTableManager<
          _$CloudHubDatabase,
          ProjectEnvironments,
          ProjectEnvironment,
          $ProjectEnvironmentsFilterComposer,
          $ProjectEnvironmentsOrderingComposer,
          $ProjectEnvironmentsAnnotationComposer,
          $ProjectEnvironmentsCreateCompanionBuilder,
          $ProjectEnvironmentsUpdateCompanionBuilder,
          (
            ProjectEnvironment,
            BaseReferences<
              _$CloudHubDatabase,
              ProjectEnvironments,
              ProjectEnvironment
            >,
          ),
          ProjectEnvironment,
          PrefetchHooks Function()
        > {
  $ProjectEnvironmentsTableManager(
    _$CloudHubDatabase db,
    ProjectEnvironments table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $ProjectEnvironmentsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $ProjectEnvironmentsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $ProjectEnvironmentsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> parentType = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<String> projectEnvironmentId = const Value.absent(),
                Value<LifecycleState> state = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<DateTime> createTime = const Value.absent(),
                Value<DateTime> updateTime = const Value.absent(),
                Value<DateTime?> deleteTime = const Value.absent(),
                Value<String?> annotations = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEnvironmentsCompanion(
                id: id,
                parentType: parentType,
                parentId: parentId,
                projectEnvironmentId: projectEnvironmentId,
                state: state,
                displayName: displayName,
                createTime: createTime,
                updateTime: updateTime,
                deleteTime: deleteTime,
                annotations: annotations,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> parentType = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                required String projectEnvironmentId,
                Value<LifecycleState> state = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<DateTime> createTime = const Value.absent(),
                Value<DateTime> updateTime = const Value.absent(),
                Value<DateTime?> deleteTime = const Value.absent(),
                Value<String?> annotations = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEnvironmentsCompanion.insert(
                id: id,
                parentType: parentType,
                parentId: parentId,
                projectEnvironmentId: projectEnvironmentId,
                state: state,
                displayName: displayName,
                createTime: createTime,
                updateTime: updateTime,
                deleteTime: deleteTime,
                annotations: annotations,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
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

typedef $ProjectEnvironmentsProcessedTableManager =
    ProcessedTableManager<
      _$CloudHubDatabase,
      ProjectEnvironments,
      ProjectEnvironment,
      $ProjectEnvironmentsFilterComposer,
      $ProjectEnvironmentsOrderingComposer,
      $ProjectEnvironmentsAnnotationComposer,
      $ProjectEnvironmentsCreateCompanionBuilder,
      $ProjectEnvironmentsUpdateCompanionBuilder,
      (
        ProjectEnvironment,
        BaseReferences<
          _$CloudHubDatabase,
          ProjectEnvironments,
          ProjectEnvironment
        >,
      ),
      ProjectEnvironment,
      PrefetchHooks Function()
    >;
typedef $ProjectEnvironmentAstsCreateCompanionBuilder =
    ProjectEnvironmentAstsCompanion Function({
      required String projectEnvironmentId,
      required Uint8List ast,
      required int version,
    });
typedef $ProjectEnvironmentAstsUpdateCompanionBuilder =
    ProjectEnvironmentAstsCompanion Function({
      Value<String> projectEnvironmentId,
      Value<Uint8List> ast,
      Value<int> version,
    });

class $ProjectEnvironmentAstsFilterComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironmentAsts> {
  $ProjectEnvironmentAstsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get ast => $composableBuilder(
    column: $table.ast,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get digest => $composableBuilder(
    column: $table.digest,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProjectEnvironmentAstsOrderingComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironmentAsts> {
  $ProjectEnvironmentAstsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get ast => $composableBuilder(
    column: $table.ast,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get digest => $composableBuilder(
    column: $table.digest,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProjectEnvironmentAstsAnnotationComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironmentAsts> {
  $ProjectEnvironmentAstsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => column,
  );

  GeneratedColumn<Uint8List> get ast =>
      $composableBuilder(column: $table.ast, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get digest =>
      $composableBuilder(column: $table.digest, builder: (column) => column);
}

class $ProjectEnvironmentAstsTableManager
    extends
        RootTableManager<
          _$CloudHubDatabase,
          ProjectEnvironmentAsts,
          ProjectEnvironmentAst,
          $ProjectEnvironmentAstsFilterComposer,
          $ProjectEnvironmentAstsOrderingComposer,
          $ProjectEnvironmentAstsAnnotationComposer,
          $ProjectEnvironmentAstsCreateCompanionBuilder,
          $ProjectEnvironmentAstsUpdateCompanionBuilder,
          (
            ProjectEnvironmentAst,
            BaseReferences<
              _$CloudHubDatabase,
              ProjectEnvironmentAsts,
              ProjectEnvironmentAst
            >,
          ),
          ProjectEnvironmentAst,
          PrefetchHooks Function()
        > {
  $ProjectEnvironmentAstsTableManager(
    _$CloudHubDatabase db,
    ProjectEnvironmentAsts table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $ProjectEnvironmentAstsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $ProjectEnvironmentAstsOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $ProjectEnvironmentAstsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> projectEnvironmentId = const Value.absent(),
                Value<Uint8List> ast = const Value.absent(),
                Value<int> version = const Value.absent(),
              }) => ProjectEnvironmentAstsCompanion(
                projectEnvironmentId: projectEnvironmentId,
                ast: ast,
                version: version,
              ),
          createCompanionCallback:
              ({
                required String projectEnvironmentId,
                required Uint8List ast,
                required int version,
              }) => ProjectEnvironmentAstsCompanion.insert(
                projectEnvironmentId: projectEnvironmentId,
                ast: ast,
                version: version,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
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

typedef $ProjectEnvironmentAstsProcessedTableManager =
    ProcessedTableManager<
      _$CloudHubDatabase,
      ProjectEnvironmentAsts,
      ProjectEnvironmentAst,
      $ProjectEnvironmentAstsFilterComposer,
      $ProjectEnvironmentAstsOrderingComposer,
      $ProjectEnvironmentAstsAnnotationComposer,
      $ProjectEnvironmentAstsCreateCompanionBuilder,
      $ProjectEnvironmentAstsUpdateCompanionBuilder,
      (
        ProjectEnvironmentAst,
        BaseReferences<
          _$CloudHubDatabase,
          ProjectEnvironmentAsts,
          ProjectEnvironmentAst
        >,
      ),
      ProjectEnvironmentAst,
      PrefetchHooks Function()
    >;
typedef $ProjectEnvironmentAssetsCreateCompanionBuilder =
    ProjectEnvironmentAssetsCompanion Function({
      required String projectEnvironmentId,
      required String type,
      required String bucket,
      required String name,
      required String etag,
    });
typedef $ProjectEnvironmentAssetsUpdateCompanionBuilder =
    ProjectEnvironmentAssetsCompanion Function({
      Value<String> projectEnvironmentId,
      Value<String> type,
      Value<String> bucket,
      Value<String> name,
      Value<String> etag,
    });

class $ProjectEnvironmentAssetsFilterComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironmentAssets> {
  $ProjectEnvironmentAssetsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bucket => $composableBuilder(
    column: $table.bucket,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProjectEnvironmentAssetsOrderingComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironmentAssets> {
  $ProjectEnvironmentAssetsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bucket => $composableBuilder(
    column: $table.bucket,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProjectEnvironmentAssetsAnnotationComposer
    extends Composer<_$CloudHubDatabase, ProjectEnvironmentAssets> {
  $ProjectEnvironmentAssetsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get bucket =>
      $composableBuilder(column: $table.bucket, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $ProjectEnvironmentAssetsTableManager
    extends
        RootTableManager<
          _$CloudHubDatabase,
          ProjectEnvironmentAssets,
          ProjectEnvironmentAsset,
          $ProjectEnvironmentAssetsFilterComposer,
          $ProjectEnvironmentAssetsOrderingComposer,
          $ProjectEnvironmentAssetsAnnotationComposer,
          $ProjectEnvironmentAssetsCreateCompanionBuilder,
          $ProjectEnvironmentAssetsUpdateCompanionBuilder,
          (
            ProjectEnvironmentAsset,
            BaseReferences<
              _$CloudHubDatabase,
              ProjectEnvironmentAssets,
              ProjectEnvironmentAsset
            >,
          ),
          ProjectEnvironmentAsset,
          PrefetchHooks Function()
        > {
  $ProjectEnvironmentAssetsTableManager(
    _$CloudHubDatabase db,
    ProjectEnvironmentAssets table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $ProjectEnvironmentAssetsFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $ProjectEnvironmentAssetsOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $ProjectEnvironmentAssetsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> projectEnvironmentId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> bucket = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> etag = const Value.absent(),
              }) => ProjectEnvironmentAssetsCompanion(
                projectEnvironmentId: projectEnvironmentId,
                type: type,
                bucket: bucket,
                name: name,
                etag: etag,
              ),
          createCompanionCallback:
              ({
                required String projectEnvironmentId,
                required String type,
                required String bucket,
                required String name,
                required String etag,
              }) => ProjectEnvironmentAssetsCompanion.insert(
                projectEnvironmentId: projectEnvironmentId,
                type: type,
                bucket: bucket,
                name: name,
                etag: etag,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
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

typedef $ProjectEnvironmentAssetsProcessedTableManager =
    ProcessedTableManager<
      _$CloudHubDatabase,
      ProjectEnvironmentAssets,
      ProjectEnvironmentAsset,
      $ProjectEnvironmentAssetsFilterComposer,
      $ProjectEnvironmentAssetsOrderingComposer,
      $ProjectEnvironmentAssetsAnnotationComposer,
      $ProjectEnvironmentAssetsCreateCompanionBuilder,
      $ProjectEnvironmentAssetsUpdateCompanionBuilder,
      (
        ProjectEnvironmentAsset,
        BaseReferences<
          _$CloudHubDatabase,
          ProjectEnvironmentAssets,
          ProjectEnvironmentAsset
        >,
      ),
      ProjectEnvironmentAsset,
      PrefetchHooks Function()
    >;
typedef $CelestOperationsCreateCompanionBuilder =
    CelestOperationsCompanion Function({
      required String id,
      Value<String?> metadata,
      Value<String?> response,
      Value<String?> error,
      Value<DateTime> createTime,
      Value<String?> fullResourceName,
      Value<String?> ownerType,
      Value<String?> ownerId,
      Value<String?> resourceType,
      Value<String?> resourceId,
      Value<int> rowid,
    });
typedef $CelestOperationsUpdateCompanionBuilder =
    CelestOperationsCompanion Function({
      Value<String> id,
      Value<String?> metadata,
      Value<String?> response,
      Value<String?> error,
      Value<DateTime> createTime,
      Value<String?> fullResourceName,
      Value<String?> ownerType,
      Value<String?> ownerId,
      Value<String?> resourceType,
      Value<String?> resourceId,
      Value<int> rowid,
    });

class $CelestOperationsFilterComposer
    extends Composer<_$CloudHubDatabase, CelestOperations> {
  $CelestOperationsFilterComposer({
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

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get response => $composableBuilder(
    column: $table.response,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullResourceName => $composableBuilder(
    column: $table.fullResourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resourceType => $composableBuilder(
    column: $table.resourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resourceId => $composableBuilder(
    column: $table.resourceId,
    builder: (column) => ColumnFilters(column),
  );
}

class $CelestOperationsOrderingComposer
    extends Composer<_$CloudHubDatabase, CelestOperations> {
  $CelestOperationsOrderingComposer({
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

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get response => $composableBuilder(
    column: $table.response,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullResourceName => $composableBuilder(
    column: $table.fullResourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resourceType => $composableBuilder(
    column: $table.resourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resourceId => $composableBuilder(
    column: $table.resourceId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CelestOperationsAnnotationComposer
    extends Composer<_$CloudHubDatabase, CelestOperations> {
  $CelestOperationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<String> get response =>
      $composableBuilder(column: $table.response, builder: (column) => column);

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullResourceName => $composableBuilder(
    column: $table.fullResourceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerType =>
      $composableBuilder(column: $table.ownerType, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get resourceType => $composableBuilder(
    column: $table.resourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resourceId => $composableBuilder(
    column: $table.resourceId,
    builder: (column) => column,
  );
}

class $CelestOperationsTableManager
    extends
        RootTableManager<
          _$CloudHubDatabase,
          CelestOperations,
          CelestOperation,
          $CelestOperationsFilterComposer,
          $CelestOperationsOrderingComposer,
          $CelestOperationsAnnotationComposer,
          $CelestOperationsCreateCompanionBuilder,
          $CelestOperationsUpdateCompanionBuilder,
          (
            CelestOperation,
            BaseReferences<
              _$CloudHubDatabase,
              CelestOperations,
              CelestOperation
            >,
          ),
          CelestOperation,
          PrefetchHooks Function()
        > {
  $CelestOperationsTableManager(_$CloudHubDatabase db, CelestOperations table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $CelestOperationsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $CelestOperationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $CelestOperationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<String?> response = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<DateTime> createTime = const Value.absent(),
                Value<String?> fullResourceName = const Value.absent(),
                Value<String?> ownerType = const Value.absent(),
                Value<String?> ownerId = const Value.absent(),
                Value<String?> resourceType = const Value.absent(),
                Value<String?> resourceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CelestOperationsCompanion(
                id: id,
                metadata: metadata,
                response: response,
                error: error,
                createTime: createTime,
                fullResourceName: fullResourceName,
                ownerType: ownerType,
                ownerId: ownerId,
                resourceType: resourceType,
                resourceId: resourceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> metadata = const Value.absent(),
                Value<String?> response = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<DateTime> createTime = const Value.absent(),
                Value<String?> fullResourceName = const Value.absent(),
                Value<String?> ownerType = const Value.absent(),
                Value<String?> ownerId = const Value.absent(),
                Value<String?> resourceType = const Value.absent(),
                Value<String?> resourceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CelestOperationsCompanion.insert(
                id: id,
                metadata: metadata,
                response: response,
                error: error,
                createTime: createTime,
                fullResourceName: fullResourceName,
                ownerType: ownerType,
                ownerId: ownerId,
                resourceType: resourceType,
                resourceId: resourceId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
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

typedef $CelestOperationsProcessedTableManager =
    ProcessedTableManager<
      _$CloudHubDatabase,
      CelestOperations,
      CelestOperation,
      $CelestOperationsFilterComposer,
      $CelestOperationsOrderingComposer,
      $CelestOperationsAnnotationComposer,
      $CelestOperationsCreateCompanionBuilder,
      $CelestOperationsUpdateCompanionBuilder,
      (
        CelestOperation,
        BaseReferences<_$CloudHubDatabase, CelestOperations, CelestOperation>,
      ),
      CelestOperation,
      PrefetchHooks Function()
    >;

class $CloudHubDatabaseManager {
  final _$CloudHubDatabase _db;
  $CloudHubDatabaseManager(this._db);
  $ProjectEnvironmentsTableManager get projectEnvironments =>
      $ProjectEnvironmentsTableManager(_db, _db.projectEnvironments);
  $ProjectEnvironmentAstsTableManager get projectEnvironmentAsts =>
      $ProjectEnvironmentAstsTableManager(_db, _db.projectEnvironmentAsts);
  $ProjectEnvironmentAssetsTableManager get projectEnvironmentAssets =>
      $ProjectEnvironmentAssetsTableManager(_db, _db.projectEnvironmentAssets);
  $CelestOperationsTableManager get celestOperations =>
      $CelestOperationsTableManager(_db, _db.celestOperations);
}
