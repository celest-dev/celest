import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/proto.dart' show Operation;
import 'package:celest_cloud/src/util/operations.dart';
import 'package:celest_core/celest_core.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:protobuf/protobuf.dart';

abstract mixin class BaseService {
  @protected
  Logger? get logger;

  @protected
  Future<Res> run<Req extends Object?, Res>(
    String name, {
    required Req request,
    required Future<Res> Function(Req) action,
  }) async {
    logger?.fine('[$name] Request:\n$request');
    try {
      final response = await action(request);
      logger?.fine('[$name] Response:\n$response');
      return response;
    } on Object catch (e, st) {
      final cloudEx = switch (e) {
        final CloudException ex => ex,
        final GrpcError ex => CloudException.fromGrpcError(ex),
        final Exception ex => CloudException.unknownError(
            null,
            details: JsonString(ex.toString()),
          ),
        _ => e,
      };
      logger?.severe('[$name] Error', cloudEx, st);
      Error.throwWithStackTrace(cloudEx, st);
    }
  }

  @protected
  Stream<OperationState<Metadata, Response>> streamOperation<
      Metadata extends GeneratedMessage, Response extends GeneratedMessage>(
    String name, {
    required Operation operation,
    required OperationsProtocol operations,
    required Metadata metadata,
    required Response response,
    Logger? logger,
  }) async* {
    final stream = operation.stream(
      operations: operations,
      metadata: metadata,
      response: response,
      logger: logger,
    );
    try {
      await for (final state in stream) {
        logger?.fine(
          '[$name.${operation.name}] Operation state:\n$state',
        );
        yield state;
      }
    } on Object catch (e, st) {
      final cloudEx = switch (e) {
        final CloudException ex => ex,
        final GrpcError ex => CloudException.fromGrpcError(ex),
        final Exception ex => CloudException.unknownError(
            null,
            details: JsonString(ex.toString()),
          ),
        _ => e,
      };
      logger?.severe('[$name] Error in operation', cloudEx, st);
      Error.throwWithStackTrace(cloudEx, st);
    }
  }
}
