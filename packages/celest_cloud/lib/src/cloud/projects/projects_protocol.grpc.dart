import 'package:celest_cloud/src/cloud/project_environments/project_environments_protocol.dart';
import 'package:celest_cloud/src/cloud/project_environments/project_environments_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:grpc/grpc.dart';

final class ProjectsProtocolGrpc implements ProjectsProtocol {
  ProjectsProtocolGrpc(
    ClientChannel channel, {
    List<ClientInterceptor>? interceptors,
  }) : _client = ProjectsClient(channel, interceptors: interceptors),
       environments = ProjectEnvironmentsProtocolGrpc(
         channel,
         interceptors: interceptors,
       );

  final ProjectsClient _client;

  @override
  final ProjectEnvironmentsProtocol environments;

  @override
  Future<Operation> create(CreateProjectRequest request) {
    return _client.createProject(request);
  }

  @override
  Future<Operation> delete(DeleteProjectRequest request) {
    return _client.deleteProject(request);
  }

  @override
  Future<Operation> undelete(UndeleteProjectRequest request) {
    return _client.undeleteProject(request);
  }

  @override
  Future<Project> get(GetProjectRequest request) {
    return _client.getProject(request);
  }

  @override
  Future<ListProjectsResponse> list(ListProjectsRequest request) {
    return _client.listProjects(request);
  }

  @override
  Future<Operation> update(UpdateProjectRequest request) {
    return _client.updateProject(request);
  }

  @override
  Future<Operation> rename(RenameProjectRequest request) {
    return _client.renameProject(request);
  }
}
