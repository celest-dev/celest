// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/converters/cedar_converters.dart'
    as i2;
import 'package:cedar/src/model/value.dart' as i3;
import 'package:cedar/src/model/policy.dart' as i4;
import 'package:cedar/src/authorization/authorization_response.dart' as i5;
import 'package:drift/internal/modular.dart' as i6;
import 'dart:async' as i7;

typedef $CedarTypesCreateCompanionBuilder = i1.CedarTypesCompanion Function({
  required String fqn,
  i0.Value<int> rowid,
});
typedef $CedarTypesUpdateCompanionBuilder = i1.CedarTypesCompanion Function({
  i0.Value<String> fqn,
  i0.Value<int> rowid,
});

final class $CedarTypesReferences extends i0
    .BaseReferences<i0.GeneratedDatabase, i1.CedarTypes, i1.CedarType> {
  $CedarTypesReferences(super.$_db, super.$_table, super.$_typedResult);

  static i0.MultiTypedResultKey<i1.CedarEntities, List<i1.CedarEntity>>
      _cedarEntitiesRefsTable(i0.GeneratedDatabase db) =>
          i0.MultiTypedResultKey.fromTable(
              i6.ReadDatabaseContainer(db)
                  .resultSet<i1.CedarEntities>('cedar_entities'),
              aliasName: i0.$_aliasNameGenerator(
                  i6.ReadDatabaseContainer(db)
                      .resultSet<i1.CedarTypes>('cedar_types')
                      .fqn,
                  i6.ReadDatabaseContainer(db)
                      .resultSet<i1.CedarEntities>('cedar_entities')
                      .entityType));

  i1.$CedarEntitiesProcessedTableManager get cedarEntitiesRefs {
    final manager = i1
        .$CedarEntitiesTableManager(
            $_db,
            i6.ReadDatabaseContainer($_db)
                .resultSet<i1.CedarEntities>('cedar_entities'))
        .filter(
            (f) => f.entityType.fqn.sqlEquals($_itemColumn<String>('fqn')!));

    final cache = $_typedResult.readTableOrNull(_cedarEntitiesRefsTable($_db));
    return i0.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $CedarTypesFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarTypes> {
  $CedarTypesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get fqn => $composableBuilder(
      column: $table.fqn, builder: (column) => i0.ColumnFilters(column));

  i0.Expression<bool> cedarEntitiesRefs(
      i0.Expression<bool> Function(i1.$CedarEntitiesFilterComposer f) f) {
    final i1.$CedarEntitiesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fqn,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i1.CedarEntities>('cedar_entities'),
        getReferencedColumn: (t) => t.entityType,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i1.$CedarEntitiesFilterComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i1.CedarEntities>('cedar_entities'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CedarTypesOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarTypes> {
  $CedarTypesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get fqn => $composableBuilder(
      column: $table.fqn, builder: (column) => i0.ColumnOrderings(column));
}

class $CedarTypesAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarTypes> {
  $CedarTypesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get fqn =>
      $composableBuilder(column: $table.fqn, builder: (column) => column);

  i0.Expression<T> cedarEntitiesRefs<T extends Object>(
      i0.Expression<T> Function(i1.$CedarEntitiesAnnotationComposer a) f) {
    final i1.$CedarEntitiesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fqn,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i1.CedarEntities>('cedar_entities'),
        getReferencedColumn: (t) => t.entityType,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i1.$CedarEntitiesAnnotationComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i1.CedarEntities>('cedar_entities'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CedarTypesTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CedarTypes,
    i1.CedarType,
    i1.$CedarTypesFilterComposer,
    i1.$CedarTypesOrderingComposer,
    i1.$CedarTypesAnnotationComposer,
    $CedarTypesCreateCompanionBuilder,
    $CedarTypesUpdateCompanionBuilder,
    (i1.CedarType, i1.$CedarTypesReferences),
    i1.CedarType,
    i0.PrefetchHooks Function({bool cedarEntitiesRefs})> {
  $CedarTypesTableManager(i0.GeneratedDatabase db, i1.CedarTypes table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CedarTypesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CedarTypesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CedarTypesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> fqn = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarTypesCompanion(
            fqn: fqn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String fqn,
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarTypesCompanion.insert(
            fqn: fqn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), i1.$CedarTypesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({cedarEntitiesRefs = false}) {
            return i0.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cedarEntitiesRefs)
                  i6.ReadDatabaseContainer(db)
                      .resultSet<i1.CedarEntities>('cedar_entities')
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cedarEntitiesRefs)
                    await i0.$_getPrefetchedData<i1.CedarType, i1.CedarTypes,
                            i1.CedarEntity>(
                        currentTable: table,
                        referencedTable: i1.$CedarTypesReferences
                            ._cedarEntitiesRefsTable(db),
                        managerFromTypedResult: (p0) => i1
                            .$CedarTypesReferences(db, table, p0)
                            .cedarEntitiesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.entityType == item.fqn),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $CedarTypesProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CedarTypes,
    i1.CedarType,
    i1.$CedarTypesFilterComposer,
    i1.$CedarTypesOrderingComposer,
    i1.$CedarTypesAnnotationComposer,
    $CedarTypesCreateCompanionBuilder,
    $CedarTypesUpdateCompanionBuilder,
    (i1.CedarType, i1.$CedarTypesReferences),
    i1.CedarType,
    i0.PrefetchHooks Function({bool cedarEntitiesRefs})>;
typedef $CedarEntitiesCreateCompanionBuilder = i1.CedarEntitiesCompanion
    Function({
  required String entityType,
  required String entityId,
  i0.Value<Map<String, i2.CedarValue>> attributeJson,
});
typedef $CedarEntitiesUpdateCompanionBuilder = i1.CedarEntitiesCompanion
    Function({
  i0.Value<String> entityType,
  i0.Value<String> entityId,
  i0.Value<Map<String, i2.CedarValue>> attributeJson,
});

final class $CedarEntitiesReferences extends i0
    .BaseReferences<i0.GeneratedDatabase, i1.CedarEntities, i1.CedarEntity> {
  $CedarEntitiesReferences(super.$_db, super.$_table, super.$_typedResult);

  static i1.CedarTypes _entityTypeTable(i0.GeneratedDatabase db) =>
      i6.ReadDatabaseContainer(db)
          .resultSet<i1.CedarTypes>('cedar_types')
          .createAlias(i0.$_aliasNameGenerator(
              i6.ReadDatabaseContainer(db)
                  .resultSet<i1.CedarEntities>('cedar_entities')
                  .entityType,
              i6.ReadDatabaseContainer(db)
                  .resultSet<i1.CedarTypes>('cedar_types')
                  .fqn));

  i1.$CedarTypesProcessedTableManager get entityType {
    final $_column = $_itemColumn<String>('entity_type')!;

    final manager = i1
        .$CedarTypesTableManager(
            $_db,
            i6.ReadDatabaseContainer($_db)
                .resultSet<i1.CedarTypes>('cedar_types'))
        .filter((f) => f.fqn.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entityTypeTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $CedarEntitiesFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarEntities> {
  $CedarEntitiesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<Map<String, i2.CedarValue>,
          Map<String, i2.CedarValue>, String>
      get attributeJson => $composableBuilder(
          column: $table.attributeJson,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnWithTypeConverterFilters<i3.EntityUid, i3.EntityUid, String>
      get entityJson => $composableBuilder(
          column: $table.entityJson,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i1.$CedarTypesFilterComposer get entityType {
    final i1.$CedarTypesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.entityType,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i1.CedarTypes>('cedar_types'),
        getReferencedColumn: (t) => t.fqn,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i1.$CedarTypesFilterComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i1.CedarTypes>('cedar_types'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CedarEntitiesOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarEntities> {
  $CedarEntitiesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get attributeJson => $composableBuilder(
      column: $table.attributeJson,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get entityJson => $composableBuilder(
      column: $table.entityJson,
      builder: (column) => i0.ColumnOrderings(column));

  i1.$CedarTypesOrderingComposer get entityType {
    final i1.$CedarTypesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.entityType,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i1.CedarTypes>('cedar_types'),
        getReferencedColumn: (t) => t.fqn,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i1.$CedarTypesOrderingComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i1.CedarTypes>('cedar_types'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CedarEntitiesAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarEntities> {
  $CedarEntitiesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<Map<String, i2.CedarValue>, String>
      get attributeJson => $composableBuilder(
          column: $table.attributeJson, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i3.EntityUid, String> get entityJson =>
      $composableBuilder(
          column: $table.entityJson, builder: (column) => column);

  i1.$CedarTypesAnnotationComposer get entityType {
    final i1.$CedarTypesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.entityType,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i1.CedarTypes>('cedar_types'),
        getReferencedColumn: (t) => t.fqn,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i1.$CedarTypesAnnotationComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i1.CedarTypes>('cedar_types'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CedarEntitiesTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CedarEntities,
    i1.CedarEntity,
    i1.$CedarEntitiesFilterComposer,
    i1.$CedarEntitiesOrderingComposer,
    i1.$CedarEntitiesAnnotationComposer,
    $CedarEntitiesCreateCompanionBuilder,
    $CedarEntitiesUpdateCompanionBuilder,
    (i1.CedarEntity, i1.$CedarEntitiesReferences),
    i1.CedarEntity,
    i0.PrefetchHooks Function({bool entityType})> {
  $CedarEntitiesTableManager(i0.GeneratedDatabase db, i1.CedarEntities table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CedarEntitiesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CedarEntitiesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CedarEntitiesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> entityType = const i0.Value.absent(),
            i0.Value<String> entityId = const i0.Value.absent(),
            i0.Value<Map<String, i2.CedarValue>> attributeJson =
                const i0.Value.absent(),
          }) =>
              i1.CedarEntitiesCompanion(
            entityType: entityType,
            entityId: entityId,
            attributeJson: attributeJson,
          ),
          createCompanionCallback: ({
            required String entityType,
            required String entityId,
            i0.Value<Map<String, i2.CedarValue>> attributeJson =
                const i0.Value.absent(),
          }) =>
              i1.CedarEntitiesCompanion.insert(
            entityType: entityType,
            entityId: entityId,
            attributeJson: attributeJson,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    i1.$CedarEntitiesReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({entityType = false}) {
            return i0.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends i0.TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (entityType) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.entityType,
                    referencedTable:
                        i1.$CedarEntitiesReferences._entityTypeTable(db),
                    referencedColumn:
                        i1.$CedarEntitiesReferences._entityTypeTable(db).fqn,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $CedarEntitiesProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CedarEntities,
    i1.CedarEntity,
    i1.$CedarEntitiesFilterComposer,
    i1.$CedarEntitiesOrderingComposer,
    i1.$CedarEntitiesAnnotationComposer,
    $CedarEntitiesCreateCompanionBuilder,
    $CedarEntitiesUpdateCompanionBuilder,
    (i1.CedarEntity, i1.$CedarEntitiesReferences),
    i1.CedarEntity,
    i0.PrefetchHooks Function({bool entityType})>;
typedef $CedarRelationshipsCreateCompanionBuilder
    = i1.CedarRelationshipsCompanion Function({
  required String entityType,
  required String entityId,
  required String parentType,
  required String parentId,
});
typedef $CedarRelationshipsUpdateCompanionBuilder
    = i1.CedarRelationshipsCompanion Function({
  i0.Value<String> entityType,
  i0.Value<String> entityId,
  i0.Value<String> parentType,
  i0.Value<String> parentId,
});

class $CedarRelationshipsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarRelationships> {
  $CedarRelationshipsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i3.EntityUid, i3.EntityUid, String>
      get entityJson => $composableBuilder(
          column: $table.entityJson,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get parentType => $composableBuilder(
      column: $table.parentType, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i3.EntityUid, i3.EntityUid, String>
      get parentJson => $composableBuilder(
          column: $table.parentJson,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));
}

class $CedarRelationshipsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarRelationships> {
  $CedarRelationshipsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get entityJson => $composableBuilder(
      column: $table.entityJson,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get parentType => $composableBuilder(
      column: $table.parentType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get parentJson => $composableBuilder(
      column: $table.parentJson,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CedarRelationshipsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarRelationships> {
  $CedarRelationshipsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  i0.GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i3.EntityUid, String> get entityJson =>
      $composableBuilder(
          column: $table.entityJson, builder: (column) => column);

  i0.GeneratedColumn<String> get parentType => $composableBuilder(
      column: $table.parentType, builder: (column) => column);

  i0.GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i3.EntityUid, String> get parentJson =>
      $composableBuilder(
          column: $table.parentJson, builder: (column) => column);
}

class $CedarRelationshipsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CedarRelationships,
    i1.CedarRelationship,
    i1.$CedarRelationshipsFilterComposer,
    i1.$CedarRelationshipsOrderingComposer,
    i1.$CedarRelationshipsAnnotationComposer,
    $CedarRelationshipsCreateCompanionBuilder,
    $CedarRelationshipsUpdateCompanionBuilder,
    (
      i1.CedarRelationship,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarRelationships,
          i1.CedarRelationship>
    ),
    i1.CedarRelationship,
    i0.PrefetchHooks Function()> {
  $CedarRelationshipsTableManager(
      i0.GeneratedDatabase db, i1.CedarRelationships table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CedarRelationshipsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CedarRelationshipsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CedarRelationshipsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> entityType = const i0.Value.absent(),
            i0.Value<String> entityId = const i0.Value.absent(),
            i0.Value<String> parentType = const i0.Value.absent(),
            i0.Value<String> parentId = const i0.Value.absent(),
          }) =>
              i1.CedarRelationshipsCompanion(
            entityType: entityType,
            entityId: entityId,
            parentType: parentType,
            parentId: parentId,
          ),
          createCompanionCallback: ({
            required String entityType,
            required String entityId,
            required String parentType,
            required String parentId,
          }) =>
              i1.CedarRelationshipsCompanion.insert(
            entityType: entityType,
            entityId: entityId,
            parentType: parentType,
            parentId: parentId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CedarRelationshipsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CedarRelationships,
    i1.CedarRelationship,
    i1.$CedarRelationshipsFilterComposer,
    i1.$CedarRelationshipsOrderingComposer,
    i1.$CedarRelationshipsAnnotationComposer,
    $CedarRelationshipsCreateCompanionBuilder,
    $CedarRelationshipsUpdateCompanionBuilder,
    (
      i1.CedarRelationship,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarRelationships,
          i1.CedarRelationship>
    ),
    i1.CedarRelationship,
    i0.PrefetchHooks Function()>;
typedef $CedarPoliciesCreateCompanionBuilder = i1.CedarPoliciesCompanion
    Function({
  required String id,
  required String policyId,
  required i4.Policy policy,
  i0.Value<int> enforcementLevel,
  i0.Value<int> rowid,
});
typedef $CedarPoliciesUpdateCompanionBuilder = i1.CedarPoliciesCompanion
    Function({
  i0.Value<String> id,
  i0.Value<String> policyId,
  i0.Value<i4.Policy> policy,
  i0.Value<int> enforcementLevel,
  i0.Value<int> rowid,
});

class $CedarPoliciesFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicies> {
  $CedarPoliciesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get policyId => $composableBuilder(
      column: $table.policyId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i4.Policy, i4.Policy, String> get policy =>
      $composableBuilder(
          column: $table.policy,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<int> get enforcementLevel => $composableBuilder(
      column: $table.enforcementLevel,
      builder: (column) => i0.ColumnFilters(column));
}

class $CedarPoliciesOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicies> {
  $CedarPoliciesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get policyId => $composableBuilder(
      column: $table.policyId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get policy => $composableBuilder(
      column: $table.policy, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get enforcementLevel => $composableBuilder(
      column: $table.enforcementLevel,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CedarPoliciesAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicies> {
  $CedarPoliciesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get policyId =>
      $composableBuilder(column: $table.policyId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i4.Policy, String> get policy =>
      $composableBuilder(column: $table.policy, builder: (column) => column);

  i0.GeneratedColumn<int> get enforcementLevel => $composableBuilder(
      column: $table.enforcementLevel, builder: (column) => column);
}

class $CedarPoliciesTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CedarPolicies,
    i1.CedarPolicy,
    i1.$CedarPoliciesFilterComposer,
    i1.$CedarPoliciesOrderingComposer,
    i1.$CedarPoliciesAnnotationComposer,
    $CedarPoliciesCreateCompanionBuilder,
    $CedarPoliciesUpdateCompanionBuilder,
    (
      i1.CedarPolicy,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarPolicies, i1.CedarPolicy>
    ),
    i1.CedarPolicy,
    i0.PrefetchHooks Function()> {
  $CedarPoliciesTableManager(i0.GeneratedDatabase db, i1.CedarPolicies table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CedarPoliciesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CedarPoliciesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CedarPoliciesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> id = const i0.Value.absent(),
            i0.Value<String> policyId = const i0.Value.absent(),
            i0.Value<i4.Policy> policy = const i0.Value.absent(),
            i0.Value<int> enforcementLevel = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarPoliciesCompanion(
            id: id,
            policyId: policyId,
            policy: policy,
            enforcementLevel: enforcementLevel,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String policyId,
            required i4.Policy policy,
            i0.Value<int> enforcementLevel = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarPoliciesCompanion.insert(
            id: id,
            policyId: policyId,
            policy: policy,
            enforcementLevel: enforcementLevel,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CedarPoliciesProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CedarPolicies,
    i1.CedarPolicy,
    i1.$CedarPoliciesFilterComposer,
    i1.$CedarPoliciesOrderingComposer,
    i1.$CedarPoliciesAnnotationComposer,
    $CedarPoliciesCreateCompanionBuilder,
    $CedarPoliciesUpdateCompanionBuilder,
    (
      i1.CedarPolicy,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarPolicies, i1.CedarPolicy>
    ),
    i1.CedarPolicy,
    i0.PrefetchHooks Function()>;
typedef $CedarPolicyTemplatesCreateCompanionBuilder
    = i1.CedarPolicyTemplatesCompanion Function({
  required String id,
  required String templateId,
  required i4.Policy template,
  i0.Value<int> rowid,
});
typedef $CedarPolicyTemplatesUpdateCompanionBuilder
    = i1.CedarPolicyTemplatesCompanion Function({
  i0.Value<String> id,
  i0.Value<String> templateId,
  i0.Value<i4.Policy> template,
  i0.Value<int> rowid,
});

class $CedarPolicyTemplatesFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicyTemplates> {
  $CedarPolicyTemplatesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i4.Policy, i4.Policy, String>
      get template => $composableBuilder(
          column: $table.template,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));
}

class $CedarPolicyTemplatesOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicyTemplates> {
  $CedarPolicyTemplatesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get templateId => $composableBuilder(
      column: $table.templateId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get template => $composableBuilder(
      column: $table.template, builder: (column) => i0.ColumnOrderings(column));
}

class $CedarPolicyTemplatesAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicyTemplates> {
  $CedarPolicyTemplatesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i4.Policy, String> get template =>
      $composableBuilder(column: $table.template, builder: (column) => column);
}

class $CedarPolicyTemplatesTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CedarPolicyTemplates,
    i1.CedarPolicyTemplate,
    i1.$CedarPolicyTemplatesFilterComposer,
    i1.$CedarPolicyTemplatesOrderingComposer,
    i1.$CedarPolicyTemplatesAnnotationComposer,
    $CedarPolicyTemplatesCreateCompanionBuilder,
    $CedarPolicyTemplatesUpdateCompanionBuilder,
    (
      i1.CedarPolicyTemplate,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarPolicyTemplates,
          i1.CedarPolicyTemplate>
    ),
    i1.CedarPolicyTemplate,
    i0.PrefetchHooks Function()> {
  $CedarPolicyTemplatesTableManager(
      i0.GeneratedDatabase db, i1.CedarPolicyTemplates table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CedarPolicyTemplatesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CedarPolicyTemplatesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => i1
              .$CedarPolicyTemplatesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> id = const i0.Value.absent(),
            i0.Value<String> templateId = const i0.Value.absent(),
            i0.Value<i4.Policy> template = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarPolicyTemplatesCompanion(
            id: id,
            templateId: templateId,
            template: template,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String templateId,
            required i4.Policy template,
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarPolicyTemplatesCompanion.insert(
            id: id,
            templateId: templateId,
            template: template,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CedarPolicyTemplatesProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CedarPolicyTemplates,
    i1.CedarPolicyTemplate,
    i1.$CedarPolicyTemplatesFilterComposer,
    i1.$CedarPolicyTemplatesOrderingComposer,
    i1.$CedarPolicyTemplatesAnnotationComposer,
    $CedarPolicyTemplatesCreateCompanionBuilder,
    $CedarPolicyTemplatesUpdateCompanionBuilder,
    (
      i1.CedarPolicyTemplate,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarPolicyTemplates,
          i1.CedarPolicyTemplate>
    ),
    i1.CedarPolicyTemplate,
    i0.PrefetchHooks Function()>;
typedef $CedarPolicyTemplateLinksCreateCompanionBuilder
    = i1.CedarPolicyTemplateLinksCompanion Function({
  required String id,
  required String policyId,
  required String templateId,
  i0.Value<String?> principalType,
  i0.Value<String?> principalId,
  i0.Value<String?> resourceType,
  i0.Value<String?> resourceId,
  i0.Value<int> enforcementLevel,
  i0.Value<int> rowid,
});
typedef $CedarPolicyTemplateLinksUpdateCompanionBuilder
    = i1.CedarPolicyTemplateLinksCompanion Function({
  i0.Value<String> id,
  i0.Value<String> policyId,
  i0.Value<String> templateId,
  i0.Value<String?> principalType,
  i0.Value<String?> principalId,
  i0.Value<String?> resourceType,
  i0.Value<String?> resourceId,
  i0.Value<int> enforcementLevel,
  i0.Value<int> rowid,
});

class $CedarPolicyTemplateLinksFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicyTemplateLinks> {
  $CedarPolicyTemplateLinksFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get policyId => $composableBuilder(
      column: $table.policyId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get principalType => $composableBuilder(
      column: $table.principalType,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get principalId => $composableBuilder(
      column: $table.principalId,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get enforcementLevel => $composableBuilder(
      column: $table.enforcementLevel,
      builder: (column) => i0.ColumnFilters(column));
}

class $CedarPolicyTemplateLinksOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicyTemplateLinks> {
  $CedarPolicyTemplateLinksOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get policyId => $composableBuilder(
      column: $table.policyId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get templateId => $composableBuilder(
      column: $table.templateId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get principalType => $composableBuilder(
      column: $table.principalType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get principalId => $composableBuilder(
      column: $table.principalId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get resourceId => $composableBuilder(
      column: $table.resourceId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get enforcementLevel => $composableBuilder(
      column: $table.enforcementLevel,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CedarPolicyTemplateLinksAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarPolicyTemplateLinks> {
  $CedarPolicyTemplateLinksAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get policyId =>
      $composableBuilder(column: $table.policyId, builder: (column) => column);

  i0.GeneratedColumn<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => column);

  i0.GeneratedColumn<String> get principalType => $composableBuilder(
      column: $table.principalType, builder: (column) => column);

  i0.GeneratedColumn<String> get principalId => $composableBuilder(
      column: $table.principalId, builder: (column) => column);

  i0.GeneratedColumn<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => column);

  i0.GeneratedColumn<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => column);

  i0.GeneratedColumn<int> get enforcementLevel => $composableBuilder(
      column: $table.enforcementLevel, builder: (column) => column);
}

class $CedarPolicyTemplateLinksTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CedarPolicyTemplateLinks,
    i1.CedarPolicyTemplateLink,
    i1.$CedarPolicyTemplateLinksFilterComposer,
    i1.$CedarPolicyTemplateLinksOrderingComposer,
    i1.$CedarPolicyTemplateLinksAnnotationComposer,
    $CedarPolicyTemplateLinksCreateCompanionBuilder,
    $CedarPolicyTemplateLinksUpdateCompanionBuilder,
    (
      i1.CedarPolicyTemplateLink,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarPolicyTemplateLinks,
          i1.CedarPolicyTemplateLink>
    ),
    i1.CedarPolicyTemplateLink,
    i0.PrefetchHooks Function()> {
  $CedarPolicyTemplateLinksTableManager(
      i0.GeneratedDatabase db, i1.CedarPolicyTemplateLinks table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => i1
              .$CedarPolicyTemplateLinksFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$CedarPolicyTemplateLinksOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CedarPolicyTemplateLinksAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> id = const i0.Value.absent(),
            i0.Value<String> policyId = const i0.Value.absent(),
            i0.Value<String> templateId = const i0.Value.absent(),
            i0.Value<String?> principalType = const i0.Value.absent(),
            i0.Value<String?> principalId = const i0.Value.absent(),
            i0.Value<String?> resourceType = const i0.Value.absent(),
            i0.Value<String?> resourceId = const i0.Value.absent(),
            i0.Value<int> enforcementLevel = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarPolicyTemplateLinksCompanion(
            id: id,
            policyId: policyId,
            templateId: templateId,
            principalType: principalType,
            principalId: principalId,
            resourceType: resourceType,
            resourceId: resourceId,
            enforcementLevel: enforcementLevel,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String policyId,
            required String templateId,
            i0.Value<String?> principalType = const i0.Value.absent(),
            i0.Value<String?> principalId = const i0.Value.absent(),
            i0.Value<String?> resourceType = const i0.Value.absent(),
            i0.Value<String?> resourceId = const i0.Value.absent(),
            i0.Value<int> enforcementLevel = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CedarPolicyTemplateLinksCompanion.insert(
            id: id,
            policyId: policyId,
            templateId: templateId,
            principalType: principalType,
            principalId: principalId,
            resourceType: resourceType,
            resourceId: resourceId,
            enforcementLevel: enforcementLevel,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CedarPolicyTemplateLinksProcessedTableManager
    = i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i1.CedarPolicyTemplateLinks,
        i1.CedarPolicyTemplateLink,
        i1.$CedarPolicyTemplateLinksFilterComposer,
        i1.$CedarPolicyTemplateLinksOrderingComposer,
        i1.$CedarPolicyTemplateLinksAnnotationComposer,
        $CedarPolicyTemplateLinksCreateCompanionBuilder,
        $CedarPolicyTemplateLinksUpdateCompanionBuilder,
        (
          i1.CedarPolicyTemplateLink,
          i0.BaseReferences<i0.GeneratedDatabase, i1.CedarPolicyTemplateLinks,
              i1.CedarPolicyTemplateLink>
        ),
        i1.CedarPolicyTemplateLink,
        i0.PrefetchHooks Function()>;
typedef $CedarAuthorizationLogsCreateCompanionBuilder
    = i1.CedarAuthorizationLogsCompanion Function({
  i0.Value<int> rowid,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> expireTime,
  i0.Value<String?> principalType,
  i0.Value<String?> principalId,
  i0.Value<String?> actionType,
  i0.Value<String?> actionId,
  i0.Value<String?> resourceType,
  i0.Value<String?> resourceId,
  i0.Value<Map<String, i2.CedarValue>> contextJson,
  required bool decision,
  i0.Value<List<String>> reasonsJson,
  i0.Value<i5.AuthorizationErrors> errorsJson,
});
typedef $CedarAuthorizationLogsUpdateCompanionBuilder
    = i1.CedarAuthorizationLogsCompanion Function({
  i0.Value<int> rowid,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> expireTime,
  i0.Value<String?> principalType,
  i0.Value<String?> principalId,
  i0.Value<String?> actionType,
  i0.Value<String?> actionId,
  i0.Value<String?> resourceType,
  i0.Value<String?> resourceId,
  i0.Value<Map<String, i2.CedarValue>> contextJson,
  i0.Value<bool> decision,
  i0.Value<List<String>> reasonsJson,
  i0.Value<i5.AuthorizationErrors> errorsJson,
});

class $CedarAuthorizationLogsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarAuthorizationLogs> {
  $CedarAuthorizationLogsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get rowid => $composableBuilder(
      column: $table.rowid, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get principalType => $composableBuilder(
      column: $table.principalType,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get principalId => $composableBuilder(
      column: $table.principalId,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get actionId => $composableBuilder(
      column: $table.actionId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<Map<String, i2.CedarValue>,
          Map<String, i2.CedarValue>, String>
      get contextJson => $composableBuilder(
          column: $table.contextJson,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<bool> get decision => $composableBuilder(
      column: $table.decision, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get reasonsJson => $composableBuilder(
          column: $table.reasonsJson,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnWithTypeConverterFilters<i5.AuthorizationErrors,
          i5.AuthorizationErrors, String>
      get errorsJson => $composableBuilder(
          column: $table.errorsJson,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));
}

class $CedarAuthorizationLogsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarAuthorizationLogs> {
  $CedarAuthorizationLogsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get rowid => $composableBuilder(
      column: $table.rowid, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get createTime => $composableBuilder(
      column: $table.createTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get principalType => $composableBuilder(
      column: $table.principalType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get principalId => $composableBuilder(
      column: $table.principalId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get actionType => $composableBuilder(
      column: $table.actionType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get actionId => $composableBuilder(
      column: $table.actionId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get resourceId => $composableBuilder(
      column: $table.resourceId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get contextJson => $composableBuilder(
      column: $table.contextJson,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<bool> get decision => $composableBuilder(
      column: $table.decision, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get reasonsJson => $composableBuilder(
      column: $table.reasonsJson,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get errorsJson => $composableBuilder(
      column: $table.errorsJson,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CedarAuthorizationLogsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.CedarAuthorizationLogs> {
  $CedarAuthorizationLogsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get rowid =>
      $composableBuilder(column: $table.rowid, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime, builder: (column) => column);

  i0.GeneratedColumn<String> get principalType => $composableBuilder(
      column: $table.principalType, builder: (column) => column);

  i0.GeneratedColumn<String> get principalId => $composableBuilder(
      column: $table.principalId, builder: (column) => column);

  i0.GeneratedColumn<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => column);

  i0.GeneratedColumn<String> get actionId =>
      $composableBuilder(column: $table.actionId, builder: (column) => column);

  i0.GeneratedColumn<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => column);

  i0.GeneratedColumn<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<Map<String, i2.CedarValue>, String>
      get contextJson => $composableBuilder(
          column: $table.contextJson, builder: (column) => column);

  i0.GeneratedColumn<bool> get decision =>
      $composableBuilder(column: $table.decision, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<List<String>, String> get reasonsJson =>
      $composableBuilder(
          column: $table.reasonsJson, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i5.AuthorizationErrors, String>
      get errorsJson => $composableBuilder(
          column: $table.errorsJson, builder: (column) => column);
}

class $CedarAuthorizationLogsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CedarAuthorizationLogs,
    i1.CedarAuthorizationLog,
    i1.$CedarAuthorizationLogsFilterComposer,
    i1.$CedarAuthorizationLogsOrderingComposer,
    i1.$CedarAuthorizationLogsAnnotationComposer,
    $CedarAuthorizationLogsCreateCompanionBuilder,
    $CedarAuthorizationLogsUpdateCompanionBuilder,
    (
      i1.CedarAuthorizationLog,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarAuthorizationLogs,
          i1.CedarAuthorizationLog>
    ),
    i1.CedarAuthorizationLog,
    i0.PrefetchHooks Function()> {
  $CedarAuthorizationLogsTableManager(
      i0.GeneratedDatabase db, i1.CedarAuthorizationLogs table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$CedarAuthorizationLogsFilterComposer($db: db, $table: table),
          createOrderingComposer: () => i1
              .$CedarAuthorizationLogsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$CedarAuthorizationLogsAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> rowid = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> expireTime = const i0.Value.absent(),
            i0.Value<String?> principalType = const i0.Value.absent(),
            i0.Value<String?> principalId = const i0.Value.absent(),
            i0.Value<String?> actionType = const i0.Value.absent(),
            i0.Value<String?> actionId = const i0.Value.absent(),
            i0.Value<String?> resourceType = const i0.Value.absent(),
            i0.Value<String?> resourceId = const i0.Value.absent(),
            i0.Value<Map<String, i2.CedarValue>> contextJson =
                const i0.Value.absent(),
            i0.Value<bool> decision = const i0.Value.absent(),
            i0.Value<List<String>> reasonsJson = const i0.Value.absent(),
            i0.Value<i5.AuthorizationErrors> errorsJson =
                const i0.Value.absent(),
          }) =>
              i1.CedarAuthorizationLogsCompanion(
            rowid: rowid,
            createTime: createTime,
            expireTime: expireTime,
            principalType: principalType,
            principalId: principalId,
            actionType: actionType,
            actionId: actionId,
            resourceType: resourceType,
            resourceId: resourceId,
            contextJson: contextJson,
            decision: decision,
            reasonsJson: reasonsJson,
            errorsJson: errorsJson,
          ),
          createCompanionCallback: ({
            i0.Value<int> rowid = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> expireTime = const i0.Value.absent(),
            i0.Value<String?> principalType = const i0.Value.absent(),
            i0.Value<String?> principalId = const i0.Value.absent(),
            i0.Value<String?> actionType = const i0.Value.absent(),
            i0.Value<String?> actionId = const i0.Value.absent(),
            i0.Value<String?> resourceType = const i0.Value.absent(),
            i0.Value<String?> resourceId = const i0.Value.absent(),
            i0.Value<Map<String, i2.CedarValue>> contextJson =
                const i0.Value.absent(),
            required bool decision,
            i0.Value<List<String>> reasonsJson = const i0.Value.absent(),
            i0.Value<i5.AuthorizationErrors> errorsJson =
                const i0.Value.absent(),
          }) =>
              i1.CedarAuthorizationLogsCompanion.insert(
            rowid: rowid,
            createTime: createTime,
            expireTime: expireTime,
            principalType: principalType,
            principalId: principalId,
            actionType: actionType,
            actionId: actionId,
            resourceType: resourceType,
            resourceId: resourceId,
            contextJson: contextJson,
            decision: decision,
            reasonsJson: reasonsJson,
            errorsJson: errorsJson,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CedarAuthorizationLogsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CedarAuthorizationLogs,
    i1.CedarAuthorizationLog,
    i1.$CedarAuthorizationLogsFilterComposer,
    i1.$CedarAuthorizationLogsOrderingComposer,
    i1.$CedarAuthorizationLogsAnnotationComposer,
    $CedarAuthorizationLogsCreateCompanionBuilder,
    $CedarAuthorizationLogsUpdateCompanionBuilder,
    (
      i1.CedarAuthorizationLog,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CedarAuthorizationLogs,
          i1.CedarAuthorizationLog>
    ),
    i1.CedarAuthorizationLog,
    i0.PrefetchHooks Function()>;

class CedarTypes extends i0.Table with i0.TableInfo<CedarTypes, i1.CedarType> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarTypes(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> fqn = i0.GeneratedColumn<String>(
      'fqn', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  @override
  List<i0.GeneratedColumn> get $columns => [fqn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_types';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {fqn};
  @override
  i1.CedarType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CedarType(
      fqn: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}fqn'])!,
    );
  }

  @override
  CedarTypes createAlias(String alias) {
    return CedarTypes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CedarType extends i0.DataClass implements i0.Insertable<i1.CedarType> {
  /// The fully qualified Cedar type, e.g. Celest::Organization
  final String fqn;
  const CedarType({required this.fqn});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['fqn'] = i0.Variable<String>(fqn);
    return map;
  }

  factory CedarType.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CedarType(
      fqn: serializer.fromJson<String>(json['fqn']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fqn': serializer.toJson<String>(fqn),
    };
  }

  i1.CedarType copyWith({String? fqn}) => i1.CedarType(
        fqn: fqn ?? this.fqn,
      );
  CedarType copyWithCompanion(i1.CedarTypesCompanion data) {
    return CedarType(
      fqn: data.fqn.present ? data.fqn.value : this.fqn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarType(')
          ..write('fqn: $fqn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => fqn.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CedarType && other.fqn == this.fqn);
}

class CedarTypesCompanion extends i0.UpdateCompanion<i1.CedarType> {
  final i0.Value<String> fqn;
  final i0.Value<int> rowid;
  const CedarTypesCompanion({
    this.fqn = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CedarTypesCompanion.insert({
    required String fqn,
    this.rowid = const i0.Value.absent(),
  }) : fqn = i0.Value(fqn);
  static i0.Insertable<i1.CedarType> custom({
    i0.Expression<String>? fqn,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (fqn != null) 'fqn': fqn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CedarTypesCompanion copyWith(
      {i0.Value<String>? fqn, i0.Value<int>? rowid}) {
    return i1.CedarTypesCompanion(
      fqn: fqn ?? this.fqn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (fqn.present) {
      map['fqn'] = i0.Variable<String>(fqn.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarTypesCompanion(')
          ..write('fqn: $fqn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarEntities extends i0.Table
    with i0.TableInfo<CedarEntities, i1.CedarEntity> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarEntities(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> entityType = i0.GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES cedar_types(fqn)');
  late final i0.GeneratedColumn<String> entityId = i0.GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0
      .GeneratedColumnWithTypeConverter<Map<String, i2.CedarValue>, String>
      attributeJson = i0.GeneratedColumn<String>(
              'attribute_json', aliasedName, false,
              type: i0.DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'{}\'',
              defaultValue: const i0.CustomExpression('\'{}\''))
          .withConverter<Map<String, i2.CedarValue>>(
              i1.CedarEntities.$converterattributeJson);
  late final i0.GeneratedColumnWithTypeConverter<i3.EntityUid,
      String> entityJson = i0.GeneratedColumn<String>(
          'entity_json', aliasedName, false,
          generatedAs: i0.GeneratedAs(
              const i0.CustomExpression(
                  'json_object(\'type\', entity_type, \'id\', entity_id)'),
              false),
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', entity_type, \'id\', entity_id)) VIRTUAL')
      .withConverter<i3.EntityUid>(i1.CedarEntities.$converterentityJson);
  @override
  List<i0.GeneratedColumn> get $columns =>
      [entityType, entityId, attributeJson, entityJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_entities';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {entityType, entityId};
  @override
  i1.CedarEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CedarEntity(
      entityType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      attributeJson: i1.CedarEntities.$converterattributeJson.fromSql(
          attachedDatabase.typeMapping.read(i0.DriftSqlType.string,
              data['${effectivePrefix}attribute_json'])!),
      entityJson: i1.CedarEntities.$converterentityJson.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}entity_json'])!),
    );
  }

  @override
  CedarEntities createAlias(String alias) {
    return CedarEntities(attachedDatabase, alias);
  }

  static i0.TypeConverter<Map<String, i2.CedarValue>, String>
      $converterattributeJson = const i2.CedarAttributesConverter();
  static i0.TypeConverter<i3.EntityUid, String> $converterentityJson =
      const i2.CedarEntityUidConverter();
  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT cedar_entities_pk PRIMARY KEY(entity_type, entity_id)ON CONFLICT IGNORE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarEntity extends i0.DataClass
    implements i0.Insertable<i1.CedarEntity> {
  /// A reference to the Cedar type of the entity.
  final String entityType;

  /// The unique identifier of the entity.
  final String entityId;

  /// The attributes of the entity.
  ///
  /// These should only be static attributes that are needed for authorization decisions.
  final Map<String, i2.CedarValue> attributeJson;

  /// A JSON representation of the entity.
  final i3.EntityUid entityJson;
  const CedarEntity(
      {required this.entityType,
      required this.entityId,
      required this.attributeJson,
      required this.entityJson});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['entity_type'] = i0.Variable<String>(entityType);
    map['entity_id'] = i0.Variable<String>(entityId);
    {
      map['attribute_json'] = i0.Variable<String>(
          i1.CedarEntities.$converterattributeJson.toSql(attributeJson));
    }
    return map;
  }

  factory CedarEntity.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CedarEntity(
      entityType: serializer.fromJson<String>(json['entity_type']),
      entityId: serializer.fromJson<String>(json['entity_id']),
      attributeJson: serializer
          .fromJson<Map<String, i2.CedarValue>>(json['attribute_json']),
      entityJson: serializer.fromJson<i3.EntityUid>(json['entity_json']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entity_type': serializer.toJson<String>(entityType),
      'entity_id': serializer.toJson<String>(entityId),
      'attribute_json':
          serializer.toJson<Map<String, i2.CedarValue>>(attributeJson),
      'entity_json': serializer.toJson<i3.EntityUid>(entityJson),
    };
  }

  i1.CedarEntity copyWith(
          {String? entityType,
          String? entityId,
          Map<String, i2.CedarValue>? attributeJson,
          i3.EntityUid? entityJson}) =>
      i1.CedarEntity(
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        attributeJson: attributeJson ?? this.attributeJson,
        entityJson: entityJson ?? this.entityJson,
      );
  @override
  String toString() {
    return (StringBuffer('CedarEntity(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('attributeJson: $attributeJson, ')
          ..write('entityJson: $entityJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(entityType, entityId, attributeJson, entityJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CedarEntity &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.attributeJson == this.attributeJson &&
          other.entityJson == this.entityJson);
}

class CedarEntitiesCompanion extends i0.UpdateCompanion<i1.CedarEntity> {
  final i0.Value<String> entityType;
  final i0.Value<String> entityId;
  final i0.Value<Map<String, i2.CedarValue>> attributeJson;
  const CedarEntitiesCompanion({
    this.entityType = const i0.Value.absent(),
    this.entityId = const i0.Value.absent(),
    this.attributeJson = const i0.Value.absent(),
  });
  CedarEntitiesCompanion.insert({
    required String entityType,
    required String entityId,
    this.attributeJson = const i0.Value.absent(),
  })  : entityType = i0.Value(entityType),
        entityId = i0.Value(entityId);
  static i0.Insertable<i1.CedarEntity> custom({
    i0.Expression<String>? entityType,
    i0.Expression<String>? entityId,
    i0.Expression<String>? attributeJson,
  }) {
    return i0.RawValuesInsertable({
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (attributeJson != null) 'attribute_json': attributeJson,
    });
  }

  i1.CedarEntitiesCompanion copyWith(
      {i0.Value<String>? entityType,
      i0.Value<String>? entityId,
      i0.Value<Map<String, i2.CedarValue>>? attributeJson}) {
    return i1.CedarEntitiesCompanion(
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      attributeJson: attributeJson ?? this.attributeJson,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (entityType.present) {
      map['entity_type'] = i0.Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = i0.Variable<String>(entityId.value);
    }
    if (attributeJson.present) {
      map['attribute_json'] = i0.Variable<String>(
          i1.CedarEntities.$converterattributeJson.toSql(attributeJson.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarEntitiesCompanion(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('attributeJson: $attributeJson')
          ..write(')'))
        .toString();
  }
}

class CedarRelationships extends i0.Table
    with i0.TableInfo<CedarRelationships, i1.CedarRelationship> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarRelationships(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> entityType = i0.GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> entityId = i0.GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumnWithTypeConverter<i3.EntityUid,
      String> entityJson = i0.GeneratedColumn<String>(
          'entity_json', aliasedName, false,
          generatedAs: i0.GeneratedAs(
              const i0.CustomExpression(
                  'json_object(\'type\', entity_type, \'id\', entity_id)'),
              false),
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', entity_type, \'id\', entity_id)) VIRTUAL')
      .withConverter<i3.EntityUid>(i1.CedarRelationships.$converterentityJson);
  late final i0.GeneratedColumn<String> parentType = i0.GeneratedColumn<String>(
      'parent_type', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> parentId = i0.GeneratedColumn<String>(
      'parent_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumnWithTypeConverter<i3.EntityUid,
      String> parentJson = i0.GeneratedColumn<String>(
          'parent_json', aliasedName, false,
          generatedAs: i0.GeneratedAs(
              const i0.CustomExpression(
                  'json_object(\'type\', parent_type, \'id\', parent_id)'),
              false),
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL GENERATED ALWAYS AS (json_object(\'type\', parent_type, \'id\', parent_id)) VIRTUAL')
      .withConverter<i3.EntityUid>(i1.CedarRelationships.$converterparentJson);
  @override
  List<i0.GeneratedColumn> get $columns =>
      [entityType, entityId, entityJson, parentType, parentId, parentJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_relationships';
  @override
  Set<i0.GeneratedColumn> get $primaryKey =>
      {entityType, entityId, parentType, parentId};
  @override
  i1.CedarRelationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CedarRelationship(
      entityType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      entityJson: i1.CedarRelationships.$converterentityJson.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}entity_json'])!),
      parentType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}parent_type'])!,
      parentId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}parent_id'])!,
      parentJson: i1.CedarRelationships.$converterparentJson.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}parent_json'])!),
    );
  }

  @override
  CedarRelationships createAlias(String alias) {
    return CedarRelationships(attachedDatabase, alias);
  }

  static i0.TypeConverter<i3.EntityUid, String> $converterentityJson =
      const i2.CedarEntityUidConverter();
  static i0.TypeConverter<i3.EntityUid, String> $converterparentJson =
      const i2.CedarEntityUidConverter();
  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT cedar_relationships_pk PRIMARY KEY(entity_type, entity_id, parent_type, parent_id)ON CONFLICT IGNORE',
        'CONSTRAINT cedar_relationships_fk_entity FOREIGN KEY(entity_type, entity_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE',
        'CONSTRAINT cedar_relationships_fk_parent FOREIGN KEY(parent_type, parent_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarRelationship extends i0.DataClass
    implements i0.Insertable<i1.CedarRelationship> {
  /// The entity (child) of the relationship.
  final String entityType;
  final String entityId;
  final i3.EntityUid entityJson;

  /// The parent (ancestor) of the relationship.
  final String parentType;
  final String parentId;
  final i3.EntityUid parentJson;
  const CedarRelationship(
      {required this.entityType,
      required this.entityId,
      required this.entityJson,
      required this.parentType,
      required this.parentId,
      required this.parentJson});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['entity_type'] = i0.Variable<String>(entityType);
    map['entity_id'] = i0.Variable<String>(entityId);
    map['parent_type'] = i0.Variable<String>(parentType);
    map['parent_id'] = i0.Variable<String>(parentId);
    return map;
  }

  factory CedarRelationship.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CedarRelationship(
      entityType: serializer.fromJson<String>(json['entity_type']),
      entityId: serializer.fromJson<String>(json['entity_id']),
      entityJson: serializer.fromJson<i3.EntityUid>(json['entity_json']),
      parentType: serializer.fromJson<String>(json['parent_type']),
      parentId: serializer.fromJson<String>(json['parent_id']),
      parentJson: serializer.fromJson<i3.EntityUid>(json['parent_json']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entity_type': serializer.toJson<String>(entityType),
      'entity_id': serializer.toJson<String>(entityId),
      'entity_json': serializer.toJson<i3.EntityUid>(entityJson),
      'parent_type': serializer.toJson<String>(parentType),
      'parent_id': serializer.toJson<String>(parentId),
      'parent_json': serializer.toJson<i3.EntityUid>(parentJson),
    };
  }

  i1.CedarRelationship copyWith(
          {String? entityType,
          String? entityId,
          i3.EntityUid? entityJson,
          String? parentType,
          String? parentId,
          i3.EntityUid? parentJson}) =>
      i1.CedarRelationship(
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        entityJson: entityJson ?? this.entityJson,
        parentType: parentType ?? this.parentType,
        parentId: parentId ?? this.parentId,
        parentJson: parentJson ?? this.parentJson,
      );
  @override
  String toString() {
    return (StringBuffer('CedarRelationship(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('entityJson: $entityJson, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('parentJson: $parentJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      entityType, entityId, entityJson, parentType, parentId, parentJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CedarRelationship &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.entityJson == this.entityJson &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.parentJson == this.parentJson);
}

class CedarRelationshipsCompanion
    extends i0.UpdateCompanion<i1.CedarRelationship> {
  final i0.Value<String> entityType;
  final i0.Value<String> entityId;
  final i0.Value<String> parentType;
  final i0.Value<String> parentId;
  const CedarRelationshipsCompanion({
    this.entityType = const i0.Value.absent(),
    this.entityId = const i0.Value.absent(),
    this.parentType = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
  });
  CedarRelationshipsCompanion.insert({
    required String entityType,
    required String entityId,
    required String parentType,
    required String parentId,
  })  : entityType = i0.Value(entityType),
        entityId = i0.Value(entityId),
        parentType = i0.Value(parentType),
        parentId = i0.Value(parentId);
  static i0.Insertable<i1.CedarRelationship> custom({
    i0.Expression<String>? entityType,
    i0.Expression<String>? entityId,
    i0.Expression<String>? parentType,
    i0.Expression<String>? parentId,
  }) {
    return i0.RawValuesInsertable({
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  i1.CedarRelationshipsCompanion copyWith(
      {i0.Value<String>? entityType,
      i0.Value<String>? entityId,
      i0.Value<String>? parentType,
      i0.Value<String>? parentId}) {
    return i1.CedarRelationshipsCompanion(
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (entityType.present) {
      map['entity_type'] = i0.Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = i0.Variable<String>(entityId.value);
    }
    if (parentType.present) {
      map['parent_type'] = i0.Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = i0.Variable<String>(parentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarRelationshipsCompanion(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }
}

i0.Index get cedarRelationshipsFkEntityIdx => i0.Index(
    'cedar_relationships_fk_entity_idx',
    'CREATE INDEX IF NOT EXISTS cedar_relationships_fk_entity_idx ON cedar_relationships (entity_type, entity_id)');
i0.Index get cedarRelationshipsFkParentIdx => i0.Index(
    'cedar_relationships_fk_parent_idx',
    'CREATE INDEX IF NOT EXISTS cedar_relationships_fk_parent_idx ON cedar_relationships (parent_type, parent_id)');

class CedarPolicies extends i0.Table
    with i0.TableInfo<CedarPolicies, i1.CedarPolicy> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarPolicies(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> id = i0.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> policyId = i0.GeneratedColumn<String>(
      'policy_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final i0.GeneratedColumnWithTypeConverter<i4.Policy, String> policy =
      i0.GeneratedColumn<String>('policy', aliasedName, false,
              type: i0.DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<i4.Policy>(i1.CedarPolicies.$converterpolicy);
  late final i0.GeneratedColumn<int> enforcementLevel = i0.GeneratedColumn<int>(
      'enforcement_level', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const i0.CustomExpression('1'));
  @override
  List<i0.GeneratedColumn> get $columns =>
      [id, policyId, policy, enforcementLevel];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_policies';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.CedarPolicy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CedarPolicy(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}id'])!,
      policyId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}policy_id'])!,
      policy: i1.CedarPolicies.$converterpolicy.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}policy'])!),
      enforcementLevel: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}enforcement_level'])!,
    );
  }

  @override
  CedarPolicies createAlias(String alias) {
    return CedarPolicies(attachedDatabase, alias);
  }

  static i0.TypeConverter<i4.Policy, String> $converterpolicy =
      const i2.CedarPolicyConverter();
  @override
  List<String> get customConstraints =>
      const ['CHECK(enforcement_level IN (0, 1))'];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPolicy extends i0.DataClass
    implements i0.Insertable<i1.CedarPolicy> {
  /// Immutable. The unique identifier for the policy.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: pol_<typeid>
  final String id;

  /// The primary alias for the policy, mapping to the `@id` annotation.
  ///
  /// While Cedar does not require policies to have IDs, we enforce their usage to improve
  /// auditability and debuggability.
  final String policyId;

  /// The policy in JSON format.
  ///
  /// Type: JSON[package:cedar/cedar.dart#Policy]
  final i4.Policy policy;

  /// The policy's enforcement level.
  ///
  /// Dry-run policies are captured in the audit log but do not affect presentation of the
  /// authorization decision.
  ///
  /// Type: integer (enforced=1, dry-run=0)
  final int enforcementLevel;
  const CedarPolicy(
      {required this.id,
      required this.policyId,
      required this.policy,
      required this.enforcementLevel});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    map['policy_id'] = i0.Variable<String>(policyId);
    {
      map['policy'] =
          i0.Variable<String>(i1.CedarPolicies.$converterpolicy.toSql(policy));
    }
    map['enforcement_level'] = i0.Variable<int>(enforcementLevel);
    return map;
  }

  factory CedarPolicy.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CedarPolicy(
      id: serializer.fromJson<String>(json['id']),
      policyId: serializer.fromJson<String>(json['policy_id']),
      policy: serializer.fromJson<i4.Policy>(json['policy']),
      enforcementLevel: serializer.fromJson<int>(json['enforcement_level']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'policy_id': serializer.toJson<String>(policyId),
      'policy': serializer.toJson<i4.Policy>(policy),
      'enforcement_level': serializer.toJson<int>(enforcementLevel),
    };
  }

  i1.CedarPolicy copyWith(
          {String? id,
          String? policyId,
          i4.Policy? policy,
          int? enforcementLevel}) =>
      i1.CedarPolicy(
        id: id ?? this.id,
        policyId: policyId ?? this.policyId,
        policy: policy ?? this.policy,
        enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      );
  CedarPolicy copyWithCompanion(i1.CedarPoliciesCompanion data) {
    return CedarPolicy(
      id: data.id.present ? data.id.value : this.id,
      policyId: data.policyId.present ? data.policyId.value : this.policyId,
      policy: data.policy.present ? data.policy.value : this.policy,
      enforcementLevel: data.enforcementLevel.present
          ? data.enforcementLevel.value
          : this.enforcementLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicy(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('policy: $policy, ')
          ..write('enforcementLevel: $enforcementLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, policyId, policy, enforcementLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CedarPolicy &&
          other.id == this.id &&
          other.policyId == this.policyId &&
          other.policy == this.policy &&
          other.enforcementLevel == this.enforcementLevel);
}

class CedarPoliciesCompanion extends i0.UpdateCompanion<i1.CedarPolicy> {
  final i0.Value<String> id;
  final i0.Value<String> policyId;
  final i0.Value<i4.Policy> policy;
  final i0.Value<int> enforcementLevel;
  final i0.Value<int> rowid;
  const CedarPoliciesCompanion({
    this.id = const i0.Value.absent(),
    this.policyId = const i0.Value.absent(),
    this.policy = const i0.Value.absent(),
    this.enforcementLevel = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CedarPoliciesCompanion.insert({
    required String id,
    required String policyId,
    required i4.Policy policy,
    this.enforcementLevel = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : id = i0.Value(id),
        policyId = i0.Value(policyId),
        policy = i0.Value(policy);
  static i0.Insertable<i1.CedarPolicy> custom({
    i0.Expression<String>? id,
    i0.Expression<String>? policyId,
    i0.Expression<String>? policy,
    i0.Expression<int>? enforcementLevel,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (policyId != null) 'policy_id': policyId,
      if (policy != null) 'policy': policy,
      if (enforcementLevel != null) 'enforcement_level': enforcementLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CedarPoliciesCompanion copyWith(
      {i0.Value<String>? id,
      i0.Value<String>? policyId,
      i0.Value<i4.Policy>? policy,
      i0.Value<int>? enforcementLevel,
      i0.Value<int>? rowid}) {
    return i1.CedarPoliciesCompanion(
      id: id ?? this.id,
      policyId: policyId ?? this.policyId,
      policy: policy ?? this.policy,
      enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<String>(id.value);
    }
    if (policyId.present) {
      map['policy_id'] = i0.Variable<String>(policyId.value);
    }
    if (policy.present) {
      map['policy'] = i0.Variable<String>(
          i1.CedarPolicies.$converterpolicy.toSql(policy.value));
    }
    if (enforcementLevel.present) {
      map['enforcement_level'] = i0.Variable<int>(enforcementLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarPoliciesCompanion(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('policy: $policy, ')
          ..write('enforcementLevel: $enforcementLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarPolicyTemplates extends i0.Table
    with i0.TableInfo<CedarPolicyTemplates, i1.CedarPolicyTemplate> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarPolicyTemplates(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> id = i0.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> templateId = i0.GeneratedColumn<String>(
      'template_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final i0.GeneratedColumnWithTypeConverter<i4.Policy, String> template =
      i0.GeneratedColumn<String>('template', aliasedName, false,
              type: i0.DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<i4.Policy>(i1.CedarPolicyTemplates.$convertertemplate);
  @override
  List<i0.GeneratedColumn> get $columns => [id, templateId, template];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_policy_templates';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.CedarPolicyTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CedarPolicyTemplate(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}id'])!,
      templateId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}template_id'])!,
      template: i1.CedarPolicyTemplates.$convertertemplate.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}template'])!),
    );
  }

  @override
  CedarPolicyTemplates createAlias(String alias) {
    return CedarPolicyTemplates(attachedDatabase, alias);
  }

  static i0.TypeConverter<i4.Policy, String> $convertertemplate =
      const i2.CedarPolicyConverter();
  @override
  List<String> get customConstraints =>
      const ['CHECK(template IS NOT NULL OR template IS NOT NULL)'];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPolicyTemplate extends i0.DataClass
    implements i0.Insertable<i1.CedarPolicyTemplate> {
  /// Immutable. The unique identifier for the template.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: polt_<typeid>
  final String id;

  /// The primary alias for the template, mapping to the `@id` annotation.
  ///
  /// While Cedar does not require templates to have IDs, we enforce their usage to improve
  /// auditability and debuggability.
  final String templateId;

  /// The template in JSON format.
  ///
  /// Type: JSON[package:cedar/cedar.dart#Policy]
  final i4.Policy template;
  const CedarPolicyTemplate(
      {required this.id, required this.templateId, required this.template});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    map['template_id'] = i0.Variable<String>(templateId);
    {
      map['template'] = i0.Variable<String>(
          i1.CedarPolicyTemplates.$convertertemplate.toSql(template));
    }
    return map;
  }

  factory CedarPolicyTemplate.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CedarPolicyTemplate(
      id: serializer.fromJson<String>(json['id']),
      templateId: serializer.fromJson<String>(json['template_id']),
      template: serializer.fromJson<i4.Policy>(json['template']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'template_id': serializer.toJson<String>(templateId),
      'template': serializer.toJson<i4.Policy>(template),
    };
  }

  i1.CedarPolicyTemplate copyWith(
          {String? id, String? templateId, i4.Policy? template}) =>
      i1.CedarPolicyTemplate(
        id: id ?? this.id,
        templateId: templateId ?? this.templateId,
        template: template ?? this.template,
      );
  CedarPolicyTemplate copyWithCompanion(i1.CedarPolicyTemplatesCompanion data) {
    return CedarPolicyTemplate(
      id: data.id.present ? data.id.value : this.id,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      template: data.template.present ? data.template.value : this.template,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplate(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('template: $template')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateId, template);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CedarPolicyTemplate &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.template == this.template);
}

class CedarPolicyTemplatesCompanion
    extends i0.UpdateCompanion<i1.CedarPolicyTemplate> {
  final i0.Value<String> id;
  final i0.Value<String> templateId;
  final i0.Value<i4.Policy> template;
  final i0.Value<int> rowid;
  const CedarPolicyTemplatesCompanion({
    this.id = const i0.Value.absent(),
    this.templateId = const i0.Value.absent(),
    this.template = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CedarPolicyTemplatesCompanion.insert({
    required String id,
    required String templateId,
    required i4.Policy template,
    this.rowid = const i0.Value.absent(),
  })  : id = i0.Value(id),
        templateId = i0.Value(templateId),
        template = i0.Value(template);
  static i0.Insertable<i1.CedarPolicyTemplate> custom({
    i0.Expression<String>? id,
    i0.Expression<String>? templateId,
    i0.Expression<String>? template,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (template != null) 'template': template,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CedarPolicyTemplatesCompanion copyWith(
      {i0.Value<String>? id,
      i0.Value<String>? templateId,
      i0.Value<i4.Policy>? template,
      i0.Value<int>? rowid}) {
    return i1.CedarPolicyTemplatesCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      template: template ?? this.template,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<String>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = i0.Variable<String>(templateId.value);
    }
    if (template.present) {
      map['template'] = i0.Variable<String>(
          i1.CedarPolicyTemplates.$convertertemplate.toSql(template.value));
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('template: $template, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CedarPolicyTemplateLinks extends i0.Table
    with i0.TableInfo<CedarPolicyTemplateLinks, i1.CedarPolicyTemplateLink> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarPolicyTemplateLinks(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> id = i0.GeneratedColumn<String>(
      'id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> policyId = i0.GeneratedColumn<String>(
      'policy_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final i0.GeneratedColumn<String> templateId = i0.GeneratedColumn<String>(
      'template_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> principalType =
      i0.GeneratedColumn<String>('principal_type', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> principalId =
      i0.GeneratedColumn<String>('principal_id', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> resourceType =
      i0.GeneratedColumn<String>('resource_type', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> resourceId = i0.GeneratedColumn<String>(
      'resource_id', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<int> enforcementLevel = i0.GeneratedColumn<int>(
      'enforcement_level', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const i0.CustomExpression('1'));
  @override
  List<i0.GeneratedColumn> get $columns => [
        id,
        policyId,
        templateId,
        principalType,
        principalId,
        resourceType,
        resourceId,
        enforcementLevel
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_policy_template_links';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.CedarPolicyTemplateLink map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CedarPolicyTemplateLink(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}id'])!,
      policyId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}policy_id'])!,
      templateId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}template_id'])!,
      principalType: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}principal_type']),
      principalId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}principal_id']),
      resourceType: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}resource_type']),
      resourceId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}resource_id']),
      enforcementLevel: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}enforcement_level'])!,
    );
  }

  @override
  CedarPolicyTemplateLinks createAlias(String alias) {
    return CedarPolicyTemplateLinks(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CHECK(principal_type IS NOT NULL AND principal_id IS NOT NULL OR resource_type IS NOT NULL AND resource_id IS NOT NULL)',
        'CHECK(enforcement_level IN (0, 1))',
        'CONSTRAINT cedar_policy_template_links_fk_template_id FOREIGN KEY(template_id)REFERENCES cedar_policy_templates(template_id)ON UPDATE CASCADE ON DELETE CASCADE',
        'CONSTRAINT cedar_policy_template_links_fk_principal FOREIGN KEY(principal_type, principal_id)REFERENCES cedar_entities(entity_type, entity_id)ON DELETE CASCADE',
        'CONSTRAINT cedar_policy_template_links_fk_resource FOREIGN KEY(resource_type, resource_id)REFERENCES cedar_entities(entity_type, entity_id)ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CedarPolicyTemplateLink extends i0.DataClass
    implements i0.Insertable<i1.CedarPolicyTemplateLink> {
  /// Immutable. The unique identifier for the policy.
  ///
  /// Maps to the `uid` field in the Protobuf.
  ///
  /// Format: polk_<typeid>
  final String id;

  /// The primary alias of the policy created by this link.
  final String policyId;

  /// The policy template ID.
  final String templateId;

  /// The linked principal slot of the template.
  final String? principalType;
  final String? principalId;

  /// The linked resource slot of the template.
  final String? resourceType;
  final String? resourceId;

  /// The policy's enforcement level.
  ///
  /// Dry-run policies are captured in the audit log but do not affect presentation of the
  /// authorization decision.
  ///
  /// Type: integer (enforced=1, dry-run=0)
  final int enforcementLevel;
  const CedarPolicyTemplateLink(
      {required this.id,
      required this.policyId,
      required this.templateId,
      this.principalType,
      this.principalId,
      this.resourceType,
      this.resourceId,
      required this.enforcementLevel});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<String>(id);
    map['policy_id'] = i0.Variable<String>(policyId);
    map['template_id'] = i0.Variable<String>(templateId);
    if (!nullToAbsent || principalType != null) {
      map['principal_type'] = i0.Variable<String>(principalType);
    }
    if (!nullToAbsent || principalId != null) {
      map['principal_id'] = i0.Variable<String>(principalId);
    }
    if (!nullToAbsent || resourceType != null) {
      map['resource_type'] = i0.Variable<String>(resourceType);
    }
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = i0.Variable<String>(resourceId);
    }
    map['enforcement_level'] = i0.Variable<int>(enforcementLevel);
    return map;
  }

  factory CedarPolicyTemplateLink.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CedarPolicyTemplateLink(
      id: serializer.fromJson<String>(json['id']),
      policyId: serializer.fromJson<String>(json['policy_id']),
      templateId: serializer.fromJson<String>(json['template_id']),
      principalType: serializer.fromJson<String?>(json['principal_type']),
      principalId: serializer.fromJson<String?>(json['principal_id']),
      resourceType: serializer.fromJson<String?>(json['resource_type']),
      resourceId: serializer.fromJson<String?>(json['resource_id']),
      enforcementLevel: serializer.fromJson<int>(json['enforcement_level']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'policy_id': serializer.toJson<String>(policyId),
      'template_id': serializer.toJson<String>(templateId),
      'principal_type': serializer.toJson<String?>(principalType),
      'principal_id': serializer.toJson<String?>(principalId),
      'resource_type': serializer.toJson<String?>(resourceType),
      'resource_id': serializer.toJson<String?>(resourceId),
      'enforcement_level': serializer.toJson<int>(enforcementLevel),
    };
  }

  i1.CedarPolicyTemplateLink copyWith(
          {String? id,
          String? policyId,
          String? templateId,
          i0.Value<String?> principalType = const i0.Value.absent(),
          i0.Value<String?> principalId = const i0.Value.absent(),
          i0.Value<String?> resourceType = const i0.Value.absent(),
          i0.Value<String?> resourceId = const i0.Value.absent(),
          int? enforcementLevel}) =>
      i1.CedarPolicyTemplateLink(
        id: id ?? this.id,
        policyId: policyId ?? this.policyId,
        templateId: templateId ?? this.templateId,
        principalType:
            principalType.present ? principalType.value : this.principalType,
        principalId: principalId.present ? principalId.value : this.principalId,
        resourceType:
            resourceType.present ? resourceType.value : this.resourceType,
        resourceId: resourceId.present ? resourceId.value : this.resourceId,
        enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      );
  CedarPolicyTemplateLink copyWithCompanion(
      i1.CedarPolicyTemplateLinksCompanion data) {
    return CedarPolicyTemplateLink(
      id: data.id.present ? data.id.value : this.id,
      policyId: data.policyId.present ? data.policyId.value : this.policyId,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      principalType: data.principalType.present
          ? data.principalType.value
          : this.principalType,
      principalId:
          data.principalId.present ? data.principalId.value : this.principalId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      enforcementLevel: data.enforcementLevel.present
          ? data.enforcementLevel.value
          : this.enforcementLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplateLink(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('templateId: $templateId, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('enforcementLevel: $enforcementLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, policyId, templateId, principalType,
      principalId, resourceType, resourceId, enforcementLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CedarPolicyTemplateLink &&
          other.id == this.id &&
          other.policyId == this.policyId &&
          other.templateId == this.templateId &&
          other.principalType == this.principalType &&
          other.principalId == this.principalId &&
          other.resourceType == this.resourceType &&
          other.resourceId == this.resourceId &&
          other.enforcementLevel == this.enforcementLevel);
}

class CedarPolicyTemplateLinksCompanion
    extends i0.UpdateCompanion<i1.CedarPolicyTemplateLink> {
  final i0.Value<String> id;
  final i0.Value<String> policyId;
  final i0.Value<String> templateId;
  final i0.Value<String?> principalType;
  final i0.Value<String?> principalId;
  final i0.Value<String?> resourceType;
  final i0.Value<String?> resourceId;
  final i0.Value<int> enforcementLevel;
  final i0.Value<int> rowid;
  const CedarPolicyTemplateLinksCompanion({
    this.id = const i0.Value.absent(),
    this.policyId = const i0.Value.absent(),
    this.templateId = const i0.Value.absent(),
    this.principalType = const i0.Value.absent(),
    this.principalId = const i0.Value.absent(),
    this.resourceType = const i0.Value.absent(),
    this.resourceId = const i0.Value.absent(),
    this.enforcementLevel = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CedarPolicyTemplateLinksCompanion.insert({
    required String id,
    required String policyId,
    required String templateId,
    this.principalType = const i0.Value.absent(),
    this.principalId = const i0.Value.absent(),
    this.resourceType = const i0.Value.absent(),
    this.resourceId = const i0.Value.absent(),
    this.enforcementLevel = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : id = i0.Value(id),
        policyId = i0.Value(policyId),
        templateId = i0.Value(templateId);
  static i0.Insertable<i1.CedarPolicyTemplateLink> custom({
    i0.Expression<String>? id,
    i0.Expression<String>? policyId,
    i0.Expression<String>? templateId,
    i0.Expression<String>? principalType,
    i0.Expression<String>? principalId,
    i0.Expression<String>? resourceType,
    i0.Expression<String>? resourceId,
    i0.Expression<int>? enforcementLevel,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (policyId != null) 'policy_id': policyId,
      if (templateId != null) 'template_id': templateId,
      if (principalType != null) 'principal_type': principalType,
      if (principalId != null) 'principal_id': principalId,
      if (resourceType != null) 'resource_type': resourceType,
      if (resourceId != null) 'resource_id': resourceId,
      if (enforcementLevel != null) 'enforcement_level': enforcementLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CedarPolicyTemplateLinksCompanion copyWith(
      {i0.Value<String>? id,
      i0.Value<String>? policyId,
      i0.Value<String>? templateId,
      i0.Value<String?>? principalType,
      i0.Value<String?>? principalId,
      i0.Value<String?>? resourceType,
      i0.Value<String?>? resourceId,
      i0.Value<int>? enforcementLevel,
      i0.Value<int>? rowid}) {
    return i1.CedarPolicyTemplateLinksCompanion(
      id: id ?? this.id,
      policyId: policyId ?? this.policyId,
      templateId: templateId ?? this.templateId,
      principalType: principalType ?? this.principalType,
      principalId: principalId ?? this.principalId,
      resourceType: resourceType ?? this.resourceType,
      resourceId: resourceId ?? this.resourceId,
      enforcementLevel: enforcementLevel ?? this.enforcementLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<String>(id.value);
    }
    if (policyId.present) {
      map['policy_id'] = i0.Variable<String>(policyId.value);
    }
    if (templateId.present) {
      map['template_id'] = i0.Variable<String>(templateId.value);
    }
    if (principalType.present) {
      map['principal_type'] = i0.Variable<String>(principalType.value);
    }
    if (principalId.present) {
      map['principal_id'] = i0.Variable<String>(principalId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = i0.Variable<String>(resourceType.value);
    }
    if (resourceId.present) {
      map['resource_id'] = i0.Variable<String>(resourceId.value);
    }
    if (enforcementLevel.present) {
      map['enforcement_level'] = i0.Variable<int>(enforcementLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarPolicyTemplateLinksCompanion(')
          ..write('id: $id, ')
          ..write('policyId: $policyId, ')
          ..write('templateId: $templateId, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('enforcementLevel: $enforcementLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get cedarPolicyTemplateLinksFkTemplateIdIdx => i0.Index(
    'cedar_policy_template_links_fk_template_id_idx',
    'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_template_id_idx ON cedar_policy_template_links (template_id)');
i0.Index get cedarPolicyTemplateLinksFkPrincipalIdx => i0.Index(
    'cedar_policy_template_links_fk_principal_idx',
    'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_principal_idx ON cedar_policy_template_links (principal_type, principal_id)');
i0.Index get cedarPolicyTemplateLinksFkResourceIdx => i0.Index(
    'cedar_policy_template_links_fk_resource_idx',
    'CREATE INDEX IF NOT EXISTS cedar_policy_template_links_fk_resource_idx ON cedar_policy_template_links (resource_type, resource_id)');

class CedarAuthorizationLogs extends i0.Table
    with i0.TableInfo<CedarAuthorizationLogs, i1.CedarAuthorizationLog> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CedarAuthorizationLogs(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<int> rowid = i0.GeneratedColumn<int>(
      'rowid', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  late final i0.GeneratedColumn<DateTime> createTime =
      i0.GeneratedColumn<DateTime>(
          'create_time', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
          defaultValue:
              const i0.CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final i0.GeneratedColumn<DateTime> expireTime =
      i0.GeneratedColumn<DateTime>('expire_time', aliasedName, true,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> principalType =
      i0.GeneratedColumn<String>('principal_type', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> principalId =
      i0.GeneratedColumn<String>('principal_id', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> actionType = i0.GeneratedColumn<String>(
      'action_type', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> actionId = i0.GeneratedColumn<String>(
      'action_id', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> resourceType =
      i0.GeneratedColumn<String>('resource_type', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> resourceId = i0.GeneratedColumn<String>(
      'resource_id', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0
      .GeneratedColumnWithTypeConverter<Map<String, i2.CedarValue>, String>
      contextJson = i0.GeneratedColumn<String>(
              'context_json', aliasedName, false,
              type: i0.DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'{}\'',
              defaultValue: const i0.CustomExpression('\'{}\''))
          .withConverter<Map<String, i2.CedarValue>>(
              i1.CedarAuthorizationLogs.$convertercontextJson);
  late final i0.GeneratedColumn<bool> decision = i0.GeneratedColumn<bool>(
      'decision', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumnWithTypeConverter<List<String>, String>
      reasonsJson = i0.GeneratedColumn<String>(
              'reasons_json', aliasedName, false,
              type: i0.DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'[]\'',
              defaultValue: const i0.CustomExpression('\'[]\''))
          .withConverter<List<String>>(
              i1.CedarAuthorizationLogs.$converterreasonsJson);
  late final i0.GeneratedColumnWithTypeConverter<i5.AuthorizationErrors, String>
      errorsJson = i0.GeneratedColumn<String>('errors_json', aliasedName, false,
              type: i0.DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'[]\'',
              defaultValue: const i0.CustomExpression('\'[]\''))
          .withConverter<i5.AuthorizationErrors>(
              i1.CedarAuthorizationLogs.$convertererrorsJson);
  @override
  List<i0.GeneratedColumn> get $columns => [
        rowid,
        createTime,
        expireTime,
        principalType,
        principalId,
        actionType,
        actionId,
        resourceType,
        resourceId,
        contextJson,
        decision,
        reasonsJson,
        errorsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cedar_authorization_logs';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {rowid};
  @override
  i1.CedarAuthorizationLog map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CedarAuthorizationLog(
      rowid: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}rowid'])!,
      createTime: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      expireTime: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}expire_time']),
      principalType: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}principal_type']),
      principalId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}principal_id']),
      actionType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}action_type']),
      actionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}action_id']),
      resourceType: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}resource_type']),
      resourceId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}resource_id']),
      contextJson: i1.CedarAuthorizationLogs.$convertercontextJson.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}context_json'])!),
      decision: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}decision'])!,
      reasonsJson: i1.CedarAuthorizationLogs.$converterreasonsJson.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}reasons_json'])!),
      errorsJson: i1.CedarAuthorizationLogs.$convertererrorsJson.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}errors_json'])!),
    );
  }

  @override
  CedarAuthorizationLogs createAlias(String alias) {
    return CedarAuthorizationLogs(attachedDatabase, alias);
  }

  static i0.TypeConverter<Map<String, i2.CedarValue>, String>
      $convertercontextJson = const i2.CedarAttributesConverter();
  static i0.TypeConverter<List<String>, String> $converterreasonsJson =
      const i2.CedarAuthorizationReasonsConverter();
  static i0.TypeConverter<i5.AuthorizationErrors, String> $convertererrorsJson =
      const i2.CedarAuthorizationErrorsConverter();
  @override
  bool get dontWriteConstraints => true;
}

class CedarAuthorizationLog extends i0.DataClass
    implements i0.Insertable<i1.CedarAuthorizationLog> {
  final int rowid;

  /// The time the audit log entry was created.
  ///
  /// Type: unixepoch.subsec
  final DateTime createTime;

  /// The log's expiration time if a TTL has been set.
  ///
  /// Type: unixepoch | null
  final DateTime? expireTime;

  /// The requesting principal's entity type.
  ///
  /// Type: string
  final String? principalType;

  /// The requesting principal's entity ID.
  ///
  /// Type: string
  final String? principalId;

  /// The requested action's entity type.
  ///
  /// Type: string
  final String? actionType;

  /// The requested action's entity ID.
  ///
  /// Type: string
  final String? actionId;

  /// The requested resource's entity type.
  ///
  /// Type: string
  final String? resourceType;

  /// The requested resource's entity ID.
  ///
  /// Type: string
  final String? resourceId;

  /// The context of the request
  ///
  /// Type: JSON
  /// JSON: `{ [key: string]: string }`
  final Map<String, i2.CedarValue> contextJson;

  /// The authorization decision.
  ///
  /// Type: bool (true=allow, false=deny)
  final bool decision;

  /// The reasons for the authorization decision.
  ///
  /// Type: JSON
  /// JSON: []string
  final List<String> reasonsJson;

  /// The errors encountered during the authorization decision.
  ///
  /// Type: JSON
  /// JSON:
  /// ```json
  /// [
  ///   {
  ///     "policy": "policy_id",
  ///     "message": "string"
  ///   }
  /// ]
  /// ```
  final i5.AuthorizationErrors errorsJson;
  const CedarAuthorizationLog(
      {required this.rowid,
      required this.createTime,
      this.expireTime,
      this.principalType,
      this.principalId,
      this.actionType,
      this.actionId,
      this.resourceType,
      this.resourceId,
      required this.contextJson,
      required this.decision,
      required this.reasonsJson,
      required this.errorsJson});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['rowid'] = i0.Variable<int>(rowid);
    map['create_time'] = i0.Variable<DateTime>(createTime);
    if (!nullToAbsent || expireTime != null) {
      map['expire_time'] = i0.Variable<DateTime>(expireTime);
    }
    if (!nullToAbsent || principalType != null) {
      map['principal_type'] = i0.Variable<String>(principalType);
    }
    if (!nullToAbsent || principalId != null) {
      map['principal_id'] = i0.Variable<String>(principalId);
    }
    if (!nullToAbsent || actionType != null) {
      map['action_type'] = i0.Variable<String>(actionType);
    }
    if (!nullToAbsent || actionId != null) {
      map['action_id'] = i0.Variable<String>(actionId);
    }
    if (!nullToAbsent || resourceType != null) {
      map['resource_type'] = i0.Variable<String>(resourceType);
    }
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = i0.Variable<String>(resourceId);
    }
    {
      map['context_json'] = i0.Variable<String>(
          i1.CedarAuthorizationLogs.$convertercontextJson.toSql(contextJson));
    }
    map['decision'] = i0.Variable<bool>(decision);
    {
      map['reasons_json'] = i0.Variable<String>(
          i1.CedarAuthorizationLogs.$converterreasonsJson.toSql(reasonsJson));
    }
    {
      map['errors_json'] = i0.Variable<String>(
          i1.CedarAuthorizationLogs.$convertererrorsJson.toSql(errorsJson));
    }
    return map;
  }

  factory CedarAuthorizationLog.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CedarAuthorizationLog(
      rowid: serializer.fromJson<int>(json['rowid']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      expireTime: serializer.fromJson<DateTime?>(json['expire_time']),
      principalType: serializer.fromJson<String?>(json['principal_type']),
      principalId: serializer.fromJson<String?>(json['principal_id']),
      actionType: serializer.fromJson<String?>(json['action_type']),
      actionId: serializer.fromJson<String?>(json['action_id']),
      resourceType: serializer.fromJson<String?>(json['resource_type']),
      resourceId: serializer.fromJson<String?>(json['resource_id']),
      contextJson:
          serializer.fromJson<Map<String, i2.CedarValue>>(json['context_json']),
      decision: serializer.fromJson<bool>(json['decision']),
      reasonsJson: serializer.fromJson<List<String>>(json['reasons_json']),
      errorsJson:
          serializer.fromJson<i5.AuthorizationErrors>(json['errors_json']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowid': serializer.toJson<int>(rowid),
      'create_time': serializer.toJson<DateTime>(createTime),
      'expire_time': serializer.toJson<DateTime?>(expireTime),
      'principal_type': serializer.toJson<String?>(principalType),
      'principal_id': serializer.toJson<String?>(principalId),
      'action_type': serializer.toJson<String?>(actionType),
      'action_id': serializer.toJson<String?>(actionId),
      'resource_type': serializer.toJson<String?>(resourceType),
      'resource_id': serializer.toJson<String?>(resourceId),
      'context_json':
          serializer.toJson<Map<String, i2.CedarValue>>(contextJson),
      'decision': serializer.toJson<bool>(decision),
      'reasons_json': serializer.toJson<List<String>>(reasonsJson),
      'errors_json': serializer.toJson<i5.AuthorizationErrors>(errorsJson),
    };
  }

  i1.CedarAuthorizationLog copyWith(
          {int? rowid,
          DateTime? createTime,
          i0.Value<DateTime?> expireTime = const i0.Value.absent(),
          i0.Value<String?> principalType = const i0.Value.absent(),
          i0.Value<String?> principalId = const i0.Value.absent(),
          i0.Value<String?> actionType = const i0.Value.absent(),
          i0.Value<String?> actionId = const i0.Value.absent(),
          i0.Value<String?> resourceType = const i0.Value.absent(),
          i0.Value<String?> resourceId = const i0.Value.absent(),
          Map<String, i2.CedarValue>? contextJson,
          bool? decision,
          List<String>? reasonsJson,
          i5.AuthorizationErrors? errorsJson}) =>
      i1.CedarAuthorizationLog(
        rowid: rowid ?? this.rowid,
        createTime: createTime ?? this.createTime,
        expireTime: expireTime.present ? expireTime.value : this.expireTime,
        principalType:
            principalType.present ? principalType.value : this.principalType,
        principalId: principalId.present ? principalId.value : this.principalId,
        actionType: actionType.present ? actionType.value : this.actionType,
        actionId: actionId.present ? actionId.value : this.actionId,
        resourceType:
            resourceType.present ? resourceType.value : this.resourceType,
        resourceId: resourceId.present ? resourceId.value : this.resourceId,
        contextJson: contextJson ?? this.contextJson,
        decision: decision ?? this.decision,
        reasonsJson: reasonsJson ?? this.reasonsJson,
        errorsJson: errorsJson ?? this.errorsJson,
      );
  CedarAuthorizationLog copyWithCompanion(
      i1.CedarAuthorizationLogsCompanion data) {
    return CedarAuthorizationLog(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      expireTime:
          data.expireTime.present ? data.expireTime.value : this.expireTime,
      principalType: data.principalType.present
          ? data.principalType.value
          : this.principalType,
      principalId:
          data.principalId.present ? data.principalId.value : this.principalId,
      actionType:
          data.actionType.present ? data.actionType.value : this.actionType,
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      contextJson:
          data.contextJson.present ? data.contextJson.value : this.contextJson,
      decision: data.decision.present ? data.decision.value : this.decision,
      reasonsJson:
          data.reasonsJson.present ? data.reasonsJson.value : this.reasonsJson,
      errorsJson:
          data.errorsJson.present ? data.errorsJson.value : this.errorsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CedarAuthorizationLog(')
          ..write('rowid: $rowid, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('actionType: $actionType, ')
          ..write('actionId: $actionId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('contextJson: $contextJson, ')
          ..write('decision: $decision, ')
          ..write('reasonsJson: $reasonsJson, ')
          ..write('errorsJson: $errorsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      rowid,
      createTime,
      expireTime,
      principalType,
      principalId,
      actionType,
      actionId,
      resourceType,
      resourceId,
      contextJson,
      decision,
      reasonsJson,
      errorsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CedarAuthorizationLog &&
          other.rowid == this.rowid &&
          other.createTime == this.createTime &&
          other.expireTime == this.expireTime &&
          other.principalType == this.principalType &&
          other.principalId == this.principalId &&
          other.actionType == this.actionType &&
          other.actionId == this.actionId &&
          other.resourceType == this.resourceType &&
          other.resourceId == this.resourceId &&
          other.contextJson == this.contextJson &&
          other.decision == this.decision &&
          other.reasonsJson == this.reasonsJson &&
          other.errorsJson == this.errorsJson);
}

class CedarAuthorizationLogsCompanion
    extends i0.UpdateCompanion<i1.CedarAuthorizationLog> {
  final i0.Value<int> rowid;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime?> expireTime;
  final i0.Value<String?> principalType;
  final i0.Value<String?> principalId;
  final i0.Value<String?> actionType;
  final i0.Value<String?> actionId;
  final i0.Value<String?> resourceType;
  final i0.Value<String?> resourceId;
  final i0.Value<Map<String, i2.CedarValue>> contextJson;
  final i0.Value<bool> decision;
  final i0.Value<List<String>> reasonsJson;
  final i0.Value<i5.AuthorizationErrors> errorsJson;
  const CedarAuthorizationLogsCompanion({
    this.rowid = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.expireTime = const i0.Value.absent(),
    this.principalType = const i0.Value.absent(),
    this.principalId = const i0.Value.absent(),
    this.actionType = const i0.Value.absent(),
    this.actionId = const i0.Value.absent(),
    this.resourceType = const i0.Value.absent(),
    this.resourceId = const i0.Value.absent(),
    this.contextJson = const i0.Value.absent(),
    this.decision = const i0.Value.absent(),
    this.reasonsJson = const i0.Value.absent(),
    this.errorsJson = const i0.Value.absent(),
  });
  CedarAuthorizationLogsCompanion.insert({
    this.rowid = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.expireTime = const i0.Value.absent(),
    this.principalType = const i0.Value.absent(),
    this.principalId = const i0.Value.absent(),
    this.actionType = const i0.Value.absent(),
    this.actionId = const i0.Value.absent(),
    this.resourceType = const i0.Value.absent(),
    this.resourceId = const i0.Value.absent(),
    this.contextJson = const i0.Value.absent(),
    required bool decision,
    this.reasonsJson = const i0.Value.absent(),
    this.errorsJson = const i0.Value.absent(),
  }) : decision = i0.Value(decision);
  static i0.Insertable<i1.CedarAuthorizationLog> custom({
    i0.Expression<int>? rowid,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? expireTime,
    i0.Expression<String>? principalType,
    i0.Expression<String>? principalId,
    i0.Expression<String>? actionType,
    i0.Expression<String>? actionId,
    i0.Expression<String>? resourceType,
    i0.Expression<String>? resourceId,
    i0.Expression<String>? contextJson,
    i0.Expression<bool>? decision,
    i0.Expression<String>? reasonsJson,
    i0.Expression<String>? errorsJson,
  }) {
    return i0.RawValuesInsertable({
      if (rowid != null) 'rowid': rowid,
      if (createTime != null) 'create_time': createTime,
      if (expireTime != null) 'expire_time': expireTime,
      if (principalType != null) 'principal_type': principalType,
      if (principalId != null) 'principal_id': principalId,
      if (actionType != null) 'action_type': actionType,
      if (actionId != null) 'action_id': actionId,
      if (resourceType != null) 'resource_type': resourceType,
      if (resourceId != null) 'resource_id': resourceId,
      if (contextJson != null) 'context_json': contextJson,
      if (decision != null) 'decision': decision,
      if (reasonsJson != null) 'reasons_json': reasonsJson,
      if (errorsJson != null) 'errors_json': errorsJson,
    });
  }

  i1.CedarAuthorizationLogsCompanion copyWith(
      {i0.Value<int>? rowid,
      i0.Value<DateTime>? createTime,
      i0.Value<DateTime?>? expireTime,
      i0.Value<String?>? principalType,
      i0.Value<String?>? principalId,
      i0.Value<String?>? actionType,
      i0.Value<String?>? actionId,
      i0.Value<String?>? resourceType,
      i0.Value<String?>? resourceId,
      i0.Value<Map<String, i2.CedarValue>>? contextJson,
      i0.Value<bool>? decision,
      i0.Value<List<String>>? reasonsJson,
      i0.Value<i5.AuthorizationErrors>? errorsJson}) {
    return i1.CedarAuthorizationLogsCompanion(
      rowid: rowid ?? this.rowid,
      createTime: createTime ?? this.createTime,
      expireTime: expireTime ?? this.expireTime,
      principalType: principalType ?? this.principalType,
      principalId: principalId ?? this.principalId,
      actionType: actionType ?? this.actionType,
      actionId: actionId ?? this.actionId,
      resourceType: resourceType ?? this.resourceType,
      resourceId: resourceId ?? this.resourceId,
      contextJson: contextJson ?? this.contextJson,
      decision: decision ?? this.decision,
      reasonsJson: reasonsJson ?? this.reasonsJson,
      errorsJson: errorsJson ?? this.errorsJson,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    if (createTime.present) {
      map['create_time'] = i0.Variable<DateTime>(createTime.value);
    }
    if (expireTime.present) {
      map['expire_time'] = i0.Variable<DateTime>(expireTime.value);
    }
    if (principalType.present) {
      map['principal_type'] = i0.Variable<String>(principalType.value);
    }
    if (principalId.present) {
      map['principal_id'] = i0.Variable<String>(principalId.value);
    }
    if (actionType.present) {
      map['action_type'] = i0.Variable<String>(actionType.value);
    }
    if (actionId.present) {
      map['action_id'] = i0.Variable<String>(actionId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = i0.Variable<String>(resourceType.value);
    }
    if (resourceId.present) {
      map['resource_id'] = i0.Variable<String>(resourceId.value);
    }
    if (contextJson.present) {
      map['context_json'] = i0.Variable<String>(i1
          .CedarAuthorizationLogs.$convertercontextJson
          .toSql(contextJson.value));
    }
    if (decision.present) {
      map['decision'] = i0.Variable<bool>(decision.value);
    }
    if (reasonsJson.present) {
      map['reasons_json'] = i0.Variable<String>(i1
          .CedarAuthorizationLogs.$converterreasonsJson
          .toSql(reasonsJson.value));
    }
    if (errorsJson.present) {
      map['errors_json'] = i0.Variable<String>(i1
          .CedarAuthorizationLogs.$convertererrorsJson
          .toSql(errorsJson.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CedarAuthorizationLogsCompanion(')
          ..write('rowid: $rowid, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('principalType: $principalType, ')
          ..write('principalId: $principalId, ')
          ..write('actionType: $actionType, ')
          ..write('actionId: $actionId, ')
          ..write('resourceType: $resourceType, ')
          ..write('resourceId: $resourceId, ')
          ..write('contextJson: $contextJson, ')
          ..write('decision: $decision, ')
          ..write('reasonsJson: $reasonsJson, ')
          ..write('errorsJson: $errorsJson')
          ..write(')'))
        .toString();
  }
}

class CedarDrift extends i6.ModularAccessor {
  CedarDrift(i0.GeneratedDatabase db) : super(db);
  i0.Selectable<List<i3.Entity>> getEntityClosure(
      {required String type, required String id}) {
    return customSelect(
        'WITH RECURSIVE parents AS (SELECT e.entity_type, e.entity_id, e.parent_type, e.parent_id, e.parent_json FROM cedar_relationships AS e WHERE e.entity_type = ?1 AND e.entity_id = ?2 UNION ALL SELECT p.entity_type, p.entity_id, p.parent_type, p.parent_id, p.parent_json FROM cedar_relationships AS p INNER JOIN parents AS a ON p.entity_id = a.parent_id AND p.entity_type = a.parent_type), entities AS (SELECT * FROM cedar_entities WHERE (entity_type, entity_id) IN (SELECT entity_type, entity_id FROM parents) OR (entity_type, entity_id) IN (SELECT parent_type, parent_id FROM parents) OR (entity_type, entity_id) = (?1, ?2)) SELECT json_group_array(json_object(\'uid\', entity_json, \'attrs\', json(attribute_json), \'parents\', (SELECT json_group_array(json(parent_json)) FROM parents AS p WHERE p.entity_type = e.entity_type AND p.entity_id = e.entity_id))) AS _c0 FROM entities AS e',
        variables: [
          i0.Variable<String>(type),
          i0.Variable<String>(id)
        ],
        readsFrom: {
          cedarRelationships,
          cedarEntities,
        }).map((i0.QueryRow row) => const i2.CedarEntityClosureConverter()
        .fromSql(row.read<String>('_c0')));
  }

  i0.Selectable<DebugDumpCedarResult> debugDumpCedar() {
    return customSelect(
        'SELECT e.entity_type, e.entity_id, coalesce(r.parent_type, \'\') AS _c0, coalesce(r.parent_id, \'\') AS _c1 FROM cedar_entities AS e LEFT JOIN cedar_relationships AS r ON e.entity_type = r.entity_type AND e.entity_id = r.entity_id',
        variables: [],
        readsFrom: {
          cedarEntities,
          cedarRelationships,
        }).map((i0.QueryRow row) => DebugDumpCedarResult(
          entityType: row.read<String>('entity_type'),
          entityId: row.read<String>('entity_id'),
          coalescerparentType: row.read<String>('_c0'),
          coalescerparentId: row.read<String>('_c1'),
        ));
  }

  Future<int> createPolicy(
      {required String id,
      required String policyId,
      required i4.Policy policy,
      required int enforcementLevel}) {
    return customInsert(
      'INSERT INTO cedar_policies (id, policy_id, policy, enforcement_level) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (policy_id) DO UPDATE SET policy = excluded.policy, enforcement_level = excluded.enforcement_level',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(policyId),
        i0.Variable<String>(i1.CedarPolicies.$converterpolicy.toSql(policy)),
        i0.Variable<int>(enforcementLevel)
      ],
      updates: {cedarPolicies},
    );
  }

  Future<int> upsertPolicy(
      {required String id,
      required String policyId,
      required i4.Policy policy,
      required int enforcementLevel}) {
    return customInsert(
      'INSERT INTO cedar_policies (id, policy_id, policy, enforcement_level) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (policy_id) DO UPDATE SET policy = excluded.policy, enforcement_level = excluded.enforcement_level',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(policyId),
        i0.Variable<String>(i1.CedarPolicies.$converterpolicy.toSql(policy)),
        i0.Variable<int>(enforcementLevel)
      ],
      updates: {cedarPolicies},
    );
  }

  Future<int> createPolicyTemplate(
      {required String id,
      required String templateId,
      required i4.Policy template}) {
    return customInsert(
      'INSERT INTO cedar_policy_templates (id, template_id, template) VALUES (?1, ?2, ?3) ON CONFLICT (template_id) DO UPDATE SET template = excluded.template',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(templateId),
        i0.Variable<String>(
            i1.CedarPolicyTemplates.$convertertemplate.toSql(template))
      ],
      updates: {cedarPolicyTemplates},
    );
  }

  Future<int> upsertPolicyTemplate(
      {required String id,
      required String templateId,
      required i4.Policy template}) {
    return customInsert(
      'INSERT INTO cedar_policy_templates (id, template_id, template) VALUES (?1, ?2, ?3) ON CONFLICT (template_id) DO UPDATE SET template = excluded.template',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(templateId),
        i0.Variable<String>(
            i1.CedarPolicyTemplates.$convertertemplate.toSql(template))
      ],
      updates: {cedarPolicyTemplates},
    );
  }

  Future<int> upsertPolicyTemplateLink(
      {required String id,
      required String policyId,
      required String templateId,
      String? principalType,
      String? principalId,
      String? resourceType,
      String? resourceId,
      required int enforcementLevel}) {
    return customInsert(
      'INSERT INTO cedar_policy_template_links (id, policy_id, template_id, principal_type, principal_id, resource_type, resource_id, enforcement_level) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8) ON CONFLICT (policy_id) DO UPDATE SET principal_type = excluded.principal_type, principal_id = excluded.principal_id, resource_type = excluded.resource_type, resource_id = excluded.resource_id, enforcement_level = excluded.enforcement_level',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(policyId),
        i0.Variable<String>(templateId),
        i0.Variable<String>(principalType),
        i0.Variable<String>(principalId),
        i0.Variable<String>(resourceType),
        i0.Variable<String>(resourceId),
        i0.Variable<int>(enforcementLevel)
      ],
      updates: {cedarPolicyTemplateLinks},
    );
  }

  Future<int> linkPolicyTemplate(
      {required String id,
      required String policyId,
      required String templateId,
      String? principalType,
      String? principalId,
      String? resourceType,
      String? resourceId,
      required int enforcementLevel}) {
    return customInsert(
      'INSERT INTO cedar_policy_template_links (id, policy_id, template_id, principal_type, principal_id, resource_type, resource_id, enforcement_level) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)',
      variables: [
        i0.Variable<String>(id),
        i0.Variable<String>(policyId),
        i0.Variable<String>(templateId),
        i0.Variable<String>(principalType),
        i0.Variable<String>(principalId),
        i0.Variable<String>(resourceType),
        i0.Variable<String>(resourceId),
        i0.Variable<int>(enforcementLevel)
      ],
      updates: {cedarPolicyTemplateLinks},
    );
  }

  i0.Selectable<ListEffectivePoliciesResult> listEffectivePolicies() {
    return customSelect(
        'WITH template_links AS (SELECT l.id, l.policy_id, t.template, l.principal_type, l.principal_id, l.resource_type, l.resource_id, l.enforcement_level FROM cedar_policy_templates AS t INNER JOIN cedar_policy_template_links AS l ON l.template_id = t.id) SELECT id, template_id AS policy_id, template AS policy, NULL AS principal_type, NULL AS principal_id, NULL AS resource_type, NULL AS resource_id, NULL AS enforcement_level FROM cedar_policy_templates UNION ALL SELECT id, policy_id, template AS policy, principal_type, principal_id, resource_type, resource_id, enforcement_level FROM template_links UNION ALL SELECT id, policy_id, policy, NULL AS principal_type, NULL AS principal_id, NULL AS resource_type, NULL AS resource_id, enforcement_level FROM cedar_policies',
        variables: [],
        readsFrom: {
          cedarPolicyTemplateLinks,
          cedarPolicyTemplates,
          cedarPolicies,
        }).map((i0.QueryRow row) => ListEffectivePoliciesResult(
          id: row.read<String>('id'),
          policyId: row.read<String>('policy_id'),
          policy: i1.CedarPolicyTemplates.$convertertemplate
              .fromSql(row.read<String>('policy')),
          principalType: row.readNullable<String>('principal_type'),
          principalId: row.readNullable<String>('principal_id'),
          resourceType: row.readNullable<String>('resource_type'),
          resourceId: row.readNullable<String>('resource_id'),
          enforcementLevel: row.readNullable<int>('enforcement_level'),
        ));
  }

  Future<int> updatePolicy(
      {String? policy, int? enforcementLevel, required String policyId}) {
    return customUpdate(
      'UPDATE cedar_policies SET policy = coalesce(?1, policy), enforcement_level = coalesce(?2, enforcement_level) WHERE id = ?3 OR policy_id = ?3',
      variables: [
        i0.Variable<String>(policy),
        i0.Variable<int>(enforcementLevel),
        i0.Variable<String>(policyId)
      ],
      updates: {cedarPolicies},
      updateKind: i0.UpdateKind.update,
    );
  }

  Future<int> updatePolicyTemplate(
      {String? template, required String templateId}) {
    return customUpdate(
      'UPDATE cedar_policy_templates SET template = coalesce(?1, template) WHERE id = ?2 OR template_id = ?2',
      variables: [
        i0.Variable<String>(template),
        i0.Variable<String>(templateId)
      ],
      updates: {cedarPolicyTemplates},
      updateKind: i0.UpdateKind.update,
    );
  }

  Future<int> updatePolicyTemplateLink(
      {int? enforcementLevel, required String policyId}) {
    return customUpdate(
      'UPDATE cedar_policy_template_links SET enforcement_level = coalesce(?1, enforcement_level) WHERE id = ?2 OR policy_id = ?2',
      variables: [
        i0.Variable<int>(enforcementLevel),
        i0.Variable<String>(policyId)
      ],
      updates: {cedarPolicyTemplateLinks},
      updateKind: i0.UpdateKind.update,
    );
  }

  i7.Future<List<i1.CedarPolicy>> deletePolicy({required String policyId}) {
    return customWriteReturning(
            'DELETE FROM cedar_policies WHERE id = ?1 OR policy_id = ?1 RETURNING *',
            variables: [i0.Variable<String>(policyId)],
            updates: {cedarPolicies},
            updateKind: i0.UpdateKind.delete)
        .then((rows) => Future.wait(rows.map(cedarPolicies.mapFromRow)));
  }

  i7.Future<List<i1.CedarPolicyTemplate>> deletePolicyTemplate(
      {required String templateId}) {
    return customWriteReturning(
            'DELETE FROM cedar_policy_templates WHERE id = ?1 OR template_id = ?1 RETURNING *',
            variables: [i0.Variable<String>(templateId)],
            updates: {cedarPolicyTemplates},
            updateKind: i0.UpdateKind.delete)
        .then((rows) => Future.wait(rows.map(cedarPolicyTemplates.mapFromRow)));
  }

  i7.Future<List<i1.CedarPolicyTemplateLink>> deletePolicyTemplateLink(
      {required String policyId}) {
    return customWriteReturning(
            'DELETE FROM cedar_policy_template_links WHERE id = ?1 OR policy_id = ?1 RETURNING *',
            variables: [i0.Variable<String>(policyId)],
            updates: {cedarPolicyTemplateLinks},
            updateKind: i0.UpdateKind.delete)
        .then((rows) =>
            Future.wait(rows.map(cedarPolicyTemplateLinks.mapFromRow)));
  }

  Future<int> recordAuthorization(
      {String? principalType,
      String? principalId,
      String? actionType,
      String? actionId,
      String? resourceType,
      String? resourceId,
      required Map<String, i2.CedarValue> contextJson,
      required bool decision,
      required List<String> reasonsJson,
      required i5.AuthorizationErrors errorsJson}) {
    return customInsert(
      'INSERT INTO cedar_authorization_logs (principal_type, principal_id, action_type, action_id, resource_type, resource_id, context_json, decision, reasons_json, errors_json) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)',
      variables: [
        i0.Variable<String>(principalType),
        i0.Variable<String>(principalId),
        i0.Variable<String>(actionType),
        i0.Variable<String>(actionId),
        i0.Variable<String>(resourceType),
        i0.Variable<String>(resourceId),
        i0.Variable<String>(
            i1.CedarAuthorizationLogs.$convertercontextJson.toSql(contextJson)),
        i0.Variable<bool>(decision),
        i0.Variable<String>(
            i1.CedarAuthorizationLogs.$converterreasonsJson.toSql(reasonsJson)),
        i0.Variable<String>(
            i1.CedarAuthorizationLogs.$convertererrorsJson.toSql(errorsJson))
      ],
      updates: {cedarAuthorizationLogs},
    );
  }

  Future<int> createRelationship(
      {required String entityType,
      required String entityId,
      required String parentType,
      required String parentId}) {
    return customInsert(
      'INSERT INTO cedar_relationships (entity_type, entity_id, parent_type, parent_id) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (entity_type, entity_id, parent_type, parent_id) DO NOTHING',
      variables: [
        i0.Variable<String>(entityType),
        i0.Variable<String>(entityId),
        i0.Variable<String>(parentType),
        i0.Variable<String>(parentId)
      ],
      updates: {cedarRelationships},
    );
  }

  i7.Future<List<i1.CedarEntity>> createEntity(
      {required String entityType,
      required String entityId,
      required Map<String, i2.CedarValue> attributeJson}) {
    return customWriteReturning(
        'INSERT INTO cedar_entities (entity_type, entity_id, attribute_json) VALUES (?1, ?2, ?3) ON CONFLICT (entity_type, entity_id) DO UPDATE SET attribute_json = excluded.attribute_json RETURNING *',
        variables: [
          i0.Variable<String>(entityType),
          i0.Variable<String>(entityId),
          i0.Variable<String>(
              i1.CedarEntities.$converterattributeJson.toSql(attributeJson))
        ],
        updates: {
          cedarEntities
        }).then((rows) => Future.wait(rows.map(cedarEntities.mapFromRow)));
  }

  Future<int> createType({required String fqn}) {
    return customInsert(
      'INSERT INTO cedar_types (fqn) VALUES (?1) ON CONFLICT (fqn) DO NOTHING',
      variables: [i0.Variable<String>(fqn)],
      updates: {cedarTypes},
    );
  }

  i0.Selectable<i1.CedarEntity> getEntity(
      {required String entityType, required String entityId}) {
    return customSelect(
        'SELECT * FROM cedar_entities WHERE entity_type = ?1 AND entity_id = ?2',
        variables: [
          i0.Variable<String>(entityType),
          i0.Variable<String>(entityId)
        ],
        readsFrom: {
          cedarEntities,
        }).asyncMap(cedarEntities.mapFromRow);
  }

  i0.Selectable<String> getEntityRoles(
      {required String entityType, required String entityId}) {
    return customSelect(
        'SELECT \'Celest::Role::"\' || parent_id || \'"\' AS _c0 FROM cedar_relationships WHERE entity_type = ?1 AND entity_id = ?2 AND parent_type = \'Celest::Role\'',
        variables: [
          i0.Variable<String>(entityType),
          i0.Variable<String>(entityId)
        ],
        readsFrom: {
          cedarRelationships,
        }).map((i0.QueryRow row) => row.read<String>('_c0'));
  }

  i0.Selectable<i1.CedarRelationship> getRelationship(
      {required String entityType, required String entityId}) {
    return customSelect(
        'SELECT * FROM cedar_relationships WHERE entity_type = ?1 AND entity_id = ?2',
        variables: [
          i0.Variable<String>(entityType),
          i0.Variable<String>(entityId)
        ],
        readsFrom: {
          cedarRelationships,
        }).asyncMap(cedarRelationships.mapFromRow);
  }

  Future<int> updateEntity(
      {String? attributeJson,
      required String entityType,
      required String entityId}) {
    return customUpdate(
      'UPDATE cedar_entities SET attribute_json = coalesce(?1, attribute_json) WHERE entity_type = ?2 AND entity_id = ?3',
      variables: [
        i0.Variable<String>(attributeJson),
        i0.Variable<String>(entityType),
        i0.Variable<String>(entityId)
      ],
      updates: {cedarEntities},
      updateKind: i0.UpdateKind.update,
    );
  }

  Future<int> deleteEntity(
      {required String entityType, required String entityId}) {
    return customUpdate(
      'DELETE FROM cedar_entities WHERE entity_type = ?1 AND entity_id = ?2',
      variables: [
        i0.Variable<String>(entityType),
        i0.Variable<String>(entityId)
      ],
      updates: {cedarEntities},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i1.CedarRelationships get cedarRelationships =>
      i6.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CedarRelationships>('cedar_relationships');
  i1.CedarEntities get cedarEntities =>
      i6.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CedarEntities>('cedar_entities');
  i1.CedarPolicies get cedarPolicies =>
      i6.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CedarPolicies>('cedar_policies');
  i1.CedarPolicyTemplates get cedarPolicyTemplates =>
      i6.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CedarPolicyTemplates>('cedar_policy_templates');
  i1.CedarPolicyTemplateLinks get cedarPolicyTemplateLinks =>
      i6.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CedarPolicyTemplateLinks>(
              'cedar_policy_template_links');
  i1.CedarAuthorizationLogs get cedarAuthorizationLogs =>
      i6.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i1.CedarAuthorizationLogs>('cedar_authorization_logs');
  i1.CedarTypes get cedarTypes => i6.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i1.CedarTypes>('cedar_types');
}

class DebugDumpCedarResult {
  final String entityType;
  final String entityId;
  final String coalescerparentType;
  final String coalescerparentId;
  DebugDumpCedarResult({
    required this.entityType,
    required this.entityId,
    required this.coalescerparentType,
    required this.coalescerparentId,
  });
}

class ListEffectivePoliciesResult {
  final String id;
  final String policyId;
  final i4.Policy policy;
  final String? principalType;
  final String? principalId;
  final String? resourceType;
  final String? resourceId;
  final int? enforcementLevel;
  ListEffectivePoliciesResult({
    required this.id,
    required this.policyId,
    required this.policy,
    this.principalType,
    this.principalId,
    this.resourceType,
    this.resourceId,
    this.enforcementLevel,
  });
}
