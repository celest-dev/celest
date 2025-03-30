import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';

final class ProjectEnvironmentsService extends ProjectEnvironmentsServiceBase {
  ProjectEnvironmentsService();

  static const String apiId = 'celest.cloud.v1alpha1.ProjectEnvironments';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: ProjectEnvironmentsService.apiId,
    functions: {},
    policySet: PolicySet(
      templateLinks: [
        TemplateLink(
          templateId: 'cloud.functions.authenticated',
          newId: ProjectEnvironmentsService.apiId,
          values: {SlotId.resource: ProjectEnvironmentsService.apiUid},
        ),
      ],
    ),
  );

  static final Map<String, GeneratedMessage> requestTypes = {
    'CreateProjectEnvironment': CreateProjectEnvironmentRequest(),
    'DeleteProjectEnvironment': DeleteProjectEnvironmentRequest(),
    'DeployProjectEnvironment': DeployProjectEnvironmentRequest(),
    'GetProjectEnvironment': GetProjectEnvironmentRequest(),
    'ListProjectEnvironments': ListProjectEnvironmentsRequest(),
    'UpdateProjectEnvironment': UpdateProjectEnvironmentRequest(),
  };

  @override
  Future<Operation> createProjectEnvironment(
    ServiceCall call,
    CreateProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Operation> deleteProjectEnvironment(
    ServiceCall call,
    DeleteProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Operation> deployProjectEnvironment(
    ServiceCall call,
    DeployProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<ProjectEnvironment> getProjectEnvironment(
    ServiceCall call,
    GetProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<ListProjectEnvironmentsResponse> listProjectEnvironments(
    ServiceCall call,
    ListProjectEnvironmentsRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Operation> updateProjectEnvironment(
    ServiceCall call,
    UpdateProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }
}
