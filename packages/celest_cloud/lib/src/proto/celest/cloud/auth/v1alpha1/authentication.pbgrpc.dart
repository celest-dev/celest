//
//  Generated code. Do not modify.
//  source: celest/cloud/auth/v1alpha1/authentication.proto
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

import '../../../../google/protobuf/empty.pb.dart' as $1;
import 'authentication.pb.dart' as $6;

export 'authentication.pb.dart';

@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Authentication')
class AuthenticationClient extends $grpc.Client {
  static final _$startSession =
      $grpc.ClientMethod<$6.StartSessionRequest, $6.Session>(
          '/celest.cloud.auth.v1alpha1.Authentication/StartSession',
          ($6.StartSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $6.Session.fromBuffer(value));
  static final _$continueSession =
      $grpc.ClientMethod<$6.ContinueSessionRequest, $6.Session>(
          '/celest.cloud.auth.v1alpha1.Authentication/ContinueSession',
          ($6.ContinueSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $6.Session.fromBuffer(value));
  static final _$endSession =
      $grpc.ClientMethod<$6.EndSessionRequest, $6.EndSessionResponse>(
          '/celest.cloud.auth.v1alpha1.Authentication/EndSession',
          ($6.EndSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $6.EndSessionResponse.fromBuffer(value));
  static final _$getOpenIdUserinfo =
      $grpc.ClientMethod<$1.Empty, $6.OpenIdUserinfo>(
          '/celest.cloud.auth.v1alpha1.Authentication/GetOpenIdUserinfo',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $6.OpenIdUserinfo.fromBuffer(value));

  AuthenticationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$6.Session> startSession($6.StartSessionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startSession, request, options: options);
  }

  $grpc.ResponseFuture<$6.Session> continueSession(
      $6.ContinueSessionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$continueSession, request, options: options);
  }

  $grpc.ResponseFuture<$6.EndSessionResponse> endSession(
      $6.EndSessionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$endSession, request, options: options);
  }

  $grpc.ResponseFuture<$6.OpenIdUserinfo> getOpenIdUserinfo($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOpenIdUserinfo, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Authentication')
abstract class AuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.auth.v1alpha1.Authentication';

  AuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.StartSessionRequest, $6.Session>(
        'StartSession',
        startSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.StartSessionRequest.fromBuffer(value),
        ($6.Session value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ContinueSessionRequest, $6.Session>(
        'ContinueSession',
        continueSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.ContinueSessionRequest.fromBuffer(value),
        ($6.Session value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.EndSessionRequest, $6.EndSessionResponse>(
        'EndSession',
        endSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.EndSessionRequest.fromBuffer(value),
        ($6.EndSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $6.OpenIdUserinfo>(
        'GetOpenIdUserinfo',
        getOpenIdUserinfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($6.OpenIdUserinfo value) => value.writeToBuffer()));
  }

  $async.Future<$6.Session> startSession_Pre($grpc.ServiceCall call,
      $async.Future<$6.StartSessionRequest> request) async {
    return startSession(call, await request);
  }

  $async.Future<$6.Session> continueSession_Pre($grpc.ServiceCall call,
      $async.Future<$6.ContinueSessionRequest> request) async {
    return continueSession(call, await request);
  }

  $async.Future<$6.EndSessionResponse> endSession_Pre($grpc.ServiceCall call,
      $async.Future<$6.EndSessionRequest> request) async {
    return endSession(call, await request);
  }

  $async.Future<$6.OpenIdUserinfo> getOpenIdUserinfo_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getOpenIdUserinfo(call, await request);
  }

  $async.Future<$6.Session> startSession(
      $grpc.ServiceCall call, $6.StartSessionRequest request);
  $async.Future<$6.Session> continueSession(
      $grpc.ServiceCall call, $6.ContinueSessionRequest request);
  $async.Future<$6.EndSessionResponse> endSession(
      $grpc.ServiceCall call, $6.EndSessionRequest request);
  $async.Future<$6.OpenIdUserinfo> getOpenIdUserinfo(
      $grpc.ServiceCall call, $1.Empty request);
}
