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
import 'wrapper.drift.dart' as i6;
import 'package:drift/internal/modular.dart' as i7;

abstract class $WrapperDatabase extends i0.GeneratedDatabase {
  $WrapperDatabase(i0.QueryExecutor e) : super(e);
  $WrapperDatabaseManager get managers => $WrapperDatabaseManager(this);
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
  late final i6.Test test = i6.Test(this);
  i6.WrapperDrift get wrapperDrift => i7.ReadDatabaseContainer(
    this,
  ).accessor<i6.WrapperDrift>(i6.WrapperDrift.new);
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
    cloudAuthSessions,
    i5.cloudAuthCryptoKeysExternalCryptoKeyIdIdx,
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
    test,
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

class $WrapperDatabaseManager {
  final $WrapperDatabase _db;
  $WrapperDatabaseManager(this._db);
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
  i6.$TestTableManager get test => i6.$TestTableManager(_db, _db.test);
}
