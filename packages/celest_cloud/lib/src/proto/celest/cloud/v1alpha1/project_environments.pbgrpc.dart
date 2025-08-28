// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/project_environments.proto.

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

import '../../../google/longrunning/operations.pb.dart' as $1;
import 'project_environments.pb.dart' as $0;

export 'project_environments.pb.dart';

/// A service for managing the different environments of Celest projects in the cloud.
@$pb.GrpcServiceName('celest.cloud.v1alpha1.ProjectEnvironments')
class ProjectEnvironmentsClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloud.celest.dev';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ProjectEnvironmentsClient(super.channel, {super.options, super.interceptors});

  /// Creates a new environment.
  $grpc.ResponseFuture<$1.Operation> createProjectEnvironment(
    $0.CreateProjectEnvironmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createProjectEnvironment, request,
        options: options);
  }

  /// Retrieves an environment.
  $grpc.ResponseFuture<$0.ProjectEnvironment> getProjectEnvironment(
    $0.GetProjectEnvironmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getProjectEnvironment, request, options: options);
  }

  /// Updates an environment.
  $grpc.ResponseFuture<$1.Operation> updateProjectEnvironment(
    $0.UpdateProjectEnvironmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateProjectEnvironment, request,
        options: options);
  }

  /// Lists environments.
  $grpc.ResponseFuture<$0.ListProjectEnvironmentsResponse>
      listProjectEnvironments(
    $0.ListProjectEnvironmentsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listProjectEnvironments, request,
        options: options);
  }

  /// Deletes an environment.
  ///
  /// TODO: Add UndeleteProjectEnvironment
  $grpc.ResponseFuture<$1.Operation> deleteProjectEnvironment(
    $0.DeleteProjectEnvironmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteProjectEnvironment, request,
        options: options);
  }

  /// Imperative only. Deploys a project's environment.
  $grpc.ResponseFuture<$1.Operation> deployProjectEnvironment(
    $0.DeployProjectEnvironmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deployProjectEnvironment, request,
        options: options);
  }

  // method descriptors

  static final _$createProjectEnvironment =
      $grpc.ClientMethod<$0.CreateProjectEnvironmentRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/CreateProjectEnvironment',
          ($0.CreateProjectEnvironmentRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$getProjectEnvironment = $grpc.ClientMethod<
          $0.GetProjectEnvironmentRequest, $0.ProjectEnvironment>(
      '/celest.cloud.v1alpha1.ProjectEnvironments/GetProjectEnvironment',
      ($0.GetProjectEnvironmentRequest value) => value.writeToBuffer(),
      $0.ProjectEnvironment.fromBuffer);
  static final _$updateProjectEnvironment =
      $grpc.ClientMethod<$0.UpdateProjectEnvironmentRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/UpdateProjectEnvironment',
          ($0.UpdateProjectEnvironmentRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$listProjectEnvironments = $grpc.ClientMethod<
          $0.ListProjectEnvironmentsRequest,
          $0.ListProjectEnvironmentsResponse>(
      '/celest.cloud.v1alpha1.ProjectEnvironments/ListProjectEnvironments',
      ($0.ListProjectEnvironmentsRequest value) => value.writeToBuffer(),
      $0.ListProjectEnvironmentsResponse.fromBuffer);
  static final _$deleteProjectEnvironment =
      $grpc.ClientMethod<$0.DeleteProjectEnvironmentRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/DeleteProjectEnvironment',
          ($0.DeleteProjectEnvironmentRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$deployProjectEnvironment =
      $grpc.ClientMethod<$0.DeployProjectEnvironmentRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.ProjectEnvironments/DeployProjectEnvironment',
          ($0.DeployProjectEnvironmentRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.ProjectEnvironments')
abstract class ProjectEnvironmentsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.ProjectEnvironments';

  ProjectEnvironmentsServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateProjectEnvironmentRequest, $1.Operation>(
            'CreateProjectEnvironment',
            createProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateProjectEnvironmentRequest.fromBuffer(value),
            ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetProjectEnvironmentRequest,
            $0.ProjectEnvironment>(
        'GetProjectEnvironment',
        getProjectEnvironment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetProjectEnvironmentRequest.fromBuffer(value),
        ($0.ProjectEnvironment value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateProjectEnvironmentRequest, $1.Operation>(
            'UpdateProjectEnvironment',
            updateProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateProjectEnvironmentRequest.fromBuffer(value),
            ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListProjectEnvironmentsRequest,
            $0.ListProjectEnvironmentsResponse>(
        'ListProjectEnvironments',
        listProjectEnvironments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListProjectEnvironmentsRequest.fromBuffer(value),
        ($0.ListProjectEnvironmentsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteProjectEnvironmentRequest, $1.Operation>(
            'DeleteProjectEnvironment',
            deleteProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteProjectEnvironmentRequest.fromBuffer(value),
            ($1.Operation value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeployProjectEnvironmentRequest, $1.Operation>(
            'DeployProjectEnvironment',
            deployProjectEnvironment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeployProjectEnvironmentRequest.fromBuffer(value),
            ($1.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$1.Operation> createProjectEnvironment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateProjectEnvironmentRequest> $request) async {
    return createProjectEnvironment($call, await $request);
  }

  $async.Future<$1.Operation> createProjectEnvironment(
      $grpc.ServiceCall call, $0.CreateProjectEnvironmentRequest request);

  $async.Future<$0.ProjectEnvironment> getProjectEnvironment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetProjectEnvironmentRequest> $request) async {
    return getProjectEnvironment($call, await $request);
  }

  $async.Future<$0.ProjectEnvironment> getProjectEnvironment(
      $grpc.ServiceCall call, $0.GetProjectEnvironmentRequest request);

  $async.Future<$1.Operation> updateProjectEnvironment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdateProjectEnvironmentRequest> $request) async {
    return updateProjectEnvironment($call, await $request);
  }

  $async.Future<$1.Operation> updateProjectEnvironment(
      $grpc.ServiceCall call, $0.UpdateProjectEnvironmentRequest request);

  $async.Future<$0.ListProjectEnvironmentsResponse> listProjectEnvironments_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListProjectEnvironmentsRequest> $request) async {
    return listProjectEnvironments($call, await $request);
  }

  $async.Future<$0.ListProjectEnvironmentsResponse> listProjectEnvironments(
      $grpc.ServiceCall call, $0.ListProjectEnvironmentsRequest request);

  $async.Future<$1.Operation> deleteProjectEnvironment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeleteProjectEnvironmentRequest> $request) async {
    return deleteProjectEnvironment($call, await $request);
  }

  $async.Future<$1.Operation> deleteProjectEnvironment(
      $grpc.ServiceCall call, $0.DeleteProjectEnvironmentRequest request);

  $async.Future<$1.Operation> deployProjectEnvironment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeployProjectEnvironmentRequest> $request) async {
    return deployProjectEnvironment($call, await $request);
  }

  $async.Future<$1.Operation> deployProjectEnvironment(
      $grpc.ServiceCall call, $0.DeployProjectEnvironmentRequest request);
}
