import 'package:celest_cloud/src/proto.dart';

abstract interface class OperationsProtocol {
  Future<Operation> get(GetOperationRequest request);
  Future<ListOperationsResponse> list(ListOperationsRequest request);
  Future<void> cancel(CancelOperationRequest request);
}
