// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/projects.proto.

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
import 'projects.pb.dart' as $0;

export 'projects.pb.dart';

/// Allows organization administrators to create projects.
@$pb.GrpcServiceName('celest.cloud.v1alpha1.Projects')
class ProjectsClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloud.celest.dev';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ProjectsClient(super.channel, {super.options, super.interceptors});

  /// Creates a new project.
  $grpc.ResponseFuture<$1.Operation> createProject(
    $0.CreateProjectRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createProject, request, options: options);
  }

  /// Retrieves the project identified by the specified name.
  $grpc.ResponseFuture<$0.Project> getProject(
    $0.GetProjectRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getProject, request, options: options);
  }

  /// Lists projects in an organization.
  $grpc.ResponseFuture<$0.ListProjectsResponse> listProjects(
    $0.ListProjectsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listProjects, request, options: options);
  }

  /// Update the project identified by the specified name.
  $grpc.ResponseFuture<$1.Operation> updateProject(
    $0.UpdateProjectRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateProject, request, options: options);
  }

  /// Marks a project for deletion.
  $grpc.ResponseFuture<$1.Operation> deleteProject(
    $0.DeleteProjectRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteProject, request, options: options);
  }

  /// Undeletes a project.
  $grpc.ResponseFuture<$1.Operation> undeleteProject(
    $0.UndeleteProjectRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$undeleteProject, request, options: options);
  }

  /// Renames the project identified by the specified name.
  ///
  /// After renaming, the project can no longer be identified by the previous name. All of its child resources are
  /// also renamed and must be accessed using the new identifier.
  ///
  /// Renaming does not release the previous identifier from use. It is an error to attempt to create a new project
  /// with the same identifier as a previously renamed project.
  ///
  /// (-- api-linter: core::0136::declarative-standard-methods-only=disabled
  ///     aip.dev/not-precedent: Renaming is an inherently imperative method which should not be handled declaratively.
  ///     https://google.aip.dev/136#declarative-friendly-resources --)
  $grpc.ResponseFuture<$1.Operation> renameProject(
    $0.RenameProjectRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$renameProject, request, options: options);
  }

  // method descriptors

  static final _$createProject =
      $grpc.ClientMethod<$0.CreateProjectRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Projects/CreateProject',
          ($0.CreateProjectRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$getProject =
      $grpc.ClientMethod<$0.GetProjectRequest, $0.Project>(
          '/celest.cloud.v1alpha1.Projects/GetProject',
          ($0.GetProjectRequest value) => value.writeToBuffer(),
          $0.Project.fromBuffer);
  static final _$listProjects =
      $grpc.ClientMethod<$0.ListProjectsRequest, $0.ListProjectsResponse>(
          '/celest.cloud.v1alpha1.Projects/ListProjects',
          ($0.ListProjectsRequest value) => value.writeToBuffer(),
          $0.ListProjectsResponse.fromBuffer);
  static final _$updateProject =
      $grpc.ClientMethod<$0.UpdateProjectRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Projects/UpdateProject',
          ($0.UpdateProjectRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$deleteProject =
      $grpc.ClientMethod<$0.DeleteProjectRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Projects/DeleteProject',
          ($0.DeleteProjectRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$undeleteProject =
      $grpc.ClientMethod<$0.UndeleteProjectRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Projects/UndeleteProject',
          ($0.UndeleteProjectRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$renameProject =
      $grpc.ClientMethod<$0.RenameProjectRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Projects/RenameProject',
          ($0.RenameProjectRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Projects')
abstract class ProjectsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Projects';

  ProjectsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateProjectRequest, $1.Operation>(
        'CreateProject',
        createProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateProjectRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetProjectRequest, $0.Project>(
        'GetProject',
        getProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProjectRequest.fromBuffer(value),
        ($0.Project value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListProjectsRequest, $0.ListProjectsResponse>(
            'ListProjects',
            listProjects_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListProjectsRequest.fromBuffer(value),
            ($0.ListProjectsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateProjectRequest, $1.Operation>(
        'UpdateProject',
        updateProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateProjectRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteProjectRequest, $1.Operation>(
        'DeleteProject',
        deleteProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteProjectRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UndeleteProjectRequest, $1.Operation>(
        'UndeleteProject',
        undeleteProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UndeleteProjectRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenameProjectRequest, $1.Operation>(
        'RenameProject',
        renameProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RenameProjectRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$1.Operation> createProject_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateProjectRequest> $request) async {
    return createProject($call, await $request);
  }

  $async.Future<$1.Operation> createProject(
      $grpc.ServiceCall call, $0.CreateProjectRequest request);

  $async.Future<$0.Project> getProject_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetProjectRequest> $request) async {
    return getProject($call, await $request);
  }

  $async.Future<$0.Project> getProject(
      $grpc.ServiceCall call, $0.GetProjectRequest request);

  $async.Future<$0.ListProjectsResponse> listProjects_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListProjectsRequest> $request) async {
    return listProjects($call, await $request);
  }

  $async.Future<$0.ListProjectsResponse> listProjects(
      $grpc.ServiceCall call, $0.ListProjectsRequest request);

  $async.Future<$1.Operation> updateProject_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateProjectRequest> $request) async {
    return updateProject($call, await $request);
  }

  $async.Future<$1.Operation> updateProject(
      $grpc.ServiceCall call, $0.UpdateProjectRequest request);

  $async.Future<$1.Operation> deleteProject_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteProjectRequest> $request) async {
    return deleteProject($call, await $request);
  }

  $async.Future<$1.Operation> deleteProject(
      $grpc.ServiceCall call, $0.DeleteProjectRequest request);

  $async.Future<$1.Operation> undeleteProject_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UndeleteProjectRequest> $request) async {
    return undeleteProject($call, await $request);
  }

  $async.Future<$1.Operation> undeleteProject(
      $grpc.ServiceCall call, $0.UndeleteProjectRequest request);

  $async.Future<$1.Operation> renameProject_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RenameProjectRequest> $request) async {
    return renameProject($call, await $request);
  }

  $async.Future<$1.Operation> renameProject(
      $grpc.ServiceCall call, $0.RenameProjectRequest request);
}
