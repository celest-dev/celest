// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/subscriptions.proto.

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

import 'subscriptions.pb.dart' as $0;

export 'subscriptions.pb.dart';

/// Manages subscriptions to the Celest Cloud service.
@$pb.GrpcServiceName('celest.cloud.v1alpha1.Subscriptions')
class SubscriptionsClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloud.celest.dev';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SubscriptionsClient(super.channel, {super.options, super.interceptors});

  /// Gets a subscription.
  $grpc.ResponseFuture<$0.Subscription> getSubscription(
    $0.GetSubscriptionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSubscription, request, options: options);
  }

  /// Change a user's subscription to Celest Cloud.
  $grpc.ResponseFuture<$0.ChangePlanResponse> changePlan(
    $0.ChangePlanRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$changePlan, request, options: options);
  }

  /// Pauses a subscription to Celest Cloud.
  $grpc.ResponseFuture<$0.PauseSubscriptionResponse> pauseSubscription(
    $0.PauseSubscriptionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pauseSubscription, request, options: options);
  }

  /// Cancels a subscription to Celest Cloud.
  $grpc.ResponseFuture<$0.CancelSubscriptionResponse> cancelSubscription(
    $0.CancelSubscriptionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$cancelSubscription, request, options: options);
  }

  /// Describes current pricing for all subscription plans and tiers.
  ///
  /// The `country_code` and `currency_code` can be provided to calculate
  /// regional pricing. If neither is provided, the user's location is determined
  /// from their IP address and the local pricing is returned for the local currency.
  $grpc.ResponseFuture<$0.DescribePricingResponse> describePricing(
    $0.DescribePricingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$describePricing, request, options: options);
  }

  // method descriptors

  static final _$getSubscription =
      $grpc.ClientMethod<$0.GetSubscriptionRequest, $0.Subscription>(
          '/celest.cloud.v1alpha1.Subscriptions/GetSubscription',
          ($0.GetSubscriptionRequest value) => value.writeToBuffer(),
          $0.Subscription.fromBuffer);
  static final _$changePlan =
      $grpc.ClientMethod<$0.ChangePlanRequest, $0.ChangePlanResponse>(
          '/celest.cloud.v1alpha1.Subscriptions/ChangePlan',
          ($0.ChangePlanRequest value) => value.writeToBuffer(),
          $0.ChangePlanResponse.fromBuffer);
  static final _$pauseSubscription = $grpc.ClientMethod<
          $0.PauseSubscriptionRequest, $0.PauseSubscriptionResponse>(
      '/celest.cloud.v1alpha1.Subscriptions/PauseSubscription',
      ($0.PauseSubscriptionRequest value) => value.writeToBuffer(),
      $0.PauseSubscriptionResponse.fromBuffer);
  static final _$cancelSubscription = $grpc.ClientMethod<
          $0.CancelSubscriptionRequest, $0.CancelSubscriptionResponse>(
      '/celest.cloud.v1alpha1.Subscriptions/CancelSubscription',
      ($0.CancelSubscriptionRequest value) => value.writeToBuffer(),
      $0.CancelSubscriptionResponse.fromBuffer);
  static final _$describePricing =
      $grpc.ClientMethod<$0.DescribePricingRequest, $0.DescribePricingResponse>(
          '/celest.cloud.v1alpha1.Subscriptions/DescribePricing',
          ($0.DescribePricingRequest value) => value.writeToBuffer(),
          $0.DescribePricingResponse.fromBuffer);
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Subscriptions')
abstract class SubscriptionsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Subscriptions';

  SubscriptionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetSubscriptionRequest, $0.Subscription>(
        'GetSubscription',
        getSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSubscriptionRequest.fromBuffer(value),
        ($0.Subscription value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangePlanRequest, $0.ChangePlanResponse>(
        'ChangePlan',
        changePlan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChangePlanRequest.fromBuffer(value),
        ($0.ChangePlanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PauseSubscriptionRequest,
            $0.PauseSubscriptionResponse>(
        'PauseSubscription',
        pauseSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.PauseSubscriptionRequest.fromBuffer(value),
        ($0.PauseSubscriptionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CancelSubscriptionRequest,
            $0.CancelSubscriptionResponse>(
        'CancelSubscription',
        cancelSubscription_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CancelSubscriptionRequest.fromBuffer(value),
        ($0.CancelSubscriptionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DescribePricingRequest,
            $0.DescribePricingResponse>(
        'DescribePricing',
        describePricing_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DescribePricingRequest.fromBuffer(value),
        ($0.DescribePricingResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.Subscription> getSubscription_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetSubscriptionRequest> $request) async {
    return getSubscription($call, await $request);
  }

  $async.Future<$0.Subscription> getSubscription(
      $grpc.ServiceCall call, $0.GetSubscriptionRequest request);

  $async.Future<$0.ChangePlanResponse> changePlan_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ChangePlanRequest> $request) async {
    return changePlan($call, await $request);
  }

  $async.Future<$0.ChangePlanResponse> changePlan(
      $grpc.ServiceCall call, $0.ChangePlanRequest request);

  $async.Future<$0.PauseSubscriptionResponse> pauseSubscription_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.PauseSubscriptionRequest> $request) async {
    return pauseSubscription($call, await $request);
  }

  $async.Future<$0.PauseSubscriptionResponse> pauseSubscription(
      $grpc.ServiceCall call, $0.PauseSubscriptionRequest request);

  $async.Future<$0.CancelSubscriptionResponse> cancelSubscription_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CancelSubscriptionRequest> $request) async {
    return cancelSubscription($call, await $request);
  }

  $async.Future<$0.CancelSubscriptionResponse> cancelSubscription(
      $grpc.ServiceCall call, $0.CancelSubscriptionRequest request);

  $async.Future<$0.DescribePricingResponse> describePricing_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DescribePricingRequest> $request) async {
    return describePricing($call, await $request);
  }

  $async.Future<$0.DescribePricingResponse> describePricing(
      $grpc.ServiceCall call, $0.DescribePricingRequest request);
}
