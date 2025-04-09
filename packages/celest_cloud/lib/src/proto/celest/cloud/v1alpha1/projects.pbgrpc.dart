//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/projects.proto
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
import 'projects.pb.dart' as $6;

export 'projects.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Projects')
class ProjectsClient extends $grpc.Client {
  static final _$createProject =
      $grpc.ClientMethod<$6.CreateProjectRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Projects/CreateProject',
          ($6.CreateProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$getProject =
      $grpc.ClientMethod<$6.GetProjectRequest, $6.Project>(
          '/celest.cloud.v1alpha1.Projects/GetProject',
          ($6.GetProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $6.Project.fromBuffer(value));
  static final _$listProjects =
      $grpc.ClientMethod<$6.ListProjectsRequest, $6.ListProjectsResponse>(
          '/celest.cloud.v1alpha1.Projects/ListProjects',
          ($6.ListProjectsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $6.ListProjectsResponse.fromBuffer(value));
  static final _$updateProject =
      $grpc.ClientMethod<$6.UpdateProjectRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Projects/UpdateProject',
          ($6.UpdateProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$deleteProject =
      $grpc.ClientMethod<$6.DeleteProjectRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Projects/DeleteProject',
          ($6.DeleteProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$undeleteProject =
      $grpc.ClientMethod<$6.UndeleteProjectRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Projects/UndeleteProject',
          ($6.UndeleteProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$renameProject =
      $grpc.ClientMethod<$6.RenameProjectRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Projects/RenameProject',
          ($6.RenameProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));

  ProjectsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.Operation> createProject(
      $6.CreateProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProject, request, options: options);
  }

  $grpc.ResponseFuture<$6.Project> getProject($6.GetProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProject, request, options: options);
  }

  $grpc.ResponseFuture<$6.ListProjectsResponse> listProjects(
      $6.ListProjectsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listProjects, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> updateProject(
      $6.UpdateProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProject, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> deleteProject(
      $6.DeleteProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteProject, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> undeleteProject(
      $6.UndeleteProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undeleteProject, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> renameProject(
      $6.RenameProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameProject, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Projects')
abstract class ProjectsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Projects';

  ProjectsServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.CreateProjectRequest, $3.Operation>(
        'CreateProject',
        createProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.CreateProjectRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetProjectRequest, $6.Project>(
        'GetProject',
        getProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetProjectRequest.fromBuffer(value),
        ($6.Project value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$6.ListProjectsRequest, $6.ListProjectsResponse>(
            'ListProjects',
            listProjects_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $6.ListProjectsRequest.fromBuffer(value),
            ($6.ListProjectsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UpdateProjectRequest, $3.Operation>(
        'UpdateProject',
        updateProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.UpdateProjectRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.DeleteProjectRequest, $3.Operation>(
        'DeleteProject',
        deleteProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.DeleteProjectRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UndeleteProjectRequest, $3.Operation>(
        'UndeleteProject',
        undeleteProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.UndeleteProjectRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.RenameProjectRequest, $3.Operation>(
        'RenameProject',
        renameProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.RenameProjectRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$3.Operation> createProject_Pre($grpc.ServiceCall call,
      $async.Future<$6.CreateProjectRequest> request) async {
    return createProject(call, await request);
  }

  $async.Future<$6.Project> getProject_Pre($grpc.ServiceCall call,
      $async.Future<$6.GetProjectRequest> request) async {
    return getProject(call, await request);
  }

  $async.Future<$6.ListProjectsResponse> listProjects_Pre(
      $grpc.ServiceCall call,
      $async.Future<$6.ListProjectsRequest> request) async {
    return listProjects(call, await request);
  }

  $async.Future<$3.Operation> updateProject_Pre($grpc.ServiceCall call,
      $async.Future<$6.UpdateProjectRequest> request) async {
    return updateProject(call, await request);
  }

  $async.Future<$3.Operation> deleteProject_Pre($grpc.ServiceCall call,
      $async.Future<$6.DeleteProjectRequest> request) async {
    return deleteProject(call, await request);
  }

  $async.Future<$3.Operation> undeleteProject_Pre($grpc.ServiceCall call,
      $async.Future<$6.UndeleteProjectRequest> request) async {
    return undeleteProject(call, await request);
  }

  $async.Future<$3.Operation> renameProject_Pre($grpc.ServiceCall call,
      $async.Future<$6.RenameProjectRequest> request) async {
    return renameProject(call, await request);
  }

  $async.Future<$3.Operation> createProject(
      $grpc.ServiceCall call, $6.CreateProjectRequest request);
  $async.Future<$6.Project> getProject(
      $grpc.ServiceCall call, $6.GetProjectRequest request);
  $async.Future<$6.ListProjectsResponse> listProjects(
      $grpc.ServiceCall call, $6.ListProjectsRequest request);
  $async.Future<$3.Operation> updateProject(
      $grpc.ServiceCall call, $6.UpdateProjectRequest request);
  $async.Future<$3.Operation> deleteProject(
      $grpc.ServiceCall call, $6.DeleteProjectRequest request);
  $async.Future<$3.Operation> undeleteProject(
      $grpc.ServiceCall call, $6.UndeleteProjectRequest request);
  $async.Future<$3.Operation> renameProject(
      $grpc.ServiceCall call, $6.RenameProjectRequest request);
}
