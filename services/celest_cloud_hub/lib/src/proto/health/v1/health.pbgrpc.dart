//
//  Generated code. Do not modify.
//  source: grpc/health/v1/health.proto
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

import 'health.pb.dart' as $0;

export 'health.pb.dart';

@$pb.GrpcServiceName('grpc.health.v1.Health')
class HealthClient extends $grpc.Client {
  static final _$check =
      $grpc.ClientMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
          '/grpc.health.v1.Health/Check',
          ($0.HealthCheckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.HealthCheckResponse.fromBuffer(value));
  static final _$watch =
      $grpc.ClientMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
          '/grpc.health.v1.Health/Watch',
          ($0.HealthCheckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.HealthCheckResponse.fromBuffer(value));

  HealthClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HealthCheckResponse> check(
      $0.HealthCheckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }

  $grpc.ResponseStream<$0.HealthCheckResponse> watch(
      $0.HealthCheckRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$watch, $async.Stream.fromIterable([request]),
        options: options);
  }
}

@$pb.GrpcServiceName('grpc.health.v1.Health')
abstract class HealthServiceBase extends $grpc.Service {
  $core.String get $name => 'grpc.health.v1.Health';

  HealthServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
            'Check',
            check_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.HealthCheckRequest.fromBuffer(value),
            ($0.HealthCheckResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
            'Watch',
            watch_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.HealthCheckRequest.fromBuffer(value),
            ($0.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HealthCheckResponse> check_Pre($grpc.ServiceCall call,
      $async.Future<$0.HealthCheckRequest> request) async {
    return check(call, await request);
  }

  $async.Stream<$0.HealthCheckResponse> watch_Pre($grpc.ServiceCall call,
      $async.Future<$0.HealthCheckRequest> request) async* {
    yield* watch(call, await request);
  }

  $async.Future<$0.HealthCheckResponse> check(
      $grpc.ServiceCall call, $0.HealthCheckRequest request);
  $async.Stream<$0.HealthCheckResponse> watch(
      $grpc.ServiceCall call, $0.HealthCheckRequest request);
}
