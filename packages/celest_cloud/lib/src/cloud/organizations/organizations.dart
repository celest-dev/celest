import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.dart';
import 'package:celest_cloud/src/proto.dart' hide OperationState;
import 'package:celest_cloud/src/util/operations.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';

final class Organizations with BaseService {
  Organizations({
    required OrganizationsProtocol protocol,
    required OperationsProtocol operations,
    this.logger,
  })  : _protocol = protocol,
        _operations = operations;

  @override
  final Logger? logger;
  final OrganizationsProtocol _protocol;
  final OperationsProtocol _operations;

  CloudOperation<Organization> create({
    String? parent,
    String? organizationId,
    Organization? organization,
    bool validateOnly = false,
  }) async* {
    final request = CreateOrganizationRequest(
      parent: parent,
      organizationId: organizationId,
      organization: organization,
      validateOnly: validateOnly,
    );
    final operation = await run(
      'Organizations.Create',
      request: request,
      action: _protocol.create,
    );
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      metadata: OperationMetadata(),
      response: Organization(),
    );
  }

  Future<Organization?> get(String name) async {
    try {
      final request = GetOrganizationRequest(name: name);
      return await run(
        'Organizations.Get',
        request: request,
        action: _protocol.get,
      );
    } on NotFoundException {
      return null;
    }
  }

  Future<ListOrganizationsResponse> list({
    String? parent,
    int? pageSize,
    String? pageToken,
    String? filter,
    String? orderBy,
    bool showDeleted = false,
  }) async {
    final request = ListOrganizationsRequest(
      parent: parent,
      pageSize: pageSize,
      pageToken: pageToken,
      filter: filter,
      orderBy: orderBy,
      showDeleted: showDeleted,
    );
    return run(
      'Organizations.List',
      request: request,
      action: _protocol.list,
    );
  }

  CloudOperation<Organization> update({
    required Organization organization,
    FieldMask? updateMask,
    bool allowMissing = false,
    bool validateOnly = false,
  }) async* {
    final request = UpdateOrganizationRequest(
      organization: organization,
      updateMask: updateMask,
      validateOnly: validateOnly,
      allowMissing: allowMissing,
    );
    final operation = await run(
      'Organizations.Update',
      request: request,
      action: _protocol.update,
    );
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      response: Organization(),
      metadata: OperationMetadata(),
    );
  }

  CloudOperation<Empty> delete(
    String name, {
    String? etag,
    bool allowMissing = false,
    bool validateOnly = false,
    bool force = false,
  }) async* {
    final request = DeleteOrganizationRequest(
      name: name,
      force: force,
      etag: etag,
      allowMissing: allowMissing,
      validateOnly: validateOnly,
    );
    final operation = await run(
      'Organizations.Delete',
      request: request,
      action: _protocol.delete,
    );
    yield* operation.stream(
      operations: _operations,
      logger: logger,
      metadata: OperationMetadata(),
      response: Empty(),
    );
  }

  Future<Organization> rename({
    required String name,
    required String newAlias,
    String? etag,
    bool validateOnly = false,
  }) async {
    final request = RenameOrganizationRequest(
      name: name,
      organizationId: newAlias,
      etag: etag,
      validateOnly: validateOnly,
    );
    final operation = await run(
      'Organizations.Rename',
      request: request,
      action: _protocol.rename,
    );
    return operation.wait(
      operations: _operations,
      logger: logger,
      response: Organization(),
    );
  }
}
