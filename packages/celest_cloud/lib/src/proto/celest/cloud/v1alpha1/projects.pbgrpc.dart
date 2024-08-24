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

import '../../../google/longrunning/operations.pb.dart' as $2;
import 'projects.pb.dart' as $9;

export 'projects.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Projects')
class ProjectsClient extends $grpc.Client {
  static final _$createProject =
      $grpc.ClientMethod<$9.CreateProjectRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Projects/CreateProject',
          ($9.CreateProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$getProject =
      $grpc.ClientMethod<$9.GetProjectRequest, $9.Project>(
          '/celest.cloud.v1alpha1.Projects/GetProject',
          ($9.GetProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $9.Project.fromBuffer(value));
  static final _$listProjects =
      $grpc.ClientMethod<$9.ListProjectsRequest, $9.ListProjectsResponse>(
          '/celest.cloud.v1alpha1.Projects/ListProjects',
          ($9.ListProjectsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $9.ListProjectsResponse.fromBuffer(value));
  static final _$updateProject =
      $grpc.ClientMethod<$9.UpdateProjectRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Projects/UpdateProject',
          ($9.UpdateProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$deleteProject =
      $grpc.ClientMethod<$9.DeleteProjectRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Projects/DeleteProject',
          ($9.DeleteProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$undeleteProject =
      $grpc.ClientMethod<$9.UndeleteProjectRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Projects/UndeleteProject',
          ($9.UndeleteProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$renameProject =
      $grpc.ClientMethod<$9.RenameProjectRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Projects/RenameProject',
          ($9.RenameProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));

  ProjectsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Operation> createProject(
      $9.CreateProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProject, request, options: options);
  }

  $grpc.ResponseFuture<$9.Project> getProject($9.GetProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProject, request, options: options);
  }

  $grpc.ResponseFuture<$9.ListProjectsResponse> listProjects(
      $9.ListProjectsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listProjects, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> updateProject(
      $9.UpdateProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProject, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> deleteProject(
      $9.DeleteProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteProject, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> undeleteProject(
      $9.UndeleteProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undeleteProject, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> renameProject(
      $9.RenameProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameProject, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Projects')
abstract class ProjectsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Projects';

  ProjectsServiceBase() {
    $addMethod($grpc.ServiceMethod<$9.CreateProjectRequest, $2.Operation>(
        'CreateProject',
        createProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.CreateProjectRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetProjectRequest, $9.Project>(
        'GetProject',
        getProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.GetProjectRequest.fromBuffer(value),
        ($9.Project value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$9.ListProjectsRequest, $9.ListProjectsResponse>(
            'ListProjects',
            listProjects_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $9.ListProjectsRequest.fromBuffer(value),
            ($9.ListProjectsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateProjectRequest, $2.Operation>(
        'UpdateProject',
        updateProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.UpdateProjectRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.DeleteProjectRequest, $2.Operation>(
        'DeleteProject',
        deleteProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.DeleteProjectRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UndeleteProjectRequest, $2.Operation>(
        'UndeleteProject',
        undeleteProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.UndeleteProjectRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.RenameProjectRequest, $2.Operation>(
        'RenameProject',
        renameProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.RenameProjectRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$2.Operation> createProject_Pre($grpc.ServiceCall call,
      $async.Future<$9.CreateProjectRequest> request) async {
    return createProject(call, await request);
  }

  $async.Future<$9.Project> getProject_Pre($grpc.ServiceCall call,
      $async.Future<$9.GetProjectRequest> request) async {
    return getProject(call, await request);
  }

  $async.Future<$9.ListProjectsResponse> listProjects_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.ListProjectsRequest> request) async {
    return listProjects(call, await request);
  }

  $async.Future<$2.Operation> updateProject_Pre($grpc.ServiceCall call,
      $async.Future<$9.UpdateProjectRequest> request) async {
    return updateProject(call, await request);
  }

  $async.Future<$2.Operation> deleteProject_Pre($grpc.ServiceCall call,
      $async.Future<$9.DeleteProjectRequest> request) async {
    return deleteProject(call, await request);
  }

  $async.Future<$2.Operation> undeleteProject_Pre($grpc.ServiceCall call,
      $async.Future<$9.UndeleteProjectRequest> request) async {
    return undeleteProject(call, await request);
  }

  $async.Future<$2.Operation> renameProject_Pre($grpc.ServiceCall call,
      $async.Future<$9.RenameProjectRequest> request) async {
    return renameProject(call, await request);
  }

  $async.Future<$2.Operation> createProject(
      $grpc.ServiceCall call, $9.CreateProjectRequest request);
  $async.Future<$9.Project> getProject(
      $grpc.ServiceCall call, $9.GetProjectRequest request);
  $async.Future<$9.ListProjectsResponse> listProjects(
      $grpc.ServiceCall call, $9.ListProjectsRequest request);
  $async.Future<$2.Operation> updateProject(
      $grpc.ServiceCall call, $9.UpdateProjectRequest request);
  $async.Future<$2.Operation> deleteProject(
      $grpc.ServiceCall call, $9.DeleteProjectRequest request);
  $async.Future<$2.Operation> undeleteProject(
      $grpc.ServiceCall call, $9.UndeleteProjectRequest request);
  $async.Future<$2.Operation> renameProject(
      $grpc.ServiceCall call, $9.RenameProjectRequest request);
}
