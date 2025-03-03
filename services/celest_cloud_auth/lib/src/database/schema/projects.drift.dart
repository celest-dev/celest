// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/projects.drift.dart'
    as i1;
import 'package:celest_ast/src/resolved_ast.dart' as i2;
import 'dart:typed_data' as i3;
import 'package:celest_cloud_auth/src/database/schema/converters/ast_converters.dart'
    as i4;
import 'package:drift/internal/modular.dart' as i5;
import 'dart:async' as i6;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i7;

typedef $CelestProjectsCreateCompanionBuilder = i1.CelestProjectsCompanion
    Function({
  required String projectId,
  required String version,
  required i2.ResolvedProject resolvedAst,
  required String etag,
  i0.Value<int> rowid,
});
typedef $CelestProjectsUpdateCompanionBuilder = i1.CelestProjectsCompanion
    Function({
  i0.Value<String> projectId,
  i0.Value<String> version,
  i0.Value<i2.ResolvedProject> resolvedAst,
  i0.Value<String> etag,
  i0.Value<int> rowid,
});

class $CelestProjectsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestProjects> {
  $CelestProjectsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i2.ResolvedProject, i2.ResolvedProject,
          i3.Uint8List>
      get resolvedAst => $composableBuilder(
          column: $table.resolvedAst,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => i0.ColumnFilters(column));
}

class $CelestProjectsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestProjects> {
  $CelestProjectsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i3.Uint8List> get resolvedAst => $composableBuilder(
      column: $table.resolvedAst,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => i0.ColumnOrderings(column));
}

class $CelestProjectsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestProjects> {
  $CelestProjectsAnnotationComposer({
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
          column: $table.resolvedAst, builder: (column) => column);

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $CelestProjectsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CelestProjects,
    i1.CelestProject,
    i1.$CelestProjectsFilterComposer,
    i1.$CelestProjectsOrderingComposer,
    i1.$CelestProjectsAnnotationComposer,
    $CelestProjectsCreateCompanionBuilder,
    $CelestProjectsUpdateCompanionBuilder,
    (
      i1.CelestProject,
      i0
      .BaseReferences<i0.GeneratedDatabase, i1.CelestProjects, i1.CelestProject>
    ),
    i1.CelestProject,
    i0.PrefetchHooks Function()> {
  $CelestProjectsTableManager(i0.GeneratedDatabase db, i1.CelestProjects table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CelestProjectsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CelestProjectsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CelestProjectsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> projectId = const i0.Value.absent(),
            i0.Value<String> version = const i0.Value.absent(),
            i0.Value<i2.ResolvedProject> resolvedAst = const i0.Value.absent(),
            i0.Value<String> etag = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestProjectsCompanion(
            projectId: projectId,
            version: version,
            resolvedAst: resolvedAst,
            etag: etag,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String projectId,
            required String version,
            required i2.ResolvedProject resolvedAst,
            required String etag,
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestProjectsCompanion.insert(
            projectId: projectId,
            version: version,
            resolvedAst: resolvedAst,
            etag: etag,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CelestProjectsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CelestProjects,
    i1.CelestProject,
    i1.$CelestProjectsFilterComposer,
    i1.$CelestProjectsOrderingComposer,
    i1.$CelestProjectsAnnotationComposer,
    $CelestProjectsCreateCompanionBuilder,
    $CelestProjectsUpdateCompanionBuilder,
    (
      i1.CelestProject,
      i0
      .BaseReferences<i0.GeneratedDatabase, i1.CelestProjects, i1.CelestProject>
    ),
    i1.CelestProject,
    i0.PrefetchHooks Function()>;
typedef $CelestApisCreateCompanionBuilder = i1.CelestApisCompanion Function({
  required String apiId,
  required String projectId,
  required i2.ResolvedApi resolvedAst,
  required String etag,
  i0.Value<int> rowid,
});
typedef $CelestApisUpdateCompanionBuilder = i1.CelestApisCompanion Function({
  i0.Value<String> apiId,
  i0.Value<String> projectId,
  i0.Value<i2.ResolvedApi> resolvedAst,
  i0.Value<String> etag,
  i0.Value<int> rowid,
});

class $CelestApisFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestApis> {
  $CelestApisFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i2.ResolvedApi, i2.ResolvedApi,
          i3.Uint8List>
      get resolvedAst => $composableBuilder(
          column: $table.resolvedAst,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => i0.ColumnFilters(column));
}

class $CelestApisOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestApis> {
  $CelestApisOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i3.Uint8List> get resolvedAst => $composableBuilder(
      column: $table.resolvedAst,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => i0.ColumnOrderings(column));
}

class $CelestApisAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestApis> {
  $CelestApisAnnotationComposer({
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
          column: $table.resolvedAst, builder: (column) => column);

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $CelestApisTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CelestApis,
    i1.CelestApi,
    i1.$CelestApisFilterComposer,
    i1.$CelestApisOrderingComposer,
    i1.$CelestApisAnnotationComposer,
    $CelestApisCreateCompanionBuilder,
    $CelestApisUpdateCompanionBuilder,
    (
      i1.CelestApi,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestApis, i1.CelestApi>
    ),
    i1.CelestApi,
    i0.PrefetchHooks Function()> {
  $CelestApisTableManager(i0.GeneratedDatabase db, i1.CelestApis table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CelestApisFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CelestApisOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CelestApisAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> apiId = const i0.Value.absent(),
            i0.Value<String> projectId = const i0.Value.absent(),
            i0.Value<i2.ResolvedApi> resolvedAst = const i0.Value.absent(),
            i0.Value<String> etag = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestApisCompanion(
            apiId: apiId,
            projectId: projectId,
            resolvedAst: resolvedAst,
            etag: etag,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String apiId,
            required String projectId,
            required i2.ResolvedApi resolvedAst,
            required String etag,
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestApisCompanion.insert(
            apiId: apiId,
            projectId: projectId,
            resolvedAst: resolvedAst,
            etag: etag,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CelestApisProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CelestApis,
    i1.CelestApi,
    i1.$CelestApisFilterComposer,
    i1.$CelestApisOrderingComposer,
    i1.$CelestApisAnnotationComposer,
    $CelestApisCreateCompanionBuilder,
    $CelestApisUpdateCompanionBuilder,
    (
      i1.CelestApi,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestApis, i1.CelestApi>
    ),
    i1.CelestApi,
    i0.PrefetchHooks Function()>;
typedef $CelestFunctionsCreateCompanionBuilder = i1.CelestFunctionsCompanion
    Function({
  required String functionId,
  required String apiId,
  required i2.ResolvedCloudFunction resolvedAst,
  required String etag,
  i0.Value<int> rowid,
});
typedef $CelestFunctionsUpdateCompanionBuilder = i1.CelestFunctionsCompanion
    Function({
  i0.Value<String> functionId,
  i0.Value<String> apiId,
  i0.Value<i2.ResolvedCloudFunction> resolvedAst,
  i0.Value<String> etag,
  i0.Value<int> rowid,
});

class $CelestFunctionsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestFunctions> {
  $CelestFunctionsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get functionId => $composableBuilder(
      column: $table.functionId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i2.ResolvedCloudFunction,
          i2.ResolvedCloudFunction, i3.Uint8List>
      get resolvedAst => $composableBuilder(
          column: $table.resolvedAst,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => i0.ColumnFilters(column));
}

class $CelestFunctionsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestFunctions> {
  $CelestFunctionsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get functionId => $composableBuilder(
      column: $table.functionId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i3.Uint8List> get resolvedAst => $composableBuilder(
      column: $table.resolvedAst,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => i0.ColumnOrderings(column));
}

class $CelestFunctionsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CelestFunctions> {
  $CelestFunctionsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get functionId => $composableBuilder(
      column: $table.functionId, builder: (column) => column);

  i0.GeneratedColumn<String> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i2.ResolvedCloudFunction, i3.Uint8List>
      get resolvedAst => $composableBuilder(
          column: $table.resolvedAst, builder: (column) => column);

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $CelestFunctionsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CelestFunctions,
    i1.CelestFunction,
    i1.$CelestFunctionsFilterComposer,
    i1.$CelestFunctionsOrderingComposer,
    i1.$CelestFunctionsAnnotationComposer,
    $CelestFunctionsCreateCompanionBuilder,
    $CelestFunctionsUpdateCompanionBuilder,
    (
      i1.CelestFunction,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestFunctions,
          i1.CelestFunction>
    ),
    i1.CelestFunction,
    i0.PrefetchHooks Function()> {
  $CelestFunctionsTableManager(
      i0.GeneratedDatabase db, i1.CelestFunctions table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CelestFunctionsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CelestFunctionsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CelestFunctionsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> functionId = const i0.Value.absent(),
            i0.Value<String> apiId = const i0.Value.absent(),
            i0.Value<i2.ResolvedCloudFunction> resolvedAst =
                const i0.Value.absent(),
            i0.Value<String> etag = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestFunctionsCompanion(
            functionId: functionId,
            apiId: apiId,
            resolvedAst: resolvedAst,
            etag: etag,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String functionId,
            required String apiId,
            required i2.ResolvedCloudFunction resolvedAst,
            required String etag,
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestFunctionsCompanion.insert(
            functionId: functionId,
            apiId: apiId,
            resolvedAst: resolvedAst,
            etag: etag,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CelestFunctionsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CelestFunctions,
    i1.CelestFunction,
    i1.$CelestFunctionsFilterComposer,
    i1.$CelestFunctionsOrderingComposer,
    i1.$CelestFunctionsAnnotationComposer,
    $CelestFunctionsCreateCompanionBuilder,
    $CelestFunctionsUpdateCompanionBuilder,
    (
      i1.CelestFunction,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestFunctions,
          i1.CelestFunction>
    ),
    i1.CelestFunction,
    i0.PrefetchHooks Function()>;

class CelestProjects extends i0.Table
    with i0.TableInfo<CelestProjects, i1.CelestProject> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestProjects(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> projectId = i0.GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> version = i0.GeneratedColumn<String>(
      'version', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0
      .GeneratedColumnWithTypeConverter<i2.ResolvedProject, i3.Uint8List>
      resolvedAst = i0.GeneratedColumn<i3.Uint8List>(
              'resolved_ast', aliasedName, false,
              type: i0.DriftSqlType.blob,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<i2.ResolvedProject>(
              i1.CelestProjects.$converterresolvedAst);
  late final i0.GeneratedColumn<String> etag = i0.GeneratedColumn<String>(
      'etag', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [projectId, version, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_projects';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {projectId};
  @override
  i1.CelestProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CelestProject(
      projectId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      version: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}version'])!,
      resolvedAst: i1.CelestProjects.$converterresolvedAst.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.blob, data['${effectivePrefix}resolved_ast'])!),
      etag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}etag'])!,
    );
  }

  @override
  CelestProjects createAlias(String alias) {
    return CelestProjects(attachedDatabase, alias);
  }

  static i0.TypeConverter<i2.ResolvedProject, i3.Uint8List>
      $converterresolvedAst = const i4.ResolvedProjectConverter();
  @override
  bool get dontWriteConstraints => true;
}

class CelestProject extends i0.DataClass
    implements i0.Insertable<i1.CelestProject> {
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
  const CelestProject(
      {required this.projectId,
      required this.version,
      required this.resolvedAst,
      required this.etag});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['project_id'] = i0.Variable<String>(projectId);
    map['version'] = i0.Variable<String>(version);
    {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
          i1.CelestProjects.$converterresolvedAst.toSql(resolvedAst));
    }
    map['etag'] = i0.Variable<String>(etag);
    return map;
  }

  factory CelestProject.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CelestProject(
      projectId: serializer.fromJson<String>(json['project_id']),
      version: serializer.fromJson<String>(json['version']),
      resolvedAst:
          serializer.fromJson<i2.ResolvedProject>(json['resolved_ast']),
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

  i1.CelestProject copyWith(
          {String? projectId,
          String? version,
          i2.ResolvedProject? resolvedAst,
          String? etag}) =>
      i1.CelestProject(
        projectId: projectId ?? this.projectId,
        version: version ?? this.version,
        resolvedAst: resolvedAst ?? this.resolvedAst,
        etag: etag ?? this.etag,
      );
  CelestProject copyWithCompanion(i1.CelestProjectsCompanion data) {
    return CelestProject(
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      version: data.version.present ? data.version.value : this.version,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestProject(')
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
      (other is i1.CelestProject &&
          other.projectId == this.projectId &&
          other.version == this.version &&
          other.resolvedAst == this.resolvedAst &&
          other.etag == this.etag);
}

class CelestProjectsCompanion extends i0.UpdateCompanion<i1.CelestProject> {
  final i0.Value<String> projectId;
  final i0.Value<String> version;
  final i0.Value<i2.ResolvedProject> resolvedAst;
  final i0.Value<String> etag;
  final i0.Value<int> rowid;
  const CelestProjectsCompanion({
    this.projectId = const i0.Value.absent(),
    this.version = const i0.Value.absent(),
    this.resolvedAst = const i0.Value.absent(),
    this.etag = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CelestProjectsCompanion.insert({
    required String projectId,
    required String version,
    required i2.ResolvedProject resolvedAst,
    required String etag,
    this.rowid = const i0.Value.absent(),
  })  : projectId = i0.Value(projectId),
        version = i0.Value(version),
        resolvedAst = i0.Value(resolvedAst),
        etag = i0.Value(etag);
  static i0.Insertable<i1.CelestProject> custom({
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

  i1.CelestProjectsCompanion copyWith(
      {i0.Value<String>? projectId,
      i0.Value<String>? version,
      i0.Value<i2.ResolvedProject>? resolvedAst,
      i0.Value<String>? etag,
      i0.Value<int>? rowid}) {
    return i1.CelestProjectsCompanion(
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
          i1.CelestProjects.$converterresolvedAst.toSql(resolvedAst.value));
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
    return (StringBuffer('CelestProjectsCompanion(')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CelestApis extends i0.Table with i0.TableInfo<CelestApis, i1.CelestApi> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestApis(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> apiId = i0.GeneratedColumn<String>(
      'api_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> projectId = i0.GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumnWithTypeConverter<i2.ResolvedApi, i3.Uint8List>
      resolvedAst = i0.GeneratedColumn<i3.Uint8List>(
              'resolved_ast', aliasedName, false,
              type: i0.DriftSqlType.blob,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<i2.ResolvedApi>(i1.CelestApis.$converterresolvedAst);
  late final i0.GeneratedColumn<String> etag = i0.GeneratedColumn<String>(
      'etag', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [apiId, projectId, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_apis';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {apiId};
  @override
  i1.CelestApi map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CelestApi(
      apiId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}api_id'])!,
      projectId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      resolvedAst: i1.CelestApis.$converterresolvedAst.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}resolved_ast'])!),
      etag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}etag'])!,
    );
  }

  @override
  CelestApis createAlias(String alias) {
    return CelestApis(attachedDatabase, alias);
  }

  static i0.TypeConverter<i2.ResolvedApi, i3.Uint8List> $converterresolvedAst =
      const i4.ResolvedApiConverter();
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT celest_apis_project_fk FOREIGN KEY(project_id)REFERENCES celest_projects(project_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CelestApi extends i0.DataClass implements i0.Insertable<i1.CelestApi> {
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
  const CelestApi(
      {required this.apiId,
      required this.projectId,
      required this.resolvedAst,
      required this.etag});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['api_id'] = i0.Variable<String>(apiId);
    map['project_id'] = i0.Variable<String>(projectId);
    {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
          i1.CelestApis.$converterresolvedAst.toSql(resolvedAst));
    }
    map['etag'] = i0.Variable<String>(etag);
    return map;
  }

  factory CelestApi.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CelestApi(
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

  i1.CelestApi copyWith(
          {String? apiId,
          String? projectId,
          i2.ResolvedApi? resolvedAst,
          String? etag}) =>
      i1.CelestApi(
        apiId: apiId ?? this.apiId,
        projectId: projectId ?? this.projectId,
        resolvedAst: resolvedAst ?? this.resolvedAst,
        etag: etag ?? this.etag,
      );
  CelestApi copyWithCompanion(i1.CelestApisCompanion data) {
    return CelestApi(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      resolvedAst:
          data.resolvedAst.present ? data.resolvedAst.value : this.resolvedAst,
      etag: data.etag.present ? data.etag.value : this.etag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestApi(')
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
      (other is i1.CelestApi &&
          other.apiId == this.apiId &&
          other.projectId == this.projectId &&
          other.resolvedAst == this.resolvedAst &&
          other.etag == this.etag);
}

class CelestApisCompanion extends i0.UpdateCompanion<i1.CelestApi> {
  final i0.Value<String> apiId;
  final i0.Value<String> projectId;
  final i0.Value<i2.ResolvedApi> resolvedAst;
  final i0.Value<String> etag;
  final i0.Value<int> rowid;
  const CelestApisCompanion({
    this.apiId = const i0.Value.absent(),
    this.projectId = const i0.Value.absent(),
    this.resolvedAst = const i0.Value.absent(),
    this.etag = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CelestApisCompanion.insert({
    required String apiId,
    required String projectId,
    required i2.ResolvedApi resolvedAst,
    required String etag,
    this.rowid = const i0.Value.absent(),
  })  : apiId = i0.Value(apiId),
        projectId = i0.Value(projectId),
        resolvedAst = i0.Value(resolvedAst),
        etag = i0.Value(etag);
  static i0.Insertable<i1.CelestApi> custom({
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

  i1.CelestApisCompanion copyWith(
      {i0.Value<String>? apiId,
      i0.Value<String>? projectId,
      i0.Value<i2.ResolvedApi>? resolvedAst,
      i0.Value<String>? etag,
      i0.Value<int>? rowid}) {
    return i1.CelestApisCompanion(
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
          i1.CelestApis.$converterresolvedAst.toSql(resolvedAst.value));
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
    return (StringBuffer('CelestApisCompanion(')
          ..write('apiId: $apiId, ')
          ..write('projectId: $projectId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get celestApisProjectIdx => i0.Index('celest_apis_project_idx',
    'CREATE INDEX IF NOT EXISTS celest_apis_project_idx ON celest_apis (project_id)');
i0.Trigger get celestApisTriggerCreate => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS celest_apis_trigger_create BEFORE INSERT ON celest_apis BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Api\', NEW.api_id);END',
    'celest_apis_trigger_create');
i0.Trigger get celestApisTriggerDelete => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS celest_apis_trigger_delete AFTER DELETE ON celest_apis BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Api\' AND parent_id = OLD.api_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Api\' AND entity_id = OLD.api_id;END',
    'celest_apis_trigger_delete');

class CelestFunctions extends i0.Table
    with i0.TableInfo<CelestFunctions, i1.CelestFunction> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestFunctions(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> functionId = i0.GeneratedColumn<String>(
      'function_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> apiId = i0.GeneratedColumn<String>(
      'api_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0
      .GeneratedColumnWithTypeConverter<i2.ResolvedCloudFunction, i3.Uint8List>
      resolvedAst = i0.GeneratedColumn<i3.Uint8List>(
              'resolved_ast', aliasedName, false,
              type: i0.DriftSqlType.blob,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<i2.ResolvedCloudFunction>(
              i1.CelestFunctions.$converterresolvedAst);
  late final i0.GeneratedColumn<String> etag = i0.GeneratedColumn<String>(
      'etag', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [functionId, apiId, resolvedAst, etag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_functions';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {functionId};
  @override
  i1.CelestFunction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CelestFunction(
      functionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}function_id'])!,
      apiId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}api_id'])!,
      resolvedAst: i1.CelestFunctions.$converterresolvedAst.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.blob, data['${effectivePrefix}resolved_ast'])!),
      etag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}etag'])!,
    );
  }

  @override
  CelestFunctions createAlias(String alias) {
    return CelestFunctions(attachedDatabase, alias);
  }

  static i0.TypeConverter<i2.ResolvedCloudFunction, i3.Uint8List>
      $converterresolvedAst = const i4.ResolvedFunctionConverter();
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT celest_functions_api_fk FOREIGN KEY(api_id)REFERENCES celest_apis(api_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CelestFunction extends i0.DataClass
    implements i0.Insertable<i1.CelestFunction> {
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
  const CelestFunction(
      {required this.functionId,
      required this.apiId,
      required this.resolvedAst,
      required this.etag});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['function_id'] = i0.Variable<String>(functionId);
    map['api_id'] = i0.Variable<String>(apiId);
    {
      map['resolved_ast'] = i0.Variable<i3.Uint8List>(
          i1.CelestFunctions.$converterresolvedAst.toSql(resolvedAst));
    }
    map['etag'] = i0.Variable<String>(etag);
    return map;
  }

  factory CelestFunction.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CelestFunction(
      functionId: serializer.fromJson<String>(json['function_id']),
      apiId: serializer.fromJson<String>(json['api_id']),
      resolvedAst:
          serializer.fromJson<i2.ResolvedCloudFunction>(json['resolved_ast']),
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

  i1.CelestFunction copyWith(
          {String? functionId,
          String? apiId,
          i2.ResolvedCloudFunction? resolvedAst,
          String? etag}) =>
      i1.CelestFunction(
        functionId: functionId ?? this.functionId,
        apiId: apiId ?? this.apiId,
        resolvedAst: resolvedAst ?? this.resolvedAst,
        etag: etag ?? this.etag,
      );
  CelestFunction copyWithCompanion(i1.CelestFunctionsCompanion data) {
    return CelestFunction(
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
    return (StringBuffer('CelestFunction(')
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
      (other is i1.CelestFunction &&
          other.functionId == this.functionId &&
          other.apiId == this.apiId &&
          other.resolvedAst == this.resolvedAst &&
          other.etag == this.etag);
}

class CelestFunctionsCompanion extends i0.UpdateCompanion<i1.CelestFunction> {
  final i0.Value<String> functionId;
  final i0.Value<String> apiId;
  final i0.Value<i2.ResolvedCloudFunction> resolvedAst;
  final i0.Value<String> etag;
  final i0.Value<int> rowid;
  const CelestFunctionsCompanion({
    this.functionId = const i0.Value.absent(),
    this.apiId = const i0.Value.absent(),
    this.resolvedAst = const i0.Value.absent(),
    this.etag = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CelestFunctionsCompanion.insert({
    required String functionId,
    required String apiId,
    required i2.ResolvedCloudFunction resolvedAst,
    required String etag,
    this.rowid = const i0.Value.absent(),
  })  : functionId = i0.Value(functionId),
        apiId = i0.Value(apiId),
        resolvedAst = i0.Value(resolvedAst),
        etag = i0.Value(etag);
  static i0.Insertable<i1.CelestFunction> custom({
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

  i1.CelestFunctionsCompanion copyWith(
      {i0.Value<String>? functionId,
      i0.Value<String>? apiId,
      i0.Value<i2.ResolvedCloudFunction>? resolvedAst,
      i0.Value<String>? etag,
      i0.Value<int>? rowid}) {
    return i1.CelestFunctionsCompanion(
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
          i1.CelestFunctions.$converterresolvedAst.toSql(resolvedAst.value));
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
    return (StringBuffer('CelestFunctionsCompanion(')
          ..write('functionId: $functionId, ')
          ..write('apiId: $apiId, ')
          ..write('resolvedAst: $resolvedAst, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get celestFunctionsApiIdx => i0.Index('celest_functions_api_idx',
    'CREATE INDEX IF NOT EXISTS celest_functions_api_idx ON celest_functions (api_id)');
i0.Trigger get celestFunctionsTriggerCreate => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS celest_functions_trigger_create BEFORE INSERT ON celest_functions BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::Function\', NEW.function_id);INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (\'Celest::Function\', NEW.function_id, \'Celest::Api\', NEW.api_id);END',
    'celest_functions_trigger_create');
i0.Trigger get celestFunctionsTriggerDelete => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS celest_functions_trigger_delete AFTER DELETE ON celest_functions BEGIN DELETE FROM cedar_relationships WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;DELETE FROM cedar_relationships WHERE parent_type = \'Celest::Function\' AND parent_id = OLD.function_id;DELETE FROM cedar_entities WHERE entity_type = \'Celest::Function\' AND entity_id = OLD.function_id;END',
    'celest_functions_trigger_delete');

class ProjectsDrift extends i5.ModularAccessor {
  ProjectsDrift(i0.GeneratedDatabase db) : super(db);
  i6.Future<List<i1.CelestProject>> upsertProject(
      {required String projectId,
      required String version,
      required i2.ResolvedProject resolvedAst,
      required String etag}) {
    return customWriteReturning(
        'INSERT INTO celest_projects (project_id, version, resolved_ast, etag) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (project_id) DO UPDATE SET version = excluded.version, resolved_ast = excluded.resolved_ast, etag = excluded.etag RETURNING *',
        variables: [
          i0.Variable<String>(projectId),
          i0.Variable<String>(version),
          i0.Variable<i3.Uint8List>(
              i1.CelestProjects.$converterresolvedAst.toSql(resolvedAst)),
          i0.Variable<String>(etag)
        ],
        updates: {
          celestProjects
        }).then((rows) => Future.wait(rows.map(celestProjects.mapFromRow)));
  }

  i0.Selectable<i1.CelestProject> getProject({required String projectId}) {
    return customSelect('SELECT * FROM celest_projects WHERE project_id = ?1',
        variables: [
          i0.Variable<String>(projectId)
        ],
        readsFrom: {
          celestProjects,
        }).asyncMap(celestProjects.mapFromRow);
  }

  i6.Future<List<i1.CelestApi>> upsertApi(
      {required String apiId,
      required String projectId,
      required i2.ResolvedApi resolvedAst,
      required String etag}) {
    return customWriteReturning(
        'INSERT INTO celest_apis (api_id, project_id, resolved_ast, etag) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (api_id) DO UPDATE SET project_id = excluded.project_id, resolved_ast = excluded.resolved_ast, etag = excluded.etag RETURNING *',
        variables: [
          i0.Variable<String>(apiId),
          i0.Variable<String>(projectId),
          i0.Variable<i3.Uint8List>(
              i1.CelestApis.$converterresolvedAst.toSql(resolvedAst)),
          i0.Variable<String>(etag)
        ],
        updates: {
          celestApis
        }).then((rows) => Future.wait(rows.map(celestApis.mapFromRow)));
  }

  i0.Selectable<i1.CelestApi> getApi({required String apiId}) {
    return customSelect('SELECT * FROM celest_apis WHERE api_id = ?1',
        variables: [
          i0.Variable<String>(apiId)
        ],
        readsFrom: {
          celestApis,
        }).asyncMap(celestApis.mapFromRow);
  }

  i0.Selectable<i1.CelestApi> listApis({required String projectId}) {
    return customSelect('SELECT * FROM celest_apis WHERE project_id = ?1',
        variables: [
          i0.Variable<String>(projectId)
        ],
        readsFrom: {
          celestApis,
        }).asyncMap(celestApis.mapFromRow);
  }

  i6.Future<List<i1.CelestFunction>> upsertFunction(
      {required String functionId,
      required String apiId,
      required i2.ResolvedCloudFunction resolvedAst,
      required String etag}) {
    return customWriteReturning(
        'INSERT INTO celest_functions (function_id, api_id, resolved_ast, etag) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (function_id) DO UPDATE SET api_id = excluded.api_id, resolved_ast = excluded.resolved_ast, etag = excluded.etag RETURNING *',
        variables: [
          i0.Variable<String>(functionId),
          i0.Variable<String>(apiId),
          i0.Variable<i3.Uint8List>(
              i1.CelestFunctions.$converterresolvedAst.toSql(resolvedAst)),
          i0.Variable<String>(etag)
        ],
        updates: {
          celestFunctions
        }).then((rows) => Future.wait(rows.map(celestFunctions.mapFromRow)));
  }

  i0.Selectable<i1.CelestFunction> getFunction({required String functionId}) {
    return customSelect('SELECT * FROM celest_functions WHERE function_id = ?1',
        variables: [
          i0.Variable<String>(functionId)
        ],
        readsFrom: {
          celestFunctions,
        }).asyncMap(celestFunctions.mapFromRow);
  }

  i0.Selectable<i1.CelestFunction> listFunctions({required String apiId}) {
    return customSelect('SELECT * FROM celest_functions WHERE api_id = ?1',
        variables: [
          i0.Variable<String>(apiId)
        ],
        readsFrom: {
          celestFunctions,
        }).asyncMap(celestFunctions.mapFromRow);
  }

  i1.CelestProjects get celestProjects =>
      i5.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CelestProjects>('celest_projects');
  i1.CelestApis get celestApis => i5.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i1.CelestApis>('celest_apis');
  i1.CelestFunctions get celestFunctions =>
      i5.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CelestFunctions>('celest_functions');
  i7.CedarDrift get cedarDrift => this.accessor(i7.CedarDrift.new);
}
