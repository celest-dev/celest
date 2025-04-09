// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_hub/src/database/schema/user_memberships.drift.dart'
    as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'dart:async' as i3;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i4;
import 'package:celest_cloud_hub/src/database/schema/organizations.drift.dart'
    as i5;
import 'package:celest_cloud_hub/src/database/schema/projects.drift.dart' as i6;
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart'
    as i7;

typedef $UserMembershipsCreateCompanionBuilder =
    i1.UserMembershipsCompanion Function({
      required String membershipId,
      required String userId,
      required String parentType,
      required String parentId,
      required String role,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<int> rowid,
    });
typedef $UserMembershipsUpdateCompanionBuilder =
    i1.UserMembershipsCompanion Function({
      i0.Value<String> membershipId,
      i0.Value<String> userId,
      i0.Value<String> parentType,
      i0.Value<String> parentId,
      i0.Value<String> role,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<int> rowid,
    });

class $UserMembershipsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.UserMemberships> {
  $UserMembershipsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get membershipId => $composableBuilder(
    column: $table.membershipId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $UserMembershipsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.UserMemberships> {
  $UserMembershipsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get membershipId => $composableBuilder(
    column: $table.membershipId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $UserMembershipsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.UserMemberships> {
  $UserMembershipsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get membershipId => $composableBuilder(
    column: $table.membershipId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumn<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  i0.GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => column,
  );

  i0.GeneratedColumn<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => column,
  );
}

class $UserMembershipsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.UserMemberships,
          i1.UserMembership,
          i1.$UserMembershipsFilterComposer,
          i1.$UserMembershipsOrderingComposer,
          i1.$UserMembershipsAnnotationComposer,
          $UserMembershipsCreateCompanionBuilder,
          $UserMembershipsUpdateCompanionBuilder,
          (
            i1.UserMembership,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.UserMemberships,
              i1.UserMembership
            >,
          ),
          i1.UserMembership,
          i0.PrefetchHooks Function()
        > {
  $UserMembershipsTableManager(
    i0.GeneratedDatabase db,
    i1.UserMemberships table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$UserMembershipsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$UserMembershipsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  i1.$UserMembershipsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> membershipId = const i0.Value.absent(),
                i0.Value<String> userId = const i0.Value.absent(),
                i0.Value<String> parentType = const i0.Value.absent(),
                i0.Value<String> parentId = const i0.Value.absent(),
                i0.Value<String> role = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.UserMembershipsCompanion(
                membershipId: membershipId,
                userId: userId,
                parentType: parentType,
                parentId: parentId,
                role: role,
                createTime: createTime,
                updateTime: updateTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String membershipId,
                required String userId,
                required String parentType,
                required String parentId,
                required String role,
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.UserMembershipsCompanion.insert(
                membershipId: membershipId,
                userId: userId,
                parentType: parentType,
                parentId: parentId,
                role: role,
                createTime: createTime,
                updateTime: updateTime,
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

typedef $UserMembershipsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.UserMemberships,
      i1.UserMembership,
      i1.$UserMembershipsFilterComposer,
      i1.$UserMembershipsOrderingComposer,
      i1.$UserMembershipsAnnotationComposer,
      $UserMembershipsCreateCompanionBuilder,
      $UserMembershipsUpdateCompanionBuilder,
      (
        i1.UserMembership,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.UserMemberships,
          i1.UserMembership
        >,
      ),
      i1.UserMembership,
      i0.PrefetchHooks Function()
    >;

class UserMemberships extends i0.Table
    with i0.TableInfo<UserMemberships, i1.UserMembership> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserMemberships(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _membershipIdMeta =
      const i0.VerificationMeta('membershipId');
  late final i0.GeneratedColumn<String> membershipId =
      i0.GeneratedColumn<String>(
        'membership_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      );
  static const i0.VerificationMeta _userIdMeta = const i0.VerificationMeta(
    'userId',
  );
  late final i0.GeneratedColumn<String> userId = i0.GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _parentTypeMeta = const i0.VerificationMeta(
    'parentType',
  );
  late final i0.GeneratedColumn<String> parentType = i0.GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _parentIdMeta = const i0.VerificationMeta(
    'parentId',
  );
  late final i0.GeneratedColumn<String> parentId = i0.GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _roleMeta = const i0.VerificationMeta(
    'role',
  );
  late final i0.GeneratedColumn<String> role = i0.GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _createTimeMeta = const i0.VerificationMeta(
    'createTime',
  );
  late final i0.GeneratedColumn<DateTime> createTime =
      i0.GeneratedColumn<DateTime>(
        'create_time',
        aliasedName,
        false,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
        defaultValue: const i0.CustomExpression(
          'unixepoch(\'now\', \'subsec\')',
        ),
      );
  static const i0.VerificationMeta _updateTimeMeta = const i0.VerificationMeta(
    'updateTime',
  );
  late final i0.GeneratedColumn<DateTime> updateTime =
      i0.GeneratedColumn<DateTime>(
        'update_time',
        aliasedName,
        false,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
        defaultValue: const i0.CustomExpression(
          'unixepoch(\'now\', \'subsec\')',
        ),
      );
  @override
  List<i0.GeneratedColumn> get $columns => [
    membershipId,
    userId,
    parentType,
    parentId,
    role,
    createTime,
    updateTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_memberships';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.UserMembership> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('membership_id')) {
      context.handle(
        _membershipIdMeta,
        membershipId.isAcceptableOrUnknown(
          data['membership_id']!,
          _membershipIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_membershipIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('parent_type')) {
      context.handle(
        _parentTypeMeta,
        parentType.isAcceptableOrUnknown(data['parent_type']!, _parentTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_parentTypeMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
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
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {membershipId};
  @override
  i1.UserMembership map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.UserMembership(
      membershipId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}membership_id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      parentType:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}parent_type'],
          )!,
      parentId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}parent_id'],
          )!,
      role:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}role'],
          )!,
      createTime:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      updateTime:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.dateTime,
            data['${effectivePrefix}update_time'],
          )!,
    );
  }

  @override
  UserMemberships createAlias(String alias) {
    return UserMemberships(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(parent_type = \'Celest::Organization\' OR parent_type = \'Celest::Project\' OR parent_type = \'Celest::Project::Environment\')',
    'CONSTRAINT user_memberships_parent_fk FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class UserMembership extends i0.DataClass
    implements i0.Insertable<i1.UserMembership> {
  /// The unique identifier for the user membership.
  final String membershipId;

  /// The unique identifier for the user.
  final String userId;

  /// The Cedar type of the parent entity.
  ///
  /// Must be `Celest::Organization`, `Celest::Project`, or `Celest::Project::Environment`.
  final String parentType;

  /// The unique identifier of the parent entity.
  ///
  /// Must be an existing organization or project.
  final String parentId;

  /// The role of the user in the organization or project.
  final String role;
  final DateTime createTime;
  final DateTime updateTime;
  const UserMembership({
    required this.membershipId,
    required this.userId,
    required this.parentType,
    required this.parentId,
    required this.role,
    required this.createTime,
    required this.updateTime,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['membership_id'] = i0.Variable<String>(membershipId);
    map['user_id'] = i0.Variable<String>(userId);
    map['parent_type'] = i0.Variable<String>(parentType);
    map['parent_id'] = i0.Variable<String>(parentId);
    map['role'] = i0.Variable<String>(role);
    map['create_time'] = i0.Variable<DateTime>(createTime);
    map['update_time'] = i0.Variable<DateTime>(updateTime);
    return map;
  }

  i1.UserMembershipsCompanion toCompanion(bool nullToAbsent) {
    return i1.UserMembershipsCompanion(
      membershipId: i0.Value(membershipId),
      userId: i0.Value(userId),
      parentType: i0.Value(parentType),
      parentId: i0.Value(parentId),
      role: i0.Value(role),
      createTime: i0.Value(createTime),
      updateTime: i0.Value(updateTime),
    );
  }

  factory UserMembership.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return UserMembership(
      membershipId: serializer.fromJson<String>(json['membership_id']),
      userId: serializer.fromJson<String>(json['user_id']),
      parentType: serializer.fromJson<String>(json['parent_type']),
      parentId: serializer.fromJson<String>(json['parent_id']),
      role: serializer.fromJson<String>(json['role']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      updateTime: serializer.fromJson<DateTime>(json['update_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'membership_id': serializer.toJson<String>(membershipId),
      'user_id': serializer.toJson<String>(userId),
      'parent_type': serializer.toJson<String>(parentType),
      'parent_id': serializer.toJson<String>(parentId),
      'role': serializer.toJson<String>(role),
      'create_time': serializer.toJson<DateTime>(createTime),
      'update_time': serializer.toJson<DateTime>(updateTime),
    };
  }

  i1.UserMembership copyWith({
    String? membershipId,
    String? userId,
    String? parentType,
    String? parentId,
    String? role,
    DateTime? createTime,
    DateTime? updateTime,
  }) => i1.UserMembership(
    membershipId: membershipId ?? this.membershipId,
    userId: userId ?? this.userId,
    parentType: parentType ?? this.parentType,
    parentId: parentId ?? this.parentId,
    role: role ?? this.role,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
  );
  UserMembership copyWithCompanion(i1.UserMembershipsCompanion data) {
    return UserMembership(
      membershipId:
          data.membershipId.present
              ? data.membershipId.value
              : this.membershipId,
      userId: data.userId.present ? data.userId.value : this.userId,
      parentType:
          data.parentType.present ? data.parentType.value : this.parentType,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      role: data.role.present ? data.role.value : this.role,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserMembership(')
          ..write('membershipId: $membershipId, ')
          ..write('userId: $userId, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('role: $role, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    membershipId,
    userId,
    parentType,
    parentId,
    role,
    createTime,
    updateTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.UserMembership &&
          other.membershipId == this.membershipId &&
          other.userId == this.userId &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.role == this.role &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class UserMembershipsCompanion extends i0.UpdateCompanion<i1.UserMembership> {
  final i0.Value<String> membershipId;
  final i0.Value<String> userId;
  final i0.Value<String> parentType;
  final i0.Value<String> parentId;
  final i0.Value<String> role;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime> updateTime;
  final i0.Value<int> rowid;
  const UserMembershipsCompanion({
    this.membershipId = const i0.Value.absent(),
    this.userId = const i0.Value.absent(),
    this.parentType = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
    this.role = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  UserMembershipsCompanion.insert({
    required String membershipId,
    required String userId,
    required String parentType,
    required String parentId,
    required String role,
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : membershipId = i0.Value(membershipId),
       userId = i0.Value(userId),
       parentType = i0.Value(parentType),
       parentId = i0.Value(parentId),
       role = i0.Value(role);
  static i0.Insertable<i1.UserMembership> custom({
    i0.Expression<String>? membershipId,
    i0.Expression<String>? userId,
    i0.Expression<String>? parentType,
    i0.Expression<String>? parentId,
    i0.Expression<String>? role,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? updateTime,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (membershipId != null) 'membership_id': membershipId,
      if (userId != null) 'user_id': userId,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (role != null) 'role': role,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.UserMembershipsCompanion copyWith({
    i0.Value<String>? membershipId,
    i0.Value<String>? userId,
    i0.Value<String>? parentType,
    i0.Value<String>? parentId,
    i0.Value<String>? role,
    i0.Value<DateTime>? createTime,
    i0.Value<DateTime>? updateTime,
    i0.Value<int>? rowid,
  }) {
    return i1.UserMembershipsCompanion(
      membershipId: membershipId ?? this.membershipId,
      userId: userId ?? this.userId,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      role: role ?? this.role,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (membershipId.present) {
      map['membership_id'] = i0.Variable<String>(membershipId.value);
    }
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (parentType.present) {
      map['parent_type'] = i0.Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = i0.Variable<String>(parentId.value);
    }
    if (role.present) {
      map['role'] = i0.Variable<String>(role.value);
    }
    if (createTime.present) {
      map['create_time'] = i0.Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = i0.Variable<DateTime>(updateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserMembershipsCompanion(')
          ..write('membershipId: $membershipId, ')
          ..write('userId: $userId, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('role: $role, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get userMembershipsParentIdx => i0.Index(
  'user_memberships_parent_idx',
  'CREATE INDEX IF NOT EXISTS user_memberships_parent_idx ON user_memberships (parent_type, parent_id)',
);
i0.Trigger get userMembershipsCreateTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS user_memberships_create_trg BEFORE INSERT ON user_memberships BEGIN INSERT INTO cedar_entities (entity_type, entity_id, attribute_json) VALUES (NEW.parent_type || \'::Member\', NEW.membership_id, json_object(\'role\', json_object(\'type\', \'Celest::Role\', \'id\', NEW.role), \'parent\', json_object(\'type\', NEW.parent_type, \'id\', NEW.parent_id)));INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::User\', NEW.user_id, NEW.parent_type || \'::Member\', NEW.membership_id);END',
  'user_memberships_create_trg',
);
i0.Trigger get userMembershipsUpdateTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS user_memberships_update_trg AFTER UPDATE ON user_memberships BEGIN UPDATE cedar_entities SET attribute_json = json_object(\'role\', json_object(\'type\', \'Celest::Role\', \'id\', NEW.role), \'parent\', json_object(\'type\', OLD.parent_type, \'id\', OLD.parent_id)) WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\';UPDATE cedar_relationships SET parent_id = NEW.role WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\' AND parent_type = \'Celest::Role\';END',
  'user_memberships_update_trg',
);
i0.Trigger get userMembershipsDeleteTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS user_memberships_delete_trg AFTER DELETE ON user_memberships BEGIN DELETE FROM cedar_relationships WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\';DELETE FROM cedar_relationships WHERE parent_id = OLD.membership_id AND parent_type = OLD.parent_type || \'::Member\';DELETE FROM cedar_entities WHERE entity_id = OLD.membership_id AND entity_type = OLD.parent_type || \'::Member\';END',
  'user_memberships_delete_trg',
);
i0.Trigger get organizationsDeleteUserMembershipsTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_delete_user_memberships_trg AFTER DELETE ON organizations BEGIN DELETE FROM user_memberships WHERE parent_type = \'Celest::Organization\' AND parent_id = OLD.id;END',
  'organizations_delete_user_memberships_trg',
);
i0.Trigger get projectsDeleteUserMembershipsTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS projects_delete_user_memberships_trg AFTER DELETE ON projects BEGIN DELETE FROM user_memberships WHERE parent_type = \'Celest::Project\' AND parent_id = OLD.id;END',
  'projects_delete_user_memberships_trg',
);
i0.Trigger get projectEnvironmentsDeleteUserMembershipsTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS project_environments_delete_user_memberships_trg AFTER DELETE ON project_environments BEGIN DELETE FROM user_memberships WHERE parent_type = \'Celest::Project::Environment\' AND parent_id = OLD.id;END',
  'project_environments_delete_user_memberships_trg',
);

class UserMembershipsDrift extends i2.ModularAccessor {
  UserMembershipsDrift(i0.GeneratedDatabase db) : super(db);
  i3.Future<List<i1.UserMembership>> createUserMembership({
    required String membershipId,
    required String userId,
    required String parentType,
    required String parentId,
    required String role,
  }) {
    return customWriteReturning(
      'INSERT INTO user_memberships (membership_id, user_id, parent_type, parent_id, role) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
      variables: [
        i0.Variable<String>(membershipId),
        i0.Variable<String>(userId),
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
        i0.Variable<String>(role),
      ],
      updates: {userMemberships},
    ).then((rows) => Future.wait(rows.map(userMemberships.mapFromRow)));
  }

  i0.Selectable<i1.UserMembership> getUserMembership({
    required String membershipId,
  }) {
    return customSelect(
      'SELECT * FROM user_memberships WHERE membership_id = ?1',
      variables: [i0.Variable<String>(membershipId)],
      readsFrom: {userMemberships},
    ).asyncMap(userMemberships.mapFromRow);
  }

  i0.Selectable<i1.UserMembership> findUserMembership({
    required String userId,
    required String parentType,
    required String parentId,
  }) {
    return customSelect(
      'SELECT * FROM user_memberships WHERE user_id = ?1 AND parent_type = ?2 AND parent_id = ?3',
      variables: [
        i0.Variable<String>(userId),
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
      ],
      readsFrom: {userMemberships},
    ).asyncMap(userMemberships.mapFromRow);
  }

  i3.Future<List<i1.UserMembership>> updateUserMembership({
    required String role,
    required String membershipId,
  }) {
    return customWriteReturning(
      'UPDATE user_memberships SET role = coalesce(?1, role) WHERE membership_id = ?2 RETURNING *',
      variables: [i0.Variable<String>(role), i0.Variable<String>(membershipId)],
      updates: {userMemberships},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(userMemberships.mapFromRow)));
  }

  i3.Future<List<i1.UserMembership>> deleteUserMembership({
    required String membershipId,
  }) {
    return customWriteReturning(
      'DELETE FROM user_memberships WHERE membership_id = ?1 RETURNING *',
      variables: [i0.Variable<String>(membershipId)],
      updates: {userMemberships},
      updateKind: i0.UpdateKind.delete,
    ).then((rows) => Future.wait(rows.map(userMemberships.mapFromRow)));
  }

  i1.UserMemberships get userMemberships => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.UserMemberships>('user_memberships');
  i4.CedarDrift get cedarDrift => this.accessor(i4.CedarDrift.new);
  i5.OrganizationsDrift get organizationsDrift =>
      this.accessor(i5.OrganizationsDrift.new);
  i6.ProjectsDrift get projectsDrift => this.accessor(i6.ProjectsDrift.new);
  i7.ProjectEnvironmentsDrift get projectEnvironmentsDrift =>
      this.accessor(i7.ProjectEnvironmentsDrift.new);
}
