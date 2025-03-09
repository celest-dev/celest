import 'package:celest_cloud/src/cloud/project_environments/project_environments_protocol.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:grpc/grpc.dart';

final class ProjectEnvironmentsProtocolGrpc
    implements ProjectEnvironmentsProtocol {
  ProjectEnvironmentsProtocolGrpc(
    ClientChannel channel, {
    List<ClientInterceptor>? interceptors,
  }) : _client = ProjectEnvironmentsClient(
          channel,
          interceptors: interceptors,
        );

  final ProjectEnvironmentsClient _client;

  @override
  Future<Operation> create(CreateProjectEnvironmentRequest request) {
    return _client.createProjectEnvironment(request);
  }

  @override
  Future<Operation> delete(DeleteProjectEnvironmentRequest request) {
    return _client.deleteProjectEnvironment(request);
  }

  @override
  Future<ProjectEnvironment> get(GetProjectEnvironmentRequest request) {
    return _client.getProjectEnvironment(request);
  }

  @override
  Future<ListProjectEnvironmentsResponse> list(
    ListProjectEnvironmentsRequest request,
  ) {
    return _client.listProjectEnvironments(request);
  }

  @override
  Future<Operation> update(UpdateProjectEnvironmentRequest request) {
    return _client.updateProjectEnvironment(request);
  }

  @override
  Future<Operation> deploy(DeployProjectEnvironmentRequest request) {
    return _client.deployProjectEnvironment(request);
  }
}
