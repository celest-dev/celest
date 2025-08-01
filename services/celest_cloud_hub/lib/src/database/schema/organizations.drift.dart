// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_hub/src/database/schema/organizations.drift.dart'
    as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'dart:async' as i3;
import 'package:celest_cloud_hub/src/database/schema/user_memberships.drift.dart'
    as i4;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i5;

typedef $OrganizationsCreateCompanionBuilder =
    i1.OrganizationsCompanion Function({
      required String id,
      i0.Value<String?> parentType,
      i0.Value<String?> parentId,
      required String organizationId,
      i0.Value<String> state,
      required String displayName,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<DateTime?> deleteTime,
      i0.Value<DateTime?> purgeTime,
      i0.Value<String?> annotations,
      i0.Value<String?> primaryRegion,
      i0.Value<bool> reconciling,
      i0.Value<int> rowid,
    });
typedef $OrganizationsUpdateCompanionBuilder =
    i1.OrganizationsCompanion Function({
      i0.Value<String> id,
      i0.Value<String?> parentType,
      i0.Value<String?> parentId,
      i0.Value<String> organizationId,
      i0.Value<String> state,
      i0.Value<String> displayName,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<DateTime?> deleteTime,
      i0.Value<DateTime?> purgeTime,
      i0.Value<String?> annotations,
      i0.Value<String?> primaryRegion,
      i0.Value<bool> reconciling,
      i0.Value<int> rowid,
    });

class $OrganizationsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Organizations> {
  $OrganizationsFilterComposer({
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

  i0.ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
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

  i0.ColumnFilters<String> get primaryRegion => $composableBuilder(
    column: $table.primaryRegion,
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

class $OrganizationsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Organizations> {
  $OrganizationsOrderingComposer({
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

  i0.ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
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

  i0.ColumnOrderings<String> get primaryRegion => $composableBuilder(
    column: $table.primaryRegion,
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

class $OrganizationsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Organizations> {
  $OrganizationsAnnotationComposer({
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

  i0.GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

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

  i0.GeneratedColumn<String> get primaryRegion => $composableBuilder(
    column: $table.primaryRegion,
    builder: (column) => column,
  );

  i0.GeneratedColumn<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $OrganizationsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Organizations,
          i1.Organization,
          i1.$OrganizationsFilterComposer,
          i1.$OrganizationsOrderingComposer,
          i1.$OrganizationsAnnotationComposer,
          $OrganizationsCreateCompanionBuilder,
          $OrganizationsUpdateCompanionBuilder,
          (
            i1.Organization,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.Organizations,
              i1.Organization
            >,
          ),
          i1.Organization,
          i0.PrefetchHooks Function()
        > {
  $OrganizationsTableManager(i0.GeneratedDatabase db, i1.Organizations table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$OrganizationsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$OrganizationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$OrganizationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> id = const i0.Value.absent(),
                i0.Value<String?> parentType = const i0.Value.absent(),
                i0.Value<String?> parentId = const i0.Value.absent(),
                i0.Value<String> organizationId = const i0.Value.absent(),
                i0.Value<String> state = const i0.Value.absent(),
                i0.Value<String> displayName = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
                i0.Value<DateTime?> purgeTime = const i0.Value.absent(),
                i0.Value<String?> annotations = const i0.Value.absent(),
                i0.Value<String?> primaryRegion = const i0.Value.absent(),
                i0.Value<bool> reconciling = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.OrganizationsCompanion(
                id: id,
                parentType: parentType,
                parentId: parentId,
                organizationId: organizationId,
                state: state,
                displayName: displayName,
                createTime: createTime,
                updateTime: updateTime,
                deleteTime: deleteTime,
                purgeTime: purgeTime,
                annotations: annotations,
                primaryRegion: primaryRegion,
                reconciling: reconciling,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                i0.Value<String?> parentType = const i0.Value.absent(),
                i0.Value<String?> parentId = const i0.Value.absent(),
                required String organizationId,
                i0.Value<String> state = const i0.Value.absent(),
                required String displayName,
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
                i0.Value<DateTime?> purgeTime = const i0.Value.absent(),
                i0.Value<String?> annotations = const i0.Value.absent(),
                i0.Value<String?> primaryRegion = const i0.Value.absent(),
                i0.Value<bool> reconciling = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.OrganizationsCompanion.insert(
                id: id,
                parentType: parentType,
                parentId: parentId,
                organizationId: organizationId,
                state: state,
                displayName: displayName,
                createTime: createTime,
                updateTime: updateTime,
                deleteTime: deleteTime,
                purgeTime: purgeTime,
                annotations: annotations,
                primaryRegion: primaryRegion,
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

typedef $OrganizationsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Organizations,
      i1.Organization,
      i1.$OrganizationsFilterComposer,
      i1.$OrganizationsOrderingComposer,
      i1.$OrganizationsAnnotationComposer,
      $OrganizationsCreateCompanionBuilder,
      $OrganizationsUpdateCompanionBuilder,
      (
        i1.Organization,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.Organizations,
          i1.Organization
        >,
      ),
      i1.Organization,
      i0.PrefetchHooks Function()
    >;

class Organizations extends i0.Table
    with i0.TableInfo<Organizations, i1.Organization> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Organizations(this.attachedDatabase, [this._alias]);
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
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _parentIdMeta = const i0.VerificationMeta(
    'parentId',
  );
  late final i0.GeneratedColumn<String> parentId = i0.GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _organizationIdMeta =
      const i0.VerificationMeta('organizationId');
  late final i0.GeneratedColumn<String> organizationId =
      i0.GeneratedColumn<String>(
        'organization_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL UNIQUE',
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
  static const i0.VerificationMeta _primaryRegionMeta =
      const i0.VerificationMeta('primaryRegion');
  late final i0.GeneratedColumn<String> primaryRegion =
      i0.GeneratedColumn<String>(
        'primary_region',
        aliasedName,
        true,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
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
        'hex(md5(json_array(id, parent_type, parent_id, organization_id, state, display_name, create_time, update_time, delete_time, purge_time, annotations, primary_region, reconciling)))',
      ),
      true,
    ),
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (hex(md5(json_array(id, parent_type, parent_id, organization_id, state, display_name, create_time, update_time, delete_time, purge_time, annotations, primary_region, reconciling)))) STORED',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
    id,
    parentType,
    parentId,
    organizationId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    primaryRegion,
    reconciling,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organizations';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.Organization> instance, {
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
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_organizationIdMeta);
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
    } else if (isInserting) {
      context.missing(_displayNameMeta);
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
    if (data.containsKey('primary_region')) {
      context.handle(
        _primaryRegionMeta,
        primaryRegion.isAcceptableOrUnknown(
          data['primary_region']!,
          _primaryRegionMeta,
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Organization map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Organization(
      id: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      parentType: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}parent_type'],
      ),
      parentId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      organizationId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      )!,
      state: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}state'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
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
      primaryRegion: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}primary_region'],
      ),
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
  Organizations createAlias(String alias) {
    return Organizations(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT organizations_parent_fk FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE SET NULL',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Organization extends i0.DataClass
    implements i0.Insertable<i1.Organization> {
  /// Immutable. The unique identifier for the organization.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: org_<typeid>
  final String id;

  /// The Cedar type of the parent entity, e.g. `Celest::Account`.
  final String? parentType;

  /// The unique identifier of the parent entity.
  final String? parentId;

  /// The primary alias for the organization.
  final String organizationId;

  /// The current state of the organization.
  final String state;

  /// A human-readable name for the organization.
  final String displayName;
  final DateTime createTime;
  final DateTime updateTime;
  final DateTime? deleteTime;
  final DateTime? purgeTime;

  /// User-defined annotations for the organization.
  ///
  /// Type: map[string]string
  final String? annotations;

  /// The organization's primary region.
  final String? primaryRegion;
  final bool reconciling;
  final String etag;
  const Organization({
    required this.id,
    this.parentType,
    this.parentId,
    required this.organizationId,
    required this.state,
    required this.displayName,
    required this.createTime,
    required this.updateTime,
    this.deleteTime,
    this.purgeTime,
    this.annotations,
    this.primaryRegion,
    required this.reconciling,
    required this.etag,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    if (!nullToAbsent || parentType != null) {
      map['parent_type'] = i0.Variable<String>(parentType);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = i0.Variable<String>(parentId);
    }
    map['organization_id'] = i0.Variable<String>(organizationId);
    map['state'] = i0.Variable<String>(state);
    map['display_name'] = i0.Variable<String>(displayName);
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
    if (!nullToAbsent || primaryRegion != null) {
      map['primary_region'] = i0.Variable<String>(primaryRegion);
    }
    map['reconciling'] = i0.Variable<bool>(reconciling);
    return map;
  }

  i1.OrganizationsCompanion toCompanion(bool nullToAbsent) {
    return i1.OrganizationsCompanion(
      id: i0.Value(id),
      parentType: parentType == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(parentType),
      parentId: parentId == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(parentId),
      organizationId: i0.Value(organizationId),
      state: i0.Value(state),
      displayName: i0.Value(displayName),
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
      primaryRegion: primaryRegion == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(primaryRegion),
      reconciling: i0.Value(reconciling),
    );
  }

  factory Organization.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Organization(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String?>(json['parent_type']),
      parentId: serializer.fromJson<String?>(json['parent_id']),
      organizationId: serializer.fromJson<String>(json['organization_id']),
      state: serializer.fromJson<String>(json['state']),
      displayName: serializer.fromJson<String>(json['display_name']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      updateTime: serializer.fromJson<DateTime>(json['update_time']),
      deleteTime: serializer.fromJson<DateTime?>(json['delete_time']),
      purgeTime: serializer.fromJson<DateTime?>(json['purge_time']),
      annotations: serializer.fromJson<String?>(json['annotations']),
      primaryRegion: serializer.fromJson<String?>(json['primary_region']),
      reconciling: serializer.fromJson<bool>(json['reconciling']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parent_type': serializer.toJson<String?>(parentType),
      'parent_id': serializer.toJson<String?>(parentId),
      'organization_id': serializer.toJson<String>(organizationId),
      'state': serializer.toJson<String>(state),
      'display_name': serializer.toJson<String>(displayName),
      'create_time': serializer.toJson<DateTime>(createTime),
      'update_time': serializer.toJson<DateTime>(updateTime),
      'delete_time': serializer.toJson<DateTime?>(deleteTime),
      'purge_time': serializer.toJson<DateTime?>(purgeTime),
      'annotations': serializer.toJson<String?>(annotations),
      'primary_region': serializer.toJson<String?>(primaryRegion),
      'reconciling': serializer.toJson<bool>(reconciling),
      'etag': serializer.toJson<String>(etag),
    };
  }

  i1.Organization copyWith({
    String? id,
    i0.Value<String?> parentType = const i0.Value.absent(),
    i0.Value<String?> parentId = const i0.Value.absent(),
    String? organizationId,
    String? state,
    String? displayName,
    DateTime? createTime,
    DateTime? updateTime,
    i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
    i0.Value<DateTime?> purgeTime = const i0.Value.absent(),
    i0.Value<String?> annotations = const i0.Value.absent(),
    i0.Value<String?> primaryRegion = const i0.Value.absent(),
    bool? reconciling,
    String? etag,
  }) => i1.Organization(
    id: id ?? this.id,
    parentType: parentType.present ? parentType.value : this.parentType,
    parentId: parentId.present ? parentId.value : this.parentId,
    organizationId: organizationId ?? this.organizationId,
    state: state ?? this.state,
    displayName: displayName ?? this.displayName,
    createTime: createTime ?? this.createTime,
    updateTime: updateTime ?? this.updateTime,
    deleteTime: deleteTime.present ? deleteTime.value : this.deleteTime,
    purgeTime: purgeTime.present ? purgeTime.value : this.purgeTime,
    annotations: annotations.present ? annotations.value : this.annotations,
    primaryRegion: primaryRegion.present
        ? primaryRegion.value
        : this.primaryRegion,
    reconciling: reconciling ?? this.reconciling,
    etag: etag ?? this.etag,
  );
  @override
  String toString() {
    return (StringBuffer('Organization(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('organizationId: $organizationId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('primaryRegion: $primaryRegion, ')
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
    organizationId,
    state,
    displayName,
    createTime,
    updateTime,
    deleteTime,
    purgeTime,
    annotations,
    primaryRegion,
    reconciling,
    etag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Organization &&
          other.id == this.id &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.organizationId == this.organizationId &&
          other.state == this.state &&
          other.displayName == this.displayName &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.deleteTime == this.deleteTime &&
          other.purgeTime == this.purgeTime &&
          other.annotations == this.annotations &&
          other.primaryRegion == this.primaryRegion &&
          other.reconciling == this.reconciling &&
          other.etag == this.etag);
}

class OrganizationsCompanion extends i0.UpdateCompanion<i1.Organization> {
  final i0.Value<String> id;
  final i0.Value<String?> parentType;
  final i0.Value<String?> parentId;
  final i0.Value<String> organizationId;
  final i0.Value<String> state;
  final i0.Value<String> displayName;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime> updateTime;
  final i0.Value<DateTime?> deleteTime;
  final i0.Value<DateTime?> purgeTime;
  final i0.Value<String?> annotations;
  final i0.Value<String?> primaryRegion;
  final i0.Value<bool> reconciling;
  final i0.Value<int> rowid;
  const OrganizationsCompanion({
    this.id = const i0.Value.absent(),
    this.parentType = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
    this.organizationId = const i0.Value.absent(),
    this.state = const i0.Value.absent(),
    this.displayName = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.deleteTime = const i0.Value.absent(),
    this.purgeTime = const i0.Value.absent(),
    this.annotations = const i0.Value.absent(),
    this.primaryRegion = const i0.Value.absent(),
    this.reconciling = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  OrganizationsCompanion.insert({
    required String id,
    this.parentType = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
    required String organizationId,
    this.state = const i0.Value.absent(),
    required String displayName,
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.deleteTime = const i0.Value.absent(),
    this.purgeTime = const i0.Value.absent(),
    this.annotations = const i0.Value.absent(),
    this.primaryRegion = const i0.Value.absent(),
    this.reconciling = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : id = i0.Value(id),
       organizationId = i0.Value(organizationId),
       displayName = i0.Value(displayName);
  static i0.Insertable<i1.Organization> custom({
    i0.Expression<String>? id,
    i0.Expression<String>? parentType,
    i0.Expression<String>? parentId,
    i0.Expression<String>? organizationId,
    i0.Expression<String>? state,
    i0.Expression<String>? displayName,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? updateTime,
    i0.Expression<DateTime>? deleteTime,
    i0.Expression<DateTime>? purgeTime,
    i0.Expression<String>? annotations,
    i0.Expression<String>? primaryRegion,
    i0.Expression<bool>? reconciling,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (organizationId != null) 'organization_id': organizationId,
      if (state != null) 'state': state,
      if (displayName != null) 'display_name': displayName,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (deleteTime != null) 'delete_time': deleteTime,
      if (purgeTime != null) 'purge_time': purgeTime,
      if (annotations != null) 'annotations': annotations,
      if (primaryRegion != null) 'primary_region': primaryRegion,
      if (reconciling != null) 'reconciling': reconciling,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.OrganizationsCompanion copyWith({
    i0.Value<String>? id,
    i0.Value<String?>? parentType,
    i0.Value<String?>? parentId,
    i0.Value<String>? organizationId,
    i0.Value<String>? state,
    i0.Value<String>? displayName,
    i0.Value<DateTime>? createTime,
    i0.Value<DateTime>? updateTime,
    i0.Value<DateTime?>? deleteTime,
    i0.Value<DateTime?>? purgeTime,
    i0.Value<String?>? annotations,
    i0.Value<String?>? primaryRegion,
    i0.Value<bool>? reconciling,
    i0.Value<int>? rowid,
  }) {
    return i1.OrganizationsCompanion(
      id: id ?? this.id,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      organizationId: organizationId ?? this.organizationId,
      state: state ?? this.state,
      displayName: displayName ?? this.displayName,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      deleteTime: deleteTime ?? this.deleteTime,
      purgeTime: purgeTime ?? this.purgeTime,
      annotations: annotations ?? this.annotations,
      primaryRegion: primaryRegion ?? this.primaryRegion,
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
    if (organizationId.present) {
      map['organization_id'] = i0.Variable<String>(organizationId.value);
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
    if (primaryRegion.present) {
      map['primary_region'] = i0.Variable<String>(primaryRegion.value);
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
    return (StringBuffer('OrganizationsCompanion(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('organizationId: $organizationId, ')
          ..write('state: $state, ')
          ..write('displayName: $displayName, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('deleteTime: $deleteTime, ')
          ..write('purgeTime: $purgeTime, ')
          ..write('annotations: $annotations, ')
          ..write('primaryRegion: $primaryRegion, ')
          ..write('reconciling: $reconciling, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get organizationsParentIdx => i0.Index(
  'organizations_parent_idx',
  'CREATE INDEX IF NOT EXISTS organizations_parent_idx ON organizations (parent_type, parent_id)',
);
i0.Trigger get organizationsUpdateTime => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_update_time AFTER UPDATE ON organizations BEGIN UPDATE organizations SET update_time = unixepoch(\'now\', \'subsec\') WHERE id = OLD.id;END',
  'organizations_update_time',
);
i0.Trigger get organizationsCreate => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_create BEFORE INSERT ON organizations BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Organization\', NEW.id);END',
  'organizations_create',
);
i0.Trigger get organizationsCreateParent => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_create_parent AFTER INSERT ON organizations WHEN NEW.parent_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Organization\', NEW.id, NEW.parent_type, NEW.parent_id);END',
  'organizations_create_parent',
);
i0.Trigger get organizationsAddParent => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_add_parent AFTER UPDATE OF parent_id ON organizations WHEN OLD.parent_id IS NULL AND NEW.parent_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Organization\', NEW.id, NEW.parent_type, NEW.parent_id);END',
  'organizations_add_parent',
);
i0.Trigger get organizationsSetParent => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_set_parent AFTER UPDATE OF parent_type, parent_id ON organizations WHEN(OLD.parent_type != NEW.parent_type OR OLD.parent_id != NEW.parent_id)AND NEW.parent_id IS NOT NULL BEGIN UPDATE cedar_relationships SET parent_type = NEW.parent_type, parent_id = NEW.parent_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Organization\';END',
  'organizations_set_parent',
);
i0.Trigger get organizationsRemoveParent => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_remove_parent AFTER UPDATE OF parent_id ON organizations WHEN OLD.parent_id IS NOT NULL AND NEW.parent_id IS NULL BEGIN DELETE FROM cedar_relationships WHERE entity_id = OLD.id AND entity_type = \'Celest::Organization\' AND parent_id = OLD.parent_id AND parent_type = OLD.parent_type;END',
  'organizations_remove_parent',
);
i0.Trigger get organizationsDelete => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS organizations_delete AFTER DELETE ON organizations BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Organization\' AND entity_id = OLD.id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Organization\' AND parent_id = OLD.id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Organization\' AND entity_id = OLD.id;END',
  'organizations_delete',
);

class OrganizationsDrift extends i2.ModularAccessor {
  OrganizationsDrift(i0.GeneratedDatabase db) : super(db);
  i3.Future<List<i1.Organization>> createOrganization({
    required String id,
    String? parentType,
    String? parentId,
    required String organizationId,
    required String state,
    required String displayName,
    String? annotations,
    String? primaryRegion,
  }) {
    return customWriteReturning(
      'INSERT INTO organizations (id, parent_type, parent_id, organization_id, state, display_name, annotations, primary_region) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8) RETURNING *',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
        i0.Variable<String>(organizationId),
        i0.Variable<String>(state),
        i0.Variable<String>(displayName),
        i0.Variable<String>(annotations),
        i0.Variable<String>(primaryRegion),
      ],
      updates: {organizations},
    ).then((rows) => Future.wait(rows.map(organizations.mapFromRow)));
  }

  i0.Selectable<i1.Organization> getOrganization({required String id}) {
    return customSelect(
      'SELECT * FROM organizations WHERE id = ?1 OR organization_id = ?1',
      variables: [i0.Variable<String>(id)],
      readsFrom: {organizations},
    ).asyncMap(organizations.mapFromRow);
  }

  i0.Selectable<ListOrganizationsResult> listOrganizations({
    required String userId,
    String? parentId,
    DateTime? startTime,
    required bool showDeleted,
    required int offset,
    ListOrganizations$orderBy? order_by,
    required int limit,
  }) {
    var $arrayStartIndex = 7;
    final generatedorder_by = $write(
      order_by?.call(this.organizations) ?? const i0.OrderBy.nothing(),
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedorder_by.amountOfVariables;
    return customSelect(
      'WITH memberships AS (SELECT parent_id AS organization_id FROM user_memberships WHERE user_id = ?1 AND parent_type = \'Celest::Organization\'), rowed AS (SELECT ROW_NUMBER()OVER (ORDER BY create_time DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE NO OTHERS) AS row_num, id FROM organizations INNER JOIN memberships ON organizations.id = memberships.organization_id WHERE(organizations.parent_id IS NULL AND ?2 IS NULL OR organizations.parent_id = ?2)AND organizations.create_time < coalesce(?3, unixepoch(\'now\', \'+1 second\', \'subsec\')) AND(?4 OR organizations.state != \'DELETED\')) SELECT row_num,"organizations"."id" AS "nested_0.id", "organizations"."parent_type" AS "nested_0.parent_type", "organizations"."parent_id" AS "nested_0.parent_id", "organizations"."organization_id" AS "nested_0.organization_id", "organizations"."state" AS "nested_0.state", "organizations"."display_name" AS "nested_0.display_name", "organizations"."create_time" AS "nested_0.create_time", "organizations"."update_time" AS "nested_0.update_time", "organizations"."delete_time" AS "nested_0.delete_time", "organizations"."purge_time" AS "nested_0.purge_time", "organizations"."annotations" AS "nested_0.annotations", "organizations"."primary_region" AS "nested_0.primary_region", "organizations"."reconciling" AS "nested_0.reconciling", "organizations"."etag" AS "nested_0.etag" FROM organizations INNER JOIN rowed ON organizations.id = rowed.id WHERE row_num > ?5 ${generatedorder_by.sql} LIMIT ?6',
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
        organizations,
        ...generatedorder_by.watchedTables,
      },
    ).asyncMap(
      (i0.QueryRow row) async => ListOrganizationsResult(
        rowNum: row.read<int>('row_num'),
        organizations: await organizations.mapFromRow(
          row,
          tablePrefix: 'nested_0',
        ),
      ),
    );
  }

  i0.Selectable<i1.Organization> debugDump() {
    return customSelect(
      'SELECT * FROM organizations',
      variables: [],
      readsFrom: {organizations},
    ).asyncMap(organizations.mapFromRow);
  }

  i3.Future<List<i1.Organization>> updateOrganization({
    String? parentType,
    String? parentId,
    String? state,
    String? displayName,
    String? annotations,
    DateTime? deleteTime,
    DateTime? purgeTime,
    String? primaryRegion,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE organizations SET parent_type = coalesce(?1, parent_type), parent_id = coalesce(?2, parent_id), state = coalesce(?3, state), display_name = coalesce(?4, display_name), annotations = coalesce(?5, annotations), update_time = unixepoch(\'now\', \'subsec\'), delete_time = coalesce(?6, delete_time), purge_time = coalesce(?7, purge_time), primary_region = coalesce(?8, primary_region) WHERE(id = ?9 OR organization_id = ?9)AND state != \'DELETED\' RETURNING *',
      variables: [
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
        i0.Variable<String>(state),
        i0.Variable<String>(displayName),
        i0.Variable<String>(annotations),
        i0.Variable<DateTime>(deleteTime),
        i0.Variable<DateTime>(purgeTime),
        i0.Variable<String>(primaryRegion),
        i0.Variable<String>(id),
      ],
      updates: {organizations},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(organizations.mapFromRow)));
  }

  i3.Future<List<i1.Organization>> deleteOrganization({
    String? state,
    DateTime? deleteTime,
    DateTime? purgeTime,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE organizations SET state = coalesce(?1, \'DELETED\'), delete_time = coalesce(?2, delete_time, unixepoch(\'now\', \'subsec\')), purge_time = coalesce(?3, purge_time, unixepoch(\'now\', \'+30 days\', \'subsec\')) WHERE id = ?4 OR organization_id = ?4 RETURNING *',
      variables: [
        i0.Variable<String>(state),
        i0.Variable<DateTime>(deleteTime),
        i0.Variable<DateTime>(purgeTime),
        i0.Variable<String>(id),
      ],
      updates: {organizations},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(organizations.mapFromRow)));
  }

  i3.Future<List<i1.Organization>> undeleteOrganization({
    String? state,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE organizations SET state = coalesce(?1, \'ACTIVE\'), delete_time = NULL, purge_time = NULL WHERE id = ?2 OR organization_id = ?2 RETURNING *',
      variables: [i0.Variable<String>(state), i0.Variable<String>(id)],
      updates: {organizations},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(organizations.mapFromRow)));
  }

  i3.Future<List<i1.Organization>> purgeOrganization({required String id}) {
    return customWriteReturning(
      'DELETE FROM organizations WHERE id = ?1 OR organization_id = ?1 RETURNING *',
      variables: [i0.Variable<String>(id)],
      updates: {organizations},
      updateKind: i0.UpdateKind.delete,
    ).then((rows) => Future.wait(rows.map(organizations.mapFromRow)));
  }

  i1.Organizations get organizations => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.Organizations>('organizations');
  i4.UserMemberships get userMemberships => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i4.UserMemberships>('user_memberships');
  i5.CedarDrift get cedarDrift => this.accessor(i5.CedarDrift.new);
  i4.UserMembershipsDrift get userMembershipsDrift =>
      this.accessor(i4.UserMembershipsDrift.new);
}

class ListOrganizationsResult {
  final int rowNum;
  final i1.Organization organizations;
  ListOrganizationsResult({required this.rowNum, required this.organizations});
}

typedef ListOrganizations$orderBy =
    i0.OrderBy Function(i1.Organizations organizations);
