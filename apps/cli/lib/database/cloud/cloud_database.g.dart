// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_database.dart';

// ignore_for_file: type=lint
class Organizations extends Table with TableInfo<Organizations, Organization> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Organizations(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> primaryRegion = GeneratedColumn<String>(
    'primary_region',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
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
    id,
    organizationId,
    displayName,
    primaryRegion,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organizations';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Organization map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Organization(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      organizationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}organization_id'],
          )!,
      displayName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}display_name'],
          )!,
      primaryRegion:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}primary_region'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  Organizations createAlias(String alias) {
    return Organizations(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Organization extends DataClass implements Insertable<Organization> {
  /// Immutable. The unique identifier for the organization.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: org_<typeid>
  final String id;

  /// The primary alias for the organization.
  final String organizationId;

  /// A human-readable name for the organization.
  final String displayName;

  /// The organization's primary region.
  final String primaryRegion;

  /// The organization's etag.
  final String etag;
  const Organization({
    required this.id,
    required this.organizationId,
    required this.displayName,
    required this.primaryRegion,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['organization_id'] = Variable<String>(organizationId);
    map['display_name'] = Variable<String>(displayName);
    map['primary_region'] = Variable<String>(primaryRegion);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  factory Organization.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Organization(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String>(json['organization_id']),
      displayName: serializer.fromJson<String>(json['display_name']),
      primaryRegion: serializer.fromJson<String>(json['primary_region']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organization_id': serializer.toJson<String>(organizationId),
      'display_name': serializer.toJson<String>(displayName),
      'primary_region': serializer.toJson<String>(primaryRegion),
      'etag': serializer.toJson<String>(etag),
    };
  }

  Organization copyWith({
    String? id,
    String? organizationId,
    String? displayName,
    String? primaryRegion,
    String? etag,
  }) => Organization(
    id: id ?? this.id,
    organizationId: organizationId ?? this.organizationId,
    displayName: displayName ?? this.displayName,
    primaryRegion: primaryRegion ?? this.primaryRegion,
    etag: etag ?? this.etag,
  );
  Organization copyWithCompanion(OrganizationsCompanion data) {
    return Organization(
      id: data.id.present ? data.id.value : this.id,
      organizationId:
          data.organizationId.present
              ? data.organizationId.value
              : this.organizationId,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      primaryRegion:
          data.primaryRegion.present
              ? data.primaryRegion.value
              : this.primaryRegion,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Organization(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('displayName: $displayName, ')
          ..write('primaryRegion: $primaryRegion, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, organizationId, displayName, primaryRegion, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Organization &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.displayName == this.displayName &&
          other.primaryRegion == this.primaryRegion &&
          other.etag == this.etag);
}

class OrganizationsCompanion extends UpdateCompanion<Organization> {
  final Value<String> id;
  final Value<String> organizationId;
  final Value<String> displayName;
  final Value<String> primaryRegion;
  final Value<String> etag;
  final Value<int> rowid;
  const OrganizationsCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.displayName = const Value.absent(),
    this.primaryRegion = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrganizationsCompanion.insert({
    required String id,
    required String organizationId,
    required String displayName,
    required String primaryRegion,
    required String etag,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       organizationId = Value(organizationId),
       displayName = Value(displayName),
       primaryRegion = Value(primaryRegion),
       etag = Value(etag);
  static Insertable<Organization> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? displayName,
    Expression<String>? primaryRegion,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (displayName != null) 'display_name': displayName,
      if (primaryRegion != null) 'primary_region': primaryRegion,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrganizationsCompanion copyWith({
    Value<String>? id,
    Value<String>? organizationId,
    Value<String>? displayName,
    Value<String>? primaryRegion,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return OrganizationsCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      displayName: displayName ?? this.displayName,
      primaryRegion: primaryRegion ?? this.primaryRegion,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (primaryRegion.present) {
      map['primary_region'] = Variable<String>(primaryRegion.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationsCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('displayName: $displayName, ')
          ..write('primaryRegion: $primaryRegion, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Projects extends Table with TableInfo<Projects, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Projects(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
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
    id,
    organizationId,
    projectId,
    displayName,
    region,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      organizationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}organization_id'],
          )!,
      projectId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      region:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}region'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  Projects createAlias(String alias) {
    return Projects(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT fk_organization_id FOREIGN KEY(organization_id)REFERENCES organizations(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Project extends DataClass implements Insertable<Project> {
  /// Immutable. The unique identifier for the project.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: prj_<typeid>
  final String id;

  /// The organizaton that the project belongs to.
  final String organizationId;

  /// The primary alias for the project.
  final String projectId;

  /// A human-readable name for the project.
  final String? displayName;

  /// The project's region.
  final String region;

  /// The project's etag.
  final String etag;
  const Project({
    required this.id,
    required this.organizationId,
    required this.projectId,
    this.displayName,
    required this.region,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['organization_id'] = Variable<String>(organizationId);
    map['project_id'] = Variable<String>(projectId);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    map['region'] = Variable<String>(region);
    map['etag'] = Variable<String>(etag);
    return map;
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String>(json['organization_id']),
      projectId: serializer.fromJson<String>(json['project_id']),
      displayName: serializer.fromJson<String?>(json['display_name']),
      region: serializer.fromJson<String>(json['region']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organization_id': serializer.toJson<String>(organizationId),
      'project_id': serializer.toJson<String>(projectId),
      'display_name': serializer.toJson<String?>(displayName),
      'region': serializer.toJson<String>(region),
      'etag': serializer.toJson<String>(etag),
    };
  }

  Project copyWith({
    String? id,
    String? organizationId,
    String? projectId,
    Value<String?> displayName = const Value.absent(),
    String? region,
    String? etag,
  }) => Project(
    id: id ?? this.id,
    organizationId: organizationId ?? this.organizationId,
    projectId: projectId ?? this.projectId,
    displayName: displayName.present ? displayName.value : this.displayName,
    region: region ?? this.region,
    etag: etag ?? this.etag,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      organizationId:
          data.organizationId.present
              ? data.organizationId.value
              : this.organizationId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      region: data.region.present ? data.region.value : this.region,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('projectId: $projectId, ')
          ..write('displayName: $displayName, ')
          ..write('region: $region, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, organizationId, projectId, displayName, region, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.projectId == this.projectId &&
          other.displayName == this.displayName &&
          other.region == this.region &&
          other.etag == this.etag);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> id;
  final Value<String> organizationId;
  final Value<String> projectId;
  final Value<String?> displayName;
  final Value<String> region;
  final Value<String> etag;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.displayName = const Value.absent(),
    this.region = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String organizationId,
    required String projectId,
    this.displayName = const Value.absent(),
    required String region,
    required String etag,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       organizationId = Value(organizationId),
       projectId = Value(projectId),
       region = Value(region),
       etag = Value(etag);
  static Insertable<Project> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? projectId,
    Expression<String>? displayName,
    Expression<String>? region,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (projectId != null) 'project_id': projectId,
      if (displayName != null) 'display_name': displayName,
      if (region != null) 'region': region,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? organizationId,
    Value<String>? projectId,
    Value<String?>? displayName,
    Value<String>? region,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      projectId: projectId ?? this.projectId,
      displayName: displayName ?? this.displayName,
      region: region ?? this.region,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('projectId: $projectId, ')
          ..write('displayName: $displayName, ')
          ..write('region: $region, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironments extends Table
    with TableInfo<ProjectEnvironments, ProjectEnvironment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironments(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> environmentId = GeneratedColumn<String>(
    'environment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
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
    id,
    projectId,
    environmentId,
    displayName,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environments';
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
      projectId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      environmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}environment_id'],
          )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
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

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT fk_project_id FOREIGN KEY(project_id)REFERENCES projects(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironment extends DataClass
    implements Insertable<ProjectEnvironment> {
  /// Immutable. The unique identifier for the environment.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: env_<typeid>
  final String id;

  /// The project that the environment belongs to.
  final String projectId;

  /// The primary alias for the environment.
  final String environmentId;

  /// A human-readable name for the environment.
  final String? displayName;

  /// The environment's etag.
  final String etag;
  const ProjectEnvironment({
    required this.id,
    required this.projectId,
    required this.environmentId,
    this.displayName,
    required this.etag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['environment_id'] = Variable<String>(environmentId);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    map['etag'] = Variable<String>(etag);
    return map;
  }

  factory ProjectEnvironment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironment(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['project_id']),
      environmentId: serializer.fromJson<String>(json['environment_id']),
      displayName: serializer.fromJson<String?>(json['display_name']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'project_id': serializer.toJson<String>(projectId),
      'environment_id': serializer.toJson<String>(environmentId),
      'display_name': serializer.toJson<String?>(displayName),
      'etag': serializer.toJson<String>(etag),
    };
  }

  ProjectEnvironment copyWith({
    String? id,
    String? projectId,
    String? environmentId,
    Value<String?> displayName = const Value.absent(),
    String? etag,
  }) => ProjectEnvironment(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    environmentId: environmentId ?? this.environmentId,
    displayName: displayName.present ? displayName.value : this.displayName,
    etag: etag ?? this.etag,
  );
  ProjectEnvironment copyWithCompanion(ProjectEnvironmentsCompanion data) {
    return ProjectEnvironment(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      environmentId:
          data.environmentId.present
              ? data.environmentId.value
              : this.environmentId,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironment(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('environmentId: $environmentId, ')
          ..write('displayName: $displayName, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, environmentId, displayName, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironment &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.environmentId == this.environmentId &&
          other.displayName == this.displayName &&
          other.etag == this.etag);
}

class ProjectEnvironmentsCompanion extends UpdateCompanion<ProjectEnvironment> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> environmentId;
  final Value<String?> displayName;
  final Value<String> etag;
  final Value<int> rowid;
  const ProjectEnvironmentsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.environmentId = const Value.absent(),
    this.displayName = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectEnvironmentsCompanion.insert({
    required String id,
    required String projectId,
    required String environmentId,
    this.displayName = const Value.absent(),
    required String etag,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       environmentId = Value(environmentId),
       etag = Value(etag);
  static Insertable<ProjectEnvironment> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? environmentId,
    Expression<String>? displayName,
    Expression<String>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (environmentId != null) 'environment_id': environmentId,
      if (displayName != null) 'display_name': displayName,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectEnvironmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? environmentId,
    Value<String?>? displayName,
    Value<String>? etag,
    Value<int>? rowid,
  }) {
    return ProjectEnvironmentsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      environmentId: environmentId ?? this.environmentId,
      displayName: displayName ?? this.displayName,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (environmentId.present) {
      map['environment_id'] = Variable<String>(environmentId.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
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
          ..write('projectId: $projectId, ')
          ..write('environmentId: $environmentId, ')
          ..write('displayName: $displayName, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironmentConfig extends Table
    with TableInfo<ProjectEnvironmentConfig, ProjectEnvironmentConfigData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentConfig(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> environmentId = GeneratedColumn<String>(
    'environment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final GeneratedColumn<String> baseUri = GeneratedColumn<String>(
    'base_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> databaseHost = GeneratedColumn<String>(
    'database_host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> databaseTokenRef = GeneratedColumn<String>(
    'database_token_ref',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    environmentId,
    baseUri,
    databaseHost,
    databaseTokenRef,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environment_config';
  @override
  Set<GeneratedColumn> get $primaryKey => {environmentId};
  @override
  ProjectEnvironmentConfigData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEnvironmentConfigData(
      environmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}environment_id'],
          )!,
      baseUri:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}base_uri'],
          )!,
      databaseHost:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}database_host'],
          )!,
      databaseTokenRef:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}database_token_ref'],
          )!,
    );
  }

  @override
  ProjectEnvironmentConfig createAlias(String alias) {
    return ProjectEnvironmentConfig(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT fk_environment_id FOREIGN KEY(environment_id)REFERENCES project_environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentConfigData extends DataClass
    implements Insertable<ProjectEnvironmentConfigData> {
  /// The environment that the configuration belongs to.
  final String environmentId;

  /// The environment's base URI.
  final String baseUri;

  /// The database host.
  final String databaseHost;

  /// The database token reference (a path in secure storage).
  final String databaseTokenRef;
  const ProjectEnvironmentConfigData({
    required this.environmentId,
    required this.baseUri,
    required this.databaseHost,
    required this.databaseTokenRef,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['environment_id'] = Variable<String>(environmentId);
    map['base_uri'] = Variable<String>(baseUri);
    map['database_host'] = Variable<String>(databaseHost);
    map['database_token_ref'] = Variable<String>(databaseTokenRef);
    return map;
  }

  factory ProjectEnvironmentConfigData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentConfigData(
      environmentId: serializer.fromJson<String>(json['environment_id']),
      baseUri: serializer.fromJson<String>(json['base_uri']),
      databaseHost: serializer.fromJson<String>(json['database_host']),
      databaseTokenRef: serializer.fromJson<String>(json['database_token_ref']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'environment_id': serializer.toJson<String>(environmentId),
      'base_uri': serializer.toJson<String>(baseUri),
      'database_host': serializer.toJson<String>(databaseHost),
      'database_token_ref': serializer.toJson<String>(databaseTokenRef),
    };
  }

  ProjectEnvironmentConfigData copyWith({
    String? environmentId,
    String? baseUri,
    String? databaseHost,
    String? databaseTokenRef,
  }) => ProjectEnvironmentConfigData(
    environmentId: environmentId ?? this.environmentId,
    baseUri: baseUri ?? this.baseUri,
    databaseHost: databaseHost ?? this.databaseHost,
    databaseTokenRef: databaseTokenRef ?? this.databaseTokenRef,
  );
  ProjectEnvironmentConfigData copyWithCompanion(
    ProjectEnvironmentConfigCompanion data,
  ) {
    return ProjectEnvironmentConfigData(
      environmentId:
          data.environmentId.present
              ? data.environmentId.value
              : this.environmentId,
      baseUri: data.baseUri.present ? data.baseUri.value : this.baseUri,
      databaseHost:
          data.databaseHost.present
              ? data.databaseHost.value
              : this.databaseHost,
      databaseTokenRef:
          data.databaseTokenRef.present
              ? data.databaseTokenRef.value
              : this.databaseTokenRef,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentConfigData(')
          ..write('environmentId: $environmentId, ')
          ..write('baseUri: $baseUri, ')
          ..write('databaseHost: $databaseHost, ')
          ..write('databaseTokenRef: $databaseTokenRef')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(environmentId, baseUri, databaseHost, databaseTokenRef);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEnvironmentConfigData &&
          other.environmentId == this.environmentId &&
          other.baseUri == this.baseUri &&
          other.databaseHost == this.databaseHost &&
          other.databaseTokenRef == this.databaseTokenRef);
}

class ProjectEnvironmentConfigCompanion
    extends UpdateCompanion<ProjectEnvironmentConfigData> {
  final Value<String> environmentId;
  final Value<String> baseUri;
  final Value<String> databaseHost;
  final Value<String> databaseTokenRef;
  final Value<int> rowid;
  const ProjectEnvironmentConfigCompanion({
    this.environmentId = const Value.absent(),
    this.baseUri = const Value.absent(),
    this.databaseHost = const Value.absent(),
    this.databaseTokenRef = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectEnvironmentConfigCompanion.insert({
    required String environmentId,
    required String baseUri,
    required String databaseHost,
    required String databaseTokenRef,
    this.rowid = const Value.absent(),
  }) : environmentId = Value(environmentId),
       baseUri = Value(baseUri),
       databaseHost = Value(databaseHost),
       databaseTokenRef = Value(databaseTokenRef);
  static Insertable<ProjectEnvironmentConfigData> custom({
    Expression<String>? environmentId,
    Expression<String>? baseUri,
    Expression<String>? databaseHost,
    Expression<String>? databaseTokenRef,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (environmentId != null) 'environment_id': environmentId,
      if (baseUri != null) 'base_uri': baseUri,
      if (databaseHost != null) 'database_host': databaseHost,
      if (databaseTokenRef != null) 'database_token_ref': databaseTokenRef,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectEnvironmentConfigCompanion copyWith({
    Value<String>? environmentId,
    Value<String>? baseUri,
    Value<String>? databaseHost,
    Value<String>? databaseTokenRef,
    Value<int>? rowid,
  }) {
    return ProjectEnvironmentConfigCompanion(
      environmentId: environmentId ?? this.environmentId,
      baseUri: baseUri ?? this.baseUri,
      databaseHost: databaseHost ?? this.databaseHost,
      databaseTokenRef: databaseTokenRef ?? this.databaseTokenRef,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (environmentId.present) {
      map['environment_id'] = Variable<String>(environmentId.value);
    }
    if (baseUri.present) {
      map['base_uri'] = Variable<String>(baseUri.value);
    }
    if (databaseHost.present) {
      map['database_host'] = Variable<String>(databaseHost.value);
    }
    if (databaseTokenRef.present) {
      map['database_token_ref'] = Variable<String>(databaseTokenRef.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentConfigCompanion(')
          ..write('environmentId: $environmentId, ')
          ..write('baseUri: $baseUri, ')
          ..write('databaseHost: $databaseHost, ')
          ..write('databaseTokenRef: $databaseTokenRef, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CloudDatabase extends GeneratedDatabase {
  _$CloudDatabase(QueryExecutor e) : super(e);
  $CloudDatabaseManager get managers => $CloudDatabaseManager(this);
  late final Organizations organizations = Organizations(this);
  late final Projects projects = Projects(this);
  late final ProjectEnvironments projectEnvironments = ProjectEnvironments(
    this,
  );
  late final Index idxProjectEnvironment = Index(
    'idx_project_environment',
    'CREATE UNIQUE INDEX IF NOT EXISTS idx_project_environment ON project_environments (project_id, environment_id)',
  );
  late final Index idxProjectEnvironmentProjectId = Index(
    'idx_project_environment_project_id',
    'CREATE INDEX IF NOT EXISTS idx_project_environment_project_id ON project_environments (project_id)',
  );
  late final ProjectEnvironmentConfig projectEnvironmentConfig =
      ProjectEnvironmentConfig(this);
  late final Index idxProjectEnvironmentDatabaseEnvironmentId = Index(
    'idx_project_environment_database_environment_id',
    'CREATE INDEX IF NOT EXISTS idx_project_environment_database_environment_id ON project_environment_config (environment_id)',
  );
  Future<List<Organization>> upsertOrganization({
    required String id,
    required String organizationId,
    required String displayName,
    required String primaryRegion,
    required String etag,
  }) {
    return customWriteReturning(
      'INSERT INTO organizations (id, organization_id, display_name, primary_region, etag) VALUES (?1, ?2, ?3, ?4, ?5) ON CONFLICT (id) DO UPDATE SET organization_id = ?2, display_name = ?3, primary_region = ?4, etag = ?5 RETURNING *',
      variables: [
        Variable<String>(id),
        Variable<String>(organizationId),
        Variable<String>(displayName),
        Variable<String>(primaryRegion),
        Variable<String>(etag),
      ],
      updates: {organizations},
    ).then((rows) => Future.wait(rows.map(organizations.mapFromRow)));
  }

  Selectable<Organization> getOrganization({required String id}) {
    return customSelect(
      'SELECT * FROM organizations WHERE id = ?1 OR organization_id = ?1',
      variables: [Variable<String>(id)],
      readsFrom: {organizations},
    ).asyncMap(organizations.mapFromRow);
  }

  Selectable<Organization> listOrganizations() {
    return customSelect(
      'SELECT * FROM organizations',
      variables: [],
      readsFrom: {organizations},
    ).asyncMap(organizations.mapFromRow);
  }

  Future<List<Organization>> updateOrganization({
    required String displayName,
    required String primaryRegion,
    required String etag,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE organizations SET display_name = ?1, primary_region = ?2, etag = ?3 WHERE id = ?4 OR organization_id = ?4 RETURNING *',
      variables: [
        Variable<String>(displayName),
        Variable<String>(primaryRegion),
        Variable<String>(etag),
        Variable<String>(id),
      ],
      updates: {organizations},
      updateKind: UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(organizations.mapFromRow)));
  }

  Future<int> deleteOrganization({required String id}) {
    return customUpdate(
      'DELETE FROM organizations WHERE id = ?1 OR organization_id = ?1',
      variables: [Variable<String>(id)],
      updates: {organizations},
      updateKind: UpdateKind.delete,
    );
  }

  Future<List<Project>> upsertProject({
    required String id,
    required String organizationId,
    required String projectId,
    String? displayName,
    required String region,
    required String etag,
  }) {
    return customWriteReturning(
      'INSERT INTO projects (id, organization_id, project_id, display_name, region, etag) VALUES (?1, ?2, ?3, ?4, ?5, ?6) ON CONFLICT (id) DO UPDATE SET organization_id = ?2, project_id = ?3, display_name = ?4, region = ?5, etag = ?6 RETURNING *',
      variables: [
        Variable<String>(id),
        Variable<String>(organizationId),
        Variable<String>(projectId),
        Variable<String>(displayName),
        Variable<String>(region),
        Variable<String>(etag),
      ],
      updates: {projects},
    ).then((rows) => Future.wait(rows.map(projects.mapFromRow)));
  }

  Selectable<Project> getProject({required String id}) {
    return customSelect(
      'SELECT * FROM projects WHERE id = ?1 OR project_id = ?1',
      variables: [Variable<String>(id)],
      readsFrom: {projects},
    ).asyncMap(projects.mapFromRow);
  }

  Selectable<Project> listProjects({required String organizationId}) {
    return customSelect(
      'SELECT * FROM projects WHERE organization_id = ?1',
      variables: [Variable<String>(organizationId)],
      readsFrom: {projects},
    ).asyncMap(projects.mapFromRow);
  }

  Future<List<Project>> updateProject({
    String? displayName,
    required String region,
    required String etag,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE projects SET display_name = ?1, region = ?2, etag = ?3 WHERE id = ?4 OR project_id = ?4 RETURNING *',
      variables: [
        Variable<String>(displayName),
        Variable<String>(region),
        Variable<String>(etag),
        Variable<String>(id),
      ],
      updates: {projects},
      updateKind: UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(projects.mapFromRow)));
  }

  Future<int> deleteProject({required String id}) {
    return customUpdate(
      'DELETE FROM projects WHERE id = ?1 OR project_id = ?1',
      variables: [Variable<String>(id)],
      updates: {projects},
      updateKind: UpdateKind.delete,
    );
  }

  Future<List<ProjectEnvironment>> upsertProjectEnvironment({
    required String id,
    required String projectId,
    required String environmentId,
    String? displayName,
    required String etag,
  }) {
    return customWriteReturning(
      'INSERT INTO project_environments (id, project_id, environment_id, display_name, etag) VALUES (?1, ?2, ?3, ?4, ?5) ON CONFLICT (id) DO UPDATE SET project_id = ?2, environment_id = ?3, display_name = ?4, etag = ?5 RETURNING *',
      variables: [
        Variable<String>(id),
        Variable<String>(projectId),
        Variable<String>(environmentId),
        Variable<String>(displayName),
        Variable<String>(etag),
      ],
      updates: {projectEnvironments},
    ).then((rows) => Future.wait(rows.map(projectEnvironments.mapFromRow)));
  }

  Selectable<ProjectEnvironment> getProjectEnvironment({required String id}) {
    return customSelect(
      'SELECT * FROM project_environments WHERE id = ?1 OR environment_id = ?1',
      variables: [Variable<String>(id)],
      readsFrom: {projectEnvironments},
    ).asyncMap(projectEnvironments.mapFromRow);
  }

  Selectable<ProjectEnvironment> listProjectEnvironments({
    required String projectId,
  }) {
    return customSelect(
      'SELECT * FROM project_environments WHERE project_id = ?1',
      variables: [Variable<String>(projectId)],
      readsFrom: {projectEnvironments},
    ).asyncMap(projectEnvironments.mapFromRow);
  }

  Future<List<ProjectEnvironment>> updateProjectEnvironment({
    String? displayName,
    required String etag,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE project_environments SET display_name = ?1, etag = ?2 WHERE id = ?3 OR environment_id = ?3 RETURNING *',
      variables: [
        Variable<String>(displayName),
        Variable<String>(etag),
        Variable<String>(id),
      ],
      updates: {projectEnvironments},
      updateKind: UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(projectEnvironments.mapFromRow)));
  }

  Future<int> deleteProjectEnvironment({required String id}) {
    return customUpdate(
      'DELETE FROM project_environments WHERE id = ?1 OR environment_id = ?1',
      variables: [Variable<String>(id)],
      updates: {projectEnvironments},
      updateKind: UpdateKind.delete,
    );
  }

  Future<List<ProjectEnvironmentConfigData>> upsertProjectEnvironmentConfig({
    required String environmentId,
    required String baseUri,
    required String databaseHost,
    required String databaseTokenRef,
  }) {
    return customWriteReturning(
      'INSERT INTO project_environment_config (environment_id, base_uri, database_host, database_token_ref) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (environment_id) DO UPDATE SET base_uri = ?2, database_host = ?3, database_token_ref = ?4 RETURNING *',
      variables: [
        Variable<String>(environmentId),
        Variable<String>(baseUri),
        Variable<String>(databaseHost),
        Variable<String>(databaseTokenRef),
      ],
      updates: {projectEnvironmentConfig},
    ).then(
      (rows) => Future.wait(rows.map(projectEnvironmentConfig.mapFromRow)),
    );
  }

  Selectable<ProjectEnvironmentConfigData> getProjectEnvironmentConfig({
    required String environmentId,
  }) {
    return customSelect(
      'SELECT * FROM project_environment_config WHERE environment_id = ?1',
      variables: [Variable<String>(environmentId)],
      readsFrom: {projectEnvironmentConfig},
    ).asyncMap(projectEnvironmentConfig.mapFromRow);
  }

  Future<int> deleteProjectEnvironmentConfig({required String environmentId}) {
    return customUpdate(
      'DELETE FROM project_environment_config WHERE environment_id = ?1',
      variables: [Variable<String>(environmentId)],
      updates: {projectEnvironmentConfig},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    organizations,
    projects,
    projectEnvironments,
    idxProjectEnvironment,
    idxProjectEnvironmentProjectId,
    projectEnvironmentConfig,
    idxProjectEnvironmentDatabaseEnvironmentId,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('projects', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('projects', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('project_environments', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
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
        TableUpdate('project_environment_config', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('project_environment_config', kind: UpdateKind.update),
      ],
    ),
  ]);
}

typedef $OrganizationsCreateCompanionBuilder =
    OrganizationsCompanion Function({
      required String id,
      required String organizationId,
      required String displayName,
      required String primaryRegion,
      required String etag,
      Value<int> rowid,
    });
typedef $OrganizationsUpdateCompanionBuilder =
    OrganizationsCompanion Function({
      Value<String> id,
      Value<String> organizationId,
      Value<String> displayName,
      Value<String> primaryRegion,
      Value<String> etag,
      Value<int> rowid,
    });

class $OrganizationsFilterComposer
    extends Composer<_$CloudDatabase, Organizations> {
  $OrganizationsFilterComposer({
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

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get primaryRegion => $composableBuilder(
    column: $table.primaryRegion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );
}

class $OrganizationsOrderingComposer
    extends Composer<_$CloudDatabase, Organizations> {
  $OrganizationsOrderingComposer({
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

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryRegion => $composableBuilder(
    column: $table.primaryRegion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $OrganizationsAnnotationComposer
    extends Composer<_$CloudDatabase, Organizations> {
  $OrganizationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get primaryRegion => $composableBuilder(
    column: $table.primaryRegion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $OrganizationsTableManager
    extends
        RootTableManager<
          _$CloudDatabase,
          Organizations,
          Organization,
          $OrganizationsFilterComposer,
          $OrganizationsOrderingComposer,
          $OrganizationsAnnotationComposer,
          $OrganizationsCreateCompanionBuilder,
          $OrganizationsUpdateCompanionBuilder,
          (
            Organization,
            BaseReferences<_$CloudDatabase, Organizations, Organization>,
          ),
          Organization,
          PrefetchHooks Function()
        > {
  $OrganizationsTableManager(_$CloudDatabase db, Organizations table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $OrganizationsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $OrganizationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $OrganizationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> organizationId = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> primaryRegion = const Value.absent(),
                Value<String> etag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrganizationsCompanion(
                id: id,
                organizationId: organizationId,
                displayName: displayName,
                primaryRegion: primaryRegion,
                etag: etag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String organizationId,
                required String displayName,
                required String primaryRegion,
                required String etag,
                Value<int> rowid = const Value.absent(),
              }) => OrganizationsCompanion.insert(
                id: id,
                organizationId: organizationId,
                displayName: displayName,
                primaryRegion: primaryRegion,
                etag: etag,
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

typedef $OrganizationsProcessedTableManager =
    ProcessedTableManager<
      _$CloudDatabase,
      Organizations,
      Organization,
      $OrganizationsFilterComposer,
      $OrganizationsOrderingComposer,
      $OrganizationsAnnotationComposer,
      $OrganizationsCreateCompanionBuilder,
      $OrganizationsUpdateCompanionBuilder,
      (
        Organization,
        BaseReferences<_$CloudDatabase, Organizations, Organization>,
      ),
      Organization,
      PrefetchHooks Function()
    >;
typedef $ProjectsCreateCompanionBuilder =
    ProjectsCompanion Function({
      required String id,
      required String organizationId,
      required String projectId,
      Value<String?> displayName,
      required String region,
      required String etag,
      Value<int> rowid,
    });
typedef $ProjectsUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<String> id,
      Value<String> organizationId,
      Value<String> projectId,
      Value<String?> displayName,
      Value<String> region,
      Value<String> etag,
      Value<int> rowid,
    });

class $ProjectsFilterComposer extends Composer<_$CloudDatabase, Projects> {
  $ProjectsFilterComposer({
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

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProjectsOrderingComposer extends Composer<_$CloudDatabase, Projects> {
  $ProjectsOrderingComposer({
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

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProjectsAnnotationComposer extends Composer<_$CloudDatabase, Projects> {
  $ProjectsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $ProjectsTableManager
    extends
        RootTableManager<
          _$CloudDatabase,
          Projects,
          Project,
          $ProjectsFilterComposer,
          $ProjectsOrderingComposer,
          $ProjectsAnnotationComposer,
          $ProjectsCreateCompanionBuilder,
          $ProjectsUpdateCompanionBuilder,
          (Project, BaseReferences<_$CloudDatabase, Projects, Project>),
          Project,
          PrefetchHooks Function()
        > {
  $ProjectsTableManager(_$CloudDatabase db, Projects table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $ProjectsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $ProjectsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $ProjectsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> organizationId = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String> region = const Value.absent(),
                Value<String> etag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                organizationId: organizationId,
                projectId: projectId,
                displayName: displayName,
                region: region,
                etag: etag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String organizationId,
                required String projectId,
                Value<String?> displayName = const Value.absent(),
                required String region,
                required String etag,
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                organizationId: organizationId,
                projectId: projectId,
                displayName: displayName,
                region: region,
                etag: etag,
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

typedef $ProjectsProcessedTableManager =
    ProcessedTableManager<
      _$CloudDatabase,
      Projects,
      Project,
      $ProjectsFilterComposer,
      $ProjectsOrderingComposer,
      $ProjectsAnnotationComposer,
      $ProjectsCreateCompanionBuilder,
      $ProjectsUpdateCompanionBuilder,
      (Project, BaseReferences<_$CloudDatabase, Projects, Project>),
      Project,
      PrefetchHooks Function()
    >;
typedef $ProjectEnvironmentsCreateCompanionBuilder =
    ProjectEnvironmentsCompanion Function({
      required String id,
      required String projectId,
      required String environmentId,
      Value<String?> displayName,
      required String etag,
      Value<int> rowid,
    });
typedef $ProjectEnvironmentsUpdateCompanionBuilder =
    ProjectEnvironmentsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> environmentId,
      Value<String?> displayName,
      Value<String> etag,
      Value<int> rowid,
    });

class $ProjectEnvironmentsFilterComposer
    extends Composer<_$CloudDatabase, ProjectEnvironments> {
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

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProjectEnvironmentsOrderingComposer
    extends Composer<_$CloudDatabase, ProjectEnvironments> {
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

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProjectEnvironmentsAnnotationComposer
    extends Composer<_$CloudDatabase, ProjectEnvironments> {
  $ProjectEnvironmentsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get environmentId => $composableBuilder(
    column: $table.environmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $ProjectEnvironmentsTableManager
    extends
        RootTableManager<
          _$CloudDatabase,
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
              _$CloudDatabase,
              ProjectEnvironments,
              ProjectEnvironment
            >,
          ),
          ProjectEnvironment,
          PrefetchHooks Function()
        > {
  $ProjectEnvironmentsTableManager(
    _$CloudDatabase db,
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
                Value<String> projectId = const Value.absent(),
                Value<String> environmentId = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String> etag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEnvironmentsCompanion(
                id: id,
                projectId: projectId,
                environmentId: environmentId,
                displayName: displayName,
                etag: etag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String environmentId,
                Value<String?> displayName = const Value.absent(),
                required String etag,
                Value<int> rowid = const Value.absent(),
              }) => ProjectEnvironmentsCompanion.insert(
                id: id,
                projectId: projectId,
                environmentId: environmentId,
                displayName: displayName,
                etag: etag,
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
      _$CloudDatabase,
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
          _$CloudDatabase,
          ProjectEnvironments,
          ProjectEnvironment
        >,
      ),
      ProjectEnvironment,
      PrefetchHooks Function()
    >;
typedef $ProjectEnvironmentConfigCreateCompanionBuilder =
    ProjectEnvironmentConfigCompanion Function({
      required String environmentId,
      required String baseUri,
      required String databaseHost,
      required String databaseTokenRef,
      Value<int> rowid,
    });
typedef $ProjectEnvironmentConfigUpdateCompanionBuilder =
    ProjectEnvironmentConfigCompanion Function({
      Value<String> environmentId,
      Value<String> baseUri,
      Value<String> databaseHost,
      Value<String> databaseTokenRef,
      Value<int> rowid,
    });

class $ProjectEnvironmentConfigFilterComposer
    extends Composer<_$CloudDatabase, ProjectEnvironmentConfig> {
  $ProjectEnvironmentConfigFilterComposer({
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

  ColumnFilters<String> get baseUri => $composableBuilder(
    column: $table.baseUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get databaseHost => $composableBuilder(
    column: $table.databaseHost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get databaseTokenRef => $composableBuilder(
    column: $table.databaseTokenRef,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProjectEnvironmentConfigOrderingComposer
    extends Composer<_$CloudDatabase, ProjectEnvironmentConfig> {
  $ProjectEnvironmentConfigOrderingComposer({
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

  ColumnOrderings<String> get baseUri => $composableBuilder(
    column: $table.baseUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get databaseHost => $composableBuilder(
    column: $table.databaseHost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get databaseTokenRef => $composableBuilder(
    column: $table.databaseTokenRef,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProjectEnvironmentConfigAnnotationComposer
    extends Composer<_$CloudDatabase, ProjectEnvironmentConfig> {
  $ProjectEnvironmentConfigAnnotationComposer({
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

  GeneratedColumn<String> get baseUri =>
      $composableBuilder(column: $table.baseUri, builder: (column) => column);

  GeneratedColumn<String> get databaseHost => $composableBuilder(
    column: $table.databaseHost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get databaseTokenRef => $composableBuilder(
    column: $table.databaseTokenRef,
    builder: (column) => column,
  );
}

class $ProjectEnvironmentConfigTableManager
    extends
        RootTableManager<
          _$CloudDatabase,
          ProjectEnvironmentConfig,
          ProjectEnvironmentConfigData,
          $ProjectEnvironmentConfigFilterComposer,
          $ProjectEnvironmentConfigOrderingComposer,
          $ProjectEnvironmentConfigAnnotationComposer,
          $ProjectEnvironmentConfigCreateCompanionBuilder,
          $ProjectEnvironmentConfigUpdateCompanionBuilder,
          (
            ProjectEnvironmentConfigData,
            BaseReferences<
              _$CloudDatabase,
              ProjectEnvironmentConfig,
              ProjectEnvironmentConfigData
            >,
          ),
          ProjectEnvironmentConfigData,
          PrefetchHooks Function()
        > {
  $ProjectEnvironmentConfigTableManager(
    _$CloudDatabase db,
    ProjectEnvironmentConfig table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $ProjectEnvironmentConfigFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $ProjectEnvironmentConfigOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $ProjectEnvironmentConfigAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> environmentId = const Value.absent(),
                Value<String> baseUri = const Value.absent(),
                Value<String> databaseHost = const Value.absent(),
                Value<String> databaseTokenRef = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEnvironmentConfigCompanion(
                environmentId: environmentId,
                baseUri: baseUri,
                databaseHost: databaseHost,
                databaseTokenRef: databaseTokenRef,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String environmentId,
                required String baseUri,
                required String databaseHost,
                required String databaseTokenRef,
                Value<int> rowid = const Value.absent(),
              }) => ProjectEnvironmentConfigCompanion.insert(
                environmentId: environmentId,
                baseUri: baseUri,
                databaseHost: databaseHost,
                databaseTokenRef: databaseTokenRef,
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

typedef $ProjectEnvironmentConfigProcessedTableManager =
    ProcessedTableManager<
      _$CloudDatabase,
      ProjectEnvironmentConfig,
      ProjectEnvironmentConfigData,
      $ProjectEnvironmentConfigFilterComposer,
      $ProjectEnvironmentConfigOrderingComposer,
      $ProjectEnvironmentConfigAnnotationComposer,
      $ProjectEnvironmentConfigCreateCompanionBuilder,
      $ProjectEnvironmentConfigUpdateCompanionBuilder,
      (
        ProjectEnvironmentConfigData,
        BaseReferences<
          _$CloudDatabase,
          ProjectEnvironmentConfig,
          ProjectEnvironmentConfigData
        >,
      ),
      ProjectEnvironmentConfigData,
      PrefetchHooks Function()
    >;

class $CloudDatabaseManager {
  final _$CloudDatabase _db;
  $CloudDatabaseManager(this._db);
  $OrganizationsTableManager get organizations =>
      $OrganizationsTableManager(_db, _db.organizations);
  $ProjectsTableManager get projects =>
      $ProjectsTableManager(_db, _db.projects);
  $ProjectEnvironmentsTableManager get projectEnvironments =>
      $ProjectEnvironmentsTableManager(_db, _db.projectEnvironments);
  $ProjectEnvironmentConfigTableManager get projectEnvironmentConfig =>
      $ProjectEnvironmentConfigTableManager(_db, _db.projectEnvironmentConfig);
}
