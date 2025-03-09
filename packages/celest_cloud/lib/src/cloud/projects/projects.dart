import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/project_environments/project_environments.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.dart';
import 'package:celest_cloud/src/proto.dart' hide OperationState;
import 'package:celest_cloud/src/util/operations.dart';
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

  late final ProjectEnvironments environments = ProjectEnvironments(
    protocol: _protocol.environments,
    operations: _operations,
    logger: logger,
  );

  Stream<OperationState<OperationMetadata, Project>> create({
    required String parent,
    required String projectId,
    String? displayName,
    Iterable<Region>? regions,
    Map<String, String>? annotations,
    bool validateOnly = false,
  }) async* {
    final request = CreateProjectRequest(
      parent: parent,
      projectId: projectId,
      project: Project(
        displayName: displayName,
        regions: regions,
        annotations: annotations,
      ),
      validateOnly: validateOnly,
    );
    final operation = await run(
      'Projects.Create',
      request: request,
      action: _protocol.create,
    );
    yield* operation.stream(
      operations: _operations,
      metadata: OperationMetadata(),
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

  Stream<OperationState<OperationMetadata, Project>> update({
    required Project project,
    FieldMask? updateMask,
    bool allowMissing = false,
    bool validateOnly = false,
  }) async* {
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
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      response: Project(),
      metadata: OperationMetadata(),
    );
  }

  Stream<OperationState<OperationMetadata, Empty>> delete(
    String name, {
    String? etag,
    bool allowMissing = false,
    bool validateOnly = false,
    bool force = false,
  }) async* {
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
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      response: Empty(),
      metadata: OperationMetadata(),
    );
  }

  Stream<OperationState<OperationMetadata, Project>> rename({
    required String name,
    required String newAlias,
    String? etag,
    bool validateOnly = false,
  }) async* {
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
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      response: Project(),
      metadata: OperationMetadata(),
    );
  }
}
