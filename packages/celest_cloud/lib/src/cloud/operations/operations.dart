import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:celest_cloud/src/util/well_known.dart';
import 'package:logging/logging.dart';

final class Operations with BaseService {
  Operations({required OperationsProtocol protocol, this.logger})
    : _protocol = protocol;

  @override
  final Logger? logger;
  final OperationsProtocol _protocol;

  Future<Operation> get(String name) async {
    final request = GetOperationRequest(name: name);
    return run('Operations.Get', request: request, action: _protocol.get);
  }

  Future<ListOperationsResponse> list({
    String? parent,
    int? pageSize,
    String? pageToken,
    String? filter,
  }) async {
    final request = ListOperationsRequest(
      name: parent,
      pageSize: pageSize,
      pageToken: pageToken,
      filter: filter,
    );
    return run('Operations.List', request: request, action: _protocol.list);
  }

  Future<void> cancel(String name) async {
    final request = CancelOperationRequest(name: name);
    return run('Operations.Cancel', request: request, action: _protocol.cancel);
  }

  Future<Operation> wait(String name, {Duration? timeout}) async {
    final request = WaitOperationRequest(
      name: name,
      timeout: timeout?.toProto(),
    );
    return run('Operations.Wait', request: request, action: _protocol.wait);
  }
}
