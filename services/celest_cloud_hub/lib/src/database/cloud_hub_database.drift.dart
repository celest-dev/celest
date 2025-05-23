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
import 'package:celest_cloud_hub/src/database/schema/user_memberships.drift.dart'
    as i6;
import 'package:celest_cloud_hub/src/database/schema/organizations.drift.dart'
    as i7;
import 'package:celest_cloud_hub/src/database/schema/projects.drift.dart' as i8;
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart'
    as i9;
import 'package:celest_cloud_hub/src/database/schema/operations.drift.dart'
    as i10;
import 'package:drift/internal/modular.dart' as i11;

abstract class $CloudHubDatabase extends i0.GeneratedDatabase {
  $CloudHubDatabase(i0.QueryExecutor e) : super(e);
  $CloudHubDatabaseManager get managers => $CloudHubDatabaseManager(this);
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
  late final i6.UserMemberships userMemberships = i6.UserMemberships(this);
  late final i7.Organizations organizations = i7.Organizations(this);
  late final i8.Projects projects = i8.Projects(this);
  late final i9.ProjectEnvironments projectEnvironments =
      i9.ProjectEnvironments(this);
  late final i9.ProjectEnvironmentAsts projectEnvironmentAsts =
      i9.ProjectEnvironmentAsts(this);
  late final i9.ProjectEnvironmentAssets projectEnvironmentAssets =
      i9.ProjectEnvironmentAssets(this);
  late final i9.TursoDatabases tursoDatabases = i9.TursoDatabases(this);
  late final i9.ProjectEnvironmentStates projectEnvironmentStates =
      i9.ProjectEnvironmentStates(this);
  late final i10.Operations operations = i10.Operations(this);
  i10.OperationsDrift get operationsDrift => i11.ReadDatabaseContainer(
    this,
  ).accessor<i10.OperationsDrift>(i10.OperationsDrift.new);
  i7.OrganizationsDrift get organizationsDrift => i11.ReadDatabaseContainer(
    this,
  ).accessor<i7.OrganizationsDrift>(i7.OrganizationsDrift.new);
  i8.ProjectsDrift get projectsDrift => i11.ReadDatabaseContainer(
    this,
  ).accessor<i8.ProjectsDrift>(i8.ProjectsDrift.new);
  i9.ProjectEnvironmentsDrift get projectEnvironmentsDrift =>
      i11.ReadDatabaseContainer(
        this,
      ).accessor<i9.ProjectEnvironmentsDrift>(i9.ProjectEnvironmentsDrift.new);
  i6.UserMembershipsDrift get userMembershipsDrift => i11.ReadDatabaseContainer(
    this,
  ).accessor<i6.UserMembershipsDrift>(i6.UserMembershipsDrift.new);
  i2.CedarDrift get cedarDrift => i11.ReadDatabaseContainer(
    this,
  ).accessor<i2.CedarDrift>(i2.CedarDrift.new);
  i5.CloudAuthCoreDrift get cloudAuthCoreDrift => i11.ReadDatabaseContainer(
    this,
  ).accessor<i5.CloudAuthCoreDrift>(i5.CloudAuthCoreDrift.new);
  i4.CloudAuthMetaDrift get cloudAuthMetaDrift => i11.ReadDatabaseContainer(
    this,
  ).accessor<i4.CloudAuthMetaDrift>(i4.CloudAuthMetaDrift.new);
  i3.CloudAuthProjectsDrift get cloudAuthProjectsDrift =>
      i11.ReadDatabaseContainer(
        this,
      ).accessor<i3.CloudAuthProjectsDrift>(i3.CloudAuthProjectsDrift.new);
  i1.CloudAuthUsersDrift get cloudAuthUsersDrift => i11.ReadDatabaseContainer(
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
    userMemberships,
    i6.userMembershipsParentIdx,
    i6.userMembershipsCreateTrg,
    i6.userMembershipsUpdateTrg,
    i6.userMembershipsDeleteTrg,
    organizations,
    i6.organizationsDeleteUserMembershipsTrg,
    projects,
    i6.projectsDeleteUserMembershipsTrg,
    projectEnvironments,
    i6.projectEnvironmentsDeleteUserMembershipsTrg,
    i9.projectEnvironmentsParentIdx,
    i9.projectEnvironmentsUpdateTimeTrg,
    i9.projectEnvironmentsCreateTrg,
    i9.projectEnvironmentsSetParentTrg,
    i9.projectEnvironmentsDeleteTrg,
    projectEnvironmentAsts,
    projectEnvironmentAssets,
    tursoDatabases,
    projectEnvironmentStates,
    i9.idxProjectEnvironmentTursoDatabase,
    i8.projectsFkParentIdx,
    i8.projectsUpdateTimeTrg,
    i8.projectsCreateTrg,
    i8.projectsSetParentTrg,
    i8.projectsDeleteTrg,
    i7.organizationsParentIdx,
    i7.organizationsUpdateTime,
    i7.organizationsCreate,
    i7.organizationsCreateParent,
    i7.organizationsAddParent,
    i7.organizationsSetParent,
    i7.organizationsRemoveParent,
    i7.organizationsDelete,
    operations,
    i10.operationsFkOwnerIdx,
    i10.operationsFkResourceIdx,
    i10.operationsTriggerCreate,
    i10.operationsTriggerCreateOwner,
    i10.operationsTriggerCreateResource,
    i10.operationsTriggerAddOwner,
    i10.operationsTriggerAddResource,
    i10.operationsTriggerSetOwner,
    i10.operationsTriggerSetResource,
    i10.operationsTriggerDelete,
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
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('user_memberships', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('user_memberships', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'user_memberships',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'user_memberships',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.update),
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'user_memberships',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('organizations', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('organizations', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('user_memberships', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('projects', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('projects', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('projects', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('projects', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [i0.TableUpdate('user_memberships', kind: i0.UpdateKind.delete)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('project_environments', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'cedar_entities',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('project_environments', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('project_environments', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'projects',
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
      result: [i0.TableUpdate('user_memberships', kind: i0.UpdateKind.delete)],
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
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
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
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'project_environments',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate(
          'project_environment_states',
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
          'project_environment_states',
          kind: i0.UpdateKind.update,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'turso_databases',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate(
          'project_environment_states',
          kind: i0.UpdateKind.delete,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'turso_databases',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate(
          'project_environment_states',
          kind: i0.UpdateKind.update,
        ),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('projects', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert),
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [i0.TableUpdate('organizations', kind: i0.UpdateKind.update)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.insert)],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.insert,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.insert),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.update,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.update),
      ],
    ),
    i0.WritePropagation(
      on: i0.TableUpdateQuery.onTableName(
        'operations',
        limitUpdateKind: i0.UpdateKind.delete,
      ),
      result: [
        i0.TableUpdate('cedar_relationships', kind: i0.UpdateKind.delete),
        i0.TableUpdate('cedar_entities', kind: i0.UpdateKind.delete),
      ],
    ),
  ]);
}

class $CloudHubDatabaseManager {
  final $CloudHubDatabase _db;
  $CloudHubDatabaseManager(this._db);
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
  i6.$UserMembershipsTableManager get userMemberships =>
      i6.$UserMembershipsTableManager(_db, _db.userMemberships);
  i7.$OrganizationsTableManager get organizations =>
      i7.$OrganizationsTableManager(_db, _db.organizations);
  i8.$ProjectsTableManager get projects =>
      i8.$ProjectsTableManager(_db, _db.projects);
  i9.$ProjectEnvironmentsTableManager get projectEnvironments =>
      i9.$ProjectEnvironmentsTableManager(_db, _db.projectEnvironments);
  i9.$ProjectEnvironmentAstsTableManager get projectEnvironmentAsts =>
      i9.$ProjectEnvironmentAstsTableManager(_db, _db.projectEnvironmentAsts);
  i9.$ProjectEnvironmentAssetsTableManager get projectEnvironmentAssets => i9
      .$ProjectEnvironmentAssetsTableManager(_db, _db.projectEnvironmentAssets);
  i9.$TursoDatabasesTableManager get tursoDatabases =>
      i9.$TursoDatabasesTableManager(_db, _db.tursoDatabases);
  i9.$ProjectEnvironmentStatesTableManager get projectEnvironmentStates => i9
      .$ProjectEnvironmentStatesTableManager(_db, _db.projectEnvironmentStates);
  i10.$OperationsTableManager get operations =>
      i10.$OperationsTableManager(_db, _db.operations);
}
