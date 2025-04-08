// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:drift/src/runtime/api/runtime_api.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift.dart'
    as i2;
import 'package:drift/internal/modular.dart' as i3;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i4;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_projects.drift.dart'
    as i5;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_meta.drift.dart'
    as i6;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_core.drift.dart'
    as i7;

mixin $CloudAuthDatabaseAccessorsMixin
    on i0.DatabaseAccessor<i1.GeneratedDatabase> {
  i2.CloudAuthUsers get cloudAuthUsers =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.CloudAuthUsers>('cloud_auth_users');
  i4.CedarTypes get cedarTypes => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i4.CedarTypes>('cedar_types');
  i4.CedarEntities get cedarEntities =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarEntities>('cedar_entities');
  i4.CedarRelationships get cedarRelationships =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarRelationships>('cedar_relationships');
  i2.CloudAuthUserEmails get cloudAuthUserEmails =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.CloudAuthUserEmails>('cloud_auth_user_emails');
  i2.CloudAuthUserPhoneNumbers get cloudAuthUserPhoneNumbers =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.CloudAuthUserPhoneNumbers>(
              'cloud_auth_user_phone_numbers');
  i5.CloudAuthProjects get cloudAuthProjects =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i5.CloudAuthProjects>('cloud_auth_projects');
  i5.CloudAuthApis get cloudAuthApis =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i5.CloudAuthApis>('cloud_auth_apis');
  i5.CloudAuthFunctions get cloudAuthFunctions =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i5.CloudAuthFunctions>('cloud_auth_functions');
  i6.CloudAuthMeta get cloudAuthMeta =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i6.CloudAuthMeta>('cloud_auth_meta');
  i7.CloudAuthCryptoKeys get cloudAuthCryptoKeys =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i7.CloudAuthCryptoKeys>('cloud_auth_crypto_keys');
  i7.CloudAuthSessions get cloudAuthSessions =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i7.CloudAuthSessions>('cloud_auth_sessions');
  i7.CloudAuthOtpCodes get cloudAuthOtpCodes =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i7.CloudAuthOtpCodes>('cloud_auth_otp_codes');
  i7.CloudAuthCorks get cloudAuthCorks =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i7.CloudAuthCorks>('cloud_auth_corks');
  i4.CedarPolicies get cedarPolicies =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarPolicies>('cedar_policies');
  i4.CedarPolicyTemplates get cedarPolicyTemplates =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarPolicyTemplates>('cedar_policy_templates');
  i4.CedarPolicyTemplateLinks get cedarPolicyTemplateLinks =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarPolicyTemplateLinks>(
              'cedar_policy_template_links');
  i4.CedarAuthorizationLogs get cedarAuthorizationLogs =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarAuthorizationLogs>('cedar_authorization_logs');
  i4.CedarDrift get cedarDrift => i3.ReadDatabaseContainer(attachedDatabase)
      .accessor<i4.CedarDrift>(i4.CedarDrift.new);
  i7.CloudAuthCoreDrift get cloudAuthCoreDrift =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .accessor<i7.CloudAuthCoreDrift>(i7.CloudAuthCoreDrift.new);
  i6.CloudAuthMetaDrift get cloudAuthMetaDrift =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .accessor<i6.CloudAuthMetaDrift>(i6.CloudAuthMetaDrift.new);
  i5.CloudAuthProjectsDrift get cloudAuthProjectsDrift =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .accessor<i5.CloudAuthProjectsDrift>(i5.CloudAuthProjectsDrift.new);
  i2.CloudAuthUsersDrift get cloudAuthUsersDrift =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .accessor<i2.CloudAuthUsersDrift>(i2.CloudAuthUsersDrift.new);
}
