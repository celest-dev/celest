import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_hub/src/services/health_service.dart';
import 'package:celest_cloud_hub/src/services/operations_service.dart';
import 'package:celest_cloud_hub/src/services/organizations_service.dart';
import 'package:celest_cloud_hub/src/services/project_environments_service.dart';
import 'package:celest_cloud_hub/src/services/projects_service.dart';
import 'package:celest_core/_internal.dart';
import 'package:pub_semver/pub_semver.dart';

final ResolvedProject project = ResolvedProject(
  projectId: 'cloud-hub',
  environmentId: kDebugMode ? 'local' : 'production',
  sdkConfig: SdkConfiguration(
    celest: Version(1, 0, 0),
    dart: Sdk(type: SdkType.dart, version: Version(3, 7, 0)),
  ),
  apis: {
    AuthenticationService.apiId: AuthenticationService.api,
    UsersService.apiId: UsersService.api,
    OperationsService.apiId: OperationsService.api,
    OrganizationsService.apiId: OrganizationsService.api,
    ProjectsService.apiId: ProjectsService.api,
    ProjectEnvironmentsService.apiId: ProjectEnvironmentsService.api,
    HealthService.apiId: HealthService.api,
  },
);
