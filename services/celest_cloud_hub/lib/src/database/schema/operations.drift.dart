// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_hub/src/database/schema/operations.drift.dart'
    as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'dart:async' as i3;

typedef $CelestOperationsCreateCompanionBuilder =
    i1.CelestOperationsCompanion Function({
      required String id,
      i0.Value<String?> metadata,
      i0.Value<String?> response,
      i0.Value<String?> error,
      i0.Value<DateTime> createTime,
      i0.Value<String?> fullResourceName,
      i0.Value<String?> ownerType,
      i0.Value<String?> ownerId,
      i0.Value<String?> resourceType,
      i0.Value<String?> resourceId,
      i0.Value<int> rowid,
    });
typedef $CelestOperationsUpdateCompanionBuilder =
    i1.CelestOperationsCompanion Function({
      i0.Value<String> id,
      i0.Value<String?> metadata,
      i0.Value<String?> response,
      i0.Value<String?> error,
      i0.Value<DateTime> createTime,
      i0.Value<String?> fullResourceName,
      i0.Value<String?> ownerType,
      i0.Value<String?> ownerId,
      i0.Value<String?> resourceType,
      i0.Value<String?> resourceId,
      i0.Value<int> rowid,
    });

class $CelestOperationsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestOperations> {
  $CelestOperationsFilterComposer({
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

  i0.ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get response => $composableBuilder(
    column: $table.response,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get fullResourceName => $composableBuilder(
    column: $table.fullResourceName,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get resourceType => $composableBuilder(
    column: $table.resourceType,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get resourceId => $composableBuilder(
    column: $table.resourceId,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $CelestOperationsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestOperations> {
  $CelestOperationsOrderingComposer({
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

  i0.ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get response => $composableBuilder(
    column: $table.response,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get fullResourceName => $composableBuilder(
    column: $table.fullResourceName,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get resourceType => $composableBuilder(
    column: $table.resourceType,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get resourceId => $composableBuilder(
    column: $table.resourceId,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $CelestOperationsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestOperations> {
  $CelestOperationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  i0.GeneratedColumn<String> get response =>
      $composableBuilder(column: $table.response, builder: (column) => column);

  i0.GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  i0.GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createTime => $composableBuilder(
    column: $table.createTime,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get fullResourceName => $composableBuilder(
    column: $table.fullResourceName,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get ownerType =>
      $composableBuilder(column: $table.ownerType, builder: (column) => column);

  i0.GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  i0.GeneratedColumn<String> get resourceType => $composableBuilder(
    column: $table.resourceType,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get resourceId => $composableBuilder(
    column: $table.resourceId,
    builder: (column) => column,
  );
}

class $CelestOperationsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.CelestOperations,
          i1.CelestOperation,
          i1.$CelestOperationsFilterComposer,
          i1.$CelestOperationsOrderingComposer,
          i1.$CelestOperationsAnnotationComposer,
          $CelestOperationsCreateCompanionBuilder,
          $CelestOperationsUpdateCompanionBuilder,
          (
            i1.CelestOperation,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.CelestOperations,
              i1.CelestOperation
            >,
          ),
          i1.CelestOperation,
          i0.PrefetchHooks Function()
        > {
  $CelestOperationsTableManager(
    i0.GeneratedDatabase db,
    i1.CelestOperations table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$CelestOperationsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  i1.$CelestOperationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$CelestOperationsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> id = const i0.Value.absent(),
                i0.Value<String?> metadata = const i0.Value.absent(),
                i0.Value<String?> response = const i0.Value.absent(),
                i0.Value<String?> error = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<String?> fullResourceName = const i0.Value.absent(),
                i0.Value<String?> ownerType = const i0.Value.absent(),
                i0.Value<String?> ownerId = const i0.Value.absent(),
                i0.Value<String?> resourceType = const i0.Value.absent(),
                i0.Value<String?> resourceId = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CelestOperationsCompanion(
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
                i0.Value<String?> metadata = const i0.Value.absent(),
                i0.Value<String?> response = const i0.Value.absent(),
                i0.Value<String?> error = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<String?> fullResourceName = const i0.Value.absent(),
                i0.Value<String?> ownerType = const i0.Value.absent(),
                i0.Value<String?> ownerId = const i0.Value.absent(),
                i0.Value<String?> resourceType = const i0.Value.absent(),
                i0.Value<String?> resourceId = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CelestOperationsCompanion.insert(
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
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CelestOperationsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.CelestOperations,
      i1.CelestOperation,
      i1.$CelestOperationsFilterComposer,
      i1.$CelestOperationsOrderingComposer,
      i1.$CelestOperationsAnnotationComposer,
      $CelestOperationsCreateCompanionBuilder,
      $CelestOperationsUpdateCompanionBuilder,
      (
        i1.CelestOperation,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.CelestOperations,
          i1.CelestOperation
        >,
      ),
      i1.CelestOperation,
      i0.PrefetchHooks Function()
    >;

class CelestOperations extends i0.Table
    with i0.TableInfo<CelestOperations, i1.CelestOperation> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestOperations(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<String> id = i0.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const i0.VerificationMeta _metadataMeta = const i0.VerificationMeta(
    'metadata',
  );
  late final i0.GeneratedColumn<String> metadata = i0.GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _responseMeta = const i0.VerificationMeta(
    'response',
  );
  late final i0.GeneratedColumn<String> response = i0.GeneratedColumn<String>(
    'response',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _errorMeta = const i0.VerificationMeta(
    'error',
  );
  late final i0.GeneratedColumn<String> error = i0.GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _doneMeta = const i0.VerificationMeta(
    'done',
  );
  late final i0.GeneratedColumn<bool> done = i0.GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    generatedAs: i0.GeneratedAs(
      const i0.CustomExpression('response IS NOT NULL OR error IS NOT NULL'),
      false,
    ),
    type: i0.DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (response IS NOT NULL OR error IS NOT NULL) VIRTUAL',
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
  static const i0.VerificationMeta _fullResourceNameMeta =
      const i0.VerificationMeta('fullResourceName');
  late final i0.GeneratedColumn<String> fullResourceName =
      i0.GeneratedColumn<String>(
        'full_resource_name',
        aliasedName,
        true,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const i0.VerificationMeta _ownerTypeMeta = const i0.VerificationMeta(
    'ownerType',
  );
  late final i0.GeneratedColumn<String> ownerType = i0.GeneratedColumn<String>(
    'owner_type',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _ownerIdMeta = const i0.VerificationMeta(
    'ownerId',
  );
  late final i0.GeneratedColumn<String> ownerId = i0.GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _resourceTypeMeta =
      const i0.VerificationMeta('resourceType');
  late final i0.GeneratedColumn<String> resourceType =
      i0.GeneratedColumn<String>(
        'resource_type',
        aliasedName,
        true,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const i0.VerificationMeta _resourceIdMeta = const i0.VerificationMeta(
    'resourceId',
  );
  late final i0.GeneratedColumn<String> resourceId = i0.GeneratedColumn<String>(
    'resource_id',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
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
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.CelestOperation> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.CelestOperation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CelestOperation(
      id:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      metadata: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
      response: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}response'],
      ),
      error: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      done:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.bool,
            data['${effectivePrefix}done'],
          )!,
      createTime:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.dateTime,
            data['${effectivePrefix}create_time'],
          )!,
      fullResourceName: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}full_resource_name'],
      ),
      ownerType: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}owner_type'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      ),
      resourceType: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}resource_type'],
      ),
      resourceId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
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

class CelestOperation extends i0.DataClass
    implements i0.Insertable<i1.CelestOperation> {
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = i0.Variable<String>(metadata);
    }
    if (!nullToAbsent || response != null) {
      map['response'] = i0.Variable<String>(response);
    }
    if (!nullToAbsent || error != null) {
      map['error'] = i0.Variable<String>(error);
    }
    map['create_time'] = i0.Variable<DateTime>(createTime);
    if (!nullToAbsent || fullResourceName != null) {
      map['full_resource_name'] = i0.Variable<String>(fullResourceName);
    }
    if (!nullToAbsent || ownerType != null) {
      map['owner_type'] = i0.Variable<String>(ownerType);
    }
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = i0.Variable<String>(ownerId);
    }
    if (!nullToAbsent || resourceType != null) {
      map['resource_type'] = i0.Variable<String>(resourceType);
    }
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = i0.Variable<String>(resourceId);
    }
    return map;
  }

  i1.CelestOperationsCompanion toCompanion(bool nullToAbsent) {
    return i1.CelestOperationsCompanion(
      id: i0.Value(id),
      metadata:
          metadata == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(metadata),
      response:
          response == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(response),
      error:
          error == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(error),
      createTime: i0.Value(createTime),
      fullResourceName:
          fullResourceName == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(fullResourceName),
      ownerType:
          ownerType == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(ownerType),
      ownerId:
          ownerId == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(ownerId),
      resourceType:
          resourceType == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(resourceType),
      resourceId:
          resourceId == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(resourceId),
    );
  }

  factory CelestOperation.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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

  i1.CelestOperation copyWith({
    String? id,
    i0.Value<String?> metadata = const i0.Value.absent(),
    i0.Value<String?> response = const i0.Value.absent(),
    i0.Value<String?> error = const i0.Value.absent(),
    bool? done,
    DateTime? createTime,
    i0.Value<String?> fullResourceName = const i0.Value.absent(),
    i0.Value<String?> ownerType = const i0.Value.absent(),
    i0.Value<String?> ownerId = const i0.Value.absent(),
    i0.Value<String?> resourceType = const i0.Value.absent(),
    i0.Value<String?> resourceId = const i0.Value.absent(),
  }) => i1.CelestOperation(
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
      (other is i1.CelestOperation &&
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

class CelestOperationsCompanion extends i0.UpdateCompanion<i1.CelestOperation> {
  final i0.Value<String> id;
  final i0.Value<String?> metadata;
  final i0.Value<String?> response;
  final i0.Value<String?> error;
  final i0.Value<DateTime> createTime;
  final i0.Value<String?> fullResourceName;
  final i0.Value<String?> ownerType;
  final i0.Value<String?> ownerId;
  final i0.Value<String?> resourceType;
  final i0.Value<String?> resourceId;
  final i0.Value<int> rowid;
  const CelestOperationsCompanion({
    this.id = const i0.Value.absent(),
    this.metadata = const i0.Value.absent(),
    this.response = const i0.Value.absent(),
    this.error = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.fullResourceName = const i0.Value.absent(),
    this.ownerType = const i0.Value.absent(),
    this.ownerId = const i0.Value.absent(),
    this.resourceType = const i0.Value.absent(),
    this.resourceId = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CelestOperationsCompanion.insert({
    required String id,
    this.metadata = const i0.Value.absent(),
    this.response = const i0.Value.absent(),
    this.error = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.fullResourceName = const i0.Value.absent(),
    this.ownerType = const i0.Value.absent(),
    this.ownerId = const i0.Value.absent(),
    this.resourceType = const i0.Value.absent(),
    this.resourceId = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : id = i0.Value(id);
  static i0.Insertable<i1.CelestOperation> custom({
    i0.Expression<String>? id,
    i0.Expression<String>? metadata,
    i0.Expression<String>? response,
    i0.Expression<String>? error,
    i0.Expression<DateTime>? createTime,
    i0.Expression<String>? fullResourceName,
    i0.Expression<String>? ownerType,
    i0.Expression<String>? ownerId,
    i0.Expression<String>? resourceType,
    i0.Expression<String>? resourceId,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
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

  i1.CelestOperationsCompanion copyWith({
    i0.Value<String>? id,
    i0.Value<String?>? metadata,
    i0.Value<String?>? response,
    i0.Value<String?>? error,
    i0.Value<DateTime>? createTime,
    i0.Value<String?>? fullResourceName,
    i0.Value<String?>? ownerType,
    i0.Value<String?>? ownerId,
    i0.Value<String?>? resourceType,
    i0.Value<String?>? resourceId,
    i0.Value<int>? rowid,
  }) {
    return i1.CelestOperationsCompanion(
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<String>(id.value);
    }
    if (metadata.present) {
      map['metadata'] = i0.Variable<String>(metadata.value);
    }
    if (response.present) {
      map['response'] = i0.Variable<String>(response.value);
    }
    if (error.present) {
      map['error'] = i0.Variable<String>(error.value);
    }
    if (createTime.present) {
      map['create_time'] = i0.Variable<DateTime>(createTime.value);
    }
    if (fullResourceName.present) {
      map['full_resource_name'] = i0.Variable<String>(fullResourceName.value);
    }
    if (ownerType.present) {
      map['owner_type'] = i0.Variable<String>(ownerType.value);
    }
    if (ownerId.present) {
      map['owner_id'] = i0.Variable<String>(ownerId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = i0.Variable<String>(resourceType.value);
    }
    if (resourceId.present) {
      map['resource_id'] = i0.Variable<String>(resourceId.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
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

class OperationsDrift extends i2.ModularAccessor {
  OperationsDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.CelestOperation> getOperation({required String id}) {
    return customSelect(
      'SELECT * FROM celest_operations WHERE id = ?1',
      variables: [i0.Variable<String>(id)],
      readsFrom: {celestOperations},
    ).asyncMap(celestOperations.mapFromRow);
  }

  i3.Future<List<i1.CelestOperation>> createOperation({
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
        i0.Variable<String>(id),
        i0.Variable<String>(metadata),
        i0.Variable<String>(response),
        i0.Variable<String>(error),
        i0.Variable<String>(fullResourceName),
        i0.Variable<String>(ownerType),
        i0.Variable<String>(ownerId),
        i0.Variable<String>(resourceType),
        i0.Variable<String>(resourceId),
      ],
      updates: {celestOperations},
    ).then((rows) => Future.wait(rows.map(celestOperations.mapFromRow)));
  }

  i3.Future<List<i1.CelestOperation>> updateOperation({
    String? metadata,
    String? response,
    String? error,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE celest_operations SET metadata = coalesce(?1, metadata), response = coalesce(?2, response), error = coalesce(?3, error) WHERE id = ?4 RETURNING *',
      variables: [
        i0.Variable<String>(metadata),
        i0.Variable<String>(response),
        i0.Variable<String>(error),
        i0.Variable<String>(id),
      ],
      updates: {celestOperations},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(celestOperations.mapFromRow)));
  }

  i1.CelestOperations get celestOperations => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.CelestOperations>('celest_operations');
}
