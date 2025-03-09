import 'package:celest_cloud/src/cloud/project_environments/project_environments_protocol.dart';
import 'package:celest_cloud/src/proto.dart';

abstract interface class ProjectsProtocol {
  Future<Operation> create(CreateProjectRequest request);
  Future<Project> get(GetProjectRequest request);
  Future<ListProjectsResponse> list(ListProjectsRequest request);
  Future<Operation> update(UpdateProjectRequest request);
  Future<Operation> delete(DeleteProjectRequest request);
  Future<Operation> rename(RenameProjectRequest request);

  ProjectEnvironmentsProtocol get environments;
}
