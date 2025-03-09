//
//  Generated code. Do not modify.
//  source: google/longrunning/operations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../protobuf/empty.pb.dart' as $1;
import 'operations.pb.dart' as $2;

export 'operations.pb.dart';

@$pb.GrpcServiceName('google.longrunning.Operations')
class OperationsClient extends $grpc.Client {
  static final _$listOperations =
      $grpc.ClientMethod<$2.ListOperationsRequest, $2.ListOperationsResponse>(
          '/google.longrunning.Operations/ListOperations',
          ($2.ListOperationsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ListOperationsResponse.fromBuffer(value));
  static final _$getOperation =
      $grpc.ClientMethod<$2.GetOperationRequest, $2.Operation>(
          '/google.longrunning.Operations/GetOperation',
          ($2.GetOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$deleteOperation =
      $grpc.ClientMethod<$2.DeleteOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/DeleteOperation',
          ($2.DeleteOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$cancelOperation =
      $grpc.ClientMethod<$2.CancelOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/CancelOperation',
          ($2.CancelOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$waitOperation =
      $grpc.ClientMethod<$2.WaitOperationRequest, $2.Operation>(
          '/google.longrunning.Operations/WaitOperation',
          ($2.WaitOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));

  OperationsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.ListOperationsResponse> listOperations(
      $2.ListOperationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOperations, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> getOperation(
      $2.GetOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOperation, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteOperation(
      $2.DeleteOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOperation, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> cancelOperation(
      $2.CancelOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelOperation, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> waitOperation(
      $2.WaitOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$waitOperation, request, options: options);
  }
}

@$pb.GrpcServiceName('google.longrunning.Operations')
abstract class OperationsServiceBase extends $grpc.Service {
  $core.String get $name => 'google.longrunning.Operations';

  OperationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ListOperationsRequest,
            $2.ListOperationsResponse>(
        'ListOperations',
        listOperations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.ListOperationsRequest.fromBuffer(value),
        ($2.ListOperationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetOperationRequest, $2.Operation>(
        'GetOperation',
        getOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.GetOperationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteOperationRequest, $1.Empty>(
        'DeleteOperation',
        deleteOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.DeleteOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CancelOperationRequest, $1.Empty>(
        'CancelOperation',
        cancelOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.CancelOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.WaitOperationRequest, $2.Operation>(
        'WaitOperation',
        waitOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.WaitOperationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$2.ListOperationsResponse> listOperations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.ListOperationsRequest> request) async {
    return listOperations(call, await request);
  }

  $async.Future<$2.Operation> getOperation_Pre($grpc.ServiceCall call,
      $async.Future<$2.GetOperationRequest> request) async {
    return getOperation(call, await request);
  }

  $async.Future<$1.Empty> deleteOperation_Pre($grpc.ServiceCall call,
      $async.Future<$2.DeleteOperationRequest> request) async {
    return deleteOperation(call, await request);
  }

  $async.Future<$1.Empty> cancelOperation_Pre($grpc.ServiceCall call,
      $async.Future<$2.CancelOperationRequest> request) async {
    return cancelOperation(call, await request);
  }

  $async.Future<$2.Operation> waitOperation_Pre($grpc.ServiceCall call,
      $async.Future<$2.WaitOperationRequest> request) async {
    return waitOperation(call, await request);
  }

  $async.Future<$2.ListOperationsResponse> listOperations(
      $grpc.ServiceCall call, $2.ListOperationsRequest request);
  $async.Future<$2.Operation> getOperation(
      $grpc.ServiceCall call, $2.GetOperationRequest request);
  $async.Future<$1.Empty> deleteOperation(
      $grpc.ServiceCall call, $2.DeleteOperationRequest request);
  $async.Future<$1.Empty> cancelOperation(
      $grpc.ServiceCall call, $2.CancelOperationRequest request);
  $async.Future<$2.Operation> waitOperation(
      $grpc.ServiceCall call, $2.WaitOperationRequest request);
}
