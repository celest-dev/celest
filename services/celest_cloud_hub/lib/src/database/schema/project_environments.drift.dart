// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart'
    as i1;
import 'package:celest_cloud_hub/src/model/lifecycle_state.dart' as i2;
import 'dart:typed_data' as i3;
import 'package:drift/internal/modular.dart' as i4;
import 'dart:async' as i5;

typedef $ProjectEnvironmentsCreateCompanionBuilder =
    i1.ProjectEnvironmentsCompanion Function({
      required String id,
      i0.Value<String?> parentType,
      i0.Value<String?> parentId,
      required String projectEnvironmentId,
      i0.Value<i2.LifecycleState> state,
      i0.Value<String?> displayName,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<DateTime?> deleteTime,
      i0.Value<String?> annotations,
      i0.Value<int> rowid,
    });
typedef $ProjectEnvironmentsUpdateCompanionBuilder =
    i1.ProjectEnvironmentsCompanion Function({
      i0.Value<String> id,
      i0.Value<String?> parentType,
      i0.Value<String?> parentId,
      i0.Value<String> projectEnvironmentId,
      i0.Value<i2.LifecycleState> state,
      i0.Value<String?> displayName,
      i0.Value<DateTime> createTime,
      i0.Value<DateTime> updateTime,
      i0.Value<DateTime?> deleteTime,
      i0.Value<String?> annotations,
      i0.Value<int> rowid,
    });

class $ProjectEnvironmentsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironments> {
  $ProjectEnvironmentsFilterComposer({
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

  i0.ColumnFilters<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnWithTypeConverterFilters<i2.LifecycleState, i2.LifecycleState, int>
  get state => $composableBuilder(
    column: $table.state,
    builder: (column) => i0.ColumnWithTypeConverterFilters(column),
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

  i0.ColumnFilters<String> get annotations => $composableBuilder(
    column: $table.annotations,
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

class $ProjectEnvironmentsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironments> {
  $ProjectEnvironmentsOrderingComposer({
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

  i0.ColumnOrderings<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<int> get state => $composableBuilder(
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

  i0.ColumnOrderings<String> get annotations => $composableBuilder(
    column: $table.annotations,
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

class $ProjectEnvironmentsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironments> {
  $ProjectEnvironmentsAnnotationComposer({
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

  i0.GeneratedColumn<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => column,
  );

  i0.GeneratedColumnWithTypeConverter<i2.LifecycleState, int> get state =>
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

  i0.GeneratedColumn<String> get annotations => $composableBuilder(
    column: $table.annotations,
    builder: (column) => column,
  );

  i0.GeneratedColumn<bool> get reconciling => $composableBuilder(
    column: $table.reconciling,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $ProjectEnvironmentsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.ProjectEnvironments,
          i1.ProjectEnvironment,
          i1.$ProjectEnvironmentsFilterComposer,
          i1.$ProjectEnvironmentsOrderingComposer,
          i1.$ProjectEnvironmentsAnnotationComposer,
          $ProjectEnvironmentsCreateCompanionBuilder,
          $ProjectEnvironmentsUpdateCompanionBuilder,
          (
            i1.ProjectEnvironment,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.ProjectEnvironments,
              i1.ProjectEnvironment
            >,
          ),
          i1.ProjectEnvironment,
          i0.PrefetchHooks Function()
        > {
  $ProjectEnvironmentsTableManager(
    i0.GeneratedDatabase db,
    i1.ProjectEnvironments table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  i1.$ProjectEnvironmentsFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$ProjectEnvironmentsOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => i1.$ProjectEnvironmentsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> id = const i0.Value.absent(),
                i0.Value<String?> parentType = const i0.Value.absent(),
                i0.Value<String?> parentId = const i0.Value.absent(),
                i0.Value<String> projectEnvironmentId = const i0.Value.absent(),
                i0.Value<i2.LifecycleState> state = const i0.Value.absent(),
                i0.Value<String?> displayName = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
                i0.Value<String?> annotations = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.ProjectEnvironmentsCompanion(
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
                i0.Value<String?> parentType = const i0.Value.absent(),
                i0.Value<String?> parentId = const i0.Value.absent(),
                required String projectEnvironmentId,
                i0.Value<i2.LifecycleState> state = const i0.Value.absent(),
                i0.Value<String?> displayName = const i0.Value.absent(),
                i0.Value<DateTime> createTime = const i0.Value.absent(),
                i0.Value<DateTime> updateTime = const i0.Value.absent(),
                i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
                i0.Value<String?> annotations = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.ProjectEnvironmentsCompanion.insert(
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
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ProjectEnvironmentsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.ProjectEnvironments,
      i1.ProjectEnvironment,
      i1.$ProjectEnvironmentsFilterComposer,
      i1.$ProjectEnvironmentsOrderingComposer,
      i1.$ProjectEnvironmentsAnnotationComposer,
      $ProjectEnvironmentsCreateCompanionBuilder,
      $ProjectEnvironmentsUpdateCompanionBuilder,
      (
        i1.ProjectEnvironment,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.ProjectEnvironments,
          i1.ProjectEnvironment
        >,
      ),
      i1.ProjectEnvironment,
      i0.PrefetchHooks Function()
    >;
typedef $ProjectEnvironmentAstsCreateCompanionBuilder =
    i1.ProjectEnvironmentAstsCompanion Function({
      required String projectEnvironmentId,
      required i3.Uint8List ast,
      required int version,
    });
typedef $ProjectEnvironmentAstsUpdateCompanionBuilder =
    i1.ProjectEnvironmentAstsCompanion Function({
      i0.Value<String> projectEnvironmentId,
      i0.Value<i3.Uint8List> ast,
      i0.Value<int> version,
    });

class $ProjectEnvironmentAstsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentAsts> {
  $ProjectEnvironmentAstsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<i3.Uint8List> get ast => $composableBuilder(
    column: $table.ast,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get digest => $composableBuilder(
    column: $table.digest,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $ProjectEnvironmentAstsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentAsts> {
  $ProjectEnvironmentAstsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<i3.Uint8List> get ast => $composableBuilder(
    column: $table.ast,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get digest => $composableBuilder(
    column: $table.digest,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $ProjectEnvironmentAstsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentAsts> {
  $ProjectEnvironmentAstsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<i3.Uint8List> get ast =>
      $composableBuilder(column: $table.ast, builder: (column) => column);

  i0.GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  i0.GeneratedColumn<String> get digest =>
      $composableBuilder(column: $table.digest, builder: (column) => column);
}

class $ProjectEnvironmentAstsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.ProjectEnvironmentAsts,
          i1.ProjectEnvironmentAst,
          i1.$ProjectEnvironmentAstsFilterComposer,
          i1.$ProjectEnvironmentAstsOrderingComposer,
          i1.$ProjectEnvironmentAstsAnnotationComposer,
          $ProjectEnvironmentAstsCreateCompanionBuilder,
          $ProjectEnvironmentAstsUpdateCompanionBuilder,
          (
            i1.ProjectEnvironmentAst,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.ProjectEnvironmentAsts,
              i1.ProjectEnvironmentAst
            >,
          ),
          i1.ProjectEnvironmentAst,
          i0.PrefetchHooks Function()
        > {
  $ProjectEnvironmentAstsTableManager(
    i0.GeneratedDatabase db,
    i1.ProjectEnvironmentAsts table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$ProjectEnvironmentAstsFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => i1.$ProjectEnvironmentAstsOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => i1.$ProjectEnvironmentAstsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> projectEnvironmentId = const i0.Value.absent(),
                i0.Value<i3.Uint8List> ast = const i0.Value.absent(),
                i0.Value<int> version = const i0.Value.absent(),
              }) => i1.ProjectEnvironmentAstsCompanion(
                projectEnvironmentId: projectEnvironmentId,
                ast: ast,
                version: version,
              ),
          createCompanionCallback:
              ({
                required String projectEnvironmentId,
                required i3.Uint8List ast,
                required int version,
              }) => i1.ProjectEnvironmentAstsCompanion.insert(
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
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ProjectEnvironmentAstsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.ProjectEnvironmentAsts,
      i1.ProjectEnvironmentAst,
      i1.$ProjectEnvironmentAstsFilterComposer,
      i1.$ProjectEnvironmentAstsOrderingComposer,
      i1.$ProjectEnvironmentAstsAnnotationComposer,
      $ProjectEnvironmentAstsCreateCompanionBuilder,
      $ProjectEnvironmentAstsUpdateCompanionBuilder,
      (
        i1.ProjectEnvironmentAst,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.ProjectEnvironmentAsts,
          i1.ProjectEnvironmentAst
        >,
      ),
      i1.ProjectEnvironmentAst,
      i0.PrefetchHooks Function()
    >;
typedef $ProjectEnvironmentAssetsCreateCompanionBuilder =
    i1.ProjectEnvironmentAssetsCompanion Function({
      required String projectEnvironmentId,
      required String type,
      required String bucket,
      required String name,
      required String etag,
    });
typedef $ProjectEnvironmentAssetsUpdateCompanionBuilder =
    i1.ProjectEnvironmentAssetsCompanion Function({
      i0.Value<String> projectEnvironmentId,
      i0.Value<String> type,
      i0.Value<String> bucket,
      i0.Value<String> name,
      i0.Value<String> etag,
    });

class $ProjectEnvironmentAssetsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentAssets> {
  $ProjectEnvironmentAssetsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get bucket => $composableBuilder(
    column: $table.bucket,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $ProjectEnvironmentAssetsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentAssets> {
  $ProjectEnvironmentAssetsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get bucket => $composableBuilder(
    column: $table.bucket,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $ProjectEnvironmentAssetsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentAssets> {
  $ProjectEnvironmentAssetsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  i0.GeneratedColumn<String> get bucket =>
      $composableBuilder(column: $table.bucket, builder: (column) => column);

  i0.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  i0.GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);
}

class $ProjectEnvironmentAssetsTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.ProjectEnvironmentAssets,
          i1.ProjectEnvironmentAsset,
          i1.$ProjectEnvironmentAssetsFilterComposer,
          i1.$ProjectEnvironmentAssetsOrderingComposer,
          i1.$ProjectEnvironmentAssetsAnnotationComposer,
          $ProjectEnvironmentAssetsCreateCompanionBuilder,
          $ProjectEnvironmentAssetsUpdateCompanionBuilder,
          (
            i1.ProjectEnvironmentAsset,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.ProjectEnvironmentAssets,
              i1.ProjectEnvironmentAsset
            >,
          ),
          i1.ProjectEnvironmentAsset,
          i0.PrefetchHooks Function()
        > {
  $ProjectEnvironmentAssetsTableManager(
    i0.GeneratedDatabase db,
    i1.ProjectEnvironmentAssets table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$ProjectEnvironmentAssetsFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => i1.$ProjectEnvironmentAssetsOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => i1.$ProjectEnvironmentAssetsAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> projectEnvironmentId = const i0.Value.absent(),
                i0.Value<String> type = const i0.Value.absent(),
                i0.Value<String> bucket = const i0.Value.absent(),
                i0.Value<String> name = const i0.Value.absent(),
                i0.Value<String> etag = const i0.Value.absent(),
              }) => i1.ProjectEnvironmentAssetsCompanion(
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
              }) => i1.ProjectEnvironmentAssetsCompanion.insert(
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
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ProjectEnvironmentAssetsProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.ProjectEnvironmentAssets,
      i1.ProjectEnvironmentAsset,
      i1.$ProjectEnvironmentAssetsFilterComposer,
      i1.$ProjectEnvironmentAssetsOrderingComposer,
      i1.$ProjectEnvironmentAssetsAnnotationComposer,
      $ProjectEnvironmentAssetsCreateCompanionBuilder,
      $ProjectEnvironmentAssetsUpdateCompanionBuilder,
      (
        i1.ProjectEnvironmentAsset,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.ProjectEnvironmentAssets,
          i1.ProjectEnvironmentAsset
        >,
      ),
      i1.ProjectEnvironmentAsset,
      i0.PrefetchHooks Function()
    >;
typedef $ProjectEnvironmentStatesCreateCompanionBuilder =
    i1.ProjectEnvironmentStatesCompanion Function({
      required String projectEnvironmentId,
      i0.Value<String?> flyAppId,
      i0.Value<String?> tursoDatabaseId,
      i0.Value<String?> domainName,
    });
typedef $ProjectEnvironmentStatesUpdateCompanionBuilder =
    i1.ProjectEnvironmentStatesCompanion Function({
      i0.Value<String> projectEnvironmentId,
      i0.Value<String?> flyAppId,
      i0.Value<String?> tursoDatabaseId,
      i0.Value<String?> domainName,
    });

class $ProjectEnvironmentStatesFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentStates> {
  $ProjectEnvironmentStatesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get flyAppId => $composableBuilder(
    column: $table.flyAppId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get tursoDatabaseId => $composableBuilder(
    column: $table.tursoDatabaseId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get domainName => $composableBuilder(
    column: $table.domainName,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $ProjectEnvironmentStatesOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentStates> {
  $ProjectEnvironmentStatesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get flyAppId => $composableBuilder(
    column: $table.flyAppId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get tursoDatabaseId => $composableBuilder(
    column: $table.tursoDatabaseId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get domainName => $composableBuilder(
    column: $table.domainName,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $ProjectEnvironmentStatesAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ProjectEnvironmentStates> {
  $ProjectEnvironmentStatesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get projectEnvironmentId => $composableBuilder(
    column: $table.projectEnvironmentId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get flyAppId =>
      $composableBuilder(column: $table.flyAppId, builder: (column) => column);

  i0.GeneratedColumn<String> get tursoDatabaseId => $composableBuilder(
    column: $table.tursoDatabaseId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get domainName => $composableBuilder(
    column: $table.domainName,
    builder: (column) => column,
  );
}

class $ProjectEnvironmentStatesTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.ProjectEnvironmentStates,
          i1.ProjectEnvironmentState,
          i1.$ProjectEnvironmentStatesFilterComposer,
          i1.$ProjectEnvironmentStatesOrderingComposer,
          i1.$ProjectEnvironmentStatesAnnotationComposer,
          $ProjectEnvironmentStatesCreateCompanionBuilder,
          $ProjectEnvironmentStatesUpdateCompanionBuilder,
          (
            i1.ProjectEnvironmentState,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.ProjectEnvironmentStates,
              i1.ProjectEnvironmentState
            >,
          ),
          i1.ProjectEnvironmentState,
          i0.PrefetchHooks Function()
        > {
  $ProjectEnvironmentStatesTableManager(
    i0.GeneratedDatabase db,
    i1.ProjectEnvironmentStates table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$ProjectEnvironmentStatesFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => i1.$ProjectEnvironmentStatesOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => i1.$ProjectEnvironmentStatesAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> projectEnvironmentId = const i0.Value.absent(),
                i0.Value<String?> flyAppId = const i0.Value.absent(),
                i0.Value<String?> tursoDatabaseId = const i0.Value.absent(),
                i0.Value<String?> domainName = const i0.Value.absent(),
              }) => i1.ProjectEnvironmentStatesCompanion(
                projectEnvironmentId: projectEnvironmentId,
                flyAppId: flyAppId,
                tursoDatabaseId: tursoDatabaseId,
                domainName: domainName,
              ),
          createCompanionCallback:
              ({
                required String projectEnvironmentId,
                i0.Value<String?> flyAppId = const i0.Value.absent(),
                i0.Value<String?> tursoDatabaseId = const i0.Value.absent(),
                i0.Value<String?> domainName = const i0.Value.absent(),
              }) => i1.ProjectEnvironmentStatesCompanion.insert(
                projectEnvironmentId: projectEnvironmentId,
                flyAppId: flyAppId,
                tursoDatabaseId: tursoDatabaseId,
                domainName: domainName,
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

typedef $ProjectEnvironmentStatesProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.ProjectEnvironmentStates,
      i1.ProjectEnvironmentState,
      i1.$ProjectEnvironmentStatesFilterComposer,
      i1.$ProjectEnvironmentStatesOrderingComposer,
      i1.$ProjectEnvironmentStatesAnnotationComposer,
      $ProjectEnvironmentStatesCreateCompanionBuilder,
      $ProjectEnvironmentStatesUpdateCompanionBuilder,
      (
        i1.ProjectEnvironmentState,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.ProjectEnvironmentStates,
          i1.ProjectEnvironmentState
        >,
      ),
      i1.ProjectEnvironmentState,
      i0.PrefetchHooks Function()
    >;

class ProjectEnvironments extends i0.Table
    with i0.TableInfo<ProjectEnvironments, i1.ProjectEnvironment> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironments(this.attachedDatabase, [this._alias]);
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
  static const i0.VerificationMeta _projectEnvironmentIdMeta =
      const i0.VerificationMeta('projectEnvironmentId');
  late final i0.GeneratedColumn<String> projectEnvironmentId =
      i0.GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  late final i0.GeneratedColumnWithTypeConverter<i2.LifecycleState, int> state =
      i0.GeneratedColumn<int>(
        'state',
        aliasedName,
        false,
        type: i0.DriftSqlType.int,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT 1',
        defaultValue: const i0.CustomExpression('1'),
      ).withConverter<i2.LifecycleState>(
        i1.ProjectEnvironments.$converterstate,
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
  static const i0.VerificationMeta _reconcilingMeta = const i0.VerificationMeta(
    'reconciling',
  );
  late final i0.GeneratedColumn<bool> reconciling = i0.GeneratedColumn<bool>(
    'reconciling',
    aliasedName,
    false,
    generatedAs: i0.GeneratedAs(
      const i0.CustomExpression('state IN (1, 4, 6)'),
      false,
    ),
    type: i0.DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (state IN (1, 4, 6)) VIRTUAL',
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
        'hex(md5(json_array(id, parent_type, parent_id, project_environment_id, state, display_name, create_time, update_time, delete_time, annotations, reconciling)))',
      ),
      true,
    ),
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL GENERATED ALWAYS AS (hex(md5(json_array(id, parent_type, parent_id, project_environment_id, state, display_name, create_time, update_time, delete_time, annotations, reconciling)))) STORED',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
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
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.ProjectEnvironment> instance, {
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.ProjectEnvironment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ProjectEnvironment(
      id:
          attachedDatabase.typeMapping.read(
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
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      state: i1.ProjectEnvironments.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int,
          data['${effectivePrefix}state'],
        )!,
      ),
      displayName: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
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
      deleteTime: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}delete_time'],
      ),
      annotations: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}annotations'],
      ),
      reconciling:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.bool,
            data['${effectivePrefix}reconciling'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}etag'],
          )!,
    );
  }

  @override
  ProjectEnvironments createAlias(String alias) {
    return ProjectEnvironments(attachedDatabase, alias);
  }

  static i0.JsonTypeConverter2<i2.LifecycleState, int, int> $converterstate =
      const i0.EnumIndexConverter<i2.LifecycleState>(i2.LifecycleState.values);
  @override
  List<String> get customConstraints => const [
    'CHECK(parent_type IS NULL OR parent_type = \'Celest::Project\')',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironment extends i0.DataClass
    implements i0.Insertable<i1.ProjectEnvironment> {
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
  final i2.LifecycleState state;

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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    if (!nullToAbsent || parentType != null) {
      map['parent_type'] = i0.Variable<String>(parentType);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = i0.Variable<String>(parentId);
    }
    map['project_environment_id'] = i0.Variable<String>(projectEnvironmentId);
    {
      map['state'] = i0.Variable<int>(
        i1.ProjectEnvironments.$converterstate.toSql(state),
      );
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = i0.Variable<String>(displayName);
    }
    map['create_time'] = i0.Variable<DateTime>(createTime);
    map['update_time'] = i0.Variable<DateTime>(updateTime);
    if (!nullToAbsent || deleteTime != null) {
      map['delete_time'] = i0.Variable<DateTime>(deleteTime);
    }
    if (!nullToAbsent || annotations != null) {
      map['annotations'] = i0.Variable<String>(annotations);
    }
    return map;
  }

  i1.ProjectEnvironmentsCompanion toCompanion(bool nullToAbsent) {
    return i1.ProjectEnvironmentsCompanion(
      id: i0.Value(id),
      parentType:
          parentType == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(parentType),
      parentId:
          parentId == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(parentId),
      projectEnvironmentId: i0.Value(projectEnvironmentId),
      state: i0.Value(state),
      displayName:
          displayName == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(displayName),
      createTime: i0.Value(createTime),
      updateTime: i0.Value(updateTime),
      deleteTime:
          deleteTime == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(deleteTime),
      annotations:
          annotations == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(annotations),
    );
  }

  factory ProjectEnvironment.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironment(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String?>(json['parent_type']),
      parentId: serializer.fromJson<String?>(json['parent_id']),
      projectEnvironmentId: serializer.fromJson<String>(
        json['project_environment_id'],
      ),
      state: i1.ProjectEnvironments.$converterstate.fromJson(
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parent_type': serializer.toJson<String?>(parentType),
      'parent_id': serializer.toJson<String?>(parentId),
      'project_environment_id': serializer.toJson<String>(projectEnvironmentId),
      'state': serializer.toJson<int>(
        i1.ProjectEnvironments.$converterstate.toJson(state),
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

  i1.ProjectEnvironment copyWith({
    String? id,
    i0.Value<String?> parentType = const i0.Value.absent(),
    i0.Value<String?> parentId = const i0.Value.absent(),
    String? projectEnvironmentId,
    i2.LifecycleState? state,
    i0.Value<String?> displayName = const i0.Value.absent(),
    DateTime? createTime,
    DateTime? updateTime,
    i0.Value<DateTime?> deleteTime = const i0.Value.absent(),
    i0.Value<String?> annotations = const i0.Value.absent(),
    bool? reconciling,
    String? etag,
  }) => i1.ProjectEnvironment(
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
      (other is i1.ProjectEnvironment &&
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

class ProjectEnvironmentsCompanion
    extends i0.UpdateCompanion<i1.ProjectEnvironment> {
  final i0.Value<String> id;
  final i0.Value<String?> parentType;
  final i0.Value<String?> parentId;
  final i0.Value<String> projectEnvironmentId;
  final i0.Value<i2.LifecycleState> state;
  final i0.Value<String?> displayName;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime> updateTime;
  final i0.Value<DateTime?> deleteTime;
  final i0.Value<String?> annotations;
  final i0.Value<int> rowid;
  const ProjectEnvironmentsCompanion({
    this.id = const i0.Value.absent(),
    this.parentType = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
    this.projectEnvironmentId = const i0.Value.absent(),
    this.state = const i0.Value.absent(),
    this.displayName = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.deleteTime = const i0.Value.absent(),
    this.annotations = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  ProjectEnvironmentsCompanion.insert({
    required String id,
    this.parentType = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
    required String projectEnvironmentId,
    this.state = const i0.Value.absent(),
    this.displayName = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.deleteTime = const i0.Value.absent(),
    this.annotations = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : id = i0.Value(id),
       projectEnvironmentId = i0.Value(projectEnvironmentId);
  static i0.Insertable<i1.ProjectEnvironment> custom({
    i0.Expression<String>? id,
    i0.Expression<String>? parentType,
    i0.Expression<String>? parentId,
    i0.Expression<String>? projectEnvironmentId,
    i0.Expression<int>? state,
    i0.Expression<String>? displayName,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? updateTime,
    i0.Expression<DateTime>? deleteTime,
    i0.Expression<String>? annotations,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
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

  i1.ProjectEnvironmentsCompanion copyWith({
    i0.Value<String>? id,
    i0.Value<String?>? parentType,
    i0.Value<String?>? parentId,
    i0.Value<String>? projectEnvironmentId,
    i0.Value<i2.LifecycleState>? state,
    i0.Value<String?>? displayName,
    i0.Value<DateTime>? createTime,
    i0.Value<DateTime>? updateTime,
    i0.Value<DateTime?>? deleteTime,
    i0.Value<String?>? annotations,
    i0.Value<int>? rowid,
  }) {
    return i1.ProjectEnvironmentsCompanion(
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
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = i0.Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (state.present) {
      map['state'] = i0.Variable<int>(
        i1.ProjectEnvironments.$converterstate.toSql(state.value),
      );
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
    if (annotations.present) {
      map['annotations'] = i0.Variable<String>(annotations.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
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

i0.Trigger get projectEnvironmentsTriggerUpdateTime => i0.Trigger(
  'CREATE TRIGGER IF NOT EXISTS project_environments_trigger_update_time AFTER UPDATE ON project_environments BEGIN UPDATE project_environments SET update_time = unixepoch(\'now\', \'subsec\') WHERE id = OLD.id;END',
  'project_environments_trigger_update_time',
);

class ProjectEnvironmentAsts extends i0.Table
    with i0.TableInfo<ProjectEnvironmentAsts, i1.ProjectEnvironmentAst> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentAsts(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _projectEnvironmentIdMeta =
      const i0.VerificationMeta('projectEnvironmentId');
  late final i0.GeneratedColumn<String> projectEnvironmentId =
      i0.GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      );
  static const i0.VerificationMeta _astMeta = const i0.VerificationMeta('ast');
  late final i0.GeneratedColumn<i3.Uint8List> ast =
      i0.GeneratedColumn<i3.Uint8List>(
        'ast',
        aliasedName,
        false,
        type: i0.DriftSqlType.blob,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const i0.VerificationMeta _versionMeta = const i0.VerificationMeta(
    'version',
  );
  late final i0.GeneratedColumn<int> version = i0.GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: i0.DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _digestMeta = const i0.VerificationMeta(
    'digest',
  );
  late final i0.GeneratedColumn<String> digest = i0.GeneratedColumn<String>(
    'digest',
    aliasedName,
    false,
    generatedAs: i0.GeneratedAs(
      const i0.CustomExpression('hex(md5(ast))'),
      true,
    ),
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL GENERATED ALWAYS AS (hex(md5(ast))) STORED',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
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
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.ProjectEnvironmentAst> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {projectEnvironmentId};
  @override
  i1.ProjectEnvironmentAst map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ProjectEnvironmentAst(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      ast:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.blob,
            data['${effectivePrefix}ast'],
          )!,
      version:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.int,
            data['${effectivePrefix}version'],
          )!,
      digest:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
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

class ProjectEnvironmentAst extends i0.DataClass
    implements i0.Insertable<i1.ProjectEnvironmentAst> {
  /// The ID of the linked environment.
  final String projectEnvironmentId;

  /// The environment's project AST.
  ///
  /// Format: ProtoAny[celest.ast.<version>.ResolvedProject]
  final i3.Uint8List ast;

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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['project_environment_id'] = i0.Variable<String>(projectEnvironmentId);
    map['ast'] = i0.Variable<i3.Uint8List>(ast);
    map['version'] = i0.Variable<int>(version);
    return map;
  }

  i1.ProjectEnvironmentAstsCompanion toCompanion(bool nullToAbsent) {
    return i1.ProjectEnvironmentAstsCompanion(
      projectEnvironmentId: i0.Value(projectEnvironmentId),
      ast: i0.Value(ast),
      version: i0.Value(version),
    );
  }

  factory ProjectEnvironmentAst.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentAst(
      projectEnvironmentId: serializer.fromJson<String>(
        json['project_environment_id'],
      ),
      ast: serializer.fromJson<i3.Uint8List>(json['ast']),
      version: serializer.fromJson<int>(json['version']),
      digest: serializer.fromJson<String>(json['digest']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'project_environment_id': serializer.toJson<String>(projectEnvironmentId),
      'ast': serializer.toJson<i3.Uint8List>(ast),
      'version': serializer.toJson<int>(version),
      'digest': serializer.toJson<String>(digest),
    };
  }

  i1.ProjectEnvironmentAst copyWith({
    String? projectEnvironmentId,
    i3.Uint8List? ast,
    int? version,
    String? digest,
  }) => i1.ProjectEnvironmentAst(
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
    i0.$driftBlobEquality.hash(ast),
    version,
    digest,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ProjectEnvironmentAst &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          i0.$driftBlobEquality.equals(other.ast, this.ast) &&
          other.version == this.version &&
          other.digest == this.digest);
}

class ProjectEnvironmentAstsCompanion
    extends i0.UpdateCompanion<i1.ProjectEnvironmentAst> {
  final i0.Value<String> projectEnvironmentId;
  final i0.Value<i3.Uint8List> ast;
  final i0.Value<int> version;
  const ProjectEnvironmentAstsCompanion({
    this.projectEnvironmentId = const i0.Value.absent(),
    this.ast = const i0.Value.absent(),
    this.version = const i0.Value.absent(),
  });
  ProjectEnvironmentAstsCompanion.insert({
    required String projectEnvironmentId,
    required i3.Uint8List ast,
    required int version,
  }) : projectEnvironmentId = i0.Value(projectEnvironmentId),
       ast = i0.Value(ast),
       version = i0.Value(version);
  static i0.Insertable<i1.ProjectEnvironmentAst> custom({
    i0.Expression<String>? projectEnvironmentId,
    i0.Expression<i3.Uint8List>? ast,
    i0.Expression<int>? version,
  }) {
    return i0.RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (ast != null) 'ast': ast,
      if (version != null) 'version': version,
    });
  }

  i1.ProjectEnvironmentAstsCompanion copyWith({
    i0.Value<String>? projectEnvironmentId,
    i0.Value<i3.Uint8List>? ast,
    i0.Value<int>? version,
  }) {
    return i1.ProjectEnvironmentAstsCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      ast: ast ?? this.ast,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = i0.Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (ast.present) {
      map['ast'] = i0.Variable<i3.Uint8List>(ast.value);
    }
    if (version.present) {
      map['version'] = i0.Variable<int>(version.value);
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

class ProjectEnvironmentAssets extends i0.Table
    with i0.TableInfo<ProjectEnvironmentAssets, i1.ProjectEnvironmentAsset> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentAssets(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _projectEnvironmentIdMeta =
      const i0.VerificationMeta('projectEnvironmentId');
  late final i0.GeneratedColumn<String> projectEnvironmentId =
      i0.GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const i0.VerificationMeta _typeMeta = const i0.VerificationMeta(
    'type',
  );
  late final i0.GeneratedColumn<String> type = i0.GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _bucketMeta = const i0.VerificationMeta(
    'bucket',
  );
  late final i0.GeneratedColumn<String> bucket = i0.GeneratedColumn<String>(
    'bucket',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _nameMeta = const i0.VerificationMeta(
    'name',
  );
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const i0.VerificationMeta _etagMeta = const i0.VerificationMeta(
    'etag',
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
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.ProjectEnvironmentAsset> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {projectEnvironmentId, name};
  @override
  i1.ProjectEnvironmentAsset map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ProjectEnvironmentAsset(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      bucket:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}bucket'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      etag:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
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

class ProjectEnvironmentAsset extends i0.DataClass
    implements i0.Insertable<i1.ProjectEnvironmentAsset> {
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['project_environment_id'] = i0.Variable<String>(projectEnvironmentId);
    map['type'] = i0.Variable<String>(type);
    map['bucket'] = i0.Variable<String>(bucket);
    map['name'] = i0.Variable<String>(name);
    map['etag'] = i0.Variable<String>(etag);
    return map;
  }

  i1.ProjectEnvironmentAssetsCompanion toCompanion(bool nullToAbsent) {
    return i1.ProjectEnvironmentAssetsCompanion(
      projectEnvironmentId: i0.Value(projectEnvironmentId),
      type: i0.Value(type),
      bucket: i0.Value(bucket),
      name: i0.Value(name),
      etag: i0.Value(etag),
    );
  }

  factory ProjectEnvironmentAsset.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'project_environment_id': serializer.toJson<String>(projectEnvironmentId),
      'type': serializer.toJson<String>(type),
      'bucket': serializer.toJson<String>(bucket),
      'name': serializer.toJson<String>(name),
      'etag': serializer.toJson<String>(etag),
    };
  }

  i1.ProjectEnvironmentAsset copyWith({
    String? projectEnvironmentId,
    String? type,
    String? bucket,
    String? name,
    String? etag,
  }) => i1.ProjectEnvironmentAsset(
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    type: type ?? this.type,
    bucket: bucket ?? this.bucket,
    name: name ?? this.name,
    etag: etag ?? this.etag,
  );
  ProjectEnvironmentAsset copyWithCompanion(
    i1.ProjectEnvironmentAssetsCompanion data,
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
      (other is i1.ProjectEnvironmentAsset &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          other.type == this.type &&
          other.bucket == this.bucket &&
          other.name == this.name &&
          other.etag == this.etag);
}

class ProjectEnvironmentAssetsCompanion
    extends i0.UpdateCompanion<i1.ProjectEnvironmentAsset> {
  final i0.Value<String> projectEnvironmentId;
  final i0.Value<String> type;
  final i0.Value<String> bucket;
  final i0.Value<String> name;
  final i0.Value<String> etag;
  const ProjectEnvironmentAssetsCompanion({
    this.projectEnvironmentId = const i0.Value.absent(),
    this.type = const i0.Value.absent(),
    this.bucket = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.etag = const i0.Value.absent(),
  });
  ProjectEnvironmentAssetsCompanion.insert({
    required String projectEnvironmentId,
    required String type,
    required String bucket,
    required String name,
    required String etag,
  }) : projectEnvironmentId = i0.Value(projectEnvironmentId),
       type = i0.Value(type),
       bucket = i0.Value(bucket),
       name = i0.Value(name),
       etag = i0.Value(etag);
  static i0.Insertable<i1.ProjectEnvironmentAsset> custom({
    i0.Expression<String>? projectEnvironmentId,
    i0.Expression<String>? type,
    i0.Expression<String>? bucket,
    i0.Expression<String>? name,
    i0.Expression<String>? etag,
  }) {
    return i0.RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (type != null) 'type': type,
      if (bucket != null) 'bucket': bucket,
      if (name != null) 'name': name,
      if (etag != null) 'etag': etag,
    });
  }

  i1.ProjectEnvironmentAssetsCompanion copyWith({
    i0.Value<String>? projectEnvironmentId,
    i0.Value<String>? type,
    i0.Value<String>? bucket,
    i0.Value<String>? name,
    i0.Value<String>? etag,
  }) {
    return i1.ProjectEnvironmentAssetsCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      type: type ?? this.type,
      bucket: bucket ?? this.bucket,
      name: name ?? this.name,
      etag: etag ?? this.etag,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = i0.Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (type.present) {
      map['type'] = i0.Variable<String>(type.value);
    }
    if (bucket.present) {
      map['bucket'] = i0.Variable<String>(bucket.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (etag.present) {
      map['etag'] = i0.Variable<String>(etag.value);
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

class ProjectEnvironmentStates extends i0.Table
    with i0.TableInfo<ProjectEnvironmentStates, i1.ProjectEnvironmentState> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectEnvironmentStates(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _projectEnvironmentIdMeta =
      const i0.VerificationMeta('projectEnvironmentId');
  late final i0.GeneratedColumn<String> projectEnvironmentId =
      i0.GeneratedColumn<String>(
        'project_environment_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      );
  static const i0.VerificationMeta _flyAppIdMeta = const i0.VerificationMeta(
    'flyAppId',
  );
  late final i0.GeneratedColumn<String> flyAppId = i0.GeneratedColumn<String>(
    'fly_app_id',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const i0.VerificationMeta _tursoDatabaseIdMeta =
      const i0.VerificationMeta('tursoDatabaseId');
  late final i0.GeneratedColumn<String> tursoDatabaseId =
      i0.GeneratedColumn<String>(
        'turso_database_id',
        aliasedName,
        true,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: '',
      );
  static const i0.VerificationMeta _domainNameMeta = const i0.VerificationMeta(
    'domainName',
  );
  late final i0.GeneratedColumn<String> domainName = i0.GeneratedColumn<String>(
    'domain_name',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
    projectEnvironmentId,
    flyAppId,
    tursoDatabaseId,
    domainName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_environment_states';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.ProjectEnvironmentState> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
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
    if (data.containsKey('fly_app_id')) {
      context.handle(
        _flyAppIdMeta,
        flyAppId.isAcceptableOrUnknown(data['fly_app_id']!, _flyAppIdMeta),
      );
    }
    if (data.containsKey('turso_database_id')) {
      context.handle(
        _tursoDatabaseIdMeta,
        tursoDatabaseId.isAcceptableOrUnknown(
          data['turso_database_id']!,
          _tursoDatabaseIdMeta,
        ),
      );
    }
    if (data.containsKey('domain_name')) {
      context.handle(
        _domainNameMeta,
        domainName.isAcceptableOrUnknown(data['domain_name']!, _domainNameMeta),
      );
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {projectEnvironmentId};
  @override
  i1.ProjectEnvironmentState map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ProjectEnvironmentState(
      projectEnvironmentId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}project_environment_id'],
          )!,
      flyAppId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}fly_app_id'],
      ),
      tursoDatabaseId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}turso_database_id'],
      ),
      domainName: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}domain_name'],
      ),
    );
  }

  @override
  ProjectEnvironmentStates createAlias(String alias) {
    return ProjectEnvironmentStates(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
    'CONSTRAINT fk_project_environment_state_project_environment_id FOREIGN KEY(project_environment_id)REFERENCES project_environments(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ProjectEnvironmentState extends i0.DataClass
    implements i0.Insertable<i1.ProjectEnvironmentState> {
  /// The ID of the linked project environment.
  final String projectEnvironmentId;

  /// The ID of the project environment's Fly app.
  final String? flyAppId;

  /// The ID of the project environment's database.
  final String? tursoDatabaseId;

  /// The domain name of the project environment.
  final String? domainName;
  const ProjectEnvironmentState({
    required this.projectEnvironmentId,
    this.flyAppId,
    this.tursoDatabaseId,
    this.domainName,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['project_environment_id'] = i0.Variable<String>(projectEnvironmentId);
    if (!nullToAbsent || flyAppId != null) {
      map['fly_app_id'] = i0.Variable<String>(flyAppId);
    }
    if (!nullToAbsent || tursoDatabaseId != null) {
      map['turso_database_id'] = i0.Variable<String>(tursoDatabaseId);
    }
    if (!nullToAbsent || domainName != null) {
      map['domain_name'] = i0.Variable<String>(domainName);
    }
    return map;
  }

  i1.ProjectEnvironmentStatesCompanion toCompanion(bool nullToAbsent) {
    return i1.ProjectEnvironmentStatesCompanion(
      projectEnvironmentId: i0.Value(projectEnvironmentId),
      flyAppId:
          flyAppId == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(flyAppId),
      tursoDatabaseId:
          tursoDatabaseId == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(tursoDatabaseId),
      domainName:
          domainName == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(domainName),
    );
  }

  factory ProjectEnvironmentState.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ProjectEnvironmentState(
      projectEnvironmentId: serializer.fromJson<String>(
        json['project_environment_id'],
      ),
      flyAppId: serializer.fromJson<String?>(json['fly_app_id']),
      tursoDatabaseId: serializer.fromJson<String?>(json['turso_database_id']),
      domainName: serializer.fromJson<String?>(json['domain_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'project_environment_id': serializer.toJson<String>(projectEnvironmentId),
      'fly_app_id': serializer.toJson<String?>(flyAppId),
      'turso_database_id': serializer.toJson<String?>(tursoDatabaseId),
      'domain_name': serializer.toJson<String?>(domainName),
    };
  }

  i1.ProjectEnvironmentState copyWith({
    String? projectEnvironmentId,
    i0.Value<String?> flyAppId = const i0.Value.absent(),
    i0.Value<String?> tursoDatabaseId = const i0.Value.absent(),
    i0.Value<String?> domainName = const i0.Value.absent(),
  }) => i1.ProjectEnvironmentState(
    projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
    flyAppId: flyAppId.present ? flyAppId.value : this.flyAppId,
    tursoDatabaseId:
        tursoDatabaseId.present ? tursoDatabaseId.value : this.tursoDatabaseId,
    domainName: domainName.present ? domainName.value : this.domainName,
  );
  ProjectEnvironmentState copyWithCompanion(
    i1.ProjectEnvironmentStatesCompanion data,
  ) {
    return ProjectEnvironmentState(
      projectEnvironmentId:
          data.projectEnvironmentId.present
              ? data.projectEnvironmentId.value
              : this.projectEnvironmentId,
      flyAppId: data.flyAppId.present ? data.flyAppId.value : this.flyAppId,
      tursoDatabaseId:
          data.tursoDatabaseId.present
              ? data.tursoDatabaseId.value
              : this.tursoDatabaseId,
      domainName:
          data.domainName.present ? data.domainName.value : this.domainName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentState(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('flyAppId: $flyAppId, ')
          ..write('tursoDatabaseId: $tursoDatabaseId, ')
          ..write('domainName: $domainName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(projectEnvironmentId, flyAppId, tursoDatabaseId, domainName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ProjectEnvironmentState &&
          other.projectEnvironmentId == this.projectEnvironmentId &&
          other.flyAppId == this.flyAppId &&
          other.tursoDatabaseId == this.tursoDatabaseId &&
          other.domainName == this.domainName);
}

class ProjectEnvironmentStatesCompanion
    extends i0.UpdateCompanion<i1.ProjectEnvironmentState> {
  final i0.Value<String> projectEnvironmentId;
  final i0.Value<String?> flyAppId;
  final i0.Value<String?> tursoDatabaseId;
  final i0.Value<String?> domainName;
  const ProjectEnvironmentStatesCompanion({
    this.projectEnvironmentId = const i0.Value.absent(),
    this.flyAppId = const i0.Value.absent(),
    this.tursoDatabaseId = const i0.Value.absent(),
    this.domainName = const i0.Value.absent(),
  });
  ProjectEnvironmentStatesCompanion.insert({
    required String projectEnvironmentId,
    this.flyAppId = const i0.Value.absent(),
    this.tursoDatabaseId = const i0.Value.absent(),
    this.domainName = const i0.Value.absent(),
  }) : projectEnvironmentId = i0.Value(projectEnvironmentId);
  static i0.Insertable<i1.ProjectEnvironmentState> custom({
    i0.Expression<String>? projectEnvironmentId,
    i0.Expression<String>? flyAppId,
    i0.Expression<String>? tursoDatabaseId,
    i0.Expression<String>? domainName,
  }) {
    return i0.RawValuesInsertable({
      if (projectEnvironmentId != null)
        'project_environment_id': projectEnvironmentId,
      if (flyAppId != null) 'fly_app_id': flyAppId,
      if (tursoDatabaseId != null) 'turso_database_id': tursoDatabaseId,
      if (domainName != null) 'domain_name': domainName,
    });
  }

  i1.ProjectEnvironmentStatesCompanion copyWith({
    i0.Value<String>? projectEnvironmentId,
    i0.Value<String?>? flyAppId,
    i0.Value<String?>? tursoDatabaseId,
    i0.Value<String?>? domainName,
  }) {
    return i1.ProjectEnvironmentStatesCompanion(
      projectEnvironmentId: projectEnvironmentId ?? this.projectEnvironmentId,
      flyAppId: flyAppId ?? this.flyAppId,
      tursoDatabaseId: tursoDatabaseId ?? this.tursoDatabaseId,
      domainName: domainName ?? this.domainName,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (projectEnvironmentId.present) {
      map['project_environment_id'] = i0.Variable<String>(
        projectEnvironmentId.value,
      );
    }
    if (flyAppId.present) {
      map['fly_app_id'] = i0.Variable<String>(flyAppId.value);
    }
    if (tursoDatabaseId.present) {
      map['turso_database_id'] = i0.Variable<String>(tursoDatabaseId.value);
    }
    if (domainName.present) {
      map['domain_name'] = i0.Variable<String>(domainName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEnvironmentStatesCompanion(')
          ..write('projectEnvironmentId: $projectEnvironmentId, ')
          ..write('flyAppId: $flyAppId, ')
          ..write('tursoDatabaseId: $tursoDatabaseId, ')
          ..write('domainName: $domainName')
          ..write(')'))
        .toString();
  }
}

class ProjectEnvironmentsDrift extends i4.ModularAccessor {
  ProjectEnvironmentsDrift(i0.GeneratedDatabase db) : super(db);
  i5.Future<List<i1.ProjectEnvironment>> createProjectEnvironment({
    required String id,
    String? parentType,
    String? parentId,
    required String projectEnvironmentId,
    required i2.LifecycleState state,
    String? displayName,
    String? annotations,
  }) {
    return customWriteReturning(
      'INSERT INTO project_environments (id, parent_type, parent_id, project_environment_id, state, display_name, annotations) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7) RETURNING *',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
        i0.Variable<String>(projectEnvironmentId),
        i0.Variable<int>(i1.ProjectEnvironments.$converterstate.toSql(state)),
        i0.Variable<String>(displayName),
        i0.Variable<String>(annotations),
      ],
      updates: {projectEnvironments},
    ).then((rows) => Future.wait(rows.map(projectEnvironments.mapFromRow)));
  }

  i0.Selectable<i1.ProjectEnvironment> getProjectEnvironment({
    required String id,
  }) {
    return customSelect(
      'SELECT * FROM project_environments WHERE id = ?1',
      variables: [i0.Variable<String>(id)],
      readsFrom: {projectEnvironments},
    ).asyncMap(projectEnvironments.mapFromRow);
  }

  i0.Selectable<i1.ProjectEnvironment> lookupProjectEnvironment({
    String? projectId,
    required String projectEnvironmentId,
  }) {
    return customSelect(
      'SELECT * FROM project_environments WHERE parent_type = \'Celest::Project\' AND parent_id = ?1 AND project_environment_id = ?2 LIMIT 1',
      variables: [
        i0.Variable<String>(projectId),
        i0.Variable<String>(projectEnvironmentId),
      ],
      readsFrom: {projectEnvironments},
    ).asyncMap(projectEnvironments.mapFromRow);
  }

  i5.Future<List<i1.ProjectEnvironment>> updateProjectEnvironment({
    String? parentType,
    String? parentId,
    String? projectEnvironmentId,
    double? state,
    String? displayName,
    String? annotations,
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE project_environments SET parent_type = coalesce(?1, parent_type), parent_id = coalesce(?2, parent_id), project_environment_id = coalesce(?3, project_environment_id), state = coalesce(?4, state), display_name = coalesce(?5, display_name), annotations = coalesce(?6, annotations) WHERE id = ?7 RETURNING *',
      variables: [
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId),
        i0.Variable<String>(projectEnvironmentId),
        i0.Variable<double>(state),
        i0.Variable<String>(displayName),
        i0.Variable<String>(annotations),
        i0.Variable<String>(id),
      ],
      updates: {projectEnvironments},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(projectEnvironments.mapFromRow)));
  }

  i5.Future<List<i1.ProjectEnvironment>> deleteProjectEnvironment({
    required String id,
  }) {
    return customWriteReturning(
      'UPDATE project_environments SET delete_time = unixepoch(\'now\', \'subsec\'), state = 8 WHERE id = ?1 RETURNING *',
      variables: [i0.Variable<String>(id)],
      updates: {projectEnvironments},
      updateKind: i0.UpdateKind.update,
    ).then((rows) => Future.wait(rows.map(projectEnvironments.mapFromRow)));
  }

  Future<int> purgeProjectEnvironment({required String id}) {
    return customUpdate(
      'DELETE FROM project_environments WHERE id = ?1',
      variables: [i0.Variable<String>(id)],
      updates: {projectEnvironments},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i0.Selectable<i1.ProjectEnvironmentState> getProjectEnvironmentState({
    required String projectEnvironmentId,
  }) {
    return customSelect(
      'SELECT * FROM project_environment_states WHERE project_environment_id = ?1',
      variables: [i0.Variable<String>(projectEnvironmentId)],
      readsFrom: {projectEnvironmentStates},
    ).asyncMap(projectEnvironmentStates.mapFromRow);
  }

  i5.Future<List<i1.ProjectEnvironmentState>> createProjectEnvironmentState({
    required String projectEnvironmentId,
    String? flyAppId,
    String? tursoDatabaseId,
    String? domainName,
  }) {
    return customWriteReturning(
      'INSERT INTO project_environment_states (project_environment_id, fly_app_id, turso_database_id, domain_name) VALUES (?1, ?2, ?3, ?4) RETURNING *',
      variables: [
        i0.Variable<String>(projectEnvironmentId),
        i0.Variable<String>(flyAppId),
        i0.Variable<String>(tursoDatabaseId),
        i0.Variable<String>(domainName),
      ],
      updates: {projectEnvironmentStates},
    ).then(
      (rows) => Future.wait(rows.map(projectEnvironmentStates.mapFromRow)),
    );
  }

  i5.Future<List<i1.ProjectEnvironmentState>> updateProjectEnvironmentState({
    String? flyAppId,
    String? tursoDatabaseId,
    String? domainName,
    required String projectEnvironmentId,
  }) {
    return customWriteReturning(
      'UPDATE project_environment_states SET fly_app_id = coalesce(?1, fly_app_id), turso_database_id = coalesce(?2, turso_database_id), domain_name = coalesce(?3, domain_name) WHERE project_environment_id = ?4 RETURNING *',
      variables: [
        i0.Variable<String>(flyAppId),
        i0.Variable<String>(tursoDatabaseId),
        i0.Variable<String>(domainName),
        i0.Variable<String>(projectEnvironmentId),
      ],
      updates: {projectEnvironmentStates},
      updateKind: i0.UpdateKind.update,
    ).then(
      (rows) => Future.wait(rows.map(projectEnvironmentStates.mapFromRow)),
    );
  }

  i1.ProjectEnvironments get projectEnvironments => i4.ReadDatabaseContainer(
    attachedDatabase,
  ).resultSet<i1.ProjectEnvironments>('project_environments');
  i1.ProjectEnvironmentStates get projectEnvironmentStates =>
      i4.ReadDatabaseContainer(
        attachedDatabase,
      ).resultSet<i1.ProjectEnvironmentStates>('project_environment_states');
}
