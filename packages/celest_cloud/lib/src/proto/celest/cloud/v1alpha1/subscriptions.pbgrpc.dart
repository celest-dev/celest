//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/subscriptions.proto
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

import 'subscriptions.pb.dart' as $7;

export 'subscriptions.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Subscriptions')
class SubscriptionsClient extends $grpc.Client {
  static final _$getSubscription =
      $grpc.ClientMethod<$7.GetSubscriptionRequest, $7.Subscription>(
          '/celest.cloud.v1alpha1.Subscriptions/GetSubscription',
          ($7.GetSubscriptionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.Subscription.fromBuffer(value));
  static final _$changePlan =
      $grpc.ClientMethod<$7.ChangePlanRequest, $7.ChangePlanResponse>(
          '/celest.cloud.v1alpha1.Subscriptions/ChangePlan',
          ($7.ChangePlanRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.ChangePlanResponse.fromBuffer(value));
  static final _$pauseSubscription = $grpc.ClientMethod<
          $7.PauseSubscriptionRequest, $7.PauseSubscriptionResponse>(
      '/celest.cloud.v1alpha1.Subscriptions/PauseSubscription',
      ($7.PauseSubscriptionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.PauseSubscriptionResponse.fromBuffer(value));
  static final _$cancelSubscription = $grpc.ClientMethod<
          $7.CancelSubscriptionRequest, $7.CancelSubscriptionResponse>(
      '/celest.cloud.v1alpha1.Subscriptions/CancelSubscription',
      ($7.CancelSubscriptionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.CancelSubscriptionResponse.fromBuffer(value));
  static final _$describePricing =
      $grpc.ClientMethod<$7.DescribePricingRequest, $7.DescribePricingResponse>(
          '/celest.cloud.v1alpha1.Subscriptions/DescribePricing',
          ($7.DescribePricingRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.DescribePricingResponse.fromBuffer(value));

  SubscriptionsClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$7.Subscription> getSubscription(
      $7.GetSubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSubscription, request, options: options);
  }

  $grpc.ResponseFuture<$7.ChangePlanResponse> changePlan(
      $7.ChangePlanRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePlan, request, options: options);
  }

  $grpc.ResponseFuture<$7.PauseSubscriptionResponse> pauseSubscription(
      $7.PauseSubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pauseSubscription, request, options: options);
  }

  $grpc.ResponseFuture<$7.CancelSubscriptionResponse> cancelSubscription(
      $7.CancelSubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelSubscription, request, options: options);
  }

  $grpc.ResponseFuture<$7.DescribePricingResponse> describePricing(
      $7.DescribePricingRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$describePricing, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Subscriptions')
abstract class SubscriptionsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Subscriptions';

  SubscriptionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.GetSubscriptionRequest, $7.Subscription>(
        'GetSubscription',
        getSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.GetSubscriptionRequest.fromBuffer(value),
        ($7.Subscription value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ChangePlanRequest, $7.ChangePlanResponse>(
        'ChangePlan',
        changePlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.ChangePlanRequest.fromBuffer(value),
        ($7.ChangePlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.PauseSubscriptionRequest,
            $7.PauseSubscriptionResponse>(
        'PauseSubscription',
        pauseSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.PauseSubscriptionRequest.fromBuffer(value),
        ($7.PauseSubscriptionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.CancelSubscriptionRequest,
            $7.CancelSubscriptionResponse>(
        'CancelSubscription',
        cancelSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.CancelSubscriptionRequest.fromBuffer(value),
        ($7.CancelSubscriptionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.DescribePricingRequest,
            $7.DescribePricingResponse>(
        'DescribePricing',
        describePricing_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.DescribePricingRequest.fromBuffer(value),
        ($7.DescribePricingResponse value) => value.writeToBuffer()));
  }

  $async.Future<$7.Subscription> getSubscription_Pre($grpc.ServiceCall $call,
      $async.Future<$7.GetSubscriptionRequest> $request) async {
    return getSubscription($call, await $request);
  }

  $async.Future<$7.ChangePlanResponse> changePlan_Pre($grpc.ServiceCall $call,
      $async.Future<$7.ChangePlanRequest> $request) async {
    return changePlan($call, await $request);
  }

  $async.Future<$7.PauseSubscriptionResponse> pauseSubscription_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$7.PauseSubscriptionRequest> $request) async {
    return pauseSubscription($call, await $request);
  }

  $async.Future<$7.CancelSubscriptionResponse> cancelSubscription_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$7.CancelSubscriptionRequest> $request) async {
    return cancelSubscription($call, await $request);
  }

  $async.Future<$7.DescribePricingResponse> describePricing_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$7.DescribePricingRequest> $request) async {
    return describePricing($call, await $request);
  }

  $async.Future<$7.Subscription> getSubscription(
      $grpc.ServiceCall call, $7.GetSubscriptionRequest request);
  $async.Future<$7.ChangePlanResponse> changePlan(
      $grpc.ServiceCall call, $7.ChangePlanRequest request);
  $async.Future<$7.PauseSubscriptionResponse> pauseSubscription(
      $grpc.ServiceCall call, $7.PauseSubscriptionRequest request);
  $async.Future<$7.CancelSubscriptionResponse> cancelSubscription(
      $grpc.ServiceCall call, $7.CancelSubscriptionRequest request);
  $async.Future<$7.DescribePricingResponse> describePricing(
      $grpc.ServiceCall call, $7.DescribePricingRequest request);
}
