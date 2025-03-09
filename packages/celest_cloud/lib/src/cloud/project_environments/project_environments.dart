import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/project_environments/project_environments_protocol.dart';
import 'package:celest_cloud/src/proto.dart' hide OperationState;
import 'package:celest_cloud/src/util/operations.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';

final class ProjectEnvironments with BaseService {
  ProjectEnvironments({
    required ProjectEnvironmentsProtocol protocol,
    required OperationsProtocol operations,
    this.logger,
  })  : _protocol = protocol,
        _operations = operations;

  @override
  final Logger? logger;
  final ProjectEnvironmentsProtocol _protocol;
  final OperationsProtocol _operations;

  CloudOperation<ProjectEnvironment> create({
    required String parent,
    required String projectEnvironmentId,
    String? displayName,
    Map<String, String>? annotations,
    bool validateOnly = false,
  }) async* {
    final request = CreateProjectEnvironmentRequest(
      parent: parent,
      projectEnvironmentId: projectEnvironmentId,
      projectEnvironment: ProjectEnvironment(
        displayName: displayName,
        annotations: annotations,
      ),
      validateOnly: validateOnly,
    );
    final operation = await run(
      'ProjectEnvironments.Create',
      request: request,
      action: _protocol.create,
    );
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      response: ProjectEnvironment(),
      metadata: OperationMetadata(),
    );
  }

  Future<ProjectEnvironment?> get(String name) async {
    try {
      final request = GetProjectEnvironmentRequest(name: name);
      return await run(
        'ProjectEnvironments.Get',
        request: request,
        action: _protocol.get,
      );
    } on NotFoundException {
      return null;
    }
  }

  Future<ListProjectEnvironmentsResponse> list({
    String? parent,
    int? pageSize,
    String? pageToken,
    String? filter,
    String? orderBy,
  }) async {
    final request = ListProjectEnvironmentsRequest(
      parent: parent,
      pageSize: pageSize,
      pageToken: pageToken,
      filter: filter,
      orderBy: orderBy,
    );
    return run(
      'ProjectEnvironments.List',
      request: request,
      action: _protocol.list,
    );
  }

  CloudOperation<ProjectEnvironment> update({
    required ProjectEnvironment projectEnvironment,
    FieldMask? updateMask,
    bool allowMissing = false,
    bool validateOnly = false,
  }) async* {
    final request = UpdateProjectEnvironmentRequest(
      projectEnvironment: projectEnvironment,
      updateMask: updateMask,
      validateOnly: validateOnly,
      allowMissing: allowMissing,
    );
    final operation = await run(
      'ProjectEnvironments.Update',
      request: request,
      action: _protocol.update,
    );
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      response: ProjectEnvironment(),
      metadata: OperationMetadata(),
    );
  }

  CloudOperation<Empty> delete(
    String name, {
    String? etag,
    bool allowMissing = false,
    bool validateOnly = false,
  }) async* {
    final request = DeleteProjectEnvironmentRequest(
      name: name,
      etag: etag,
      allowMissing: allowMissing,
      validateOnly: validateOnly,
    );
    final operation = await run(
      'ProjectEnvironments.Delete',
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

  CloudOperation<DeployProjectEnvironmentResponse> deploy(
    String environment, {
    required ResolvedProject resolvedProject,
    required Iterable<ProjectAsset> assets,
    String? requestId,
    String? etag,
    bool validateOnly = false,
  }) async* {
    final request = DeployProjectEnvironmentRequest(
      name: environment,
      assets: assets,
      resolvedProjectAst: resolvedProject,
      requestId: requestId,
      etag: etag,
      validateOnly: validateOnly,
    );
    final operation = await run(
      'ProjectEnvironments.Deploy',
      request: request,
      action: _protocol.deploy,
    );
    yield* operation.stream(
      operations: _operations,
      metadata: OperationMetadata(),
      response: DeployProjectEnvironmentResponse(),
      logger: logger,
    );
  }
}
