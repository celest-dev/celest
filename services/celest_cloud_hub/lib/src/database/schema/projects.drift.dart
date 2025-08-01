// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_hub/src/database/schema/projects.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'dart:async' as i3;
import 'package:celest_cloud_hub/src/database/schema/user_memberships.drift.dart'
    as i4;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i5;
import 'package:celest_cloud_hub/src/database/schema/organizations.drift.dart'
    as i6;

typedef $ProjectsCreateCompanionBuilder =
    i1.ProjectsCompanion Function({
      required String id,
      required String parentType,
      required String parentId,
      required String projectId,
      i0.Value<String> state,
      i0.Value<String?> displayName,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<DateTime?> deleteTime,
      i0.Value<DateTime?> purgeTime,
      i0.Value<String?> annotations,
      required String regions,
      i0.Value<bool> reconciling,
      i0.Value<int> rowid,
    });
typedef $ProjectsUpdateCompanionBuilder =
    i1.ProjectsCompanion Function({
      i0.Value<String> id,
      i0.Value<String> parentType,
      i0.Value<String> parentId,
      i0.Value<String> projectId,
      i0.Value<String> state,
      i0.Value<String?> displayName,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<DateTime?> deleteTime,
      i0.Value<DateTime?> purgeTime,
      i0.Value<String?> annotations,
      i0.Value<String> regions,
      i0.Value<bool> reconciling,
      i0.Value<int> rowid,
    });

class $ProjectsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Projects> {
  $ProjectsFilterComposer({
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

  i0.ColumnFilters<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
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

  i0.ColumnFilters<DateTime> get deleteTime => $composableBuilder(
    column: $table.deleteTime,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get purgeTime => $composableBuilder(
    column: $table.purgeTime,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get annotations => $composableBuilder(
    column: $table.annotations,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get regions => $composableBuilder(
    column: $table.regions,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $ProjectsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Projects> {
  $ProjectsOrderingComposer({
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

  i0.ColumnOrderings<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
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

  i0.ColumnOrderings<DateTime> get deleteTime => $composableBuilder(
    column: $table.deleteTime,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get purgeTime => $composableBuilder(
    column: $table.purgeTime,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get annotations => $composableBuilder(
    column: $table.annotations,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get regions => $composableBuilder(
    column: $table.regions,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $ProjectsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Projects> {
  $ProjectsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  i0.GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  i0.GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  i0.GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  i0.GeneratedColumn<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => column,
  );

  i0.GeneratedColumn<DateTime> get updateTime => $composableBuilder(
    column: $table.updateTime,
    builder: (column) => column,
  );

  i0.GeneratedColumn<DateTime> get deleteTime => $composableBuilder(
    column: $table.deleteTime,
    builder: (column) => column,
  );

  i0.GeneratedColumn<DateTime> get purgeTime =>
      $composableBuilder(column: $table.purgeTime, builder: (column) => column);

  i0.GeneratedColumn<String> get annotations => $composableBuilder(
    column: $table.annotations,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get regions =>
      $composableBuilder(column: $table.regions, builder: (column) => column);

  i0.GeneratedColumn<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $ProjectsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Projects,
          i1.Project,
          i1.$ProjectsFilterComposer,
          i1.$ProjectsOrderingComposer,
          i1.$ProjectsAnnotationComposer,
          $ProjectsCreateCompanionBuilder,
          $ProjectsUpdateCompanionBuilder,
          (
            i1.Project,
            i0.BaseReferences<i0.GeneratedDatabase, i1.Projects, i1.Project>,
          ),
          i1.Project,
          i0.PrefetchHooks Function()
        > {
  $ProjectsTableManager(i0.GeneratedDatabase db, i1.Projects table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$ProjectsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$ProjectsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$ProjectsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> id = const i0.Value.absent(),
                i0.Value<String> parentType = const i0.Value.absent(),
                i0.Value<String> parentId = const i0.Value.absent(),
                i0.Value<String> projectId = const i0.Value.absent(),
                i0.Value<String> state = const i0.Value.absent(),
                i0.Value<String?> displayName = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
                i0.Value<DateTime?> purgeTime = const i0.Value.absent(),
                i0.Value<String?> annotations = const i0.Value.absent(),
                i0.Value<String> regions = const i0.Value.absent(),
                i0.Value<bool> reconciling = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.ProjectsCompanion(
                id: id,
                parentType: parentType,
                parentId: parentId,
                projectId: projectId,
                state: state,
                displayName: displayName,
                createTime: createTime,
                updateTime: updateTime,
                deleteTime: deleteTime,
                purgeTime: purgeTime,
                annotations: annotations,
                regions: regions,
                reconciling: reconciling,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String parentType,
                required String parentId,
                required String projectId,
                i0.Value<String> state = const i0.Value.absent(),
                i0.Value<String?> displayName = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
                i0.Value<DateTime?> purgeTime = const i0.Value.absent(),
                i0.Value<String?> annotations = const i0.Value.absent(),
                required String regions,
                i0.Value<bool> reconciling = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.ProjectsCompanion.insert(
                id: id,
                parentType: parentType,
                parentId: parentId,
                projectId: projectId,
                state: state,
                displayName: displayName,
                createTime: createTime,
                updateTime: updateTime,
                deleteTime: deleteTime,
                purgeTime: purgeTime,
                annotations: annotations,
                regions: regions,
                reconciling: reconciling,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ProjectsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Projects,
      i1.Project,
      i1.$ProjectsFilterComposer,
      i1.$ProjectsOrderingComposer,
      i1.$ProjectsAnnotationComposer,
      $ProjectsCreateCompanionBuilder,
      $ProjectsUpdateCompanionBuilder,
      (
        i1.Project,
        i0.BaseReferences<i0.GeneratedDatabase, i1.Projects, i1.Project>,
      ),
      i1.Project,
      i0.PrefetchHooks Function()
    >;

class Projects extends i0.Table with i0.TableInfo<Projects, i1.Project> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Projects(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<String> id = i0.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
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
  static const i0.VerificationMeta _projectIdMeta = const i0.VerificationMeta(
    'projectId',
  );
  late final i0.GeneratedColumn<String> projectId = i0.GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _stateMeta = const i0.VerificationMeta(
    'state',
  );
  late final i0.GeneratedColumn<String> state = i0.GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'CREATING\'',
    defaultValue: const i0.CustomExpression('\'CREATING\''),
  );
  static const i0.VerificationMeta _displayNameMeta = const i0.VerificationMeta(
    'displayName',
  );
  late final i0.GeneratedColumn<String> displayName =
      i0.GeneratedColumn<String>(
        'display_name',
        aliasedName,
        true,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
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
  static const i0.VerificationMeta _deleteTimeMeta = const i0.VerificationMeta(
    'deleteTime',
  );
  late final i0.GeneratedColumn<DateTime> deleteTime =
      i0.GeneratedColumn<DateTime>(
        'delete_time',
        aliasedName,
        true,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const i0.VerificationMeta _purgeTimeMeta = const i0.VerificationMeta(
    'purgeTime',
  );
  late final i0.GeneratedColumn<DateTime> purgeTime =
      i0.GeneratedColumn<DateTime>(
        'purge_time',
        aliasedName,
        true,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const i0.VerificationMeta _annotationsMeta = const i0.VerificationMeta(
    'annotations',
  );
  late final i0.GeneratedColumn<String> annotations =
      i0.GeneratedColumn<String>(
        'annotations',
        aliasedName,
        true,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const i0.VerificationMeta _regionsMeta = const i0.VerificationMeta(
    'regions',
  );
  late final i0.GeneratedColumn<String> regions = i0.GeneratedColumn<String>(
    'regions',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _reconcilingMeta = const i0.VerificationMeta(
    'reconciling',
  );
  late final i0.GeneratedColumn<bool> reconciling = i0.GeneratedColumn<bool>(
    'reconciling',
    aliasedName,
    false,
    type: i0.DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const i0.CustomExpression('FALSE'),
  );
  static const i0.VerificationMeta _etagMeta = const i0.VerificationMeta(
    'etag',
  );
  late final i0.GeneratedColumn<String> etag = i0.GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    generatedAs: i0.GeneratedAs(
      const i0.CustomExpression(
        'hex(md5(json_array(id, parent_type, parent_id, project_id, state, display_name, create_time, update_time, delete_time, purge_time, annotations, regions, reconciling)))',
      ),
      true,
    ),
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (hex(md5(json_array(id, parent_type, parent_id, project_id, state, display_name, create_time, update_time, delete_time, purge_time, annotations, regions, reconciling)))) STORED',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
    id,
    parentType,
    parentId,
    projectId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    regions,
    reconciling,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.Project> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
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
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
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
    if (data.containsKey('purge_time')) {
      context.handle(
        _purgeTimeMeta,
        purgeTime.isAcceptableOrUnknown(data['purge_time']!, _purgeTimeMeta),
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
    if (data.containsKey('regions')) {
      context.handle(
        _regionsMeta,
        regions.isAcceptableOrUnknown(data['regions']!, _regionsMeta),
      );
    } else if (isInserting) {
      context.missing(_regionsMeta);
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<i0.GeneratedColumn>> get uniqueKeys => [
    {projectId, parentId},
  ];
  @override
  i1.Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Project(
      id: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      parentType: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}parent_type'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      state: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}state'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      createTime: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}create_time'],
      )!,
      updateTime: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}update_time'],
      )!,
      deleteTime: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}delete_time'],
      ),
      purgeTime: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}purge_time'],
      ),
      annotations: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}annotations'],
      ),
      regions: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}regions'],
      )!,
      reconciling: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.bool,
        data['${effectivePrefix}reconciling'],
      )!,
      etag: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
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
    'CHECK(parent_type = \'Celest::Organization\')',
    'CONSTRAINT projects_fk_parent FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT projects_fk_organization FOREIGN KEY(parent_id)REFERENCES organizations(id)ON UPDATE CASCADE ON DELETE CASCADE',
    'CONSTRAINT projects_uq_project_id UNIQUE(project_id, parent_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Project extends i0.DataClass implements i0.Insertable<i1.Project> {
  /// Immutable. The unique identifier for the project.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: prj_<typeid>
  final String id;

  /// The Cedar type of the parent entity.
  ///
  /// Must be `Celest::Organization` for projects.
  final String parentType;

  /// The unique identifier of the parent entity.
  ///
  /// Must be an existing organization.
  final String parentId;

  /// The primary alias for the project.
  final String projectId;

  /// The current state of the project.
  final String state;

  /// A human-readable name for the project.
  final String? displayName;
  final DateTime createTime;
  final DateTime updateTime;
  final DateTime? deleteTime;
  final DateTime? purgeTime;

  /// User-defined annotations for the project.
  ///
  /// Type: map[string]string
  final String? annotations;

  /// The project's regions.
  ///
  /// Type: list[string]
  final String regions;

  /// Whether the project is in the process of being reconciled.
  final bool reconciling;

  /// The project's etag.
  final String etag;
  const Project({
    required this.id,
    required this.parentType,
    required this.parentId,
    required this.projectId,
    required this.state,
    this.displayName,
    required this.createTime,
    required this.updateTime,
    this.deleteTime,
    this.purgeTime,
    this.annotations,
    required this.regions,
    required this.reconciling,
    required this.etag,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    map['parent_type'] = i0.Variable<String>(parentType);
    map['parent_id'] = i0.Variable<String>(parentId);
    map['project_id'] = i0.Variable<String>(projectId);
    map['state'] = i0.Variable<String>(state);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = i0.Variable<String>(displayName);
    }
    map['create_time'] = i0.Variable<DateTime>(createTime);
    map['update_time'] = i0.Variable<DateTime>(updateTime);
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = i0.Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || purgeTime != null) {
      map['purge_time'] = i0.Variable<DateTime>(purgeTime);
    }
    if (!nullToAbsent || annotations != null) {
      map['annotations'] = i0.Variable<String>(annotations);
    }
    map['regions'] = i0.Variable<String>(regions);
    map['reconciling'] = i0.Variable<bool>(reconciling);
    return map;
  }

  i1.ProjectsCompanion toCompanion(bool nullToAbsent) {
    return i1.ProjectsCompanion(
      id: i0.Value(id),
      parentType: i0.Value(parentType),
      parentId: i0.Value(parentId),
      projectId: i0.Value(projectId),
      state: i0.Value(state),
      displayName: displayName == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(displayName),
      createTime: i0.Value(createTime),
      updateTime: i0.Value(updateTime),
      deleteTime: deleteTime == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(deleteTime),
      purgeTime: purgeTime == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(purgeTime),
      annotations: annotations == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(annotations),
      regions: i0.Value(regions),
      reconciling: i0.Value(reconciling),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String>(json['parent_type']),
      parentId: serializer.fromJson<String>(json['parent_id']),
      projectId: serializer.fromJson<String>(json['project_id']),
      state: serializer.fromJson<String>(json['state']),
      displayName: serializer.fromJson<String?>(json['display_name']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      updateTime: serializer.fromJson<DateTime>(json['update_time']),
      deleteTime: serializer.fromJson<DateTime?>(json['delete_time']),
      purgeTime: serializer.fromJson<DateTime?>(json['purge_time']),
      annotations: serializer.fromJson<String?>(json['annotations']),
      regions: serializer.fromJson<String>(json['regions']),
      reconciling: serializer.fromJson<bool>(json['reconciling']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parent_type': serializer.toJson<String>(parentType),
      'parent_id': serializer.toJson<String>(parentId),
      'project_id': serializer.toJson<String>(projectId),
      'state': serializer.toJson<String>(state),
      'display_name': serializer.toJson<String?>(displayName),
      'create_time': serializer.toJson<DateTime>(createTime),
      'update_time': serializer.toJson<DateTime>(updateTime),
      'delete_time': serializer.toJson<DateTime?>(deleteTime),
      'purge_time': serializer.toJson<DateTime?>(purgeTime),
      'annotations': serializer.toJson<String?>(annotations),
      'regions': serializer.toJson<String>(regions),
      'reconciling': serializer.toJson<bool>(reconciling),
      'etag': serializer.toJson<String>(etag),
    };
  }

  i1.Project copyWith({
    String? id,
    String? parentType,
    String? parentId,
    String? projectId,
    String? state,
    i0.Value<String?> displayName = const i0.Value.absent(),
    DateTime? createTime,
    DateTime? updateTime,
    i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
    i0.Value<DateTime?> purgeTime = const i0.Value.absent(),
    i0.Value<String?> annotations = const i0.Value.absent(),
    String? regions,
    bool? reconciling,
    String? etag,
  }) => i1.Project(
    id: id ?? this.id,
    parentType: parentType ?? this.parentType,
    parentId: parentId ?? this.parentId,
    projectId: projectId ?? this.projectId,
    state: state ?? this.state,
    displayName: displayName.present ? displayName.value : this.displayName,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
    deleteTime: deleteTime.present ? deleteTime.value : this.deleteTime,
    purgeTime: purgeTime.present ? purgeTime.value : this.purgeTime,
    annotations: annotations.present ? annotations.value : this.annotations,
    regions: regions ?? this.regions,
    reconciling: reconciling ?? this.reconciling,
    etag: etag ?? this.etag,
  );
  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectId: $projectId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('regions: $regions, ')
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
    projectId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    regions,
    reconciling,
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Project &&
          other.id == this.id &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.projectId == this.projectId &&
          other.state == this.state &&
          other.displayName == this.displayName &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.deleteTime == this.deleteTime &&
          other.purgeTime == this.purgeTime &&
          other.annotations == this.annotations &&
          other.regions == this.regions &&
          other.reconciling == this.reconciling &&
          other.etag == this.etag);
}

class ProjectsCompanion extends i0.UpdateCompanion<i1.Project> {
  final i0.Value<String> id;
  final i0.Value<String> parentType;
  final i0.Value<String> parentId;
  final i0.Value<String> projectId;
  final i0.Value<String> state;
  final i0.Value<String?> displayName;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime> updateTime;
  final i0.Value<DateTime?> deleteTime;
  final i0.Value<DateTime?> purgeTime;
  final i0.Value<String?> annotations;
  final i0.Value<String> regions;
  final i0.Value<bool> reconciling;
  final i0.Value<int> rowid;
  const ProjectsCompanion({
    this.id = const i0.Value.absent(),
    this.parentType = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
    this.projectId = const i0.Value.absent(),
    this.state = const i0.Value.absent(),
    this.displayName = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.deleteTime = const i0.Value.absent(),
    this.purgeTime = const i0.Value.absent(),
    this.annotations = const i0.Value.absent(),
    this.regions = const i0.Value.absent(),
    this.reconciling = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String parentType,
    required String parentId,
    required String projectId,
    this.state = const i0.Value.absent(),
    this.displayName = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.deleteTime = const i0.Value.absent(),
    this.purgeTime = const i0.Value.absent(),
    this.annotations = const i0.Value.absent(),
    required String regions,
    this.reconciling = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : id = i0.Value(id),
       parentType = i0.Value(parentType),
       parentId = i0.Value(parentId),
       projectId = i0.Value(projectId),
       regions = i0.Value(regions);
  static i0.Insertable<i1.Project> custom({
    i0.Expression<String>? id,
    i0.Expression<String>? parentType,
    i0.Expression<String>? parentId,
    i0.Expression<String>? projectId,
    i0.Expression<String>? state,
    i0.Expression<String>? displayName,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? updateTime,
    i0.Expression<DateTime>? deleteTime,
    i0.Expression<DateTime>? purgeTime,
    i0.Expression<String>? annotations,
    i0.Expression<String>? regions,
    i0.Expression<bool>? reconciling,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (projectId != null) 'project_id': projectId,
      if (state != null) 'state': state,
      if (displayName != null) 'display_name': displayName,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (purgeTime != null) 'purge_time': purgeTime,
      if (annotations != null) 'annotations': annotations,
      if (regions != null) 'regions': regions,
      if (reconciling != null) 'reconciling': reconciling,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.ProjectsCompanion copyWith({
    i0.Value<String>? id,
    i0.Value<String>? parentType,
    i0.Value<String>? parentId,
    i0.Value<String>? projectId,
    i0.Value<String>? state,
    i0.Value<String?>? displayName,
    i0.Value<DateTime>? createTime,
    i0.Value<DateTime>? updateTime,
    i0.Value<DateTime?>? deleteTime,
    i0.Value<DateTime?>? purgeTime,
    i0.Value<String?>? annotations,
    i0.Value<String>? regions,
    i0.Value<bool>? reconciling,
    i0.Value<int>? rowid,
  }) {
    return i1.ProjectsCompanion(
      id: id ?? this.id,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      projectId: projectId ?? this.projectId,
      state: state ?? this.state,
      displayName: displayName ?? this.displayName,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      deleteTime: deleteTime ?? this.deleteTime,
      purgeTime: purgeTime ?? this.purgeTime,
      annotations: annotations ?? this.annotations,
      regions: regions ?? this.regions,
      reconciling: reconciling ?? this.reconciling,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<String>(id.value);
    }
    if (parentType.present) {
      map['parent_type'] = i0.Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = i0.Variable<String>(parentId.value);
    }
    if (projectId.present) {
      map['project_id'] = i0.Variable<String>(projectId.value);
    }
    if (state.present) {
      map['state'] = i0.Variable<String>(state.value);
    }
    if (displayName.present) {
      map['display_name'] = i0.Variable<String>(displayName.value);
    }
    if (createTime.present) {
      map['create_time'] = i0.Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = i0.Variable<DateTime>(updateTime.value);
    }
    if (deleteTime.present) {
      map['delete_time'] = i0.Variable<DateTime>(deleteTime.value);
    }
    if (purgeTime.present) {
      map['purge_time'] = i0.Variable<DateTime>(purgeTime.value);
    }
    if (annotations.present) {
      map['annotations'] = i0.Variable<String>(annotations.value);
    }
    if (regions.present) {
      map['regions'] = i0.Variable<String>(regions.value);
    }
    if (reconciling.present) {
      map['reconciling'] = i0.Variable<bool>(reconciling.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('projectId: $projectId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('regions: $regions, ')
          ..write('reconciling: $reconciling, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get projectsFkParentIdx => i0.Index(
  'projects_fk_parent_idx',
  'CREATE INDEX IF NOT EXISTS projects_fk_parent_idx ON projects (parent_type, parent_id)',
);
i0.Trigger get projectsUpdateTimeTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS projects_update_time_trg AFTER UPDATE ON projects BEGIN UPDATE projects SET update_time = unixepoch(\'now\', \'subsec\') WHERE id = OLD.id;END',
  'projects_update_time_trg',
);
i0.Trigger get projectsCreateTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS projects_create_trg BEFORE INSERT ON projects BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Project\', NEW.id);INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Project\', NEW.id, NEW.parent_type, NEW.parent_id);END',
  'projects_create_trg',
);
i0.Trigger get projectsSetParentTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS projects_set_parent_trg AFTER UPDATE OF parent_type, parent_id ON projects WHEN OLD.parent_type != NEW.parent_type OR OLD.parent_id != NEW.parent_id BEGIN UPDATE cedar_relationships SET parent_type = NEW.parent_type, parent_id = NEW.parent_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Project\';END',
  'projects_set_parent_trg',
);
i0.Trigger get projectsDeleteTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS projects_delete_trg AFTER DELETE ON projects BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Project\' AND entity_id = OLD.id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Project\' AND parent_id = OLD.id;DELETE FROM cedar_entities WHERE entity_id = OLD.id AND entity_type = \'Celest::Project\';END',
  'projects_delete_trg',
);

class ProjectsDrift extends i2.ModularAccessor {
  ProjectsDrift(i0.GeneratedDatabase db) : super(db);
  i3.Future<List<i1.Project>> createProject({
    required String id,
    required String parentType,
    required String parentId,
    required String projectId,
    required String state,
    String? displayName,
    String? annotations,
    required String regions,
  }) {
    return customWriteReturning(
      'INSERT INTO projects (id, parent_type, parent_id, project_id, state, display_name, annotations, regions) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8) RETURNING *',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
        i0.Variable<String>(projectId),
        i0.Variable<String>(state),
        i0.Variable<String>(displayName),
        i0.Variable<String>(annotations),
        i0.Variable<String>(regions),
      ],
      updates: {projects},
    ).then((rows) => Future.wait(rows.map(projects.mapFromRow)));
  }

  i0.Selectable<i1.Project> getProject({required String id}) {
    return customSelect(
      'SELECT * FROM projects WHERE id = ?1 OR project_id = ?1',
      variables: [i0.Variable<String>(id)],
      readsFrom: {projects},
    ).asyncMap(projects.mapFromRow);
  }

  i0.Selectable<ListProjectsResult> listProjects({
    required String userId,
    String? parentId,
    DateTime? startTime,
    required bool showDeleted,
    required int offset,
    ListProjects$orderBy? order_by,
    required int limit,
  }) {
    var $arrayStartIndex = 7;
    final generatedorder_by = $write(
      order_by?.call(this.projects) ?? const i0.OrderBy.nothing(),
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedorder_by.amountOfVariables;
    return customSelect(
      'WITH memberships AS (SELECT parent_id AS project_id FROM user_memberships WHERE user_id = ?1 AND parent_type = \'Celest::Project\'), rowed AS (SELECT ROW_NUMBER()OVER (ORDER BY create_time DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE NO OTHERS) AS row_num, id FROM projects INNER JOIN memberships ON projects.id = memberships.project_id WHERE(projects.parent_id IS NULL AND ?2 IS NULL OR projects.parent_id = ?2)AND projects.create_time < coalesce(?3, unixepoch(\'now\', \'+1 second\', \'subsec\')) AND(?4 OR projects.state != \'DELETED\')) SELECT row_num,"projects"."id" AS "nested_0.id", "projects"."parent_type" AS "nested_0.parent_type", "projects"."parent_id" AS "nested_0.parent_id", "projects"."project_id" AS "nested_0.project_id", "projects"."state" AS "nested_0.state", "projects"."display_name" AS "nested_0.display_name", "projects"."create_time" AS "nested_0.create_time", "projects"."update_time" AS "nested_0.update_time", "projects"."delete_time" AS "nested_0.delete_time", "projects"."purge_time" AS "nested_0.purge_time", "projects"."annotations" AS "nested_0.annotations", "projects"."regions" AS "nested_0.regions", "projects"."reconciling" AS "nested_0.reconciling", "projects"."etag" AS "nested_0.etag" FROM projects INNER JOIN rowed ON projects.id = rowed.id WHERE row_num > ?5 ${generatedorder_by.sql} LIMIT ?6',
      variables: [
        i0.Variable<String>(userId),
        i0.Variable<String>(parentId),
        i0.Variable<DateTime>(startTime),
        i0.Variable<bool>(showDeleted),
        i0.Variable<int>(offset),
        i0.Variable<int>(limit),
        ...generatedorder_by.introducedVariables,
      ],
      readsFrom: {
        userMemberships,
        projects,
        ...generatedorder_by.watchedTables,
      },
    ).asyncMap(
      (i0.QueryRow row) async => ListProjectsResult(
        rowNum: row.read<int>('row_num'),
        projects: await projects.mapFromRow(row, tablePrefix: 'nested_0'),
      ),
    );
  }

  i3.Future<List<i1.Project>> updateProject({
    String? parentType,
    String? parentId,
    String? state,
    String? displayName,
    String? annotations,
    DateTime? deleteTime,
    DateTime? purgeTime,
    String? regions,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE projects SET parent_type = coalesce(?1, parent_type), parent_id = coalesce(?2, parent_id), state = coalesce(?3, state), display_name = coalesce(?4, display_name), annotations = coalesce(?5, annotations), update_time = unixepoch(\'now\', \'subsec\'), delete_time = coalesce(?6, delete_time), purge_time = coalesce(?7, purge_time), regions = coalesce(?8, regions) WHERE(id = ?9 OR project_id = ?9)AND state != \'DELETED\' RETURNING *',
      variables: [
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
        i0.Variable<String>(state),
        i0.Variable<String>(displayName),
        i0.Variable<String>(annotations),
        i0.Variable<DateTime>(deleteTime),
        i0.Variable<DateTime>(purgeTime),
        i0.Variable<String>(regions),
        i0.Variable<String>(id),
      ],
      updates: {projects},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(projects.mapFromRow)));
  }

  i3.Future<List<i1.Project>> deleteProject({
    String? state,
    DateTime? deleteTime,
    DateTime? purgeTime,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE projects SET state = coalesce(?1, \'DELETED\'), delete_time = coalesce(?2, delete_time, unixepoch(\'now\', \'subsec\')), purge_time = coalesce(?3, purge_time, unixepoch(\'now\', \'+30 days\', \'subsec\')) WHERE id = ?4 OR project_id = ?4 RETURNING *',
      variables: [
        i0.Variable<String>(state),
        i0.Variable<DateTime>(deleteTime),
        i0.Variable<DateTime>(purgeTime),
        i0.Variable<String>(id),
      ],
      updates: {projects},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(projects.mapFromRow)));
  }

  i3.Future<List<i1.Project>> undeleteProject({
    String? state,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE projects SET state = coalesce(?1, \'ACTIVE\'), delete_time = NULL, purge_time = NULL WHERE id = ?2 OR project_id = ?2 RETURNING *',
      variables: [i0.Variable<String>(state), i0.Variable<String>(id)],
      updates: {projects},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(projects.mapFromRow)));
  }

  i3.Future<List<i1.Project>> purgeProject({required String id}) {
    return customWriteReturning(
      'DELETE FROM projects WHERE id = ?1 OR project_id = ?1 RETURNING *',
      variables: [i0.Variable<String>(id)],
      updates: {projects},
      updateKind: i0.UpdateKind.delete,
    ).then((rows) => Future.wait(rows.map(projects.mapFromRow)));
  }

  i1.Projects get projects => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.Projects>('projects');
  i4.UserMemberships get userMemberships => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i4.UserMemberships>('user_memberships');
  i5.CedarDrift get cedarDrift => this.accessor(i5.CedarDrift.new);
  i6.OrganizationsDrift get organizationsDrift =>
      this.accessor(i6.OrganizationsDrift.new);
}

class ListProjectsResult {
  final int rowNum;
  final i1.Project projects;
  ListProjectsResult({required this.rowNum, required this.projects});
}

typedef ListProjects$orderBy = i0.OrderBy Function(i1.Projects projects);
