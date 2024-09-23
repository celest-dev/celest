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

import '../../../google/longrunning/operations.pb.dart' as $2;
import 'project_environments.pb.dart' as $9;

export 'project_environments.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.ProjectEnvironments')
class ProjectEnvironmentsClient extends $grpc.Client {
  static final _$createProjectEnvironment =
      $grpc.ClientMethod<$9.CreateProjectEnvironmentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/CreateProjectEnvironment',
          ($9.CreateProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$getProjectEnvironment = $grpc.ClientMethod<
          $9.GetProjectEnvironmentRequest, $9.ProjectEnvironment>(
      '/celest.cloud.v1alpha1.ProjectEnvironments/GetProjectEnvironment',
      ($9.GetProjectEnvironmentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.ProjectEnvironment.fromBuffer(value));
  static final _$updateProjectEnvironment =
      $grpc.ClientMethod<$9.UpdateProjectEnvironmentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/UpdateProjectEnvironment',
          ($9.UpdateProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$listProjectEnvironments = $grpc.ClientMethod<
          $9.ListProjectEnvironmentsRequest,
          $9.ListProjectEnvironmentsResponse>(
      '/celest.cloud.v1alpha1.ProjectEnvironments/ListProjectEnvironments',
      ($9.ListProjectEnvironmentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $9.ListProjectEnvironmentsResponse.fromBuffer(value));
  static final _$deleteProjectEnvironment =
      $grpc.ClientMethod<$9.DeleteProjectEnvironmentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/DeleteProjectEnvironment',
          ($9.DeleteProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$deployProjectEnvironment =
      $grpc.ClientMethod<$9.DeployProjectEnvironmentRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/DeployProjectEnvironment',
          ($9.DeployProjectEnvironmentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));

  ProjectEnvironmentsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Operation> createProjectEnvironment(
      $9.CreateProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProjectEnvironment, request,
        options: options);
  }

  $grpc.ResponseFuture<$9.ProjectEnvironment> getProjectEnvironment(
      $9.GetProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProjectEnvironment, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> updateProjectEnvironment(
      $9.UpdateProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProjectEnvironment, request,
        options: options);
  }

  $grpc.ResponseFuture<$9.ListProjectEnvironmentsResponse>
      listProjectEnvironments($9.ListProjectEnvironmentsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listProjectEnvironments, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.Operation> deleteProjectEnvironment(
      $9.DeleteProjectEnvironmentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteProjectEnvironment, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.Operation> deployProjectEnvironment(
      $9.DeployProjectEnvironmentRequest request,
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
        $grpc.ServiceMethod<$9.CreateProjectEnvironmentRequest, $2.Operation>(
            'CreateProjectEnvironment',
            createProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $9.CreateProjectEnvironmentRequest.fromBuffer(value),
            ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetProjectEnvironmentRequest,
            $9.ProjectEnvironment>(
        'GetProjectEnvironment',
        getProjectEnvironment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.GetProjectEnvironmentRequest.fromBuffer(value),
        ($9.ProjectEnvironment value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$9.UpdateProjectEnvironmentRequest, $2.Operation>(
            'UpdateProjectEnvironment',
            updateProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $9.UpdateProjectEnvironmentRequest.fromBuffer(value),
            ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ListProjectEnvironmentsRequest,
            $9.ListProjectEnvironmentsResponse>(
        'ListProjectEnvironments',
        listProjectEnvironments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.ListProjectEnvironmentsRequest.fromBuffer(value),
        ($9.ListProjectEnvironmentsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$9.DeleteProjectEnvironmentRequest, $2.Operation>(
            'DeleteProjectEnvironment',
            deleteProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $9.DeleteProjectEnvironmentRequest.fromBuffer(value),
            ($2.Operation value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$9.DeployProjectEnvironmentRequest, $2.Operation>(
            'DeployProjectEnvironment',
            deployProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $9.DeployProjectEnvironmentRequest.fromBuffer(value),
            ($2.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$2.Operation> createProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.CreateProjectEnvironmentRequest> request) async {
    return createProjectEnvironment(call, await request);
  }

  $async.Future<$9.ProjectEnvironment> getProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.GetProjectEnvironmentRequest> request) async {
    return getProjectEnvironment(call, await request);
  }

  $async.Future<$2.Operation> updateProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.UpdateProjectEnvironmentRequest> request) async {
    return updateProjectEnvironment(call, await request);
  }

  $async.Future<$9.ListProjectEnvironmentsResponse> listProjectEnvironments_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.ListProjectEnvironmentsRequest> request) async {
    return listProjectEnvironments(call, await request);
  }

  $async.Future<$2.Operation> deleteProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.DeleteProjectEnvironmentRequest> request) async {
    return deleteProjectEnvironment(call, await request);
  }

  $async.Future<$2.Operation> deployProjectEnvironment_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.DeployProjectEnvironmentRequest> request) async {
    return deployProjectEnvironment(call, await request);
  }

  $async.Future<$2.Operation> createProjectEnvironment(
      $grpc.ServiceCall call, $9.CreateProjectEnvironmentRequest request);
  $async.Future<$9.ProjectEnvironment> getProjectEnvironment(
      $grpc.ServiceCall call, $9.GetProjectEnvironmentRequest request);
  $async.Future<$2.Operation> updateProjectEnvironment(
      $grpc.ServiceCall call, $9.UpdateProjectEnvironmentRequest request);
  $async.Future<$9.ListProjectEnvironmentsResponse> listProjectEnvironments(
      $grpc.ServiceCall call, $9.ListProjectEnvironmentsRequest request);
  $async.Future<$2.Operation> deleteProjectEnvironment(
      $grpc.ServiceCall call, $9.DeleteProjectEnvironmentRequest request);
  $async.Future<$2.Operation> deployProjectEnvironment(
      $grpc.ServiceCall call, $9.DeployProjectEnvironmentRequest request);
}
