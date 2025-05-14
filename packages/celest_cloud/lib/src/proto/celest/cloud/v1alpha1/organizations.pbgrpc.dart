//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/organizations.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/longrunning/operations.pb.dart' as $4;
import 'organizations.pb.dart' as $3;

export 'organizations.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
class OrganizationsClient extends $grpc.Client {
  static final _$createOrganization =
      $grpc.ClientMethod<$3.CreateOrganizationRequest, $4.Operation>(
          '/celest.cloud.v1alpha1.Organizations/CreateOrganization',
          ($3.CreateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Operation.fromBuffer(value));
  static final _$getOrganization =
      $grpc.ClientMethod<$3.GetOrganizationRequest, $3.Organization>(
          '/celest.cloud.v1alpha1.Organizations/GetOrganization',
          ($3.GetOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Organization.fromBuffer(value));
  static final _$listOrganizations = $grpc.ClientMethod<
          $3.ListOrganizationsRequest, $3.ListOrganizationsResponse>(
      '/celest.cloud.v1alpha1.Organizations/ListOrganizations',
      ($3.ListOrganizationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $3.ListOrganizationsResponse.fromBuffer(value));
  static final _$updateOrganization =
      $grpc.ClientMethod<$3.UpdateOrganizationRequest, $4.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UpdateOrganization',
          ($3.UpdateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Operation.fromBuffer(value));
  static final _$deleteOrganization =
      $grpc.ClientMethod<$3.DeleteOrganizationRequest, $4.Operation>(
          '/celest.cloud.v1alpha1.Organizations/DeleteOrganization',
          ($3.DeleteOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Operation.fromBuffer(value));
  static final _$undeleteOrganization =
      $grpc.ClientMethod<$3.UndeleteOrganizationRequest, $4.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UndeleteOrganization',
          ($3.UndeleteOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Operation.fromBuffer(value));
  static final _$renameOrganization =
      $grpc.ClientMethod<$3.RenameOrganizationRequest, $4.Operation>(
          '/celest.cloud.v1alpha1.Organizations/RenameOrganization',
          ($3.RenameOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Operation.fromBuffer(value));

  OrganizationsClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$4.Operation> createOrganization(
      $3.CreateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$3.Organization> getOrganization(
      $3.GetOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListOrganizationsResponse> listOrganizations(
      $3.ListOrganizationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOrganizations, request, options: options);
  }

  $grpc.ResponseFuture<$4.Operation> updateOrganization(
      $3.UpdateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$4.Operation> deleteOrganization(
      $3.DeleteOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$4.Operation> undeleteOrganization(
      $3.UndeleteOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undeleteOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$4.Operation> renameOrganization(
      $3.RenameOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameOrganization, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
abstract class OrganizationsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Organizations';

  OrganizationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.CreateOrganizationRequest, $4.Operation>(
        'CreateOrganization',
        createOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateOrganizationRequest.fromBuffer(value),
        ($4.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetOrganizationRequest, $3.Organization>(
        'GetOrganization',
        getOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.GetOrganizationRequest.fromBuffer(value),
        ($3.Organization value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListOrganizationsRequest,
            $3.ListOrganizationsResponse>(
        'ListOrganizations',
        listOrganizations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.ListOrganizationsRequest.fromBuffer(value),
        ($3.ListOrganizationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateOrganizationRequest, $4.Operation>(
        'UpdateOrganization',
        updateOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.UpdateOrganizationRequest.fromBuffer(value),
        ($4.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteOrganizationRequest, $4.Operation>(
        'DeleteOrganization',
        deleteOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.DeleteOrganizationRequest.fromBuffer(value),
        ($4.Operation value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.UndeleteOrganizationRequest, $4.Operation>(
            'UndeleteOrganization',
            undeleteOrganization_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.UndeleteOrganizationRequest.fromBuffer(value),
            ($4.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.RenameOrganizationRequest, $4.Operation>(
        'RenameOrganization',
        renameOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.RenameOrganizationRequest.fromBuffer(value),
        ($4.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$4.Operation> createOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$3.CreateOrganizationRequest> $request) async {
    return createOrganization($call, await $request);
  }

  $async.Future<$3.Organization> getOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$3.GetOrganizationRequest> $request) async {
    return getOrganization($call, await $request);
  }

  $async.Future<$3.ListOrganizationsResponse> listOrganizations_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$3.ListOrganizationsRequest> $request) async {
    return listOrganizations($call, await $request);
  }

  $async.Future<$4.Operation> updateOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$3.UpdateOrganizationRequest> $request) async {
    return updateOrganization($call, await $request);
  }

  $async.Future<$4.Operation> deleteOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$3.DeleteOrganizationRequest> $request) async {
    return deleteOrganization($call, await $request);
  }

  $async.Future<$4.Operation> undeleteOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$3.UndeleteOrganizationRequest> $request) async {
    return undeleteOrganization($call, await $request);
  }

  $async.Future<$4.Operation> renameOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$3.RenameOrganizationRequest> $request) async {
    return renameOrganization($call, await $request);
  }

  $async.Future<$4.Operation> createOrganization(
      $grpc.ServiceCall call, $3.CreateOrganizationRequest request);
  $async.Future<$3.Organization> getOrganization(
      $grpc.ServiceCall call, $3.GetOrganizationRequest request);
  $async.Future<$3.ListOrganizationsResponse> listOrganizations(
      $grpc.ServiceCall call, $3.ListOrganizationsRequest request);
  $async.Future<$4.Operation> updateOrganization(
      $grpc.ServiceCall call, $3.UpdateOrganizationRequest request);
  $async.Future<$4.Operation> deleteOrganization(
      $grpc.ServiceCall call, $3.DeleteOrganizationRequest request);
  $async.Future<$4.Operation> undeleteOrganization(
      $grpc.ServiceCall call, $3.UndeleteOrganizationRequest request);
  $async.Future<$4.Operation> renameOrganization(
      $grpc.ServiceCall call, $3.RenameOrganizationRequest request);
}
