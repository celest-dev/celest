import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.dart';
import 'package:celest_cloud/src/proto.dart' hide OperationState, Duration;
import 'package:celest_cloud/src/proto/operations.dart';
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

  Future<Organization> create({
    String? parent,
    String? organizationId,
    Organization? organization,
    bool validateOnly = false,
  }) async {
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
    return operation.wait(
      operations: _operations,
      logger: logger,
      response: Organization(),
      timeout: const Duration(minutes: 1),
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

  Future<Organization> update({
    required Organization organization,
    FieldMask? updateMask,
    bool allowMissing = false,
    bool validateOnly = false,
  }) async {
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
    return operation.wait(
      operations: _operations,
      logger: logger,
      response: Organization(),
      timeout: const Duration(minutes: 1),
    );
  }

  Future<Empty> delete(
    String name, {
    String? etag,
    bool allowMissing = false,
    bool validateOnly = false,
    bool force = false,
  }) async {
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
    return operation.wait(
      operations: _operations,
      logger: logger,
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
