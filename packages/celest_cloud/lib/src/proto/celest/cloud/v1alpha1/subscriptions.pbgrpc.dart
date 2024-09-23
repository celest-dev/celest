//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/subscriptions.proto
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

import 'subscriptions.pb.dart' as $11;

export 'subscriptions.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Subscriptions')
class SubscriptionsClient extends $grpc.Client {
  static final _$getSubscription =
      $grpc.ClientMethod<$11.GetSubscriptionRequest, $11.Subscription>(
          '/celest.cloud.v1alpha1.Subscriptions/GetSubscription',
          ($11.GetSubscriptionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $11.Subscription.fromBuffer(value));
  static final _$changePlan =
      $grpc.ClientMethod<$11.ChangePlanRequest, $11.ChangePlanResponse>(
          '/celest.cloud.v1alpha1.Subscriptions/ChangePlan',
          ($11.ChangePlanRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $11.ChangePlanResponse.fromBuffer(value));
  static final _$pauseSubscription = $grpc.ClientMethod<
          $11.PauseSubscriptionRequest, $11.PauseSubscriptionResponse>(
      '/celest.cloud.v1alpha1.Subscriptions/PauseSubscription',
      ($11.PauseSubscriptionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $11.PauseSubscriptionResponse.fromBuffer(value));
  static final _$cancelSubscription = $grpc.ClientMethod<
          $11.CancelSubscriptionRequest, $11.CancelSubscriptionResponse>(
      '/celest.cloud.v1alpha1.Subscriptions/CancelSubscription',
      ($11.CancelSubscriptionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $11.CancelSubscriptionResponse.fromBuffer(value));

  SubscriptionsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$11.Subscription> getSubscription(
      $11.GetSubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSubscription, request, options: options);
  }

  $grpc.ResponseFuture<$11.ChangePlanResponse> changePlan(
      $11.ChangePlanRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePlan, request, options: options);
  }

  $grpc.ResponseFuture<$11.PauseSubscriptionResponse> pauseSubscription(
      $11.PauseSubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pauseSubscription, request, options: options);
  }

  $grpc.ResponseFuture<$11.CancelSubscriptionResponse> cancelSubscription(
      $11.CancelSubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelSubscription, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Subscriptions')
abstract class SubscriptionsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Subscriptions';

  SubscriptionsServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$11.GetSubscriptionRequest, $11.Subscription>(
            'GetSubscription',
            getSubscription_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $11.GetSubscriptionRequest.fromBuffer(value),
            ($11.Subscription value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$11.ChangePlanRequest, $11.ChangePlanResponse>(
            'ChangePlan',
            changePlan_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $11.ChangePlanRequest.fromBuffer(value),
            ($11.ChangePlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.PauseSubscriptionRequest,
            $11.PauseSubscriptionResponse>(
        'PauseSubscription',
        pauseSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $11.PauseSubscriptionRequest.fromBuffer(value),
        ($11.PauseSubscriptionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.CancelSubscriptionRequest,
            $11.CancelSubscriptionResponse>(
        'CancelSubscription',
        cancelSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $11.CancelSubscriptionRequest.fromBuffer(value),
        ($11.CancelSubscriptionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$11.Subscription> getSubscription_Pre($grpc.ServiceCall call,
      $async.Future<$11.GetSubscriptionRequest> request) async {
    return getSubscription(call, await request);
  }

  $async.Future<$11.ChangePlanResponse> changePlan_Pre($grpc.ServiceCall call,
      $async.Future<$11.ChangePlanRequest> request) async {
    return changePlan(call, await request);
  }

  $async.Future<$11.PauseSubscriptionResponse> pauseSubscription_Pre(
      $grpc.ServiceCall call,
      $async.Future<$11.PauseSubscriptionRequest> request) async {
    return pauseSubscription(call, await request);
  }

  $async.Future<$11.CancelSubscriptionResponse> cancelSubscription_Pre(
      $grpc.ServiceCall call,
      $async.Future<$11.CancelSubscriptionRequest> request) async {
    return cancelSubscription(call, await request);
  }

  $async.Future<$11.Subscription> getSubscription(
      $grpc.ServiceCall call, $11.GetSubscriptionRequest request);
  $async.Future<$11.ChangePlanResponse> changePlan(
      $grpc.ServiceCall call, $11.ChangePlanRequest request);
  $async.Future<$11.PauseSubscriptionResponse> pauseSubscription(
      $grpc.ServiceCall call, $11.PauseSubscriptionRequest request);
  $async.Future<$11.CancelSubscriptionResponse> cancelSubscription(
      $grpc.ServiceCall call, $11.CancelSubscriptionRequest request);
}
