import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_hub/src/services/operations_service.dart';
import 'package:celest_cloud_hub/src/services/project_environments_service.dart';
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
    OperationsService.apiId: OperationsService.api,
    ProjectEnvironmentsService.apiId: ProjectEnvironmentsService.api,
  },
);
