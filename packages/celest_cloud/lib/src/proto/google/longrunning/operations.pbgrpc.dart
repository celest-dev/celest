//
//  Generated code. Do not modify.
//  source: google/longrunning/operations.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../protobuf/empty.pb.dart' as $1;
import 'operations.pb.dart' as $4;

export 'operations.pb.dart';

@$pb.GrpcServiceName('google.longrunning.Operations')
class OperationsClient extends $grpc.Client {
  static final _$listOperations =
      $grpc.ClientMethod<$4.ListOperationsRequest, $4.ListOperationsResponse>(
          '/google.longrunning.Operations/ListOperations',
          ($4.ListOperationsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.ListOperationsResponse.fromBuffer(value));
  static final _$getOperation =
      $grpc.ClientMethod<$4.GetOperationRequest, $4.Operation>(
          '/google.longrunning.Operations/GetOperation',
          ($4.GetOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Operation.fromBuffer(value));
  static final _$deleteOperation =
      $grpc.ClientMethod<$4.DeleteOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/DeleteOperation',
          ($4.DeleteOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$cancelOperation =
      $grpc.ClientMethod<$4.CancelOperationRequest, $1.Empty>(
          '/google.longrunning.Operations/CancelOperation',
          ($4.CancelOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$waitOperation =
      $grpc.ClientMethod<$4.WaitOperationRequest, $4.Operation>(
          '/google.longrunning.Operations/WaitOperation',
          ($4.WaitOperationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Operation.fromBuffer(value));

  OperationsClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$4.ListOperationsResponse> listOperations(
      $4.ListOperationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOperations, request, options: options);
  }

  $grpc.ResponseFuture<$4.Operation> getOperation(
      $4.GetOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOperation, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteOperation(
      $4.DeleteOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOperation, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> cancelOperation(
      $4.CancelOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelOperation, request, options: options);
  }

  $grpc.ResponseFuture<$4.Operation> waitOperation(
      $4.WaitOperationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$waitOperation, request, options: options);
  }
}

@$pb.GrpcServiceName('google.longrunning.Operations')
abstract class OperationsServiceBase extends $grpc.Service {
  $core.String get $name => 'google.longrunning.Operations';

  OperationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.ListOperationsRequest,
            $4.ListOperationsResponse>(
        'ListOperations',
        listOperations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.ListOperationsRequest.fromBuffer(value),
        ($4.ListOperationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetOperationRequest, $4.Operation>(
        'GetOperation',
        getOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetOperationRequest.fromBuffer(value),
        ($4.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.DeleteOperationRequest, $1.Empty>(
        'DeleteOperation',
        deleteOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.DeleteOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.CancelOperationRequest, $1.Empty>(
        'CancelOperation',
        cancelOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.CancelOperationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.WaitOperationRequest, $4.Operation>(
        'WaitOperation',
        waitOperation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.WaitOperationRequest.fromBuffer(value),
        ($4.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$4.ListOperationsResponse> listOperations_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$4.ListOperationsRequest> $request) async {
    return listOperations($call, await $request);
  }

  $async.Future<$4.Operation> getOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$4.GetOperationRequest> $request) async {
    return getOperation($call, await $request);
  }

  $async.Future<$1.Empty> deleteOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$4.DeleteOperationRequest> $request) async {
    return deleteOperation($call, await $request);
  }

  $async.Future<$1.Empty> cancelOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$4.CancelOperationRequest> $request) async {
    return cancelOperation($call, await $request);
  }

  $async.Future<$4.Operation> waitOperation_Pre($grpc.ServiceCall $call,
      $async.Future<$4.WaitOperationRequest> $request) async {
    return waitOperation($call, await $request);
  }

  $async.Future<$4.ListOperationsResponse> listOperations(
      $grpc.ServiceCall call, $4.ListOperationsRequest request);
  $async.Future<$4.Operation> getOperation(
      $grpc.ServiceCall call, $4.GetOperationRequest request);
  $async.Future<$1.Empty> deleteOperation(
      $grpc.ServiceCall call, $4.DeleteOperationRequest request);
  $async.Future<$1.Empty> cancelOperation(
      $grpc.ServiceCall call, $4.CancelOperationRequest request);
  $async.Future<$4.Operation> waitOperation(
      $grpc.ServiceCall call, $4.WaitOperationRequest request);
}
