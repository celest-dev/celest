import 'package:celest_cloud/src/proto/google/longrunning/operations.pb.dart';

abstract interface class OperationsProtocol {
  Future<Operation> get(GetOperationRequest request);
  Future<ListOperationsResponse> list(ListOperationsRequest request);
  Future<void> cancel(CancelOperationRequest request);
}
