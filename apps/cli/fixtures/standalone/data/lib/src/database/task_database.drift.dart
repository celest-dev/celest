// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift.dart'
    as i1;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i2;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_projects.drift.dart'
    as i3;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_meta.drift.dart'
    as i4;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_core.drift.dart'
    as i5;
import 'package:celest_backend/src/database/task_database.drift.dart' as i6;
import 'package:drift/internal/modular.dart' as i7;
import 'package:celest_backend/src/database/task_database.dart' as i8;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i9;

typedef $$TasksTableCreateCompanionBuilder =
    i6.TasksCompanion Function({
      i0.Value<int> id,
      required String title,
      required i8.Priority priority,
      i0.Value<bool> completed,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    i6.TasksCompanion Function({
      i0.Value<int> id,
      i0.Value<String> title,
      i0.Value<i8.Priority> priority,
      i0.Value<bool> completed,
    });

class $$TasksTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i6.$TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnWithTypeConverterFilters<i8.Priority, i8.Priority, String>
  get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => i0.ColumnWithTypeConverterFilters(column),
  );

  i0.ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $$TasksTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i6.$TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $$TasksTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i6.$TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i8.Priority, String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  i0.GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);
}

class $$TasksTableTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i6.$TasksTable,
          i6.Task,
          i6.$$TasksTableFilterComposer,
          i6.$$TasksTableOrderingComposer,
          i6.$$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (
            i6.Task,
            i0.BaseReferences<i0.GeneratedDatabase, i6.$TasksTable, i6.Task>,
          ),
          i6.Task,
          i0.PrefetchHooks Function()
        > {
  $$TasksTableTableManager(i0.GeneratedDatabase db, i6.$TasksTable table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i6.$$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i6.$$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i6.$$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                i0.Value<String> title = const i0.Value.absent(),
                i0.Value<i8.Priority> priority = const i0.Value.absent(),
                i0.Value<bool> completed = const i0.Value.absent(),
              }) => i6.TasksCompanion(
                id: id,
                title: title,
                priority: priority,
                completed: completed,
              ),
          createCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                required String title,
                required i8.Priority priority,
                i0.Value<bool> completed = const i0.Value.absent(),
              }) => i6.TasksCompanion.insert(
                id: id,
                title: title,
                priority: priority,
                completed: completed,
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

typedef $$TasksTableProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i6.$TasksTable,
      i6.Task,
      i6.$$TasksTableFilterComposer,
      i6.$$TasksTableOrderingComposer,
      i6.$$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (
        i6.Task,
        i0.BaseReferences<i0.GeneratedDatabase, i6.$TasksTable, i6.Task>,
      ),
      i6.Task,
      i0.PrefetchHooks Function()
    >;

abstract class $TaskDatabase extends i0.GeneratedDatabase {
  $TaskDatabase(i0.QueryExecutor e) : super(e);
  $TaskDatabaseManager get managers => $TaskDatabaseManager(this);
  late final i1.CloudAuthUsers cloudAuthUsers = i1.CloudAuthUsers(this);
  late final i2.CedarTypes cedarTypes = i2.CedarTypes(this);
  late final i2.CedarEntities cedarEntities = i2.CedarEntities(this);
  late final i2.CedarRelationships cedarRelationships = i2.CedarRelationships(
    this,
  );
  late final i1.CloudAuthUserEmails cloudAuthUserEmails =
      i1.CloudAuthUserEmails(this);
  late final i1.CloudAuthUserPhoneNumbers cloudAuthUserPhoneNumbers =
      i1.CloudAuthUserPhoneNumbers(this);
  late final i1.CloudAuthUsersView cloudAuthUsersView = i1.CloudAuthUsersView(
    this,
  );
  late final i3.CloudAuthProjects cloudAuthProjects = i3.CloudAuthProjects(
    this,
  );
  late final i3.CloudAuthApis cloudAuthApis = i3.CloudAuthApis(this);
  late final i3.CloudAuthFunctions cloudAuthFunctions = i3.CloudAuthFunctions(
    this,
  );
  late final i4.CloudAuthMeta cloudAuthMeta = i4.CloudAuthMeta(this);
  late final i5.CloudAuthCryptoKeys cloudAuthCryptoKeys =
      i5.CloudAuthCryptoKeys(this);
  late final i5.CloudAuthSessions cloudAuthSessions = i5.CloudAuthSessions(
    this,
  );
  late final i5.CloudAuthOtpCodes cloudAuthOtpCodes = i5.CloudAuthOtpCodes(
    this,
  );
  late final i5.CloudAuthCorks cloudAuthCorks = i5.CloudAuthCorks(this);
  late final i2.CedarPolicies cedarPolicies = i2.CedarPolicies(this);
  late final i2.CedarPolicyTemplates cedarPolicyTemplates =
      i2.CedarPolicyTemplates(this);
  late final i2.CedarPolicyTemplateLinks cedarPolicyTemplateLinks =
      i2.CedarPolicyTemplateLinks(this);
  late final i2.CedarAuthorizationLogs cedarAuthorizationLogs =
      i2.CedarAuthorizationLogs(this);
  late final i6.$TasksTable tasks = i6.$TasksTable(this);
  i2.CedarDrift get cedarDrift =>
      i7.ReadDatabaseContainer(this).accessor<i2.CedarDrift>(i2.CedarDrift.new);
  i5.CloudAuthCoreDrift get cloudAuthCoreDrift => i7.ReadDatabaseContainer(
    this,
  ).accessor<i5.CloudAuthCoreDrift>(i5.CloudAuthCoreDrift.new);
  i4.CloudAuthMetaDrift get cloudAuthMetaDrift => i7.ReadDatabaseContainer(
    this,
  ).accessor<i4.CloudAuthMetaDrift>(i4.CloudAuthMetaDrift.new);
  i3.CloudAuthProjectsDrift get cloudAuthProjectsDrift =>
      i7.ReadDatabaseContainer(
        this,
      ).accessor<i3.CloudAuthProjectsDrift>(i3.CloudAuthProjectsDrift.new);
  i1.CloudAuthUsersDrift get cloudAuthUsersDrift => i7.ReadDatabaseContainer(
    this,
  ).accessor<i1.CloudAuthUsersDrift>(i1.CloudAuthUsersDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
    cloudAuthUsers,
    cedarTypes,
    cedarEntities,
    i1.cloudAuthUsersCreateTrg,
    cedarRelationships,
    i1.cloudAuthUsersDeleteTrg,
    cloudAuthUserEmails,
    cloudAuthUserPhoneNumbers,
    cloudAuthUsersView,
    cloudAuthProjects,
    cloudAuthApis,
    i3.cloudAuthApisProjectIdx,
    i3.cloudAuthApisCreateTrg,
    i3.cloudAuthApisDeleteTrg,
    cloudAuthFunctions,
    i3.cloudAuthFunctionsApiIdx,
    i3.cloudAuthFunctionsCreateTrg,
    i3.cloudAuthFunctionsDeleteTrg,
    cloudAuthMeta,
    i4.$drift0,
    cloudAuthCryptoKeys,
    i5.cloudAuthCryptoKeysExternalCryptoKeyIdIdx,
    cloudAuthSessions,
    i5.cloudAuthSessionsUserIdx,
    i5.cloudAuthSessionsCryptoKeyIdx,
    i5.cloudAuthSessionsExternalSessionIdIdx,
    i5.cloudAuthSessionsUpdateTimeTrg,
    cloudAuthOtpCodes,
    i5.cloudAuthOtpCodesSessionIdIdx,
    cloudAuthCorks,
    i5.cloudAuthCorksCryptoKeyIdx,
    i5.cloudAuthCorksBearerIdx,
    i5.cloudAuthCorksAudienceIdx,
    i5.cloudAuthCorksIssuerIdx,
    i2.cedarRelationshipsFkEntityIdx,
    i2.cedarRelationshipsFkParentIdx,
    cedarPolicies,
    cedarPolicyTemplates,
    cedarPolicyTemplateLinks,
    i2.cedarPolicyTemplateLinksFkTemplateIdIdx,
    i2.cedarPolicyTemplateLinksFkPrincipalIdx,
    i2.cedarPolicyTemplateLinksFkResourceIdx,
    cedarAuthorizationLogs,
    tasks,
  ];
  @override
  i0.StreamQueryUpdateRules
  get streamUpdateRules => const i0.StreamQueryUpdateRules([
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cloud_auth_user_emails', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cloud_auth_user_emails', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate(
          'cloud_auth_user_phone_numbers',
          kind: i0.UpdateKind.delete,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate(
          'cloud_auth_user_phone_numbers',
          kind: i0.UpdateKind.update,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_projects',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('cloud_auth_apis', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_projects',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('cloud_auth_apis', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_apis',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_apis',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_apis',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cloud_auth_functions', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_apis',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cloud_auth_functions', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_functions',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_functions',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cloud_auth_sessions', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_users',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cloud_auth_sessions', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_crypto_keys',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cloud_auth_sessions', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_crypto_keys',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cloud_auth_sessions', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_sessions',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cloud_auth_sessions', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_sessions',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cloud_auth_otp_codes', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_sessions',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cloud_auth_otp_codes', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_crypto_keys',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cloud_auth_crypto_keys',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('cloud_auth_corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_policy_templates',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate(
          'cedar_policy_template_links',
          kind: i0.UpdateKind.delete,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_policy_templates',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate(
          'cedar_policy_template_links',
          kind: i0.UpdateKind.update,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate(
          'cedar_policy_template_links',
          kind: i0.UpdateKind.delete,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate(
          'cedar_policy_template_links',
          kind: i0.UpdateKind.delete,
        ),
      ],
    ),
  ]);
}

class $TaskDatabaseManager {
  final $TaskDatabase _db;
  $TaskDatabaseManager(this._db);
  i1.$CloudAuthUsersTableManager get cloudAuthUsers =>
      i1.$CloudAuthUsersTableManager(_db, _db.cloudAuthUsers);
  i2.$CedarTypesTableManager get cedarTypes =>
      i2.$CedarTypesTableManager(_db, _db.cedarTypes);
  i2.$CedarEntitiesTableManager get cedarEntities =>
      i2.$CedarEntitiesTableManager(_db, _db.cedarEntities);
  i2.$CedarRelationshipsTableManager get cedarRelationships =>
      i2.$CedarRelationshipsTableManager(_db, _db.cedarRelationships);
  i1.$CloudAuthUserEmailsTableManager get cloudAuthUserEmails =>
      i1.$CloudAuthUserEmailsTableManager(_db, _db.cloudAuthUserEmails);
  i1.$CloudAuthUserPhoneNumbersTableManager get cloudAuthUserPhoneNumbers =>
      i1.$CloudAuthUserPhoneNumbersTableManager(
        _db,
        _db.cloudAuthUserPhoneNumbers,
      );
  i3.$CloudAuthProjectsTableManager get cloudAuthProjects =>
      i3.$CloudAuthProjectsTableManager(_db, _db.cloudAuthProjects);
  i3.$CloudAuthApisTableManager get cloudAuthApis =>
      i3.$CloudAuthApisTableManager(_db, _db.cloudAuthApis);
  i3.$CloudAuthFunctionsTableManager get cloudAuthFunctions =>
      i3.$CloudAuthFunctionsTableManager(_db, _db.cloudAuthFunctions);
  i4.$CloudAuthMetaTableManager get cloudAuthMeta =>
      i4.$CloudAuthMetaTableManager(_db, _db.cloudAuthMeta);
  i5.$CloudAuthCryptoKeysTableManager get cloudAuthCryptoKeys =>
      i5.$CloudAuthCryptoKeysTableManager(_db, _db.cloudAuthCryptoKeys);
  i5.$CloudAuthSessionsTableManager get cloudAuthSessions =>
      i5.$CloudAuthSessionsTableManager(_db, _db.cloudAuthSessions);
  i5.$CloudAuthOtpCodesTableManager get cloudAuthOtpCodes =>
      i5.$CloudAuthOtpCodesTableManager(_db, _db.cloudAuthOtpCodes);
  i5.$CloudAuthCorksTableManager get cloudAuthCorks =>
      i5.$CloudAuthCorksTableManager(_db, _db.cloudAuthCorks);
  i2.$CedarPoliciesTableManager get cedarPolicies =>
      i2.$CedarPoliciesTableManager(_db, _db.cedarPolicies);
  i2.$CedarPolicyTemplatesTableManager get cedarPolicyTemplates =>
      i2.$CedarPolicyTemplatesTableManager(_db, _db.cedarPolicyTemplates);
  i2.$CedarPolicyTemplateLinksTableManager get cedarPolicyTemplateLinks => i2
      .$CedarPolicyTemplateLinksTableManager(_db, _db.cedarPolicyTemplateLinks);
  i2.$CedarAuthorizationLogsTableManager get cedarAuthorizationLogs =>
      i2.$CedarAuthorizationLogsTableManager(_db, _db.cedarAuthorizationLogs);
  i6.$$TasksTableTableManager get tasks =>
      i6.$$TasksTableTableManager(_db, _db.tasks);
}

class $TasksTable extends i8.Tasks with i0.TableInfo<$TasksTable, i6.Task> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: i0.DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const i0.VerificationMeta _titleMeta = const i0.VerificationMeta(
    'title',
  );
  @override
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: i0.GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final i0.GeneratedColumnWithTypeConverter<i8.Priority, String> priority =
      i0.GeneratedColumn<String>(
        'priority',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<i8.Priority>(i6.$TasksTable.$converterpriority);
  static const i0.VerificationMeta _completedMeta = const i0.VerificationMeta(
    'completed',
  );
  @override
  late final i0.GeneratedColumn<bool> completed = i0.GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: i0.DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const i9.Constant(false),
  );
  @override
  List<i0.GeneratedColumn> get $columns => [id, title, priority, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i6.Task> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i6.Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i6.Task(
      id:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      priority: i6.$TasksTable.$converterpriority.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}priority'],
        )!,
      ),
      completed:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.bool,
            data['${effectivePrefix}completed'],
          )!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static i0.JsonTypeConverter2<i8.Priority, String, String> $converterpriority =
      const i0.EnumNameConverter<i8.Priority>(i8.Priority.values);
}

class Task extends i0.DataClass implements i0.Insertable<i6.Task> {
  final int id;
  final String title;
  final i8.Priority priority;
  final bool completed;
  const Task({
    required this.id,
    required this.title,
    required this.priority,
    required this.completed,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['title'] = i0.Variable<String>(title);
    {
      map['priority'] = i0.Variable<String>(
        i6.$TasksTable.$converterpriority.toSql(priority),
      );
    }
    map['completed'] = i0.Variable<bool>(completed);
    return map;
  }

  i6.TasksCompanion toCompanion(bool nullToAbsent) {
    return i6.TasksCompanion(
      id: i0.Value(id),
      title: i0.Value(title),
      priority: i0.Value(priority),
      completed: i0.Value(completed),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      priority: i6.$TasksTable.$converterpriority.fromJson(
        serializer.fromJson<String>(json['priority']),
      ),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'priority': serializer.toJson<String>(
        i6.$TasksTable.$converterpriority.toJson(priority),
      ),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  i6.Task copyWith({
    int? id,
    String? title,
    i8.Priority? priority,
    bool? completed,
  }) => i6.Task(
    id: id ?? this.id,
    title: title ?? this.title,
    priority: priority ?? this.priority,
    completed: completed ?? this.completed,
  );
  Task copyWithCompanion(i6.TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      priority: data.priority.present ? data.priority.value : this.priority,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('priority: $priority, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, priority, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i6.Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.priority == this.priority &&
          other.completed == this.completed);
}

class TasksCompanion extends i0.UpdateCompanion<i6.Task> {
  final i0.Value<int> id;
  final i0.Value<String> title;
  final i0.Value<i8.Priority> priority;
  final i0.Value<bool> completed;
  const TasksCompanion({
    this.id = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.priority = const i0.Value.absent(),
    this.completed = const i0.Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const i0.Value.absent(),
    required String title,
    required i8.Priority priority,
    this.completed = const i0.Value.absent(),
  }) : title = i0.Value(title),
       priority = i0.Value(priority);
  static i0.Insertable<i6.Task> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? title,
    i0.Expression<String>? priority,
    i0.Expression<bool>? completed,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (priority != null) 'priority': priority,
      if (completed != null) 'completed': completed,
    });
  }

  i6.TasksCompanion copyWith({
    i0.Value<int>? id,
    i0.Value<String>? title,
    i0.Value<i8.Priority>? priority,
    i0.Value<bool>? completed,
  }) {
    return i6.TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (priority.present) {
      map['priority'] = i0.Variable<String>(
        i6.$TasksTable.$converterpriority.toSql(priority.value),
      );
    }
    if (completed.present) {
      map['completed'] = i0.Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('priority: $priority, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}
