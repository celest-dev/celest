// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_projects.drift.dart'
    as i1;
import 'package:celest_ast/src/resolved_ast.dart' as i2;
import 'dart:typed_data' as i3;
import 'package:celest_cloud_auth/src/database/schema/converters/ast_converters.dart'
    as i4;
import 'package:drift/internal/modular.dart' as i5;
import 'dart:async' as i6;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i7;

typedef $CloudAuthProjectsCreateCompanionBuilder =
    i1.CloudAuthProjectsCompanion Function({
      required String projectId,
      required String version,
      required i2.ResolvedProject resolvedAst,
      required String etag,
      i0.Value<int> rowid,
    });
typedef $CloudAuthProjectsUpdateCompanionBuilder =
    i1.CloudAuthProjectsCompanion Function({
      i0.Value<String> projectId,
      i0.Value<String> version,
      i0.Value<i2.ResolvedProject> resolvedAst,
      i0.Value<String> etag,
      i0.Value<int> rowid,
    });

class $CloudAuthProjectsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthProjects> {
  $CloudAuthProjectsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnWithTypeConverterFilters<
    i2.ResolvedProject,
    i2.ResolvedProject,
    i3.Uint8List
  >
  get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => i0.ColumnWithTypeConverterFilters(column),
  );

  i0.ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $CloudAuthProjectsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthProjects> {
  $CloudAuthProjectsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<i3.Uint8List> get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $CloudAuthProjectsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthProjects> {
  $CloudAuthProjectsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  i0.GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i2.ResolvedProject, i3.Uint8List>
  get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $CloudAuthProjectsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.CloudAuthProjects,
          i1.CloudAuthProject,
          i1.$CloudAuthProjectsFilterComposer,
          i1.$CloudAuthProjectsOrderingComposer,
          i1.$CloudAuthProjectsAnnotationComposer,
          $CloudAuthProjectsCreateCompanionBuilder,
          $CloudAuthProjectsUpdateCompanionBuilder,
          (
            i1.CloudAuthProject,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.CloudAuthProjects,
              i1.CloudAuthProject
            >,
          ),
          i1.CloudAuthProject,
          i0.PrefetchHooks Function()
        > {
  $CloudAuthProjectsTableManager(
    i0.GeneratedDatabase db,
    i1.CloudAuthProjects table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$CloudAuthProjectsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  i1.$CloudAuthProjectsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$CloudAuthProjectsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> projectId = const i0.Value.absent(),
                i0.Value<String> version = const i0.Value.absent(),
                i0.Value<i2.ResolvedProject> resolvedAst =
                    const i0.Value.absent(),
                i0.Value<String> etag = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CloudAuthProjectsCompanion(
                projectId: projectId,
                version: version,
                resolvedAst: resolvedAst,
                etag: etag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String projectId,
                required String version,
                required i2.ResolvedProject resolvedAst,
                required String etag,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CloudAuthProjectsCompanion.insert(
                projectId: projectId,
                version: version,
                resolvedAst: resolvedAst,
                etag: etag,
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

typedef $CloudAuthProjectsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.CloudAuthProjects,
      i1.CloudAuthProject,
      i1.$CloudAuthProjectsFilterComposer,
      i1.$CloudAuthProjectsOrderingComposer,
      i1.$CloudAuthProjectsAnnotationComposer,
      $CloudAuthProjectsCreateCompanionBuilder,
      $CloudAuthProjectsUpdateCompanionBuilder,
      (
        i1.CloudAuthProject,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.CloudAuthProjects,
          i1.CloudAuthProject
        >,
      ),
      i1.CloudAuthProject,
      i0.PrefetchHooks Function()
    >;
typedef $CloudAuthApisCreateCompanionBuilder =
    i1.CloudAuthApisCompanion Function({
      required String apiId,
      required String projectId,
      required i2.ResolvedApi resolvedAst,
      required String etag,
      i0.Value<int> rowid,
    });
typedef $CloudAuthApisUpdateCompanionBuilder =
    i1.CloudAuthApisCompanion Function({
      i0.Value<String> apiId,
      i0.Value<String> projectId,
      i0.Value<i2.ResolvedApi> resolvedAst,
      i0.Value<String> etag,
      i0.Value<int> rowid,
    });

class $CloudAuthApisFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthApis> {
  $CloudAuthApisFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnWithTypeConverterFilters<
    i2.ResolvedApi,
    i2.ResolvedApi,
    i3.Uint8List
  >
  get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => i0.ColumnWithTypeConverterFilters(column),
  );

  i0.ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $CloudAuthApisOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthApis> {
  $CloudAuthApisOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<i3.Uint8List> get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $CloudAuthApisAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthApis> {
  $CloudAuthApisAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  i0.GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i2.ResolvedApi, i3.Uint8List>
  get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $CloudAuthApisTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.CloudAuthApis,
          i1.CloudAuthApi,
          i1.$CloudAuthApisFilterComposer,
          i1.$CloudAuthApisOrderingComposer,
          i1.$CloudAuthApisAnnotationComposer,
          $CloudAuthApisCreateCompanionBuilder,
          $CloudAuthApisUpdateCompanionBuilder,
          (
            i1.CloudAuthApi,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.CloudAuthApis,
              i1.CloudAuthApi
            >,
          ),
          i1.CloudAuthApi,
          i0.PrefetchHooks Function()
        > {
  $CloudAuthApisTableManager(i0.GeneratedDatabase db, i1.CloudAuthApis table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$CloudAuthApisFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$CloudAuthApisOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$CloudAuthApisAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> apiId = const i0.Value.absent(),
                i0.Value<String> projectId = const i0.Value.absent(),
                i0.Value<i2.ResolvedApi> resolvedAst = const i0.Value.absent(),
                i0.Value<String> etag = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CloudAuthApisCompanion(
                apiId: apiId,
                projectId: projectId,
                resolvedAst: resolvedAst,
                etag: etag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String apiId,
                required String projectId,
                required i2.ResolvedApi resolvedAst,
                required String etag,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CloudAuthApisCompanion.insert(
                apiId: apiId,
                projectId: projectId,
                resolvedAst: resolvedAst,
                etag: etag,
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

typedef $CloudAuthApisProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.CloudAuthApis,
      i1.CloudAuthApi,
      i1.$CloudAuthApisFilterComposer,
      i1.$CloudAuthApisOrderingComposer,
      i1.$CloudAuthApisAnnotationComposer,
      $CloudAuthApisCreateCompanionBuilder,
      $CloudAuthApisUpdateCompanionBuilder,
      (
        i1.CloudAuthApi,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.CloudAuthApis,
          i1.CloudAuthApi
        >,
      ),
      i1.CloudAuthApi,
      i0.PrefetchHooks Function()
    >;
typedef $CloudAuthFunctionsCreateCompanionBuilder =
    i1.CloudAuthFunctionsCompanion Function({
      required String functionId,
      required String apiId,
      required i2.ResolvedCloudFunction resolvedAst,
      required String etag,
      i0.Value<int> rowid,
    });
typedef $CloudAuthFunctionsUpdateCompanionBuilder =
    i1.CloudAuthFunctionsCompanion Function({
      i0.Value<String> functionId,
      i0.Value<String> apiId,
      i0.Value<i2.ResolvedCloudFunction> resolvedAst,
      i0.Value<String> etag,
      i0.Value<int> rowid,
    });

class $CloudAuthFunctionsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthFunctions> {
  $CloudAuthFunctionsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get functionId => $composableBuilder(
    column: $table.functionId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnWithTypeConverterFilters<
    i2.ResolvedCloudFunction,
    i2.ResolvedCloudFunction,
    i3.Uint8List
  >
  get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => i0.ColumnWithTypeConverterFilters(column),
  );

  i0.ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $CloudAuthFunctionsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthFunctions> {
  $CloudAuthFunctionsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get functionId => $composableBuilder(
    column: $table.functionId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<i3.Uint8List> get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $CloudAuthFunctionsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CloudAuthFunctions> {
  $CloudAuthFunctionsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get functionId => $composableBuilder(
    column: $table.functionId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i2.ResolvedCloudFunction, i3.Uint8List>
  get resolvedAst => $composableBuilder(
    column: $table.resolvedAst,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $CloudAuthFunctionsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.CloudAuthFunctions,
          i1.CloudAuthFunction,
          i1.$CloudAuthFunctionsFilterComposer,
          i1.$CloudAuthFunctionsOrderingComposer,
          i1.$CloudAuthFunctionsAnnotationComposer,
          $CloudAuthFunctionsCreateCompanionBuilder,
          $CloudAuthFunctionsUpdateCompanionBuilder,
          (
            i1.CloudAuthFunction,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.CloudAuthFunctions,
              i1.CloudAuthFunction
            >,
          ),
          i1.CloudAuthFunction,
          i0.PrefetchHooks Function()
        > {
  $CloudAuthFunctionsTableManager(
    i0.GeneratedDatabase db,
    i1.CloudAuthFunctions table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  i1.$CloudAuthFunctionsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$CloudAuthFunctionsOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => i1.$CloudAuthFunctionsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> functionId = const i0.Value.absent(),
                i0.Value<String> apiId = const i0.Value.absent(),
                i0.Value<i2.ResolvedCloudFunction> resolvedAst =
                    const i0.Value.absent(),
                i0.Value<String> etag = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CloudAuthFunctionsCompanion(
                functionId: functionId,
                apiId: apiId,
                resolvedAst: resolvedAst,
                etag: etag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String functionId,
                required String apiId,
                required i2.ResolvedCloudFunction resolvedAst,
                required String etag,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CloudAuthFunctionsCompanion.insert(
                functionId: functionId,
                apiId: apiId,
                resolvedAst: resolvedAst,
                etag: etag,
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

typedef $CloudAuthFunctionsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.CloudAuthFunctions,
      i1.CloudAuthFunction,
      i1.$CloudAuthFunctionsFilterComposer,
      i1.$CloudAuthFunctionsOrderingComposer,
      i1.$CloudAuthFunctionsAnnotationComposer,
      $CloudAuthFunctionsCreateCompanionBuilder,
      $CloudAuthFunctionsUpdateCompanionBuilder,
      (
        i1.CloudAuthFunction,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.CloudAuthFunctions,
          i1.CloudAuthFunction
        >,
      ),
      i1.CloudAuthFunction,
      i0.PrefetchHooks Function()
    >;

class CloudAuthProjects extends i0.Table
    with i0.TableInfo<CloudAuthProjects, i1.CloudAuthProject> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthProjects(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> projectId = i0.GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final i0.GeneratedColumn<String> version = i0.GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumnWithTypeConverter<
    i2.ResolvedProject,
    i3.Uint8List
  >
  resolvedAst = i0.GeneratedColumn<i3.Uint8List>(
    'resolved_ast',
    aliasedName,
    false,
    type: i0.DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<i2.ResolvedProject>(
    i1.CloudAuthProjects.$converterresolvedAst,
  );
  late final i0.GeneratedColumn<String> etag = i0.GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
    projectId,
    version,
    resolvedAst,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_projects';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {projectId};
  @override
  i1.CloudAuthProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CloudAuthProject(
      projectId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      version:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}version'],
          )!,
      resolvedAst: i1.CloudAuthProjects.$converterresolvedAst.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.blob,
          data['${effectivePrefix}resolved_ast'],
        )!,
      ),
      etag:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  CloudAuthProjects createAlias(String alias) {
    return CloudAuthProjects(attachedDatabase, alias);
  }

  static i0.TypeConverter<i2.ResolvedProject, i3.Uint8List>
  $converterresolvedAst = const i4.ResolvedProjectConverter();
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthProject extends i0.DataClass
    implements i0.Insertable<i1.CloudAuthProject> {
  /// The unique identifier of the project.
  final String projectId;

  /// The version of the project.
  final String version;

  /// The resolved AST.
  ///
  /// Format: Proto[celest.ast.v1.ResolvedProject]
  final i2.ResolvedProject resolvedAst;

  /// A hash of the project metadata.
  final String etag;
  const CloudAuthProject({
    required this.projectId,
    required this.version,
    required this.resolvedAst,
    required this.etag,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['project_id'] = i0.Variable<String>(projectId);
    map['version'] = i0.Variable<String>(version);
    {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
        i1.CloudAuthProjects.$converterresolvedAst.toSql(resolvedAst),
      );
    }
    map['etag'] = i0.Variable<String>(etag);
    return map;
  }

  factory CloudAuthProject.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CloudAuthProject(
      projectId: serializer.fromJson<String>(json['project_id']),
      version: serializer.fromJson<String>(json['version']),
      resolvedAst: serializer.fromJson<i2.ResolvedProject>(
        json['resolved_ast'],
      ),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'project_id': serializer.toJson<String>(projectId),
      'version': serializer.toJson<String>(version),
      'resolved_ast': serializer.toJson<i2.ResolvedProject>(resolvedAst),
      'etag': serializer.toJson<String>(etag),
    };
  }

  i1.CloudAuthProject copyWith({
    String? projectId,
    String? version,
    i2.ResolvedProject? resolvedAst,
    String? etag,
  }) => i1.CloudAuthProject(
    projectId: projectId ?? this.projectId,
    version: version ?? this.version,
    resolvedAst: resolvedAst ?? this.resolvedAst,
    etag: etag ?? this.etag,
  );
  CloudAuthProject copyWithCompanion(i1.CloudAuthProjectsCompanion data) {
    return CloudAuthProject(
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      version: data.version.present ? data.version.value : this.version,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthProject(')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(projectId, version, resolvedAst, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CloudAuthProject &&
          other.projectId == this.projectId &&
          other.version == this.version &&
          other.resolvedAst == this.resolvedAst &&
          other.etag == this.etag);
}

class CloudAuthProjectsCompanion
    extends i0.UpdateCompanion<i1.CloudAuthProject> {
  final i0.Value<String> projectId;
  final i0.Value<String> version;
  final i0.Value<i2.ResolvedProject> resolvedAst;
  final i0.Value<String> etag;
  final i0.Value<int> rowid;
  const CloudAuthProjectsCompanion({
    this.projectId = const i0.Value.absent(),
    this.version = const i0.Value.absent(),
    this.resolvedAst = const i0.Value.absent(),
    this.etag = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CloudAuthProjectsCompanion.insert({
    required String projectId,
    required String version,
    required i2.ResolvedProject resolvedAst,
    required String etag,
    this.rowid = const i0.Value.absent(),
  }) : projectId = i0.Value(projectId),
       version = i0.Value(version),
       resolvedAst = i0.Value(resolvedAst),
       etag = i0.Value(etag);
  static i0.Insertable<i1.CloudAuthProject> custom({
    i0.Expression<String>? projectId,
    i0.Expression<String>? version,
    i0.Expression<i3.Uint8List>? resolvedAst,
    i0.Expression<String>? etag,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (projectId != null) 'project_id': projectId,
      if (version != null) 'version': version,
      if (resolvedAst != null) 'resolved_ast': resolvedAst,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CloudAuthProjectsCompanion copyWith({
    i0.Value<String>? projectId,
    i0.Value<String>? version,
    i0.Value<i2.ResolvedProject>? resolvedAst,
    i0.Value<String>? etag,
    i0.Value<int>? rowid,
  }) {
    return i1.CloudAuthProjectsCompanion(
      projectId: projectId ?? this.projectId,
      version: version ?? this.version,
      resolvedAst: resolvedAst ?? this.resolvedAst,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (projectId.present) {
      map['project_id'] = i0.Variable<String>(projectId.value);
    }
    if (version.present) {
      map['version'] = i0.Variable<String>(version.value);
    }
    if (resolvedAst.present) {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
        i1.CloudAuthProjects.$converterresolvedAst.toSql(resolvedAst.value),
      );
    }
    if (etag.present) {
      map['etag'] = i0.Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthProjectsCompanion(')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CloudAuthApis extends i0.Table
    with i0.TableInfo<CloudAuthApis, i1.CloudAuthApi> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthApis(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> apiId = i0.GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final i0.GeneratedColumn<String> projectId = i0.GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumnWithTypeConverter<i2.ResolvedApi, i3.Uint8List>
  resolvedAst = i0.GeneratedColumn<i3.Uint8List>(
    'resolved_ast',
    aliasedName,
    false,
    type: i0.DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<i2.ResolvedApi>(i1.CloudAuthApis.$converterresolvedAst);
  late final i0.GeneratedColumn<String> etag = i0.GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
    apiId,
    projectId,
    resolvedAst,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_apis';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {apiId};
  @override
  i1.CloudAuthApi map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CloudAuthApi(
      apiId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}api_id'],
          )!,
      projectId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      resolvedAst: i1.CloudAuthApis.$converterresolvedAst.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.blob,
          data['${effectivePrefix}resolved_ast'],
        )!,
      ),
      etag:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  CloudAuthApis createAlias(String alias) {
    return CloudAuthApis(attachedDatabase, alias);
  }

  static i0.TypeConverter<i2.ResolvedApi, i3.Uint8List> $converterresolvedAst =
      const i4.ResolvedApiConverter();
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_apis_project_fk FOREIGN KEY(project_id)REFERENCES cloud_auth_projects(project_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthApi extends i0.DataClass
    implements i0.Insertable<i1.CloudAuthApi> {
  /// The unique identifier of the API.
  final String apiId;

  /// The project ID of the API.
  final String projectId;

  /// The resolved AST.
  ///
  /// Format: Proto[celest.ast.v1.ResolvedApi]
  final i2.ResolvedApi resolvedAst;

  /// A hash of the API metadata.
  final String etag;
  const CloudAuthApi({
    required this.apiId,
    required this.projectId,
    required this.resolvedAst,
    required this.etag,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['api_id'] = i0.Variable<String>(apiId);
    map['project_id'] = i0.Variable<String>(projectId);
    {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
        i1.CloudAuthApis.$converterresolvedAst.toSql(resolvedAst),
      );
    }
    map['etag'] = i0.Variable<String>(etag);
    return map;
  }

  factory CloudAuthApi.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CloudAuthApi(
      apiId: serializer.fromJson<String>(json['api_id']),
      projectId: serializer.fromJson<String>(json['project_id']),
      resolvedAst: serializer.fromJson<i2.ResolvedApi>(json['resolved_ast']),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'api_id': serializer.toJson<String>(apiId),
      'project_id': serializer.toJson<String>(projectId),
      'resolved_ast': serializer.toJson<i2.ResolvedApi>(resolvedAst),
      'etag': serializer.toJson<String>(etag),
    };
  }

  i1.CloudAuthApi copyWith({
    String? apiId,
    String? projectId,
    i2.ResolvedApi? resolvedAst,
    String? etag,
  }) => i1.CloudAuthApi(
    apiId: apiId ?? this.apiId,
    projectId: projectId ?? this.projectId,
    resolvedAst: resolvedAst ?? this.resolvedAst,
    etag: etag ?? this.etag,
  );
  CloudAuthApi copyWithCompanion(i1.CloudAuthApisCompanion data) {
    return CloudAuthApi(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthApi(')
          ..write('apiId: $apiId, ')
          ..write('projectId: $projectId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(apiId, projectId, resolvedAst, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CloudAuthApi &&
          other.apiId == this.apiId &&
          other.projectId == this.projectId &&
          other.resolvedAst == this.resolvedAst &&
          other.etag == this.etag);
}

class CloudAuthApisCompanion extends i0.UpdateCompanion<i1.CloudAuthApi> {
  final i0.Value<String> apiId;
  final i0.Value<String> projectId;
  final i0.Value<i2.ResolvedApi> resolvedAst;
  final i0.Value<String> etag;
  final i0.Value<int> rowid;
  const CloudAuthApisCompanion({
    this.apiId = const i0.Value.absent(),
    this.projectId = const i0.Value.absent(),
    this.resolvedAst = const i0.Value.absent(),
    this.etag = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CloudAuthApisCompanion.insert({
    required String apiId,
    required String projectId,
    required i2.ResolvedApi resolvedAst,
    required String etag,
    this.rowid = const i0.Value.absent(),
  }) : apiId = i0.Value(apiId),
       projectId = i0.Value(projectId),
       resolvedAst = i0.Value(resolvedAst),
       etag = i0.Value(etag);
  static i0.Insertable<i1.CloudAuthApi> custom({
    i0.Expression<String>? apiId,
    i0.Expression<String>? projectId,
    i0.Expression<i3.Uint8List>? resolvedAst,
    i0.Expression<String>? etag,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (apiId != null) 'api_id': apiId,
      if (projectId != null) 'project_id': projectId,
      if (resolvedAst != null) 'resolved_ast': resolvedAst,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CloudAuthApisCompanion copyWith({
    i0.Value<String>? apiId,
    i0.Value<String>? projectId,
    i0.Value<i2.ResolvedApi>? resolvedAst,
    i0.Value<String>? etag,
    i0.Value<int>? rowid,
  }) {
    return i1.CloudAuthApisCompanion(
      apiId: apiId ?? this.apiId,
      projectId: projectId ?? this.projectId,
      resolvedAst: resolvedAst ?? this.resolvedAst,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (apiId.present) {
      map['api_id'] = i0.Variable<String>(apiId.value);
    }
    if (projectId.present) {
      map['project_id'] = i0.Variable<String>(projectId.value);
    }
    if (resolvedAst.present) {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
        i1.CloudAuthApis.$converterresolvedAst.toSql(resolvedAst.value),
      );
    }
    if (etag.present) {
      map['etag'] = i0.Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthApisCompanion(')
          ..write('apiId: $apiId, ')
          ..write('projectId: $projectId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get cloudAuthApisProjectIdx => i0.Index(
  'cloud_auth_apis_project_idx',
  'CREATE INDEX IF NOT EXISTS cloud_auth_apis_project_idx ON cloud_auth_apis (project_id)',
);
i0.Trigger get cloudAuthApisCreateTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS cloud_auth_apis_create_trg BEFORE INSERT ON cloud_auth_apis BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Api\', NEW.api_id);END',
  'cloud_auth_apis_create_trg',
);
i0.Trigger get cloudAuthApisDeleteTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS cloud_auth_apis_delete_trg AFTER DELETE ON cloud_auth_apis BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Api\' AND parent_id = OLD.api_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;END',
  'cloud_auth_apis_delete_trg',
);

class CloudAuthFunctions extends i0.Table
    with i0.TableInfo<CloudAuthFunctions, i1.CloudAuthFunction> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthFunctions(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> functionId = i0.GeneratedColumn<String>(
    'function_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  late final i0.GeneratedColumn<String> apiId = i0.GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumnWithTypeConverter<
    i2.ResolvedCloudFunction,
    i3.Uint8List
  >
  resolvedAst = i0.GeneratedColumn<i3.Uint8List>(
    'resolved_ast',
    aliasedName,
    false,
    type: i0.DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<i2.ResolvedCloudFunction>(
    i1.CloudAuthFunctions.$converterresolvedAst,
  );
  late final i0.GeneratedColumn<String> etag = i0.GeneratedColumn<String>(
    'etag',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
    functionId,
    apiId,
    resolvedAst,
    etag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_functions';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {functionId};
  @override
  i1.CloudAuthFunction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CloudAuthFunction(
      functionId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}function_id'],
          )!,
      apiId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}api_id'],
          )!,
      resolvedAst: i1.CloudAuthFunctions.$converterresolvedAst.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.blob,
          data['${effectivePrefix}resolved_ast'],
        )!,
      ),
      etag:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  CloudAuthFunctions createAlias(String alias) {
    return CloudAuthFunctions(attachedDatabase, alias);
  }

  static i0.TypeConverter<i2.ResolvedCloudFunction, i3.Uint8List>
  $converterresolvedAst = const i4.ResolvedFunctionConverter();
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT cloud_auth_functions_api_fk FOREIGN KEY(api_id)REFERENCES cloud_auth_apis(api_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthFunction extends i0.DataClass
    implements i0.Insertable<i1.CloudAuthFunction> {
  /// The unique identifier of the function.
  final String functionId;

  /// The API ID of the function.
  final String apiId;

  /// The resolved function AST.
  ///
  /// Format: Proto[celest.ast.v1.ResolvedFunction]
  final i2.ResolvedCloudFunction resolvedAst;

  /// A hash of the function metadata.
  final String etag;
  const CloudAuthFunction({
    required this.functionId,
    required this.apiId,
    required this.resolvedAst,
    required this.etag,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['function_id'] = i0.Variable<String>(functionId);
    map['api_id'] = i0.Variable<String>(apiId);
    {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
        i1.CloudAuthFunctions.$converterresolvedAst.toSql(resolvedAst),
      );
    }
    map['etag'] = i0.Variable<String>(etag);
    return map;
  }

  factory CloudAuthFunction.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CloudAuthFunction(
      functionId: serializer.fromJson<String>(json['function_id']),
      apiId: serializer.fromJson<String>(json['api_id']),
      resolvedAst: serializer.fromJson<i2.ResolvedCloudFunction>(
        json['resolved_ast'],
      ),
      etag: serializer.fromJson<String>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'function_id': serializer.toJson<String>(functionId),
      'api_id': serializer.toJson<String>(apiId),
      'resolved_ast': serializer.toJson<i2.ResolvedCloudFunction>(resolvedAst),
      'etag': serializer.toJson<String>(etag),
    };
  }

  i1.CloudAuthFunction copyWith({
    String? functionId,
    String? apiId,
    i2.ResolvedCloudFunction? resolvedAst,
    String? etag,
  }) => i1.CloudAuthFunction(
    functionId: functionId ?? this.functionId,
    apiId: apiId ?? this.apiId,
    resolvedAst: resolvedAst ?? this.resolvedAst,
    etag: etag ?? this.etag,
  );
  CloudAuthFunction copyWithCompanion(i1.CloudAuthFunctionsCompanion data) {
    return CloudAuthFunction(
      functionId:
          data.functionId.present ? data.functionId.value : this.functionId,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthFunction(')
          ..write('functionId: $functionId, ')
          ..write('apiId: $apiId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(functionId, apiId, resolvedAst, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CloudAuthFunction &&
          other.functionId == this.functionId &&
          other.apiId == this.apiId &&
          other.resolvedAst == this.resolvedAst &&
          other.etag == this.etag);
}

class CloudAuthFunctionsCompanion
    extends i0.UpdateCompanion<i1.CloudAuthFunction> {
  final i0.Value<String> functionId;
  final i0.Value<String> apiId;
  final i0.Value<i2.ResolvedCloudFunction> resolvedAst;
  final i0.Value<String> etag;
  final i0.Value<int> rowid;
  const CloudAuthFunctionsCompanion({
    this.functionId = const i0.Value.absent(),
    this.apiId = const i0.Value.absent(),
    this.resolvedAst = const i0.Value.absent(),
    this.etag = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CloudAuthFunctionsCompanion.insert({
    required String functionId,
    required String apiId,
    required i2.ResolvedCloudFunction resolvedAst,
    required String etag,
    this.rowid = const i0.Value.absent(),
  }) : functionId = i0.Value(functionId),
       apiId = i0.Value(apiId),
       resolvedAst = i0.Value(resolvedAst),
       etag = i0.Value(etag);
  static i0.Insertable<i1.CloudAuthFunction> custom({
    i0.Expression<String>? functionId,
    i0.Expression<String>? apiId,
    i0.Expression<i3.Uint8List>? resolvedAst,
    i0.Expression<String>? etag,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (functionId != null) 'function_id': functionId,
      if (apiId != null) 'api_id': apiId,
      if (resolvedAst != null) 'resolved_ast': resolvedAst,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CloudAuthFunctionsCompanion copyWith({
    i0.Value<String>? functionId,
    i0.Value<String>? apiId,
    i0.Value<i2.ResolvedCloudFunction>? resolvedAst,
    i0.Value<String>? etag,
    i0.Value<int>? rowid,
  }) {
    return i1.CloudAuthFunctionsCompanion(
      functionId: functionId ?? this.functionId,
      apiId: apiId ?? this.apiId,
      resolvedAst: resolvedAst ?? this.resolvedAst,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (functionId.present) {
      map['function_id'] = i0.Variable<String>(functionId.value);
    }
    if (apiId.present) {
      map['api_id'] = i0.Variable<String>(apiId.value);
    }
    if (resolvedAst.present) {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
        i1.CloudAuthFunctions.$converterresolvedAst.toSql(resolvedAst.value),
      );
    }
    if (etag.present) {
      map['etag'] = i0.Variable<String>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthFunctionsCompanion(')
          ..write('functionId: $functionId, ')
          ..write('apiId: $apiId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get cloudAuthFunctionsApiIdx => i0.Index(
  'cloud_auth_functions_api_idx',
  'CREATE INDEX IF NOT EXISTS cloud_auth_functions_api_idx ON cloud_auth_functions (api_id)',
);
i0.Trigger get cloudAuthFunctionsCreateTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS cloud_auth_functions_create_trg BEFORE INSERT ON cloud_auth_functions BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Function\', NEW.function_id);INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Function\', NEW.function_id, \'Celest::Api\', NEW.api_id);END',
  'cloud_auth_functions_create_trg',
);
i0.Trigger get cloudAuthFunctionsDeleteTrg => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS cloud_auth_functions_delete_trg AFTER DELETE ON cloud_auth_functions BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Function\' AND parent_id = OLD.function_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;END',
  'cloud_auth_functions_delete_trg',
);

class CloudAuthProjectsDrift extends i5.ModularAccessor {
  CloudAuthProjectsDrift(i0.GeneratedDatabase db) : super(db);
  i6.Future<List<i1.CloudAuthProject>> upsertProject({
    required String projectId,
    required String version,
    required i2.ResolvedProject resolvedAst,
    required String etag,
  }) {
    return customWriteReturning(
      'INSERT INTO cloud_auth_projects (project_id, version, resolved_ast, etag) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (project_id) DO UPDATE SET version = excluded.version, resolved_ast = excluded.resolved_ast, etag = excluded.etag RETURNING *',
      variables: [
        i0.Variable<String>(projectId),
        i0.Variable<String>(version),
        i0.Variable<i3.Uint8List>(
          i1.CloudAuthProjects.$converterresolvedAst.toSql(resolvedAst),
        ),
        i0.Variable<String>(etag),
      ],
      updates: {cloudAuthProjects},
    ).then((rows) => Future.wait(rows.map(cloudAuthProjects.mapFromRow)));
  }

  i0.Selectable<i1.CloudAuthProject> getProject({required String projectId}) {
    return customSelect(
      'SELECT * FROM cloud_auth_projects WHERE project_id = ?1',
      variables: [i0.Variable<String>(projectId)],
      readsFrom: {cloudAuthProjects},
    ).asyncMap(cloudAuthProjects.mapFromRow);
  }

  i6.Future<List<i1.CloudAuthApi>> upsertApi({
    required String apiId,
    required String projectId,
    required i2.ResolvedApi resolvedAst,
    required String etag,
  }) {
    return customWriteReturning(
      'INSERT INTO cloud_auth_apis (api_id, project_id, resolved_ast, etag) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (api_id) DO UPDATE SET project_id = excluded.project_id, resolved_ast = excluded.resolved_ast, etag = excluded.etag RETURNING *',
      variables: [
        i0.Variable<String>(apiId),
        i0.Variable<String>(projectId),
        i0.Variable<i3.Uint8List>(
          i1.CloudAuthApis.$converterresolvedAst.toSql(resolvedAst),
        ),
        i0.Variable<String>(etag),
      ],
      updates: {cloudAuthApis},
    ).then((rows) => Future.wait(rows.map(cloudAuthApis.mapFromRow)));
  }

  i0.Selectable<i1.CloudAuthApi> getApi({required String apiId}) {
    return customSelect(
      'SELECT * FROM cloud_auth_apis WHERE api_id = ?1',
      variables: [i0.Variable<String>(apiId)],
      readsFrom: {cloudAuthApis},
    ).asyncMap(cloudAuthApis.mapFromRow);
  }

  i0.Selectable<i1.CloudAuthApi> listApis({required String projectId}) {
    return customSelect(
      'SELECT * FROM cloud_auth_apis WHERE project_id = ?1',
      variables: [i0.Variable<String>(projectId)],
      readsFrom: {cloudAuthApis},
    ).asyncMap(cloudAuthApis.mapFromRow);
  }

  i6.Future<List<i1.CloudAuthFunction>> upsertFunction({
    required String functionId,
    required String apiId,
    required i2.ResolvedCloudFunction resolvedAst,
    required String etag,
  }) {
    return customWriteReturning(
      'INSERT INTO cloud_auth_functions (function_id, api_id, resolved_ast, etag) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (function_id) DO UPDATE SET api_id = excluded.api_id, resolved_ast = excluded.resolved_ast, etag = excluded.etag RETURNING *',
      variables: [
        i0.Variable<String>(functionId),
        i0.Variable<String>(apiId),
        i0.Variable<i3.Uint8List>(
          i1.CloudAuthFunctions.$converterresolvedAst.toSql(resolvedAst),
        ),
        i0.Variable<String>(etag),
      ],
      updates: {cloudAuthFunctions},
    ).then((rows) => Future.wait(rows.map(cloudAuthFunctions.mapFromRow)));
  }

  i0.Selectable<i1.CloudAuthFunction> getFunction({
    required String functionId,
  }) {
    return customSelect(
      'SELECT * FROM cloud_auth_functions WHERE function_id = ?1',
      variables: [i0.Variable<String>(functionId)],
      readsFrom: {cloudAuthFunctions},
    ).asyncMap(cloudAuthFunctions.mapFromRow);
  }

  i0.Selectable<i1.CloudAuthFunction> listFunctions({required String apiId}) {
    return customSelect(
      'SELECT * FROM cloud_auth_functions WHERE api_id = ?1',
      variables: [i0.Variable<String>(apiId)],
      readsFrom: {cloudAuthFunctions},
    ).asyncMap(cloudAuthFunctions.mapFromRow);
  }

  i1.CloudAuthProjects get cloudAuthProjects => i5.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.CloudAuthProjects>('cloud_auth_projects');
  i1.CloudAuthApis get cloudAuthApis => i5.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.CloudAuthApis>('cloud_auth_apis');
  i1.CloudAuthFunctions get cloudAuthFunctions => i5.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.CloudAuthFunctions>('cloud_auth_functions');
  i7.CedarDrift get cedarDrift => this.accessor(i7.CedarDrift.new);
}
