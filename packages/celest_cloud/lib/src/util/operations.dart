import 'dart:async';

import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/proto/google/longrunning/operations.pb.dart';
import 'package:celest_cloud/src/proto/google/rpc/status.pb.dart';
import 'package:grpc/grpc.dart' hide Any; // ignore: undefined_hidden_name
import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart';

typedef CloudOperation<R extends GeneratedMessage> =
    Stream<OperationState<OperationMetadata, R>>;

extension WaitForOperation on Operation {
  Future<T> wait<T extends GeneratedMessage>({
    required OperationsProtocol operations,
    required T response,
    Logger? logger,
    Duration timeout = const Duration(minutes: 5),
  }) async {
    var operation = this;
    if (!operation.done) {
      final waiter = OperationWaiter(
        this,
        protocol: operations,
        logger: logger,
      );
      operation = await waiter.wait(timeout: timeout);
    }
    return operation.response.unpackInto(response);
  }

  Stream<OperationState<TMetadata, TResponse>> stream<
    TMetadata extends GeneratedMessage,
    TResponse extends GeneratedMessage
  >({
    required OperationsProtocol operations,
    required TMetadata metadata,
    required TResponse response,
    Logger? logger,
  }) {
    if (done) {
      return Stream.value(
        state<TMetadata, TResponse>(metadata: metadata, response: response),
      );
    }
    return OperationWaiter(
      this,
      protocol: operations,
      logger: logger,
    ).stream.map((operation) {
      return operation.state<TMetadata, TResponse>(
        metadata: metadata,
        response: response,
      );
    });
  }

  OperationState<TMetadata, TResponse> state<
    TMetadata extends GeneratedMessage,
    TResponse extends GeneratedMessage
  >({required TMetadata metadata, required TResponse response}) {
    if (done) {
      if (hasError()) {
        return OperationFailure<TMetadata, TResponse>(
          id: name,
          metadata: hasMetadata() ? metadata.unpack(this.metadata) : metadata,
          error: error.grpcError,
        );
      }
      return OperationSuccess<TMetadata, TResponse>(
        id: name,
        metadata: hasMetadata() ? metadata.unpack(this.metadata) : metadata,
        response: response.unpack(ensureResponse()),
      );
    }
    return OperationInProgress<TMetadata, TResponse>(
      id: name,
      metadata: hasMetadata() ? metadata.unpack(this.metadata) : metadata,
    );
  }
}

extension on Status {
  GrpcError get grpcError {
    return GrpcError.custom(code, message, details);
  }
}

extension<T extends GeneratedMessage> on T {
  T unpack(Any any) {
    return any.unpackInto(createEmptyInstance() as T);
  }
}

sealed class OperationState<
  TMetadata extends GeneratedMessage,
  TResponse extends GeneratedMessage
> {
  OperationState({required this.id, required this.metadata});

  final String id;
  final TMetadata metadata;

  bool get done => false;
  TResponse? get response => null;
  GrpcError? get error => null;
}

final class OperationInProgress<
  TMetadata extends GeneratedMessage,
  TResponse extends GeneratedMessage
>
    extends OperationState<TMetadata, TResponse> {
  OperationInProgress({required super.id, required super.metadata});

  @override
  String toString() {
    return 'OperationInProgress(\n'
        '  id: $id,\n'
        '  metadata: $metadata\n'
        ')';
  }
}

final class OperationSuccess<
  TMetadata extends GeneratedMessage,
  TResponse extends GeneratedMessage
>
    extends OperationState<TMetadata, TResponse> {
  OperationSuccess({
    required super.id,
    required super.metadata,
    required this.response,
  });

  @override
  bool get done => true;

  @override
  final TResponse response;

  @override
  String toString() {
    return 'OperationSuccess(\n'
        '  id: $id,\n'
        '  metadata: $metadata,\n'
        '  response: $response\n'
        ')';
  }
}

final class OperationCancelled<
  TMetadata extends GeneratedMessage,
  TResponse extends GeneratedMessage
>
    extends OperationState<TMetadata, TResponse> {
  OperationCancelled({required super.id, required super.metadata});

  @override
  bool get done => true;

  @override
  String toString() {
    return 'OperationCancelled(\n'
        '  id: $id,\n'
        '  metadata: $metadata\n'
        ')';
  }
}

final class OperationFailure<
  TMetadata extends GeneratedMessage,
  TResponse extends GeneratedMessage
>
    extends OperationState<TMetadata, TResponse> {
  OperationFailure({
    required super.id,
    required super.metadata,
    required this.error,
  });

  @override
  bool get done => true;

  @override
  final GrpcError error;

  @override
  String toString() {
    return 'OperationFailure(\n'
        '  id: $id,\n'
        '  metadata: $metadata,\n'
        '  error: $error\n'
        ')';
  }
}

final class OperationWaiter {
  OperationWaiter(
    Operation operation, {
    required OperationsProtocol protocol,
    Logger? logger,
  }) : _operation = operation,
       _client = protocol,
       _logger = logger;

  Operation _operation;
  final OperationsProtocol _client;
  final Logger? _logger;

  Future<Operation> wait({
    Duration timeout = const Duration(minutes: 5),
  }) async {
    final timer = Stopwatch()..start();
    while (!_operation.done) {
      if (timer.elapsed > timeout) {
        throw TimeoutException('Operation did not complete within $timeout');
      }
      await Future<void>.delayed(const Duration(seconds: 5));
      _operation = await _client.get(
        GetOperationRequest(name: _operation.name),
      );
      _logger?.fine(
        () =>
            _operation
                .toProto3Json(typeRegistry: CelestCloud.typeRegistry)
                .toString(),
      );
    }
    if (_operation.hasError()) {
      throw GrpcError.custom(
        _operation.error.code,
        _operation.error.message,
        _operation.error.details,
      );
    }
    return _operation;
  }

  Stream<Operation> get stream async* {
    yield _operation;
    while (!_operation.done) {
      await Future<void>.delayed(const Duration(seconds: 5));
      _operation = await _client.get(
        GetOperationRequest(name: _operation.name),
      );
      yield _operation;
    }
  }
}
