import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.dart';
import 'package:celest_cloud/src/proto.dart' hide OperationState;
import 'package:celest_cloud/src/proto/operations.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';

final class Projects with BaseService {
  Projects({
    required ProjectsProtocol protocol,
    required OperationsProtocol operations,
    this.logger,
  })  : _protocol = protocol,
        _operations = operations;

  @override
  final Logger? logger;
  final ProjectsProtocol _protocol;
  final OperationsProtocol _operations;

  Future<Project> create({
    required String parent,
    required String projectId,
    required String displayName,
    required String region,
    Map<String, String>? annotations,
    bool validateOnly = false,
  }) async {
    final request = CreateProjectRequest(
      parent: parent,
      projectId: projectId,
      project: Project(
        displayName: displayName,
        region: region,
        annotations: annotations,
      ),
      validateOnly: validateOnly,
    );
    final operation = await run(
      'Projects.Create',
      request: request,
      action: _protocol.create,
    );
    return operation.wait(
      operations: _operations,
      response: Project(),
      logger: logger,
    );
  }

  Future<Project?> get(String name) async {
    try {
      final request = GetProjectRequest(name: name);
      return await run(
        'Projects.Get',
        request: request,
        action: _protocol.get,
      );
    } on NotFoundException {
      return null;
    }
  }

  Future<ListProjectsResponse> list({
    String? parent,
    int? pageSize,
    String? pageToken,
    String? filter,
    String? orderBy,
    bool showDeleted = false,
  }) async {
    final request = ListProjectsRequest(
      parent: parent,
      pageSize: pageSize,
      pageToken: pageToken,
      filter: filter,
      orderBy: orderBy,
      showDeleted: showDeleted,
    );
    return run(
      'Projects.List',
      request: request,
      action: _protocol.list,
    );
  }

  Future<Project> update({
    required Project project,
    FieldMask? updateMask,
    bool allowMissing = false,
    bool validateOnly = false,
  }) async {
    final request = UpdateProjectRequest(
      project: project,
      updateMask: updateMask,
      validateOnly: validateOnly,
      allowMissing: allowMissing,
    );
    final operation = await run(
      'Projects.Update',
      request: request,
      action: _protocol.update,
    );
    return operation.wait(
      operations: _operations,
      logger: logger,
      response: Project(),
    );
  }

  Future<Empty> delete(
    String name, {
    String? etag,
    bool allowMissing = false,
    bool validateOnly = false,
    bool force = false,
  }) async {
    final request = DeleteProjectRequest(
      name: name,
      etag: etag,
      allowMissing: allowMissing,
      validateOnly: validateOnly,
      force: force,
    );
    final operation = await run(
      'Projects.Delete',
      request: request,
      action: _protocol.delete,
    );
    return operation.wait(
      operations: _operations,
      logger: logger,
      response: Empty(),
    );
  }

  Future<Project> rename({
    required String name,
    required String newAlias,
    String? etag,
    bool validateOnly = false,
  }) async {
    final request = RenameProjectRequest(
      name: name,
      projectId: newAlias,
      etag: etag,
      validateOnly: validateOnly,
    );
    final operation = await run(
      'Projects.Rename',
      request: request,
      action: _protocol.rename,
    );
    return operation.wait(
      operations: _operations,
      logger: logger,
      response: Project(),
    );
  }
}
