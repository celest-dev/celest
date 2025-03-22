// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i2;
import 'package:celest_cloud_auth/src/database/schema/projects.drift.dart'
    as i3;
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart' as i4;
import 'package:drift/internal/modular.dart' as i5;

abstract class $AuthDatabase extends i0.GeneratedDatabase {
  $AuthDatabase(i0.QueryExecutor e) : super(e);
  $AuthDatabaseManager get managers => $AuthDatabaseManager(this);
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
  late final i2.CedarPolicies cedarPolicies = i2.CedarPolicies(this);
  late final i2.CedarPolicyTemplates cedarPolicyTemplates =
      i2.CedarPolicyTemplates(this);
  late final i2.CedarPolicyTemplateLinks cedarPolicyTemplateLinks =
      i2.CedarPolicyTemplateLinks(this);
  late final i2.CedarAuthorizationLogs cedarAuthorizationLogs =
      i2.CedarAuthorizationLogs(this);
  late final i4.CryptoKeys cryptoKeys = i4.CryptoKeys(this);
  late final i4.Sessions sessions = i4.Sessions(this);
  late final i4.OtpCodes otpCodes = i4.OtpCodes(this);
  late final i4.Corks corks = i4.Corks(this);
  i4.AuthDrift get authDrift =>
      i5.ReadDatabaseContainer(this).accessor<i4.AuthDrift>(i4.AuthDrift.new);
  i2.CedarDrift get cedarDrift =>
      i5.ReadDatabaseContainer(this).accessor<i2.CedarDrift>(i2.CedarDrift.new);
  i3.ProjectsDrift get projectsDrift => i5.ReadDatabaseContainer(this)
      .accessor<i3.ProjectsDrift>(i3.ProjectsDrift.new);
  i1.UsersDrift get usersDrift =>
      i5.ReadDatabaseContainer(this).accessor<i1.UsersDrift>(i1.UsersDrift.new);
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
        i4.cryptoKeysExternalCryptoKeyIdIdx,
        sessions,
        i4.sessionsUserIdx,
        i4.sessionsCryptoKeyIdx,
        i4.sessionsExternalSessionIdIdx,
        i4.authSessionsUpdateTime,
        otpCodes,
        i4.otpCodesSessionIdx,
        corks,
        i4.corksCryptoKeyIdx,
        i4.corksBearerIdx,
        i4.corksAudienceIdx,
        i4.corksIssuerIdx
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

class $AuthDatabaseManager {
  final $AuthDatabase _db;
  $AuthDatabaseManager(this._db);
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
  i2.$CedarPoliciesTableManager get cedarPolicies =>
      i2.$CedarPoliciesTableManager(_db, _db.cedarPolicies);
  i2.$CedarPolicyTemplatesTableManager get cedarPolicyTemplates =>
      i2.$CedarPolicyTemplatesTableManager(_db, _db.cedarPolicyTemplates);
  i2.$CedarPolicyTemplateLinksTableManager get cedarPolicyTemplateLinks => i2
      .$CedarPolicyTemplateLinksTableManager(_db, _db.cedarPolicyTemplateLinks);
  i2.$CedarAuthorizationLogsTableManager get cedarAuthorizationLogs =>
      i2.$CedarAuthorizationLogsTableManager(_db, _db.cedarAuthorizationLogs);
  i4.$CryptoKeysTableManager get cryptoKeys =>
      i4.$CryptoKeysTableManager(_db, _db.cryptoKeys);
  i4.$SessionsTableManager get sessions =>
      i4.$SessionsTableManager(_db, _db.sessions);
  i4.$OtpCodesTableManager get otpCodes =>
      i4.$OtpCodesTableManager(_db, _db.otpCodes);
  i4.$CorksTableManager get corks => i4.$CorksTableManager(_db, _db.corks);
}
