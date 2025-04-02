// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i2;
import 'package:celest_cloud_auth/src/database/schema/projects.drift.dart'
    as i3;
import 'package:celest_cloud_auth/src/database/schema/meta.drift.dart' as i4;
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart' as i5;
import 'package:celest_backend/src/database/task_database.drift.dart' as i6;
import 'package:drift/internal/modular.dart' as i7;
import 'package:celest_backend/src/database/task_database.dart' as i8;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i9;

typedef $$TasksTableCreateCompanionBuilder = i6.TasksCompanion Function({
  i0.Value<int> id,
  required String title,
  required i8.Priority priority,
  i0.Value<bool> completed,
});
typedef $$TasksTableUpdateCompanionBuilder = i6.TasksCompanion Function({
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
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i8.Priority, i8.Priority, String>
      get priority => $composableBuilder(
          column: $table.priority,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => i0.ColumnFilters(column));
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
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed,
      builder: (column) => i0.ColumnOrderings(column));
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

class $$TasksTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i6.$TasksTable,
    i6.Task,
    i6.$$TasksTableFilterComposer,
    i6.$$TasksTableOrderingComposer,
    i6.$$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (i6.Task, i0.BaseReferences<i0.GeneratedDatabase, i6.$TasksTable, i6.Task>),
    i6.Task,
    i0.PrefetchHooks Function()> {
  $$TasksTableTableManager(i0.GeneratedDatabase db, i6.$TasksTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i6.$$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i6.$$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i6.$$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> title = const i0.Value.absent(),
            i0.Value<i8.Priority> priority = const i0.Value.absent(),
            i0.Value<bool> completed = const i0.Value.absent(),
          }) =>
              i6.TasksCompanion(
            id: id,
            title: title,
            priority: priority,
            completed: completed,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String title,
            required i8.Priority priority,
            i0.Value<bool> completed = const i0.Value.absent(),
          }) =>
              i6.TasksCompanion.insert(
            id: id,
            title: title,
            priority: priority,
            completed: completed,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TasksTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i6.$TasksTable,
    i6.Task,
    i6.$$TasksTableFilterComposer,
    i6.$$TasksTableOrderingComposer,
    i6.$$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (i6.Task, i0.BaseReferences<i0.GeneratedDatabase, i6.$TasksTable, i6.Task>),
    i6.Task,
    i0.PrefetchHooks Function()>;

abstract class $TaskDatabase extends i0.GeneratedDatabase {
  $TaskDatabase(i0.QueryExecutor e) : super(e);
  $TaskDatabaseManager get managers => $TaskDatabaseManager(this);
  late final i1.Users users = i1.Users(this);
  late final i2.CedarTypes cedarTypes = i2.CedarTypes(this);
  late final i2.CedarEntities cedarEntities = i2.CedarEntities(this);
  late final i2.CedarRelationships cedarRelationships =
      i2.CedarRelationships(this);
  late final i1.UserEmails userEmails = i1.UserEmails(this);
  late final i1.UserPhoneNumbers userPhoneNumbers = i1.UserPhoneNumbers(this);
  late final i3.CelestProjects celestProjects = i3.CelestProjects(this);
  late final i3.CelestApis celestApis = i3.CelestApis(this);
  late final i3.CelestFunctions celestFunctions = i3.CelestFunctions(this);
  late final i4.CelestCloudAuthMeta celestCloudAuthMeta =
      i4.CelestCloudAuthMeta(this);
  late final i2.CedarPolicies cedarPolicies = i2.CedarPolicies(this);
  late final i2.CedarPolicyTemplates cedarPolicyTemplates =
      i2.CedarPolicyTemplates(this);
  late final i2.CedarPolicyTemplateLinks cedarPolicyTemplateLinks =
      i2.CedarPolicyTemplateLinks(this);
  late final i2.CedarAuthorizationLogs cedarAuthorizationLogs =
      i2.CedarAuthorizationLogs(this);
  late final i5.CryptoKeys cryptoKeys = i5.CryptoKeys(this);
  late final i5.Sessions sessions = i5.Sessions(this);
  late final i5.OtpCodes otpCodes = i5.OtpCodes(this);
  late final i5.Corks corks = i5.Corks(this);
  late final i6.$TasksTable tasks = i6.$TasksTable(this);
  i5.AuthDrift get authDrift =>
      i7.ReadDatabaseContainer(this).accessor<i5.AuthDrift>(i5.AuthDrift.new);
  i2.CedarDrift get cedarDrift =>
      i7.ReadDatabaseContainer(this).accessor<i2.CedarDrift>(i2.CedarDrift.new);
  i4.MetaDrift get metaDrift =>
      i7.ReadDatabaseContainer(this).accessor<i4.MetaDrift>(i4.MetaDrift.new);
  i3.ProjectsDrift get projectsDrift => i7.ReadDatabaseContainer(this)
      .accessor<i3.ProjectsDrift>(i3.ProjectsDrift.new);
  i1.UsersDrift get usersDrift =>
      i7.ReadDatabaseContainer(this).accessor<i1.UsersDrift>(i1.UsersDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        cedarTypes,
        cedarEntities,
        i1.usersCreate,
        cedarRelationships,
        i1.usersDelete,
        userEmails,
        userPhoneNumbers,
        celestProjects,
        celestApis,
        i3.celestApisProjectIdx,
        i3.celestApisTriggerCreate,
        i3.celestApisTriggerDelete,
        celestFunctions,
        i3.celestFunctionsApiIdx,
        i3.celestFunctionsTriggerCreate,
        i3.celestFunctionsTriggerDelete,
        celestCloudAuthMeta,
        i2.cedarRelationshipsFkEntityIdx,
        i2.cedarRelationshipsFkParentIdx,
        cedarPolicies,
        cedarPolicyTemplates,
        cedarPolicyTemplateLinks,
        i2.cedarPolicyTemplateLinksFkTemplateIdIdx,
        i2.cedarPolicyTemplateLinksFkPrincipalIdx,
        i2.cedarPolicyTemplateLinksFkResourceIdx,
        cedarAuthorizationLogs,
        cryptoKeys,
        i5.cryptoKeysExternalCryptoKeyIdIdx,
        sessions,
        i5.sessionsUserIdx,
        i5.sessionsCryptoKeyIdx,
        i5.sessionsExternalSessionIdIdx,
        i5.authSessionsUpdateTime,
        otpCodes,
        i5.otpCodesSessionIdx,
        corks,
        i5.corksCryptoKeyIdx,
        i5.corksBearerIdx,
        i5.corksAudienceIdx,
        i5.corksIssuerIdx,
        tasks
      ];
  @override
  i0.StreamQueryUpdateRules get streamUpdateRules =>
      const i0.StreamQueryUpdateRules(
        [
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.insert),
            result: [
              i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
              i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('user_emails', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('user_emails', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('user_phone_numbers', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('user_phone_numbers', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_projects',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('celest_apis', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_projects',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('celest_apis', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_apis',
                limitUpdateKind: i0.UpdateKind.insert),
            result: [
              i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_apis',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
              i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_apis',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('celest_functions', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_apis',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('celest_functions', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_functions',
                limitUpdateKind: i0.UpdateKind.insert),
            result: [
              i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('celest_functions',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
              i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_policy_templates',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_policy_template_links',
                  kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_policy_templates',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('cedar_policy_template_links',
                  kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_policy_template_links',
                  kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cedar_policy_template_links',
                  kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('sessions', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('users',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('sessions', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('crypto_keys',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('sessions', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('crypto_keys',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('sessions', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('sessions',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('sessions', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('sessions',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('otp_codes', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('sessions',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('otp_codes', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('crypto_keys',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('crypto_keys',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('cedar_entities',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('corks', kind: i0.UpdateKind.update),
            ],
          ),
        ],
      );
}

class $TaskDatabaseManager {
  final $TaskDatabase _db;
  $TaskDatabaseManager(this._db);
  i1.$UsersTableManager get users => i1.$UsersTableManager(_db, _db.users);
  i2.$CedarTypesTableManager get cedarTypes =>
      i2.$CedarTypesTableManager(_db, _db.cedarTypes);
  i2.$CedarEntitiesTableManager get cedarEntities =>
      i2.$CedarEntitiesTableManager(_db, _db.cedarEntities);
  i2.$CedarRelationshipsTableManager get cedarRelationships =>
      i2.$CedarRelationshipsTableManager(_db, _db.cedarRelationships);
  i1.$UserEmailsTableManager get userEmails =>
      i1.$UserEmailsTableManager(_db, _db.userEmails);
  i1.$UserPhoneNumbersTableManager get userPhoneNumbers =>
      i1.$UserPhoneNumbersTableManager(_db, _db.userPhoneNumbers);
  i3.$CelestProjectsTableManager get celestProjects =>
      i3.$CelestProjectsTableManager(_db, _db.celestProjects);
  i3.$CelestApisTableManager get celestApis =>
      i3.$CelestApisTableManager(_db, _db.celestApis);
  i3.$CelestFunctionsTableManager get celestFunctions =>
      i3.$CelestFunctionsTableManager(_db, _db.celestFunctions);
  i4.$CelestCloudAuthMetaTableManager get celestCloudAuthMeta =>
      i4.$CelestCloudAuthMetaTableManager(_db, _db.celestCloudAuthMeta);
  i2.$CedarPoliciesTableManager get cedarPolicies =>
      i2.$CedarPoliciesTableManager(_db, _db.cedarPolicies);
  i2.$CedarPolicyTemplatesTableManager get cedarPolicyTemplates =>
      i2.$CedarPolicyTemplatesTableManager(_db, _db.cedarPolicyTemplates);
  i2.$CedarPolicyTemplateLinksTableManager get cedarPolicyTemplateLinks => i2
      .$CedarPolicyTemplateLinksTableManager(_db, _db.cedarPolicyTemplateLinks);
  i2.$CedarAuthorizationLogsTableManager get cedarAuthorizationLogs =>
      i2.$CedarAuthorizationLogsTableManager(_db, _db.cedarAuthorizationLogs);
  i5.$CryptoKeysTableManager get cryptoKeys =>
      i5.$CryptoKeysTableManager(_db, _db.cryptoKeys);
  i5.$SessionsTableManager get sessions =>
      i5.$SessionsTableManager(_db, _db.sessions);
  i5.$OtpCodesTableManager get otpCodes =>
      i5.$OtpCodesTableManager(_db, _db.otpCodes);
  i5.$CorksTableManager get corks => i5.$CorksTableManager(_db, _db.corks);
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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  @override
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: i0.GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 100),
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true);
  static const i0.VerificationMeta _priorityMeta =
      const i0.VerificationMeta('priority');
  @override
  late final i0.GeneratedColumnWithTypeConverter<i8.Priority, String> priority =
      i0.GeneratedColumn<String>('priority', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<i8.Priority>(i6.$TasksTable.$converterpriority);
  static const i0.VerificationMeta _completedMeta =
      const i0.VerificationMeta('completed');
  @override
  late final i0.GeneratedColumn<bool> completed = i0.GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'CHECK ("completed" IN (0, 1))'),
      defaultValue: const i9.Constant(false));
  @override
  List<i0.GeneratedColumn> get $columns => [id, title, priority, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i6.Task> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_priorityMeta, const i0.VerificationResult.success());
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i6.Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i6.Task(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      priority: i6.$TasksTable.$converterpriority.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}priority'])!),
      completed: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}completed'])!,
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
  const Task(
      {required this.id,
      required this.title,
      required this.priority,
      required this.completed});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['title'] = i0.Variable<String>(title);
    {
      map['priority'] = i0.Variable<String>(
          i6.$TasksTable.$converterpriority.toSql(priority));
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

  factory Task.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      priority: i6.$TasksTable.$converterpriority
          .fromJson(serializer.fromJson<String>(json['priority'])),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'priority': serializer
          .toJson<String>(i6.$TasksTable.$converterpriority.toJson(priority)),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  i6.Task copyWith(
          {int? id, String? title, i8.Priority? priority, bool? completed}) =>
      i6.Task(
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
  })  : title = i0.Value(title),
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

  i6.TasksCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? title,
      i0.Value<i8.Priority>? priority,
      i0.Value<bool>? completed}) {
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
          i6.$TasksTable.$converterpriority.toSql(priority.value));
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
