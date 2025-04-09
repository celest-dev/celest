// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_hub/src/database/schema/operations.drift.dart'
    as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'dart:async' as i3;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i4;

typedef $OperationsCreateCompanionBuilder =
    i1.OperationsCompanion Function({
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
typedef $OperationsUpdateCompanionBuilder =
    i1.OperationsCompanion Function({
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

class $OperationsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Operations> {
  $OperationsFilterComposer({
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

class $OperationsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Operations> {
  $OperationsOrderingComposer({
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

class $OperationsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Operations> {
  $OperationsAnnotationComposer({
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

class $OperationsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Operations,
          i1.Operation,
          i1.$OperationsFilterComposer,
          i1.$OperationsOrderingComposer,
          i1.$OperationsAnnotationComposer,
          $OperationsCreateCompanionBuilder,
          $OperationsUpdateCompanionBuilder,
          (
            i1.Operation,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.Operations,
              i1.Operation
            >,
          ),
          i1.Operation,
          i0.PrefetchHooks Function()
        > {
  $OperationsTableManager(i0.GeneratedDatabase db, i1.Operations table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$OperationsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$OperationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$OperationsAnnotationComposer($db: db, $table: table),
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
              }) => i1.OperationsCompanion(
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
              }) => i1.OperationsCompanion.insert(
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

typedef $OperationsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Operations,
      i1.Operation,
      i1.$OperationsFilterComposer,
      i1.$OperationsOrderingComposer,
      i1.$OperationsAnnotationComposer,
      $OperationsCreateCompanionBuilder,
      $OperationsUpdateCompanionBuilder,
      (
        i1.Operation,
        i0.BaseReferences<i0.GeneratedDatabase, i1.Operations, i1.Operation>,
      ),
      i1.Operation,
      i0.PrefetchHooks Function()
    >;

class Operations extends i0.Table with i0.TableInfo<Operations, i1.Operation> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Operations(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'operations';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.Operation> instance, {
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
  i1.Operation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Operation(
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
  Operations createAlias(String alias) {
    return Operations(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Operation extends i0.DataClass implements i0.Insertable<i1.Operation> {
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
  const Operation({
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

  i1.OperationsCompanion toCompanion(bool nullToAbsent) {
    return i1.OperationsCompanion(
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

  factory Operation.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Operation(
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

  i1.Operation copyWith({
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
  }) => i1.Operation(
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
    return (StringBuffer('Operation(')
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
      (other is i1.Operation &&
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

class OperationsCompanion extends i0.UpdateCompanion<i1.Operation> {
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
  const OperationsCompanion({
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
  OperationsCompanion.insert({
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
  static i0.Insertable<i1.Operation> custom({
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

  i1.OperationsCompanion copyWith({
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
    return i1.OperationsCompanion(
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
    return (StringBuffer('OperationsCompanion(')
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

i0.Index get operationsFkOwnerIdx => i0.Index(
  'operations_fk_owner_idx',
  'CREATE INDEX IF NOT EXISTS operations_fk_owner_idx ON operations (owner_type, owner_id)',
);
i0.Index get operationsFkResourceIdx => i0.Index(
  'operations_fk_resource_idx',
  'CREATE INDEX IF NOT EXISTS operations_fk_resource_idx ON operations (resource_type, resource_id)',
);
i0.Trigger get operationsTriggerCreate => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_create BEFORE INSERT ON operations BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Operation\', NEW.id);END',
  'operations_trigger_create',
);
i0.Trigger get operationsTriggerCreateOwner => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_create_owner AFTER INSERT ON operations WHEN NEW.owner_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.owner_type, NEW.owner_id);END',
  'operations_trigger_create_owner',
);
i0.Trigger get operationsTriggerCreateResource => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_create_resource AFTER INSERT ON operations WHEN NEW.resource_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.resource_type, NEW.resource_id);END',
  'operations_trigger_create_resource',
);
i0.Trigger get operationsTriggerAddOwner => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_add_owner AFTER UPDATE OF owner_id ON operations WHEN OLD.owner_id IS NULL AND NEW.owner_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.owner_type, NEW.owner_id);END',
  'operations_trigger_add_owner',
);
i0.Trigger get operationsTriggerAddResource => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_add_resource AFTER UPDATE OF resource_id ON operations WHEN OLD.resource_id IS NULL AND NEW.resource_id IS NOT NULL BEGIN INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Operation\', NEW.id, NEW.resource_type, NEW.resource_id);END',
  'operations_trigger_add_resource',
);
i0.Trigger get operationsTriggerSetOwner => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_set_owner AFTER UPDATE OF owner_type, owner_id ON operations WHEN(OLD.owner_type != NEW.owner_type OR OLD.owner_id != NEW.owner_id)AND OLD.owner_id IS NOT NULL AND NEW.owner_id IS NOT NULL BEGIN UPDATE cedar_relationships SET parent_type = NEW.owner_type, parent_id = NEW.owner_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\' AND parent_type = OLD.owner_type AND parent_id = OLD.owner_id;END',
  'operations_trigger_set_owner',
);
i0.Trigger get operationsTriggerSetResource => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_set_resource AFTER UPDATE OF resource_type, resource_id ON operations WHEN(OLD.resource_type != NEW.resource_type OR OLD.resource_id != NEW.resource_id)AND OLD.resource_id IS NOT NULL AND NEW.resource_id IS NOT NULL BEGIN UPDATE cedar_relationships SET parent_type = NEW.resource_type, parent_id = NEW.resource_id WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\' AND parent_type = OLD.resource_type AND parent_id = OLD.resource_id;END',
  'operations_trigger_set_resource',
);
i0.Trigger get operationsTriggerDelete => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS operations_trigger_delete AFTER DELETE ON operations BEGIN DELETE FROM cedar_relationships WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\';DELETE FROM cedar_entities WHERE entity_id = OLD.id AND entity_type = \'Celest::Operation\';END',
  'operations_trigger_delete',
);

class OperationsDrift extends i2.ModularAccessor {
  OperationsDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<i1.Operation> getOperation({required String id}) {
    return customSelect(
      'SELECT * FROM operations WHERE id = ?1 LIMIT 1',
      variables: [i0.Variable<String>(id)],
      readsFrom: {operations},
    ).asyncMap(operations.mapFromRow);
  }

  i3.Future<List<i1.Operation>> createOperation({
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
      'INSERT INTO operations (id, metadata, response, error, full_resource_name, owner_type, owner_id, resource_type, resource_id) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9) RETURNING *',
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
      updates: {operations},
    ).then((rows) => Future.wait(rows.map(operations.mapFromRow)));
  }

  i0.Selectable<ListOperationsResult> listOperations({
    String? ownerType,
    String? ownerId,
    String? resourceType,
    String? resourceId,
    DateTime? startTime,
    required int offset,
    required int limit,
  }) {
    return customSelect(
      'WITH rowed AS (SELECT ROW_NUMBER()OVER (ORDER BY create_time DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE NO OTHERS) AS row_num, id FROM operations WHERE(operations.owner_type IS NULL AND ?1 IS NULL OR operations.owner_type = ?1)AND(operations.owner_id IS NULL AND ?2 IS NULL OR operations.owner_id = ?2)AND(operations.resource_type IS NULL AND ?3 IS NULL OR operations.resource_type = ?3)AND(operations.resource_id IS NULL AND ?4 IS NULL OR operations.resource_id = ?4)AND operations.create_time < coalesce(?5, unixepoch(\'now\', \'+1 second\', \'subsec\'))) SELECT row_num,"operations"."id" AS "nested_0.id", "operations"."metadata" AS "nested_0.metadata", "operations"."response" AS "nested_0.response", "operations"."error" AS "nested_0.error", "operations"."done" AS "nested_0.done", "operations"."create_time" AS "nested_0.create_time", "operations"."full_resource_name" AS "nested_0.full_resource_name", "operations"."owner_type" AS "nested_0.owner_type", "operations"."owner_id" AS "nested_0.owner_id", "operations"."resource_type" AS "nested_0.resource_type", "operations"."resource_id" AS "nested_0.resource_id" FROM operations INNER JOIN rowed ON operations.id = rowed.id WHERE row_num > ?6 ORDER BY create_time DESC LIMIT ?7',
      variables: [
        i0.Variable<String>(ownerType),
        i0.Variable<String>(ownerId),
        i0.Variable<String>(resourceType),
        i0.Variable<String>(resourceId),
        i0.Variable<DateTime>(startTime),
        i0.Variable<int>(offset),
        i0.Variable<int>(limit),
      ],
      readsFrom: {operations},
    ).asyncMap(
      (i0.QueryRow row) async => ListOperationsResult(
        rowNum: row.read<int>('row_num'),
        operations: await operations.mapFromRow(row, tablePrefix: 'nested_0'),
      ),
    );
  }

  i3.Future<List<i1.Operation>> updateOperation({
    String? metadata,
    String? response,
    String? error,
    String? fullResourceName,
    String? resourceType,
    String? resourceId,
    String? ownerType,
    String? ownerId,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE operations SET metadata = coalesce(?1, metadata), response = coalesce(?2, response), error = coalesce(?3, error), full_resource_name = coalesce(?4, full_resource_name), resource_type = coalesce(?5, resource_type), resource_id = coalesce(?6, resource_id), owner_type = coalesce(?7, owner_type), owner_id = coalesce(?8, owner_id) WHERE id = ?9 RETURNING *',
      variables: [
        i0.Variable<String>(metadata),
        i0.Variable<String>(response),
        i0.Variable<String>(error),
        i0.Variable<String>(fullResourceName),
        i0.Variable<String>(resourceType),
        i0.Variable<String>(resourceId),
        i0.Variable<String>(ownerType),
        i0.Variable<String>(ownerId),
        i0.Variable<String>(id),
      ],
      updates: {operations},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(operations.mapFromRow)));
  }

  i3.Future<List<i1.Operation>> deleteOperation({required String id}) {
    return customWriteReturning(
      'DELETE FROM operations WHERE id = ?1 RETURNING *',
      variables: [i0.Variable<String>(id)],
      updates: {operations},
      updateKind: i0.UpdateKind.delete,
    ).then((rows) => Future.wait(rows.map(operations.mapFromRow)));
  }

  i1.Operations get operations => i2.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.Operations>('operations');
  i4.CedarDrift get cedarDrift => this.accessor(i4.CedarDrift.new);
}

class ListOperationsResult {
  final int rowNum;
  final i1.Operation operations;
  ListOperationsResult({required this.rowNum, required this.operations});
}
