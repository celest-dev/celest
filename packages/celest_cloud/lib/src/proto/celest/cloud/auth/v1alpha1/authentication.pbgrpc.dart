// This is a generated file - do not edit.
//
// Generated from celest/cloud/auth/v1alpha1/authentication.proto.

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

import '../../../../google/protobuf/empty.pb.dart' as $1;
import 'authentication.pb.dart' as $0;

export 'authentication.pb.dart';

/// The authentication service.
@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Authentication')
class AuthenticationClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloud.celest.dev';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthenticationClient(super.channel, {super.options, super.interceptors});

  /// Starts an authentication session.
  ///
  /// Upon completion, if the identified user does not exist, a new user will be created
  /// unless that user can be linked to an existing identity.
  ///
  /// See the docs [here](https://cloud.google.com/identity-platform/docs/concepts-manage-users#verified_email_addresses)
  /// for when linking is possible.
  ///
  /// (-- api-linter: core::0136::response-message-name=disabled
  ///     api-linter: core::0136::http-uri-suffix=disabled
  ///     api-linter: core::0134::request-required-fields
  ///     aip.dev/not-precedent: State machine RPC. --)
  $grpc.ResponseFuture<$0.Session> startSession(
    $0.StartSessionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$startSession, request, options: options);
  }

  /// Continues an authentication session.
  ///
  /// Upon completion, if the identified user does not exist, a new user will be created
  /// unless that user can be linked to an existing identity.
  ///
  /// See the docs [here](https://cloud.google.com/identity-platform/docs/concepts-manage-users#verified_email_addresses)
  /// for when linking is possible.
  ///
  /// (-- api-linter: core::0136::response-message-name=disabled
  ///     api-linter: core::0136::http-uri-suffix=disabled
  ///     aip.dev/not-precedent: State machine RPC. --)
  $grpc.ResponseFuture<$0.Session> continueSession(
    $0.ContinueSessionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$continueSession, request, options: options);
  }

  /// Cancels an in-progress authentication session.
  ///
  /// (-- api-linter: core::0136::response-message-name=disabled
  ///     api-linter: core::0136::http-uri-suffix=disabled
  ///     aip.dev/not-precedent: State machine RPC. --)
  $grpc.ResponseFuture<$0.EndSessionResponse> endSession(
    $0.EndSessionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$endSession, request, options: options);
  }

  /// Retrieves the current user's userinfo.
  ///
  /// This API follows the OIDC `/userinfo` endpoint:
  /// https://openid.net/specs/openid-connect-core-1_0.html#UserInfo
  /// (-- api-linter: core::0131::method-signature=disabled
  ///     api-linter: core::0131::http-uri-name=disabled
  ///     api-linter: core::0131::http-method=disabled
  ///     api-linter: core::0131::request-message-name=disabled
  ///     aip.dev/not-precedent: Conformance to OIDC --)
  $grpc.ResponseFuture<$0.OpenIdUserinfo> getOpenIdUserinfo(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getOpenIdUserinfo, request, options: options);
  }

  // method descriptors

  static final _$startSession =
      $grpc.ClientMethod<$0.StartSessionRequest, $0.Session>(
          '/celest.cloud.auth.v1alpha1.Authentication/StartSession',
          ($0.StartSessionRequest value) => value.writeToBuffer(),
          $0.Session.fromBuffer);
  static final _$continueSession =
      $grpc.ClientMethod<$0.ContinueSessionRequest, $0.Session>(
          '/celest.cloud.auth.v1alpha1.Authentication/ContinueSession',
          ($0.ContinueSessionRequest value) => value.writeToBuffer(),
          $0.Session.fromBuffer);
  static final _$endSession =
      $grpc.ClientMethod<$0.EndSessionRequest, $0.EndSessionResponse>(
          '/celest.cloud.auth.v1alpha1.Authentication/EndSession',
          ($0.EndSessionRequest value) => value.writeToBuffer(),
          $0.EndSessionResponse.fromBuffer);
  static final _$getOpenIdUserinfo =
      $grpc.ClientMethod<$1.Empty, $0.OpenIdUserinfo>(
          '/celest.cloud.auth.v1alpha1.Authentication/GetOpenIdUserinfo',
          ($1.Empty value) => value.writeToBuffer(),
          $0.OpenIdUserinfo.fromBuffer);
}

@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Authentication')
abstract class AuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.auth.v1alpha1.Authentication';

  AuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StartSessionRequest, $0.Session>(
        'StartSession',
        startSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StartSessionRequest.fromBuffer(value),
        ($0.Session value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContinueSessionRequest, $0.Session>(
        'ContinueSession',
        continueSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ContinueSessionRequest.fromBuffer(value),
        ($0.Session value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EndSessionRequest, $0.EndSessionResponse>(
        'EndSession',
        endSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EndSessionRequest.fromBuffer(value),
        ($0.EndSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.OpenIdUserinfo>(
        'GetOpenIdUserinfo',
        getOpenIdUserinfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.OpenIdUserinfo value) => value.writeToBuffer()));
  }

  $async.Future<$0.Session> startSession_Pre($grpc.ServiceCall $call,
      $async.Future<$0.StartSessionRequest> $request) async {
    return startSession($call, await $request);
  }

  $async.Future<$0.Session> startSession(
      $grpc.ServiceCall call, $0.StartSessionRequest request);

  $async.Future<$0.Session> continueSession_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ContinueSessionRequest> $request) async {
    return continueSession($call, await $request);
  }

  $async.Future<$0.Session> continueSession(
      $grpc.ServiceCall call, $0.ContinueSessionRequest request);

  $async.Future<$0.EndSessionResponse> endSession_Pre($grpc.ServiceCall $call,
      $async.Future<$0.EndSessionRequest> $request) async {
    return endSession($call, await $request);
  }

  $async.Future<$0.EndSessionResponse> endSession(
      $grpc.ServiceCall call, $0.EndSessionRequest request);

  $async.Future<$0.OpenIdUserinfo> getOpenIdUserinfo_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return getOpenIdUserinfo($call, await $request);
  }

  $async.Future<$0.OpenIdUserinfo> getOpenIdUserinfo(
      $grpc.ServiceCall call, $1.Empty request);
}
