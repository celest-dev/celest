import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:grpc/grpc.dart';

final class OperationsProtocolGrpc implements OperationsProtocol {
  OperationsProtocolGrpc(
    ClientChannel channel, {
    List<ClientInterceptor>? interceptors,
  }) : _client = OperationsClient(channel, interceptors: interceptors);

  final OperationsClient _client;

  @override
  Future<void> cancel(CancelOperationRequest request) async {
    await _client.cancelOperation(request);
  }

  @override
  Future<Operation> get(GetOperationRequest request) {
    return _client.getOperation(request);
  }

  @override
  Future<ListOperationsResponse> list(ListOperationsRequest request) {
    return _client.listOperations(request);
  }

  @override
  Future<Operation> wait(WaitOperationRequest request) {
    return _client.waitOperation(request);
  }
}
