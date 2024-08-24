//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/environments.proto
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

import '../../../google/longrunning/operations.pb.dart' as $2;
import 'environments.pb.dart' as $10;

export 'environments.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Environments')
class EnvironmentsClient extends $grpc.Client {
  static final _$createEnvironment =
      $grpc.ClientMethod<$10.CreateEnvironmentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Environments/CreateEnvironment',
          ($10.CreateEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$getEnvironment =
      $grpc.ClientMethod<$10.GetEnvironmentRequest, $10.Environment>(
          '/celest.cloud.v1alpha1.Environments/GetEnvironment',
          ($10.GetEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $10.Environment.fromBuffer(value));
  static final _$updateEnvironment =
      $grpc.ClientMethod<$10.UpdateEnvironmentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Environments/UpdateEnvironment',
          ($10.UpdateEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$listEnvironments = $grpc.ClientMethod<
          $10.ListEnvironmentsRequest, $10.ListEnvironmentsResponse>(
      '/celest.cloud.v1alpha1.Environments/ListEnvironments',
      ($10.ListEnvironmentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $10.ListEnvironmentsResponse.fromBuffer(value));
  static final _$deleteEnvironment =
      $grpc.ClientMethod<$10.DeleteEnvironmentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Environments/DeleteEnvironment',
          ($10.DeleteEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));

  EnvironmentsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Operation> createEnvironment(
      $10.CreateEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEnvironment, request, options: options);
  }

  $grpc.ResponseFuture<$10.Environment> getEnvironment(
      $10.GetEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEnvironment, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> updateEnvironment(
      $10.UpdateEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateEnvironment, request, options: options);
  }

  $grpc.ResponseFuture<$10.ListEnvironmentsResponse> listEnvironments(
      $10.ListEnvironmentsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listEnvironments, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> deleteEnvironment(
      $10.DeleteEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteEnvironment, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Environments')
abstract class EnvironmentsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Environments';

  EnvironmentsServiceBase() {
    $addMethod($grpc.ServiceMethod<$10.CreateEnvironmentRequest, $2.Operation>(
        'CreateEnvironment',
        createEnvironment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $10.CreateEnvironmentRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.GetEnvironmentRequest, $10.Environment>(
        'GetEnvironment',
        getEnvironment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $10.GetEnvironmentRequest.fromBuffer(value),
        ($10.Environment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.UpdateEnvironmentRequest, $2.Operation>(
        'UpdateEnvironment',
        updateEnvironment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $10.UpdateEnvironmentRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.ListEnvironmentsRequest,
            $10.ListEnvironmentsResponse>(
        'ListEnvironments',
        listEnvironments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $10.ListEnvironmentsRequest.fromBuffer(value),
        ($10.ListEnvironmentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.DeleteEnvironmentRequest, $2.Operation>(
        'DeleteEnvironment',
        deleteEnvironment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $10.DeleteEnvironmentRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$2.Operation> createEnvironment_Pre($grpc.ServiceCall call,
      $async.Future<$10.CreateEnvironmentRequest> request) async {
    return createEnvironment(call, await request);
  }

  $async.Future<$10.Environment> getEnvironment_Pre($grpc.ServiceCall call,
      $async.Future<$10.GetEnvironmentRequest> request) async {
    return getEnvironment(call, await request);
  }

  $async.Future<$2.Operation> updateEnvironment_Pre($grpc.ServiceCall call,
      $async.Future<$10.UpdateEnvironmentRequest> request) async {
    return updateEnvironment(call, await request);
  }

  $async.Future<$10.ListEnvironmentsResponse> listEnvironments_Pre(
      $grpc.ServiceCall call,
      $async.Future<$10.ListEnvironmentsRequest> request) async {
    return listEnvironments(call, await request);
  }

  $async.Future<$2.Operation> deleteEnvironment_Pre($grpc.ServiceCall call,
      $async.Future<$10.DeleteEnvironmentRequest> request) async {
    return deleteEnvironment(call, await request);
  }

  $async.Future<$2.Operation> createEnvironment(
      $grpc.ServiceCall call, $10.CreateEnvironmentRequest request);
  $async.Future<$10.Environment> getEnvironment(
      $grpc.ServiceCall call, $10.GetEnvironmentRequest request);
  $async.Future<$2.Operation> updateEnvironment(
      $grpc.ServiceCall call, $10.UpdateEnvironmentRequest request);
  $async.Future<$10.ListEnvironmentsResponse> listEnvironments(
      $grpc.ServiceCall call, $10.ListEnvironmentsRequest request);
  $async.Future<$2.Operation> deleteEnvironment(
      $grpc.ServiceCall call, $10.DeleteEnvironmentRequest request);
}
