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
import 'operations.pb.dart' as $3;

export 'operations.pb.dart';

@$pb.GrpcServiceName('google.longrunning.Operations')
class OperationsClient extends $grpc.Client {
  static final _$listOperations =
      $grpc.ClientMethod<$3.ListOperationsRequest, $3.ListOperationsResponse>(
          '/google.longrunning.Operations/ListOperations',
          ($3.ListOperationsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListOperationsResponse.fromBuffer(value));
  static final _$getOperation =
      $grpc.ClientMethod<$3.GetOperationRequest, $3.Operation>(
          '/google.longrunning.Operations/GetOperation',
          ($3.GetOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$deleteOperation =
      $grpc.ClientMethod<$3.DeleteOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/DeleteOperation',
          ($3.DeleteOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$cancelOperation =
      $grpc.ClientMethod<$3.CancelOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/CancelOperation',
          ($3.CancelOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$waitOperation =
      $grpc.ClientMethod<$3.WaitOperationRequest, $3.Operation>(
          '/google.longrunning.Operations/WaitOperation',
          ($3.WaitOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));

  OperationsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.ListOperationsResponse> listOperations(
      $3.ListOperationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOperations, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> getOperation(
      $3.GetOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOperation, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteOperation(
      $3.DeleteOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOperation, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> cancelOperation(
      $3.CancelOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelOperation, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> waitOperation(
      $3.WaitOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$waitOperation, request, options: options);
  }
}

@$pb.GrpcServiceName('google.longrunning.Operations')
abstract class OperationsServiceBase extends $grpc.Service {
  $core.String get $name => 'google.longrunning.Operations';

  OperationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.ListOperationsRequest,
            $3.ListOperationsResponse>(
        'ListOperations',
        listOperations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.ListOperationsRequest.fromBuffer(value),
        ($3.ListOperationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetOperationRequest, $3.Operation>(
        'GetOperation',
        getOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.GetOperationRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteOperationRequest, $1.Empty>(
        'DeleteOperation',
        deleteOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.DeleteOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CancelOperationRequest, $1.Empty>(
        'CancelOperation',
        cancelOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CancelOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.WaitOperationRequest, $3.Operation>(
        'WaitOperation',
        waitOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.WaitOperationRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$3.ListOperationsResponse> listOperations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.ListOperationsRequest> request) async {
    return listOperations(call, await request);
  }

  $async.Future<$3.Operation> getOperation_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetOperationRequest> request) async {
    return getOperation(call, await request);
  }

  $async.Future<$1.Empty> deleteOperation_Pre($grpc.ServiceCall call,
      $async.Future<$3.DeleteOperationRequest> request) async {
    return deleteOperation(call, await request);
  }

  $async.Future<$1.Empty> cancelOperation_Pre($grpc.ServiceCall call,
      $async.Future<$3.CancelOperationRequest> request) async {
    return cancelOperation(call, await request);
  }

  $async.Future<$3.Operation> waitOperation_Pre($grpc.ServiceCall call,
      $async.Future<$3.WaitOperationRequest> request) async {
    return waitOperation(call, await request);
  }

  $async.Future<$3.ListOperationsResponse> listOperations(
      $grpc.ServiceCall call, $3.ListOperationsRequest request);
  $async.Future<$3.Operation> getOperation(
      $grpc.ServiceCall call, $3.GetOperationRequest request);
  $async.Future<$1.Empty> deleteOperation(
      $grpc.ServiceCall call, $3.DeleteOperationRequest request);
  $async.Future<$1.Empty> cancelOperation(
      $grpc.ServiceCall call, $3.CancelOperationRequest request);
  $async.Future<$3.Operation> waitOperation(
      $grpc.ServiceCall call, $3.WaitOperationRequest request);
}
