//
//  Generated code. Do not modify.
//  source: google/logging/v2/logging_metrics.proto
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

import '../../protobuf/empty.pb.dart' as $1;
import 'logging_metrics.pb.dart' as $4;

export 'logging_metrics.pb.dart';

@$pb.GrpcServiceName('google.logging.v2.MetricsServiceV2')
class MetricsServiceV2Client extends $grpc.Client {
  static final _$listLogMetrics =
      $grpc.ClientMethod<$4.ListLogMetricsRequest, $4.ListLogMetricsResponse>(
          '/google.logging.v2.MetricsServiceV2/ListLogMetrics',
          ($4.ListLogMetricsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.ListLogMetricsResponse.fromBuffer(value));
  static final _$getLogMetric =
      $grpc.ClientMethod<$4.GetLogMetricRequest, $4.LogMetric>(
          '/google.logging.v2.MetricsServiceV2/GetLogMetric',
          ($4.GetLogMetricRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.LogMetric.fromBuffer(value));
  static final _$createLogMetric =
      $grpc.ClientMethod<$4.CreateLogMetricRequest, $4.LogMetric>(
          '/google.logging.v2.MetricsServiceV2/CreateLogMetric',
          ($4.CreateLogMetricRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.LogMetric.fromBuffer(value));
  static final _$updateLogMetric =
      $grpc.ClientMethod<$4.UpdateLogMetricRequest, $4.LogMetric>(
          '/google.logging.v2.MetricsServiceV2/UpdateLogMetric',
          ($4.UpdateLogMetricRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.LogMetric.fromBuffer(value));
  static final _$deleteLogMetric =
      $grpc.ClientMethod<$4.DeleteLogMetricRequest, $1.Empty>(
          '/google.logging.v2.MetricsServiceV2/DeleteLogMetric',
          ($4.DeleteLogMetricRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  MetricsServiceV2Client($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.ListLogMetricsResponse> listLogMetrics(
      $4.ListLogMetricsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listLogMetrics, request, options: options);
  }

  $grpc.ResponseFuture<$4.LogMetric> getLogMetric(
      $4.GetLogMetricRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLogMetric, request, options: options);
  }

  $grpc.ResponseFuture<$4.LogMetric> createLogMetric(
      $4.CreateLogMetricRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLogMetric, request, options: options);
  }

  $grpc.ResponseFuture<$4.LogMetric> updateLogMetric(
      $4.UpdateLogMetricRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLogMetric, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteLogMetric(
      $4.DeleteLogMetricRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteLogMetric, request, options: options);
  }
}

@$pb.GrpcServiceName('google.logging.v2.MetricsServiceV2')
abstract class MetricsServiceV2ServiceBase extends $grpc.Service {
  $core.String get $name => 'google.logging.v2.MetricsServiceV2';

  MetricsServiceV2ServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.ListLogMetricsRequest,
            $4.ListLogMetricsResponse>(
        'ListLogMetrics',
        listLogMetrics_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.ListLogMetricsRequest.fromBuffer(value),
        ($4.ListLogMetricsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetLogMetricRequest, $4.LogMetric>(
        'GetLogMetric',
        getLogMetric_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetLogMetricRequest.fromBuffer(value),
        ($4.LogMetric value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.CreateLogMetricRequest, $4.LogMetric>(
        'CreateLogMetric',
        createLogMetric_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.CreateLogMetricRequest.fromBuffer(value),
        ($4.LogMetric value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UpdateLogMetricRequest, $4.LogMetric>(
        'UpdateLogMetric',
        updateLogMetric_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.UpdateLogMetricRequest.fromBuffer(value),
        ($4.LogMetric value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.DeleteLogMetricRequest, $1.Empty>(
        'DeleteLogMetric',
        deleteLogMetric_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.DeleteLogMetricRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$4.ListLogMetricsResponse> listLogMetrics_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.ListLogMetricsRequest> request) async {
    return listLogMetrics(call, await request);
  }

  $async.Future<$4.LogMetric> getLogMetric_Pre($grpc.ServiceCall call,
      $async.Future<$4.GetLogMetricRequest> request) async {
    return getLogMetric(call, await request);
  }

  $async.Future<$4.LogMetric> createLogMetric_Pre($grpc.ServiceCall call,
      $async.Future<$4.CreateLogMetricRequest> request) async {
    return createLogMetric(call, await request);
  }

  $async.Future<$4.LogMetric> updateLogMetric_Pre($grpc.ServiceCall call,
      $async.Future<$4.UpdateLogMetricRequest> request) async {
    return updateLogMetric(call, await request);
  }

  $async.Future<$1.Empty> deleteLogMetric_Pre($grpc.ServiceCall call,
      $async.Future<$4.DeleteLogMetricRequest> request) async {
    return deleteLogMetric(call, await request);
  }

  $async.Future<$4.ListLogMetricsResponse> listLogMetrics(
      $grpc.ServiceCall call, $4.ListLogMetricsRequest request);
  $async.Future<$4.LogMetric> getLogMetric(
      $grpc.ServiceCall call, $4.GetLogMetricRequest request);
  $async.Future<$4.LogMetric> createLogMetric(
      $grpc.ServiceCall call, $4.CreateLogMetricRequest request);
  $async.Future<$4.LogMetric> updateLogMetric(
      $grpc.ServiceCall call, $4.UpdateLogMetricRequest request);
  $async.Future<$1.Empty> deleteLogMetric(
      $grpc.ServiceCall call, $4.DeleteLogMetricRequest request);
}
