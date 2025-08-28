// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/organizations.proto.

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
import 'organizations.pb.dart' as $0;

export 'organizations.pb.dart';

/// Allows users to manage organizations in Celest.
@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
class OrganizationsClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloud.celest.dev';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  OrganizationsClient(super.channel, {super.options, super.interceptors});

  /// Creates a new organization.
  $grpc.ResponseFuture<$1.Operation> createOrganization(
    $0.CreateOrganizationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOrganization, request, options: options);
  }

  /// Retrieves the organization identified by the specified name.
  $grpc.ResponseFuture<$0.Organization> getOrganization(
    $0.GetOrganizationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getOrganization, request, options: options);
  }

  /// Lists organizations.
  $grpc.ResponseFuture<$0.ListOrganizationsResponse> listOrganizations(
    $0.ListOrganizationsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listOrganizations, request, options: options);
  }

  /// Update the organization identified by the specified name.
  $grpc.ResponseFuture<$1.Operation> updateOrganization(
    $0.UpdateOrganizationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOrganization, request, options: options);
  }

  /// Marks an organization for deletion.
  $grpc.ResponseFuture<$1.Operation> deleteOrganization(
    $0.DeleteOrganizationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteOrganization, request, options: options);
  }

  /// Restores an organization that has been marked for deletion.
  $grpc.ResponseFuture<$1.Operation> undeleteOrganization(
    $0.UndeleteOrganizationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$undeleteOrganization, request, options: options);
  }

  /// Renames the organization identified by the specified name.
  ///
  /// After renaming, the organization can no longer be identified by the previous name. All of its child resources are
  /// also renamed and must be accessed using the new identifier.
  ///
  /// Renaming does not release the previous identifier from use. It is an error to attempt to create a new organization
  /// with the same identifier as a previously renamed organization.
  ///
  /// (-- api-linter: core::0136::declarative-standard-methods-only=disabled
  ///     aip.dev/not-precedent: Renaming is an inherently imperative method which should not be handled declaratively.
  ///     https://google.aip.dev/136#declarative-friendly-resources --)
  $grpc.ResponseFuture<$1.Operation> renameOrganization(
    $0.RenameOrganizationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$renameOrganization, request, options: options);
  }

  // method descriptors

  static final _$createOrganization =
      $grpc.ClientMethod<$0.CreateOrganizationRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Organizations/CreateOrganization',
          ($0.CreateOrganizationRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$getOrganization =
      $grpc.ClientMethod<$0.GetOrganizationRequest, $0.Organization>(
          '/celest.cloud.v1alpha1.Organizations/GetOrganization',
          ($0.GetOrganizationRequest value) => value.writeToBuffer(),
          $0.Organization.fromBuffer);
  static final _$listOrganizations = $grpc.ClientMethod<
          $0.ListOrganizationsRequest, $0.ListOrganizationsResponse>(
      '/celest.cloud.v1alpha1.Organizations/ListOrganizations',
      ($0.ListOrganizationsRequest value) => value.writeToBuffer(),
      $0.ListOrganizationsResponse.fromBuffer);
  static final _$updateOrganization =
      $grpc.ClientMethod<$0.UpdateOrganizationRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UpdateOrganization',
          ($0.UpdateOrganizationRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$deleteOrganization =
      $grpc.ClientMethod<$0.DeleteOrganizationRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Organizations/DeleteOrganization',
          ($0.DeleteOrganizationRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$undeleteOrganization =
      $grpc.ClientMethod<$0.UndeleteOrganizationRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Organizations/UndeleteOrganization',
          ($0.UndeleteOrganizationRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
  static final _$renameOrganization =
      $grpc.ClientMethod<$0.RenameOrganizationRequest, $1.Operation>(
          '/celest.cloud.v1alpha1.Organizations/RenameOrganization',
          ($0.RenameOrganizationRequest value) => value.writeToBuffer(),
          $1.Operation.fromBuffer);
}

@$pb.GrpcServiceName('celest.cloud.v1alpha1.Organizations')
abstract class OrganizationsServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.v1alpha1.Organizations';

  OrganizationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateOrganizationRequest, $1.Operation>(
        'CreateOrganization',
        createOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateOrganizationRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOrganizationRequest, $0.Organization>(
        'GetOrganization',
        getOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetOrganizationRequest.fromBuffer(value),
        ($0.Organization value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListOrganizationsRequest,
            $0.ListOrganizationsResponse>(
        'ListOrganizations',
        listOrganizations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListOrganizationsRequest.fromBuffer(value),
        ($0.ListOrganizationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateOrganizationRequest, $1.Operation>(
        'UpdateOrganization',
        updateOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateOrganizationRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteOrganizationRequest, $1.Operation>(
        'DeleteOrganization',
        deleteOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteOrganizationRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UndeleteOrganizationRequest, $1.Operation>(
            'UndeleteOrganization',
            undeleteOrganization_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UndeleteOrganizationRequest.fromBuffer(value),
            ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenameOrganizationRequest, $1.Operation>(
        'RenameOrganization',
        renameOrganization_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RenameOrganizationRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$1.Operation> createOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateOrganizationRequest> $request) async {
    return createOrganization($call, await $request);
  }

  $async.Future<$1.Operation> createOrganization(
      $grpc.ServiceCall call, $0.CreateOrganizationRequest request);

  $async.Future<$0.Organization> getOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetOrganizationRequest> $request) async {
    return getOrganization($call, await $request);
  }

  $async.Future<$0.Organization> getOrganization(
      $grpc.ServiceCall call, $0.GetOrganizationRequest request);

  $async.Future<$0.ListOrganizationsResponse> listOrganizations_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListOrganizationsRequest> $request) async {
    return listOrganizations($call, await $request);
  }

  $async.Future<$0.ListOrganizationsResponse> listOrganizations(
      $grpc.ServiceCall call, $0.ListOrganizationsRequest request);

  $async.Future<$1.Operation> updateOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateOrganizationRequest> $request) async {
    return updateOrganization($call, await $request);
  }

  $async.Future<$1.Operation> updateOrganization(
      $grpc.ServiceCall call, $0.UpdateOrganizationRequest request);

  $async.Future<$1.Operation> deleteOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteOrganizationRequest> $request) async {
    return deleteOrganization($call, await $request);
  }

  $async.Future<$1.Operation> deleteOrganization(
      $grpc.ServiceCall call, $0.DeleteOrganizationRequest request);

  $async.Future<$1.Operation> undeleteOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UndeleteOrganizationRequest> $request) async {
    return undeleteOrganization($call, await $request);
  }

  $async.Future<$1.Operation> undeleteOrganization(
      $grpc.ServiceCall call, $0.UndeleteOrganizationRequest request);

  $async.Future<$1.Operation> renameOrganization_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RenameOrganizationRequest> $request) async {
    return renameOrganization($call, await $request);
  }

  $async.Future<$1.Operation> renameOrganization(
      $grpc.ServiceCall call, $0.RenameOrganizationRequest request);
}
