//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/functions.proto
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

import 'functions.pb.dart' as $11;

export 'functions.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Functions')
class FunctionsClient extends $grpc.Client {
  static final _$getFunction =
      $grpc.ClientMethod<$11.GetFunctionRequest, $11.Function_>(
          '/celest.cloud.v1alpha1.Functions/GetFunction',
          ($11.GetFunctionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $11.Function_.fromBuffer(value));
  static final _$listFunctions =
      $grpc.ClientMethod<$11.ListFunctionsRequest, $11.ListFunctionsResponse>(
          '/celest.cloud.v1alpha1.Functions/ListFunctions',
          ($11.ListFunctionsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $11.ListFunctionsResponse.fromBuffer(value));
  static final _$invokeFunction =
      $grpc.ClientMethod<$11.InvokeFunctionRequest, $11.InvokeFunctionResponse>(
          '/celest.cloud.v1alpha1.Functions/InvokeFunction',
          ($11.InvokeFunctionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $11.InvokeFunctionResponse.fromBuffer(value));
  static final _$getFunctionInvocation = $grpc.ClientMethod<
          $11.GetFunctionInvocationRequest, $11.FunctionInvocation>(
      '/celest.cloud.v1alpha1.Functions/GetFunctionInvocation',
      ($11.GetFunctionInvocationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $11.FunctionInvocation.fromBuffer(value));
  static final _$listFunctionInvocations = $grpc.ClientMethod<
          $11.ListFunctionInvocationsRequest,
          $11.ListFunctionInvocationsResponse>(
      '/celest.cloud.v1alpha1.Functions/ListFunctionInvocations',
      ($11.ListFunctionInvocationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $11.ListFunctionInvocationsResponse.fromBuffer(value));

  FunctionsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$11.Function_> getFunction(
      $11.GetFunctionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFunction, request, options: options);
  }

  $grpc.ResponseFuture<$11.ListFunctionsResponse> listFunctions(
      $11.ListFunctionsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listFunctions, request, options: options);
  }

  $grpc.ResponseFuture<$11.InvokeFunctionResponse> invokeFunction(
      $11.InvokeFunctionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$invokeFunction, request, options: options);
  }

  $grpc.ResponseFuture<$11.FunctionInvocation> getFunctionInvocation(
      $11.GetFunctionInvocationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFunctionInvocation, request, options: options);
  }

  $grpc.ResponseFuture<$11.ListFunctionInvocationsResponse>
      listFunctionInvocations($11.ListFunctionInvocationsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listFunctionInvocations, request,
        options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Functions')
abstract class FunctionsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Functions';

  FunctionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$11.GetFunctionRequest, $11.Function_>(
        'GetFunction',
        getFunction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $11.GetFunctionRequest.fromBuffer(value),
        ($11.Function_ value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.ListFunctionsRequest,
            $11.ListFunctionsResponse>(
        'ListFunctions',
        listFunctions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $11.ListFunctionsRequest.fromBuffer(value),
        ($11.ListFunctionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.InvokeFunctionRequest,
            $11.InvokeFunctionResponse>(
        'InvokeFunction',
        invokeFunction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $11.InvokeFunctionRequest.fromBuffer(value),
        ($11.InvokeFunctionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.GetFunctionInvocationRequest,
            $11.FunctionInvocation>(
        'GetFunctionInvocation',
        getFunctionInvocation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $11.GetFunctionInvocationRequest.fromBuffer(value),
        ($11.FunctionInvocation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.ListFunctionInvocationsRequest,
            $11.ListFunctionInvocationsResponse>(
        'ListFunctionInvocations',
        listFunctionInvocations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $11.ListFunctionInvocationsRequest.fromBuffer(value),
        ($11.ListFunctionInvocationsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$11.Function_> getFunction_Pre($grpc.ServiceCall call,
      $async.Future<$11.GetFunctionRequest> request) async {
    return getFunction(call, await request);
  }

  $async.Future<$11.ListFunctionsResponse> listFunctions_Pre(
      $grpc.ServiceCall call,
      $async.Future<$11.ListFunctionsRequest> request) async {
    return listFunctions(call, await request);
  }

  $async.Future<$11.InvokeFunctionResponse> invokeFunction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$11.InvokeFunctionRequest> request) async {
    return invokeFunction(call, await request);
  }

  $async.Future<$11.FunctionInvocation> getFunctionInvocation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$11.GetFunctionInvocationRequest> request) async {
    return getFunctionInvocation(call, await request);
  }

  $async.Future<$11.ListFunctionInvocationsResponse>
      listFunctionInvocations_Pre($grpc.ServiceCall call,
          $async.Future<$11.ListFunctionInvocationsRequest> request) async {
    return listFunctionInvocations(call, await request);
  }

  $async.Future<$11.Function_> getFunction(
      $grpc.ServiceCall call, $11.GetFunctionRequest request);
  $async.Future<$11.ListFunctionsResponse> listFunctions(
      $grpc.ServiceCall call, $11.ListFunctionsRequest request);
  $async.Future<$11.InvokeFunctionResponse> invokeFunction(
      $grpc.ServiceCall call, $11.InvokeFunctionRequest request);
  $async.Future<$11.FunctionInvocation> getFunctionInvocation(
      $grpc.ServiceCall call, $11.GetFunctionInvocationRequest request);
  $async.Future<$11.ListFunctionInvocationsResponse> listFunctionInvocations(
      $grpc.ServiceCall call, $11.ListFunctionInvocationsRequest request);
}
