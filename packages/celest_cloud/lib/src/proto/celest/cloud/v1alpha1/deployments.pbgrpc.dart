//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/deployments.proto
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
import '../../../google/protobuf/empty.pb.dart' as $1;
import 'deployments.pb.dart' as $7;

export 'deployments.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Deployments')
class DeploymentsClient extends $grpc.Client {
  static final _$createDeployment =
      $grpc.ClientMethod<$7.CreateDeploymentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Deployments/CreateDeployment',
          ($7.CreateDeploymentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$getDeployment =
      $grpc.ClientMethod<$7.GetDeploymentRequest, $7.Deployment>(
          '/celest.cloud.v1alpha1.Deployments/GetDeployment',
          ($7.GetDeploymentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.Deployment.fromBuffer(value));
  static final _$listDeployments =
      $grpc.ClientMethod<$7.ListDeploymentsRequest, $7.ListDeploymentsResponse>(
          '/celest.cloud.v1alpha1.Deployments/ListDeployments',
          ($7.ListDeploymentsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.ListDeploymentsResponse.fromBuffer(value));
  static final _$deleteDeployment =
      $grpc.ClientMethod<$7.DeleteDeploymentRequest, $1.Empty>(
          '/celest.cloud.v1alpha1.Deployments/DeleteDeployment',
          ($7.DeleteDeploymentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$watchDeployment =
      $grpc.ClientMethod<$7.WatchDeploymentRequest, $7.WatchDeploymentResponse>(
          '/celest.cloud.v1alpha1.Deployments/WatchDeployment',
          ($7.WatchDeploymentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.WatchDeploymentResponse.fromBuffer(value));

  DeploymentsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Operation> createDeployment(
      $7.CreateDeploymentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDeployment, request, options: options);
  }

  $grpc.ResponseFuture<$7.Deployment> getDeployment(
      $7.GetDeploymentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDeployment, request, options: options);
  }

  $grpc.ResponseFuture<$7.ListDeploymentsResponse> listDeployments(
      $7.ListDeploymentsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listDeployments, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteDeployment(
      $7.DeleteDeploymentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDeployment, request, options: options);
  }

  $grpc.ResponseStream<$7.WatchDeploymentResponse> watchDeployment(
      $7.WatchDeploymentRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$watchDeployment, $async.Stream.fromIterable([request]),
        options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Deployments')
abstract class DeploymentsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Deployments';

  DeploymentsServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.CreateDeploymentRequest, $2.Operation>(
        'CreateDeployment',
        createDeployment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.CreateDeploymentRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetDeploymentRequest, $7.Deployment>(
        'GetDeployment',
        getDeployment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.GetDeploymentRequest.fromBuffer(value),
        ($7.Deployment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ListDeploymentsRequest,
            $7.ListDeploymentsResponse>(
        'ListDeployments',
        listDeployments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.ListDeploymentsRequest.fromBuffer(value),
        ($7.ListDeploymentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.DeleteDeploymentRequest, $1.Empty>(
        'DeleteDeployment',
        deleteDeployment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.DeleteDeploymentRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.WatchDeploymentRequest,
            $7.WatchDeploymentResponse>(
        'WatchDeployment',
        watchDeployment_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $7.WatchDeploymentRequest.fromBuffer(value),
        ($7.WatchDeploymentResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.Operation> createDeployment_Pre($grpc.ServiceCall call,
      $async.Future<$7.CreateDeploymentRequest> request) async {
    return createDeployment(call, await request);
  }

  $async.Future<$7.Deployment> getDeployment_Pre($grpc.ServiceCall call,
      $async.Future<$7.GetDeploymentRequest> request) async {
    return getDeployment(call, await request);
  }

  $async.Future<$7.ListDeploymentsResponse> listDeployments_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.ListDeploymentsRequest> request) async {
    return listDeployments(call, await request);
  }

  $async.Future<$1.Empty> deleteDeployment_Pre($grpc.ServiceCall call,
      $async.Future<$7.DeleteDeploymentRequest> request) async {
    return deleteDeployment(call, await request);
  }

  $async.Stream<$7.WatchDeploymentResponse> watchDeployment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.WatchDeploymentRequest> request) async* {
    yield* watchDeployment(call, await request);
  }

  $async.Future<$2.Operation> createDeployment(
      $grpc.ServiceCall call, $7.CreateDeploymentRequest request);
  $async.Future<$7.Deployment> getDeployment(
      $grpc.ServiceCall call, $7.GetDeploymentRequest request);
  $async.Future<$7.ListDeploymentsResponse> listDeployments(
      $grpc.ServiceCall call, $7.ListDeploymentsRequest request);
  $async.Future<$1.Empty> deleteDeployment(
      $grpc.ServiceCall call, $7.DeleteDeploymentRequest request);
  $async.Stream<$7.WatchDeploymentResponse> watchDeployment(
      $grpc.ServiceCall call, $7.WatchDeploymentRequest request);
}
