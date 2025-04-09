//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/organizations.proto
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
import 'organizations.pb.dart' as $4;

export 'organizations.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
class OrganizationsClient extends $grpc.Client {
  static final _$createOrganization =
      $grpc.ClientMethod<$4.CreateOrganizationRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Organizations/CreateOrganization',
          ($4.CreateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$getOrganization =
      $grpc.ClientMethod<$4.GetOrganizationRequest, $4.Organization>(
          '/celest.cloud.v1alpha1.Organizations/GetOrganization',
          ($4.GetOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.Organization.fromBuffer(value));
  static final _$listOrganizations = $grpc.ClientMethod<
          $4.ListOrganizationsRequest, $4.ListOrganizationsResponse>(
      '/celest.cloud.v1alpha1.Organizations/ListOrganizations',
      ($4.ListOrganizationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.ListOrganizationsResponse.fromBuffer(value));
  static final _$updateOrganization =
      $grpc.ClientMethod<$4.UpdateOrganizationRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UpdateOrganization',
          ($4.UpdateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$deleteOrganization =
      $grpc.ClientMethod<$4.DeleteOrganizationRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Organizations/DeleteOrganization',
          ($4.DeleteOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$undeleteOrganization =
      $grpc.ClientMethod<$4.UndeleteOrganizationRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UndeleteOrganization',
          ($4.UndeleteOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));
  static final _$renameOrganization =
      $grpc.ClientMethod<$4.RenameOrganizationRequest, $3.Operation>(
          '/celest.cloud.v1alpha1.Organizations/RenameOrganization',
          ($4.RenameOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Operation.fromBuffer(value));

  OrganizationsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.Operation> createOrganization(
      $4.CreateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$4.Organization> getOrganization(
      $4.GetOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$4.ListOrganizationsResponse> listOrganizations(
      $4.ListOrganizationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOrganizations, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> updateOrganization(
      $4.UpdateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> deleteOrganization(
      $4.DeleteOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> undeleteOrganization(
      $4.UndeleteOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undeleteOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$3.Operation> renameOrganization(
      $4.RenameOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameOrganization, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
abstract class OrganizationsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Organizations';

  OrganizationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.CreateOrganizationRequest, $3.Operation>(
        'CreateOrganization',
        createOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.CreateOrganizationRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetOrganizationRequest, $4.Organization>(
        'GetOrganization',
        getOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetOrganizationRequest.fromBuffer(value),
        ($4.Organization value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.ListOrganizationsRequest,
            $4.ListOrganizationsResponse>(
        'ListOrganizations',
        listOrganizations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.ListOrganizationsRequest.fromBuffer(value),
        ($4.ListOrganizationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UpdateOrganizationRequest, $3.Operation>(
        'UpdateOrganization',
        updateOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.UpdateOrganizationRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.DeleteOrganizationRequest, $3.Operation>(
        'DeleteOrganization',
        deleteOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.DeleteOrganizationRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$4.UndeleteOrganizationRequest, $3.Operation>(
            'UndeleteOrganization',
            undeleteOrganization_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $4.UndeleteOrganizationRequest.fromBuffer(value),
            ($3.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.RenameOrganizationRequest, $3.Operation>(
        'RenameOrganization',
        renameOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.RenameOrganizationRequest.fromBuffer(value),
        ($3.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$3.Operation> createOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$4.CreateOrganizationRequest> request) async {
    return createOrganization(call, await request);
  }

  $async.Future<$4.Organization> getOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$4.GetOrganizationRequest> request) async {
    return getOrganization(call, await request);
  }

  $async.Future<$4.ListOrganizationsResponse> listOrganizations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.ListOrganizationsRequest> request) async {
    return listOrganizations(call, await request);
  }

  $async.Future<$3.Operation> updateOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$4.UpdateOrganizationRequest> request) async {
    return updateOrganization(call, await request);
  }

  $async.Future<$3.Operation> deleteOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$4.DeleteOrganizationRequest> request) async {
    return deleteOrganization(call, await request);
  }

  $async.Future<$3.Operation> undeleteOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$4.UndeleteOrganizationRequest> request) async {
    return undeleteOrganization(call, await request);
  }

  $async.Future<$3.Operation> renameOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$4.RenameOrganizationRequest> request) async {
    return renameOrganization(call, await request);
  }

  $async.Future<$3.Operation> createOrganization(
      $grpc.ServiceCall call, $4.CreateOrganizationRequest request);
  $async.Future<$4.Organization> getOrganization(
      $grpc.ServiceCall call, $4.GetOrganizationRequest request);
  $async.Future<$4.ListOrganizationsResponse> listOrganizations(
      $grpc.ServiceCall call, $4.ListOrganizationsRequest request);
  $async.Future<$3.Operation> updateOrganization(
      $grpc.ServiceCall call, $4.UpdateOrganizationRequest request);
  $async.Future<$3.Operation> deleteOrganization(
      $grpc.ServiceCall call, $4.DeleteOrganizationRequest request);
  $async.Future<$3.Operation> undeleteOrganization(
      $grpc.ServiceCall call, $4.UndeleteOrganizationRequest request);
  $async.Future<$3.Operation> renameOrganization(
      $grpc.ServiceCall call, $4.RenameOrganizationRequest request);
}
