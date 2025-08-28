// This is a generated file - do not edit.
//
// Generated from celest/cloud/auth/v1alpha1/users.proto.

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

import '../../../../google/protobuf/empty.pb.dart' as $1;
import 'users.pb.dart' as $0;

export 'users.pb.dart';

/// Allows admins to manage users in Celest.
@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Users')
class UsersClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloud.celest.dev';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UsersClient(super.channel, {super.options, super.interceptors});

  /// Retrieves the user identified by the specified name.
  $grpc.ResponseFuture<$0.User> getUser(
    $0.GetUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  /// Lists users.
  /// (-- api-linter: core::0132::http-uri-parent=disabled
  ///     aip.dev/not-precedent: Parent can be inferred for auth. --)
  $grpc.ResponseFuture<$0.ListUsersResponse> listUsers(
    $0.ListUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  /// Update the user identified by the specified name.
  $grpc.ResponseFuture<$0.User> updateUser(
    $0.UpdateUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  /// Deletes a user and all associated resources.
  ///
  /// This cannot be undone.
  $grpc.ResponseFuture<$1.Empty> deleteUser(
    $0.DeleteUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  /// Gets a user's membership to a resource.
  $grpc.ResponseFuture<$0.UserMembership> getUserMembership(
    $0.GetUserMembershipRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUserMembership, request, options: options);
  }

  /// Lists memberships for a user.
  $grpc.ResponseFuture<$0.ListUserMembershipsResponse> listUserMemberships(
    $0.ListUserMembershipsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listUserMemberships, request, options: options);
  }

  // method descriptors

  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.User>(
      '/celest.cloud.auth.v1alpha1.Users/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      $0.User.fromBuffer);
  static final _$listUsers =
      $grpc.ClientMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
          '/celest.cloud.auth.v1alpha1.Users/ListUsers',
          ($0.ListUsersRequest value) => value.writeToBuffer(),
          $0.ListUsersResponse.fromBuffer);
  static final _$updateUser = $grpc.ClientMethod<$0.UpdateUserRequest, $0.User>(
      '/celest.cloud.auth.v1alpha1.Users/UpdateUser',
      ($0.UpdateUserRequest value) => value.writeToBuffer(),
      $0.User.fromBuffer);
  static final _$deleteUser =
      $grpc.ClientMethod<$0.DeleteUserRequest, $1.Empty>(
          '/celest.cloud.auth.v1alpha1.Users/DeleteUser',
          ($0.DeleteUserRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$getUserMembership =
      $grpc.ClientMethod<$0.GetUserMembershipRequest, $0.UserMembership>(
          '/celest.cloud.auth.v1alpha1.Users/GetUserMembership',
          ($0.GetUserMembershipRequest value) => value.writeToBuffer(),
          $0.UserMembership.fromBuffer);
  static final _$listUserMemberships = $grpc.ClientMethod<
          $0.ListUserMembershipsRequest, $0.ListUserMembershipsResponse>(
      '/celest.cloud.auth.v1alpha1.Users/ListUserMemberships',
      ($0.ListUserMembershipsRequest value) => value.writeToBuffer(),
      $0.ListUserMembershipsResponse.fromBuffer);
}

@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Users')
abstract class UsersServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.auth.v1alpha1.Users';

  UsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.User>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListUsersRequest.fromBuffer(value),
        ($0.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserRequest, $0.User>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateUserRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUserRequest, $1.Empty>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteUserRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetUserMembershipRequest, $0.UserMembership>(
            'GetUserMembership',
            getUserMembership_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetUserMembershipRequest.fromBuffer(value),
            ($0.UserMembership value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUserMembershipsRequest,
            $0.ListUserMembershipsResponse>(
        'ListUserMemberships',
        listUserMemberships_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListUserMembershipsRequest.fromBuffer(value),
        ($0.ListUserMembershipsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.User> getUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetUserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$0.User> getUser(
      $grpc.ServiceCall call, $0.GetUserRequest request);

  $async.Future<$0.ListUsersResponse> listUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListUsersRequest> $request) async {
    return listUsers($call, await $request);
  }

  $async.Future<$0.ListUsersResponse> listUsers(
      $grpc.ServiceCall call, $0.ListUsersRequest request);

  $async.Future<$0.User> updateUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateUserRequest> $request) async {
    return updateUser($call, await $request);
  }

  $async.Future<$0.User> updateUser(
      $grpc.ServiceCall call, $0.UpdateUserRequest request);

  $async.Future<$1.Empty> deleteUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteUserRequest> $request) async {
    return deleteUser($call, await $request);
  }

  $async.Future<$1.Empty> deleteUser(
      $grpc.ServiceCall call, $0.DeleteUserRequest request);

  $async.Future<$0.UserMembership> getUserMembership_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetUserMembershipRequest> $request) async {
    return getUserMembership($call, await $request);
  }

  $async.Future<$0.UserMembership> getUserMembership(
      $grpc.ServiceCall call, $0.GetUserMembershipRequest request);

  $async.Future<$0.ListUserMembershipsResponse> listUserMemberships_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListUserMembershipsRequest> $request) async {
    return listUserMemberships($call, await $request);
  }

  $async.Future<$0.ListUserMembershipsResponse> listUserMemberships(
      $grpc.ServiceCall call, $0.ListUserMembershipsRequest request);
}
