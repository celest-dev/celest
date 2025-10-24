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
import 'package:celest_backend/src/database/log_database.drift.dart' as i6;
import 'package:drift/internal/modular.dart' as i7;
import 'package:celest_backend/src/database/log_database.dart' as i8;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i9;

typedef $$LogsTableCreateCompanionBuilder =
    i6.LogsCompanion Function({
      i0.Value<int> id,
      required String message,
      i0.Value<DateTime> createdAt,
    });
typedef $$LogsTableUpdateCompanionBuilder =
    i6.LogsCompanion Function({
      i0.Value<int> id,
      i0.Value<String> message,
      i0.Value<DateTime> createdAt,
    });

class $$LogsTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i6.$LogsTable> {
  $$LogsTableFilterComposer({
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

  i0.ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $$LogsTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i6.$LogsTable> {
  $$LogsTableOrderingComposer({
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

  i0.ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $$LogsTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i6.$LogsTable> {
  $$LogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LogsTableTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i6.$LogsTable,
          i6.Log,
          i6.$$LogsTableFilterComposer,
          i6.$$LogsTableOrderingComposer,
          i6.$$LogsTableAnnotationComposer,
          $$LogsTableCreateCompanionBuilder,
          $$LogsTableUpdateCompanionBuilder,
          (
            i6.Log,
            i0.BaseReferences<i0.GeneratedDatabase, i6.$LogsTable, i6.Log>,
          ),
          i6.Log,
          i0.PrefetchHooks Function()
        > {
  $$LogsTableTableManager(i0.GeneratedDatabase db, i6.$LogsTable table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i6.$$LogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i6.$$LogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i6.$$LogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                i0.Value<String> message = const i0.Value.absent(),
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
              }) => i6.LogsCompanion(
                id: id,
                message: message,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                required String message,
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
              }) => i6.LogsCompanion.insert(
                id: id,
                message: message,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LogsTableProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i6.$LogsTable,
      i6.Log,
      i6.$$LogsTableFilterComposer,
      i6.$$LogsTableOrderingComposer,
      i6.$$LogsTableAnnotationComposer,
      $$LogsTableCreateCompanionBuilder,
      $$LogsTableUpdateCompanionBuilder,
      (i6.Log, i0.BaseReferences<i0.GeneratedDatabase, i6.$LogsTable, i6.Log>),
      i6.Log,
      i0.PrefetchHooks Function()
    >;

abstract class $LogDatabase extends i0.GeneratedDatabase {
  $LogDatabase(i0.QueryExecutor e) : super(e);
  $LogDatabaseManager get managers => $LogDatabaseManager(this);
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
  late final i6.$LogsTable logs = i6.$LogsTable(this);
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
    logs,
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

class $LogDatabaseManager {
  final $LogDatabase _db;
  $LogDatabaseManager(this._db);
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
  i6.$$LogsTableTableManager get logs =>
      i6.$$LogsTableTableManager(_db, _db.logs);
}

class $LogsTable extends i8.Logs with i0.TableInfo<$LogsTable, i6.Log> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogsTable(this.attachedDatabase, [this._alias]);
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
  static const i0.VerificationMeta _messageMeta = const i0.VerificationMeta(
    'message',
  );
  @override
  late final i0.GeneratedColumn<String> message = i0.GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    additionalChecks: i0.GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _createdAtMeta = const i0.VerificationMeta(
    'createdAt',
  );
  @override
  late final i0.GeneratedColumn<DateTime> createdAt =
      i0.GeneratedColumn<DateTime>(
        'created_at',
        aliasedName,
        false,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: i9.currentDateAndTime,
      );
  @override
  List<i0.GeneratedColumn> get $columns => [id, message, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'logs';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i6.Log> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i6.Log map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i6.Log(
      id: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      message: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LogsTable createAlias(String alias) {
    return $LogsTable(attachedDatabase, alias);
  }
}

class Log extends i0.DataClass implements i0.Insertable<i6.Log> {
  /// Primary key for the log entry.
  final int id;

  /// Human readable description of the event.
  final String message;

  /// Creation timestamp recorded for each entry.
  final DateTime createdAt;
  const Log({required this.id, required this.message, required this.createdAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['message'] = i0.Variable<String>(message);
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    return map;
  }

  i6.LogsCompanion toCompanion(bool nullToAbsent) {
    return i6.LogsCompanion(
      id: i0.Value(id),
      message: i0.Value(message),
      createdAt: i0.Value(createdAt),
    );
  }

  factory Log.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Log(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  i6.Log copyWith({int? id, String? message, DateTime? createdAt}) => i6.Log(
    id: id ?? this.id,
    message: message ?? this.message,
    createdAt: createdAt ?? this.createdAt,
  );
  Log copyWithCompanion(i6.LogsCompanion data) {
    return Log(
      id: data.id.present ? data.id.value : this.id,
      message: data.message.present ? data.message.value : this.message,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Log(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, message, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i6.Log &&
          other.id == this.id &&
          other.message == this.message &&
          other.createdAt == this.createdAt);
}

class LogsCompanion extends i0.UpdateCompanion<i6.Log> {
  final i0.Value<int> id;
  final i0.Value<String> message;
  final i0.Value<DateTime> createdAt;
  const LogsCompanion({
    this.id = const i0.Value.absent(),
    this.message = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
  });
  LogsCompanion.insert({
    this.id = const i0.Value.absent(),
    required String message,
    this.createdAt = const i0.Value.absent(),
  }) : message = i0.Value(message);
  static i0.Insertable<i6.Log> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? message,
    i0.Expression<DateTime>? createdAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  i6.LogsCompanion copyWith({
    i0.Value<int>? id,
    i0.Value<String>? message,
    i0.Value<DateTime>? createdAt,
  }) {
    return i6.LogsCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = i0.Variable<String>(message.value);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogsCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}
