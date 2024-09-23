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

import 'functions.pb.dart' as $7;

export 'functions.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Functions')
class FunctionsClient extends $grpc.Client {
  static final _$getFunction =
      $grpc.ClientMethod<$7.GetFunctionRequest, $7.Function_>(
          '/celest.cloud.v1alpha1.Functions/GetFunction',
          ($7.GetFunctionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.Function_.fromBuffer(value));
  static final _$listFunctions =
      $grpc.ClientMethod<$7.ListFunctionsRequest, $7.ListFunctionsResponse>(
          '/celest.cloud.v1alpha1.Functions/ListFunctions',
          ($7.ListFunctionsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.ListFunctionsResponse.fromBuffer(value));
  static final _$invokeFunction =
      $grpc.ClientMethod<$7.InvokeFunctionRequest, $7.InvokeFunctionResponse>(
          '/celest.cloud.v1alpha1.Functions/InvokeFunction',
          ($7.InvokeFunctionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.InvokeFunctionResponse.fromBuffer(value));
  static final _$getFunctionInvocation = $grpc.ClientMethod<
          $7.GetFunctionInvocationRequest, $7.FunctionInvocation>(
      '/celest.cloud.v1alpha1.Functions/GetFunctionInvocation',
      ($7.GetFunctionInvocationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.FunctionInvocation.fromBuffer(value));
  static final _$listFunctionInvocations = $grpc.ClientMethod<
          $7.ListFunctionInvocationsRequest,
          $7.ListFunctionInvocationsResponse>(
      '/celest.cloud.v1alpha1.Functions/ListFunctionInvocations',
      ($7.ListFunctionInvocationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.ListFunctionInvocationsResponse.fromBuffer(value));

  FunctionsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$7.Function_> getFunction($7.GetFunctionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFunction, request, options: options);
  }

  $grpc.ResponseFuture<$7.ListFunctionsResponse> listFunctions(
      $7.ListFunctionsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listFunctions, request, options: options);
  }

  $grpc.ResponseFuture<$7.InvokeFunctionResponse> invokeFunction(
      $7.InvokeFunctionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$invokeFunction, request, options: options);
  }

  $grpc.ResponseFuture<$7.FunctionInvocation> getFunctionInvocation(
      $7.GetFunctionInvocationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFunctionInvocation, request, options: options);
  }

  $grpc.ResponseFuture<$7.ListFunctionInvocationsResponse>
      listFunctionInvocations($7.ListFunctionInvocationsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listFunctionInvocations, request,
        options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Functions')
abstract class FunctionsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Functions';

  FunctionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.GetFunctionRequest, $7.Function_>(
        'GetFunction',
        getFunction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.GetFunctionRequest.fromBuffer(value),
        ($7.Function_ value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$7.ListFunctionsRequest, $7.ListFunctionsResponse>(
            'ListFunctions',
            listFunctions_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $7.ListFunctionsRequest.fromBuffer(value),
            ($7.ListFunctionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.InvokeFunctionRequest,
            $7.InvokeFunctionResponse>(
        'InvokeFunction',
        invokeFunction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.InvokeFunctionRequest.fromBuffer(value),
        ($7.InvokeFunctionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetFunctionInvocationRequest,
            $7.FunctionInvocation>(
        'GetFunctionInvocation',
        getFunctionInvocation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.GetFunctionInvocationRequest.fromBuffer(value),
        ($7.FunctionInvocation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ListFunctionInvocationsRequest,
            $7.ListFunctionInvocationsResponse>(
        'ListFunctionInvocations',
        listFunctionInvocations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.ListFunctionInvocationsRequest.fromBuffer(value),
        ($7.ListFunctionInvocationsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$7.Function_> getFunction_Pre($grpc.ServiceCall call,
      $async.Future<$7.GetFunctionRequest> request) async {
    return getFunction(call, await request);
  }

  $async.Future<$7.ListFunctionsResponse> listFunctions_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.ListFunctionsRequest> request) async {
    return listFunctions(call, await request);
  }

  $async.Future<$7.InvokeFunctionResponse> invokeFunction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.InvokeFunctionRequest> request) async {
    return invokeFunction(call, await request);
  }

  $async.Future<$7.FunctionInvocation> getFunctionInvocation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.GetFunctionInvocationRequest> request) async {
    return getFunctionInvocation(call, await request);
  }

  $async.Future<$7.ListFunctionInvocationsResponse> listFunctionInvocations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.ListFunctionInvocationsRequest> request) async {
    return listFunctionInvocations(call, await request);
  }

  $async.Future<$7.Function_> getFunction(
      $grpc.ServiceCall call, $7.GetFunctionRequest request);
  $async.Future<$7.ListFunctionsResponse> listFunctions(
      $grpc.ServiceCall call, $7.ListFunctionsRequest request);
  $async.Future<$7.InvokeFunctionResponse> invokeFunction(
      $grpc.ServiceCall call, $7.InvokeFunctionRequest request);
  $async.Future<$7.FunctionInvocation> getFunctionInvocation(
      $grpc.ServiceCall call, $7.GetFunctionInvocationRequest request);
  $async.Future<$7.ListFunctionInvocationsResponse> listFunctionInvocations(
      $grpc.ServiceCall call, $7.ListFunctionInvocationsRequest request);
}
