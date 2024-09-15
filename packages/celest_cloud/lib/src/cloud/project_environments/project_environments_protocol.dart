import 'package:celest_cloud/src/proto.dart';

abstract interface class ProjectEnvironmentsProtocol {
  Future<Operation> create(CreateProjectEnvironmentRequest request);
  Future<ProjectEnvironment> get(GetProjectEnvironmentRequest request);
  Future<ListProjectEnvironmentsResponse> list(
    ListProjectEnvironmentsRequest request,
  );
  Future<Operation> update(UpdateProjectEnvironmentRequest request);
  Future<Operation> delete(DeleteProjectEnvironmentRequest request);
  Future<Operation> deploy(DeployProjectEnvironmentRequest request);
}
