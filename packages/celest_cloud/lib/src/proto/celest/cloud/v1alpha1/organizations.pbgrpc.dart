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
import 'organizations.pb.dart' as $7;

export 'organizations.pb.dart';

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
class OrganizationsClient extends $grpc.Client {
  static final _$createOrganization =
      $grpc.ClientMethod<$7.CreateOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/CreateOrganization',
          ($7.CreateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$getOrganization =
      $grpc.ClientMethod<$7.GetOrganizationRequest, $7.Organization>(
          '/celest.cloud.v1alpha1.Organizations/GetOrganization',
          ($7.GetOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.Organization.fromBuffer(value));
  static final _$listOrganizations = $grpc.ClientMethod<
          $7.ListOrganizationsRequest, $7.ListOrganizationsResponse>(
      '/celest.cloud.v1alpha1.Organizations/ListOrganizations',
      ($7.ListOrganizationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $7.ListOrganizationsResponse.fromBuffer(value));
  static final _$updateOrganization =
      $grpc.ClientMethod<$7.UpdateOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UpdateOrganization',
          ($7.UpdateOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$deleteOrganization =
      $grpc.ClientMethod<$7.DeleteOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/DeleteOrganization',
          ($7.DeleteOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$undeleteOrganization =
      $grpc.ClientMethod<$7.UndeleteOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UndeleteOrganization',
          ($7.UndeleteOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$renameOrganization =
      $grpc.ClientMethod<$7.RenameOrganizationRequest, $2.Operation>(
          '/celest.cloud.v1alpha1.Organizations/RenameOrganization',
          ($7.RenameOrganizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));

  OrganizationsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Operation> createOrganization(
      $7.CreateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$7.Organization> getOrganization(
      $7.GetOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$7.ListOrganizationsResponse> listOrganizations(
      $7.ListOrganizationsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOrganizations, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> updateOrganization(
      $7.UpdateOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> deleteOrganization(
      $7.DeleteOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> undeleteOrganization(
      $7.UndeleteOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undeleteOrganization, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> renameOrganization(
      $7.RenameOrganizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameOrganization, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
abstract class OrganizationsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Organizations';

  OrganizationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.CreateOrganizationRequest, $2.Operation>(
        'CreateOrganization',
        createOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.CreateOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetOrganizationRequest, $7.Organization>(
        'GetOrganization',
        getOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.GetOrganizationRequest.fromBuffer(value),
        ($7.Organization value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ListOrganizationsRequest,
            $7.ListOrganizationsResponse>(
        'ListOrganizations',
        listOrganizations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.ListOrganizationsRequest.fromBuffer(value),
        ($7.ListOrganizationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UpdateOrganizationRequest, $2.Operation>(
        'UpdateOrganization',
        updateOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.UpdateOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.DeleteOrganizationRequest, $2.Operation>(
        'DeleteOrganization',
        deleteOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.DeleteOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$7.UndeleteOrganizationRequest, $2.Operation>(
            'UndeleteOrganization',
            undeleteOrganization_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $7.UndeleteOrganizationRequest.fromBuffer(value),
            ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.RenameOrganizationRequest, $2.Operation>(
        'RenameOrganization',
        renameOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.RenameOrganizationRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$2.Operation> createOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$7.CreateOrganizationRequest> request) async {
    return createOrganization(call, await request);
  }

  $async.Future<$7.Organization> getOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$7.GetOrganizationRequest> request) async {
    return getOrganization(call, await request);
  }

  $async.Future<$7.ListOrganizationsResponse> listOrganizations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.ListOrganizationsRequest> request) async {
    return listOrganizations(call, await request);
  }

  $async.Future<$2.Operation> updateOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$7.UpdateOrganizationRequest> request) async {
    return updateOrganization(call, await request);
  }

  $async.Future<$2.Operation> deleteOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$7.DeleteOrganizationRequest> request) async {
    return deleteOrganization(call, await request);
  }

  $async.Future<$2.Operation> undeleteOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$7.UndeleteOrganizationRequest> request) async {
    return undeleteOrganization(call, await request);
  }

  $async.Future<$2.Operation> renameOrganization_Pre($grpc.ServiceCall call,
      $async.Future<$7.RenameOrganizationRequest> request) async {
    return renameOrganization(call, await request);
  }

  $async.Future<$2.Operation> createOrganization(
      $grpc.ServiceCall call, $7.CreateOrganizationRequest request);
  $async.Future<$7.Organization> getOrganization(
      $grpc.ServiceCall call, $7.GetOrganizationRequest request);
  $async.Future<$7.ListOrganizationsResponse> listOrganizations(
      $grpc.ServiceCall call, $7.ListOrganizationsRequest request);
  $async.Future<$2.Operation> updateOrganization(
      $grpc.ServiceCall call, $7.UpdateOrganizationRequest request);
  $async.Future<$2.Operation> deleteOrganization(
      $grpc.ServiceCall call, $7.DeleteOrganizationRequest request);
  $async.Future<$2.Operation> undeleteOrganization(
      $grpc.ServiceCall call, $7.UndeleteOrganizationRequest request);
  $async.Future<$2.Operation> renameOrganization(
      $grpc.ServiceCall call, $7.RenameOrganizationRequest request);
}
