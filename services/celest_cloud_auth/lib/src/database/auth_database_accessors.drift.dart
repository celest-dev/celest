// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:drift/src/runtime/api/runtime_api.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i4;
import 'package:celest_cloud_auth/src/database/schema/projects.drift.dart'
    as i5;
import 'package:celest_cloud_auth/src/database/schema/meta.drift.dart' as i6;
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart' as i7;

mixin $CloudAuthDatabaseAccessorsMixin
    on i0.DatabaseAccessor<i1.GeneratedDatabase> {
  i2.Users get users =>
      i3.ReadDatabaseContainer(attachedDatabase).resultSet<i2.Users>('users');
  i4.CedarTypes get cedarTypes => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i4.CedarTypes>('cedar_types');
  i4.CedarEntities get cedarEntities =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarEntities>('cedar_entities');
  i4.CedarRelationships get cedarRelationships =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.CedarRelationships>('cedar_relationships');
  i2.UserEmails get userEmails => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i2.UserEmails>('user_emails');
  i2.UserPhoneNumbers get userPhoneNumbers =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.UserPhoneNumbers>('user_phone_numbers');
  i5.CelestProjects get celestProjects =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i5.CelestProjects>('celest_projects');
  i5.CelestApis get celestApis => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i5.CelestApis>('celest_apis');
  i5.CelestFunctions get celestFunctions =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i5.CelestFunctions>('celest_functions');
  i6.CelestCloudAuthMeta get celestCloudAuthMeta =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i6.CelestCloudAuthMeta>('_celest_cloud_auth_meta');
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
  i7.CryptoKeys get cryptoKeys => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i7.CryptoKeys>('crypto_keys');
  i7.Sessions get sessions => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i7.Sessions>('sessions');
  i7.OtpCodes get otpCodes => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i7.OtpCodes>('otp_codes');
  i7.Corks get corks =>
      i3.ReadDatabaseContainer(attachedDatabase).resultSet<i7.Corks>('corks');
  i7.AuthDrift get authDrift => i3.ReadDatabaseContainer(attachedDatabase)
      .accessor<i7.AuthDrift>(i7.AuthDrift.new);
  i4.CedarDrift get cedarDrift => i3.ReadDatabaseContainer(attachedDatabase)
      .accessor<i4.CedarDrift>(i4.CedarDrift.new);
  i6.MetaDrift get metaDrift => i3.ReadDatabaseContainer(attachedDatabase)
      .accessor<i6.MetaDrift>(i6.MetaDrift.new);
  i5.ProjectsDrift get projectsDrift =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .accessor<i5.ProjectsDrift>(i5.ProjectsDrift.new);
  i2.UsersDrift get usersDrift => i3.ReadDatabaseContainer(attachedDatabase)
      .accessor<i2.UsersDrift>(i2.UsersDrift.new);
}
