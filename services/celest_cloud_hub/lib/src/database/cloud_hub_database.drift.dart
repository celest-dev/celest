// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i2;
import 'package:celest_cloud_auth/src/database/schema/projects.drift.dart'
    as i3;
import 'package:celest_cloud_auth/src/database/schema/meta.drift.dart' as i4;
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart' as i5;
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart'
    as i6;
import 'package:celest_cloud_hub/src/database/schema/operations.drift.dart'
    as i7;
import 'package:drift/internal/modular.dart' as i8;

abstract class $CloudHubDatabase extends i0.GeneratedDatabase {
  $CloudHubDatabase(i0.QueryExecutor e) : super(e);
  $CloudHubDatabaseManager get managers => $CloudHubDatabaseManager(this);
  late final i1.Users users = i1.Users(this);
  late final i2.CedarTypes cedarTypes = i2.CedarTypes(this);
  late final i2.CedarEntities cedarEntities = i2.CedarEntities(this);
  late final i2.CedarRelationships cedarRelationships = i2.CedarRelationships(
    this,
  );
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
  late final i6.ProjectEnvironments projectEnvironments =
      i6.ProjectEnvironments(this);
  late final i6.ProjectEnvironmentAsts projectEnvironmentAsts =
      i6.ProjectEnvironmentAsts(this);
  late final i6.ProjectEnvironmentAssets projectEnvironmentAssets =
      i6.ProjectEnvironmentAssets(this);
  late final i7.CelestOperations celestOperations = i7.CelestOperations(this);
  i7.OperationsDrift get operationsDrift => i8.ReadDatabaseContainer(
    this,
  ).accessor<i7.OperationsDrift>(i7.OperationsDrift.new);
  i5.AuthDrift get authDrift =>
      i8.ReadDatabaseContainer(this).accessor<i5.AuthDrift>(i5.AuthDrift.new);
  i2.CedarDrift get cedarDrift =>
      i8.ReadDatabaseContainer(this).accessor<i2.CedarDrift>(i2.CedarDrift.new);
  i4.MetaDrift get metaDrift =>
      i8.ReadDatabaseContainer(this).accessor<i4.MetaDrift>(i4.MetaDrift.new);
  i3.ProjectsDrift get projectsDrift => i8.ReadDatabaseContainer(
    this,
  ).accessor<i3.ProjectsDrift>(i3.ProjectsDrift.new);
  i1.UsersDrift get usersDrift =>
      i8.ReadDatabaseContainer(this).accessor<i1.UsersDrift>(i1.UsersDrift.new);
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
    projectEnvironments,
    i6.projectEnvironmentsTriggerUpdateTime,
    projectEnvironmentAsts,
    projectEnvironmentAssets,
    celestOperations,
  ];
  @override
  i0.StreamQueryUpdateRules
  get streamUpdateRules => const i0.StreamQueryUpdateRules([
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'users',
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
        'users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('user_emails', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('user_emails', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('user_phone_numbers', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('user_phone_numbers', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_projects',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('celest_apis', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_projects',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('celest_apis', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_apis',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_apis',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_apis',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('celest_functions', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_apis',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('celest_functions', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_functions',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'celest_functions',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
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
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('sessions', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('sessions', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'crypto_keys',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('sessions', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'crypto_keys',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('sessions', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'sessions',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('sessions', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'sessions',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('otp_codes', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'sessions',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('otp_codes', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'crypto_keys',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'crypto_keys',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('corks', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('project_environments', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('project_environment_asts', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('project_environment_asts', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate(
          'project_environment_assets',
          kind: i0.UpdateKind.delete,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate(
          'project_environment_assets',
          kind: i0.UpdateKind.update,
        ),
      ],
    ),
  ]);
}

class $CloudHubDatabaseManager {
  final $CloudHubDatabase _db;
  $CloudHubDatabaseManager(this._db);
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
  i6.$ProjectEnvironmentsTableManager get projectEnvironments =>
      i6.$ProjectEnvironmentsTableManager(_db, _db.projectEnvironments);
  i6.$ProjectEnvironmentAstsTableManager get projectEnvironmentAsts =>
      i6.$ProjectEnvironmentAstsTableManager(_db, _db.projectEnvironmentAsts);
  i6.$ProjectEnvironmentAssetsTableManager get projectEnvironmentAssets => i6
      .$ProjectEnvironmentAssetsTableManager(_db, _db.projectEnvironmentAssets);
  i7.$CelestOperationsTableManager get celestOperations =>
      i7.$CelestOperationsTableManager(_db, _db.celestOperations);
}
