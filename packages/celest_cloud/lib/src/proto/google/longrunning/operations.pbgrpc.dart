// This is a generated file - do not edit.
//
// Generated from google/longrunning/operations.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../protobuf/empty.pb.dart' as $1;
import 'operations.pb.dart' as $0;

export 'operations.pb.dart';

/// Manages long-running operations with an API service.
///
/// When an API method normally takes long time to complete, it can be designed
/// to return [Operation][google.longrunning.Operation] to the client, and the
/// client can use this interface to receive the real response asynchronously by
/// polling the operation resource, or pass the operation resource to another API
/// (such as Pub/Sub API) to receive the response.  Any API service that returns
/// long-running operations should implement the `Operations` interface so
/// developers can have a consistent client experience.
@$pb.GrpcServiceName('google.longrunning.Operations')
class OperationsClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'longrunning.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  OperationsClient(super.channel, {super.options, super.interceptors});

  /// Lists operations that match the specified filter in the request. If the
  /// server doesn't support this method, it returns `UNIMPLEMENTED`.
  $grpc.ResponseFuture<$0.ListOperationsResponse> listOperations(
    $0.ListOperationsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listOperations, request, options: options);
  }

  /// Gets the latest state of a long-running operation.  Clients can use this
  /// method to poll the operation result at intervals as recommended by the API
  /// service.
  $grpc.ResponseFuture<$0.Operation> getOperation(
    $0.GetOperationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getOperation, request, options: options);
  }

  /// Deletes a long-running operation. This method indicates that the client is
  /// no longer interested in the operation result. It does not cancel the
  /// operation. If the server doesn't support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`.
  $grpc.ResponseFuture<$1.Empty> deleteOperation(
    $0.DeleteOperationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOperation, request, options: options);
  }

  /// Starts asynchronous cancellation on a long-running operation.  The server
  /// makes a best effort to cancel the operation, but success is not
  /// guaranteed.  If the server doesn't support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`.  Clients can use
  /// [Operations.GetOperation][google.longrunning.Operations.GetOperation] or
  /// other methods to check whether the cancellation succeeded or whether the
  /// operation completed despite cancellation. On successful cancellation,
  /// the operation is not deleted; instead, it becomes an operation with
  /// an [Operation.error][google.longrunning.Operation.error] value with a
  /// [google.rpc.Status.code][google.rpc.Status.code] of `1`, corresponding to
  /// `Code.CANCELLED`.
  $grpc.ResponseFuture<$1.Empty> cancelOperation(
    $0.CancelOperationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$cancelOperation, request, options: options);
  }

  /// Waits until the specified long-running operation is done or reaches at most
  /// a specified timeout, returning the latest state.  If the operation is
  /// already done, the latest state is immediately returned.  If the timeout
  /// specified is greater than the default HTTP/RPC timeout, the HTTP/RPC
  /// timeout is used.  If the server does not support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`.
  /// Note that this method is on a best-effort basis.  It may return the latest
  /// state before the specified timeout (including immediately), meaning even an
  /// immediate response is no guarantee that the operation is done.
  $grpc.ResponseFuture<$0.Operation> waitOperation(
    $0.WaitOperationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$waitOperation, request, options: options);
  }

  // method descriptors

  static final _$listOperations =
      $grpc.ClientMethod<$0.ListOperationsRequest, $0.ListOperationsResponse>(
          '/google.longrunning.Operations/ListOperations',
          ($0.ListOperationsRequest value) => value.writeToBuffer(),
          $0.ListOperationsResponse.fromBuffer);
  static final _$getOperation =
      $grpc.ClientMethod<$0.GetOperationRequest, $0.Operation>(
          '/google.longrunning.Operations/GetOperation',
          ($0.GetOperationRequest value) => value.writeToBuffer(),
          $0.Operation.fromBuffer);
  static final _$deleteOperation =
      $grpc.ClientMethod<$0.DeleteOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/DeleteOperation',
          ($0.DeleteOperationRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$cancelOperation =
      $grpc.ClientMethod<$0.CancelOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/CancelOperation',
          ($0.CancelOperationRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$waitOperation =
      $grpc.ClientMethod<$0.WaitOperationRequest, $0.Operation>(
          '/google.longrunning.Operations/WaitOperation',
          ($0.WaitOperationRequest value) => value.writeToBuffer(),
          $0.Operation.fromBuffer);
}

@$pb.GrpcServiceName('google.longrunning.Operations')
abstract class OperationsServiceBase extends $grpc.Service {
  $core.String get $name => 'google.longrunning.Operations';

  OperationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListOperationsRequest,
            $0.ListOperationsResponse>(
        'ListOperations',
        listOperations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListOperationsRequest.fromBuffer(value),
        ($0.ListOperationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOperationRequest, $0.Operation>(
        'GetOperation',
        getOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetOperationRequest.fromBuffer(value),
        ($0.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteOperationRequest, $1.Empty>(
        'DeleteOperation',
        deleteOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CancelOperationRequest, $1.Empty>(
        'CancelOperation',
        cancelOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CancelOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WaitOperationRequest, $0.Operation>(
        'WaitOperation',
        waitOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.WaitOperationRequest.fromBuffer(value),
        ($0.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListOperationsResponse> listOperations_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListOperationsRequest> $request) async {
    return listOperations($call, await $request);
  }

  $async.Future<$0.ListOperationsResponse> listOperations(
      $grpc.ServiceCall call, $0.ListOperationsRequest request);

  $async.Future<$0.Operation> getOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetOperationRequest> $request) async {
    return getOperation($call, await $request);
  }

  $async.Future<$0.Operation> getOperation(
      $grpc.ServiceCall call, $0.GetOperationRequest request);

  $async.Future<$1.Empty> deleteOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteOperationRequest> $request) async {
    return deleteOperation($call, await $request);
  }

  $async.Future<$1.Empty> deleteOperation(
      $grpc.ServiceCall call, $0.DeleteOperationRequest request);

  $async.Future<$1.Empty> cancelOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CancelOperationRequest> $request) async {
    return cancelOperation($call, await $request);
  }

  $async.Future<$1.Empty> cancelOperation(
      $grpc.ServiceCall call, $0.CancelOperationRequest request);

  $async.Future<$0.Operation> waitOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$0.WaitOperationRequest> $request) async {
    return waitOperation($call, await $request);
  }

  $async.Future<$0.Operation> waitOperation(
      $grpc.ServiceCall call, $0.WaitOperationRequest request);
}
