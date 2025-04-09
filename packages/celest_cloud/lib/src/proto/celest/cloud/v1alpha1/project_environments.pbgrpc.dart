//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/project_environments.proto
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

import '../../../google/longrunning/operations.pb.dart' as $3;
import 'project_environments.pb.dart' as $5;

export 'project_environments.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.ProjectEnvironments')
class ProjectEnvironmentsClient extends $grpc.Client {
  static final _$createProjectEnvironment =
      $grpc.ClientMethod<$5.CreateProjectEnvironmentRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/CreateProjectEnvironment',
          ($5.CreateProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$getProjectEnvironment = $grpc.ClientMethod<
          $5.GetProjectEnvironmentRequest, $5.ProjectEnvironment>(
      '/celest.cloud.v1alpha1.ProjectEnvironments/GetProjectEnvironment',
      ($5.GetProjectEnvironmentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ProjectEnvironment.fromBuffer(value));
  static final _$updateProjectEnvironment =
      $grpc.ClientMethod<$5.UpdateProjectEnvironmentRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/UpdateProjectEnvironment',
          ($5.UpdateProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$listProjectEnvironments = $grpc.ClientMethod<
          $5.ListProjectEnvironmentsRequest,
          $5.ListProjectEnvironmentsResponse>(
      '/celest.cloud.v1alpha1.ProjectEnvironments/ListProjectEnvironments',
      ($5.ListProjectEnvironmentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $5.ListProjectEnvironmentsResponse.fromBuffer(value));
  static final _$deleteProjectEnvironment =
      $grpc.ClientMethod<$5.DeleteProjectEnvironmentRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/DeleteProjectEnvironment',
          ($5.DeleteProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$deployProjectEnvironment =
      $grpc.ClientMethod<$5.DeployProjectEnvironmentRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/DeployProjectEnvironment',
          ($5.DeployProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));

  ProjectEnvironmentsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.Operation> createProjectEnvironment(
      $5.CreateProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProjectEnvironment, request,
        options: options);
  }

  $grpc.ResponseFuture<$5.ProjectEnvironment> getProjectEnvironment(
      $5.GetProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProjectEnvironment, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> updateProjectEnvironment(
      $5.UpdateProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProjectEnvironment, request,
        options: options);
  }

  $grpc.ResponseFuture<$5.ListProjectEnvironmentsResponse>
      listProjectEnvironments($5.ListProjectEnvironmentsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listProjectEnvironments, request,
        options: options);
  }

  $grpc.ResponseFuture<$3.Operation> deleteProjectEnvironment(
      $5.DeleteProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteProjectEnvironment, request,
        options: options);
  }

  $grpc.ResponseFuture<$3.Operation> deployProjectEnvironment(
      $5.DeployProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deployProjectEnvironment, request,
        options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.ProjectEnvironments')
abstract class ProjectEnvironmentsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.ProjectEnvironments';

  ProjectEnvironmentsServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$5.CreateProjectEnvironmentRequest, $3.Operation>(
            'CreateProjectEnvironment',
            createProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.CreateProjectEnvironmentRequest.fromBuffer(value),
            ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetProjectEnvironmentRequest,
            $5.ProjectEnvironment>(
        'GetProjectEnvironment',
        getProjectEnvironment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.GetProjectEnvironmentRequest.fromBuffer(value),
        ($5.ProjectEnvironment value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$5.UpdateProjectEnvironmentRequest, $3.Operation>(
            'UpdateProjectEnvironment',
            updateProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.UpdateProjectEnvironmentRequest.fromBuffer(value),
            ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ListProjectEnvironmentsRequest,
            $5.ListProjectEnvironmentsResponse>(
        'ListProjectEnvironments',
        listProjectEnvironments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.ListProjectEnvironmentsRequest.fromBuffer(value),
        ($5.ListProjectEnvironmentsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$5.DeleteProjectEnvironmentRequest, $3.Operation>(
            'DeleteProjectEnvironment',
            deleteProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.DeleteProjectEnvironmentRequest.fromBuffer(value),
            ($3.Operation value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$5.DeployProjectEnvironmentRequest, $3.Operation>(
            'DeployProjectEnvironment',
            deployProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.DeployProjectEnvironmentRequest.fromBuffer(value),
            ($3.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$3.Operation> createProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.CreateProjectEnvironmentRequest> request) async {
    return createProjectEnvironment(call, await request);
  }

  $async.Future<$5.ProjectEnvironment> getProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.GetProjectEnvironmentRequest> request) async {
    return getProjectEnvironment(call, await request);
  }

  $async.Future<$3.Operation> updateProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.UpdateProjectEnvironmentRequest> request) async {
    return updateProjectEnvironment(call, await request);
  }

  $async.Future<$5.ListProjectEnvironmentsResponse> listProjectEnvironments_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.ListProjectEnvironmentsRequest> request) async {
    return listProjectEnvironments(call, await request);
  }

  $async.Future<$3.Operation> deleteProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.DeleteProjectEnvironmentRequest> request) async {
    return deleteProjectEnvironment(call, await request);
  }

  $async.Future<$3.Operation> deployProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.DeployProjectEnvironmentRequest> request) async {
    return deployProjectEnvironment(call, await request);
  }

  $async.Future<$3.Operation> createProjectEnvironment(
      $grpc.ServiceCall call, $5.CreateProjectEnvironmentRequest request);
  $async.Future<$5.ProjectEnvironment> getProjectEnvironment(
      $grpc.ServiceCall call, $5.GetProjectEnvironmentRequest request);
  $async.Future<$3.Operation> updateProjectEnvironment(
      $grpc.ServiceCall call, $5.UpdateProjectEnvironmentRequest request);
  $async.Future<$5.ListProjectEnvironmentsResponse> listProjectEnvironments(
      $grpc.ServiceCall call, $5.ListProjectEnvironmentsRequest request);
  $async.Future<$3.Operation> deleteProjectEnvironment(
      $grpc.ServiceCall call, $5.DeleteProjectEnvironmentRequest request);
  $async.Future<$3.Operation> deployProjectEnvironment(
      $grpc.ServiceCall call, $5.DeployProjectEnvironmentRequest request);
}
