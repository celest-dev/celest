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

import '../../../google/longrunning/operations.pb.dart' as $2;
import 'organizations.pb.dart' as $8;

export 'organizations.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
class OrganizationsClient extends $grpc.Client {
  static final _$createOrganization =
      $grpc.ClientMethod<$8.CreateOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/CreateOrganization',
          ($8.CreateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$getOrganization =
      $grpc.ClientMethod<$8.GetOrganizationRequest, $8.Organization>(
          '/celest.cloud.v1alpha1.Organizations/GetOrganization',
          ($8.GetOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $8.Organization.fromBuffer(value));
  static final _$listOrganizations = $grpc.ClientMethod<
          $8.ListOrganizationsRequest, $8.ListOrganizationsResponse>(
      '/celest.cloud.v1alpha1.Organizations/ListOrganizations',
      ($8.ListOrganizationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $8.ListOrganizationsResponse.fromBuffer(value));
  static final _$updateOrganization =
      $grpc.ClientMethod<$8.UpdateOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UpdateOrganization',
          ($8.UpdateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$deleteOrganization =
      $grpc.ClientMethod<$8.DeleteOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/DeleteOrganization',
          ($8.DeleteOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$renameOrganization =
      $grpc.ClientMethod<$8.RenameOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/RenameOrganization',
          ($8.RenameOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));

  OrganizationsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Operation> createOrganization(
      $8.CreateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$8.Organization> getOrganization(
      $8.GetOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$8.ListOrganizationsResponse> listOrganizations(
      $8.ListOrganizationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOrganizations, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> updateOrganization(
      $8.UpdateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> deleteOrganization(
      $8.DeleteOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> renameOrganization(
      $8.RenameOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameOrganization, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
abstract class OrganizationsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Organizations';

  OrganizationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$8.CreateOrganizationRequest, $2.Operation>(
        'CreateOrganization',
        createOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.CreateOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetOrganizationRequest, $8.Organization>(
        'GetOrganization',
        getOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.GetOrganizationRequest.fromBuffer(value),
        ($8.Organization value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ListOrganizationsRequest,
            $8.ListOrganizationsResponse>(
        'ListOrganizations',
        listOrganizations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ListOrganizationsRequest.fromBuffer(value),
        ($8.ListOrganizationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateOrganizationRequest, $2.Operation>(
        'UpdateOrganization',
        updateOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.UpdateOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DeleteOrganizationRequest, $2.Operation>(
        'DeleteOrganization',
        deleteOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.DeleteOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.RenameOrganizationRequest, $2.Operation>(
        'RenameOrganization',
        renameOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.RenameOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$2.Operation> createOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$8.CreateOrganizationRequest> request) async {
    return createOrganization(call, await request);
  }

  $async.Future<$8.Organization> getOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$8.GetOrganizationRequest> request) async {
    return getOrganization(call, await request);
  }

  $async.Future<$8.ListOrganizationsResponse> listOrganizations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$8.ListOrganizationsRequest> request) async {
    return listOrganizations(call, await request);
  }

  $async.Future<$2.Operation> updateOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$8.UpdateOrganizationRequest> request) async {
    return updateOrganization(call, await request);
  }

  $async.Future<$2.Operation> deleteOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$8.DeleteOrganizationRequest> request) async {
    return deleteOrganization(call, await request);
  }

  $async.Future<$2.Operation> renameOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$8.RenameOrganizationRequest> request) async {
    return renameOrganization(call, await request);
  }

  $async.Future<$2.Operation> createOrganization(
      $grpc.ServiceCall call, $8.CreateOrganizationRequest request);
  $async.Future<$8.Organization> getOrganization(
      $grpc.ServiceCall call, $8.GetOrganizationRequest request);
  $async.Future<$8.ListOrganizationsResponse> listOrganizations(
      $grpc.ServiceCall call, $8.ListOrganizationsRequest request);
  $async.Future<$2.Operation> updateOrganization(
      $grpc.ServiceCall call, $8.UpdateOrganizationRequest request);
  $async.Future<$2.Operation> deleteOrganization(
      $grpc.ServiceCall call, $8.DeleteOrganizationRequest request);
  $async.Future<$2.Operation> renameOrganization(
      $grpc.ServiceCall call, $8.RenameOrganizationRequest request);
}
