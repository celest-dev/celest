//
//  Generated code. Do not modify.
//  source: celest/cloud/auth/v1alpha1/users.proto
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

import '../../../../google/protobuf/empty.pb.dart' as $1;
import 'users.pb.dart' as $2;

export 'users.pb.dart';

@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Users')
class UsersClient extends $grpc.Client {
  static final _$getUser = $grpc.ClientMethod<$2.GetUserRequest, $2.User>(
      '/celest.cloud.auth.v1alpha1.Users/GetUser',
      ($2.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.User.fromBuffer(value));
  static final _$listUsers =
      $grpc.ClientMethod<$2.ListUsersRequest, $2.ListUsersResponse>(
          '/celest.cloud.auth.v1alpha1.Users/ListUsers',
          ($2.ListUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ListUsersResponse.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$2.UpdateUserRequest, $2.User>(
      '/celest.cloud.auth.v1alpha1.Users/UpdateUser',
      ($2.UpdateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.User.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$2.DeleteUserRequest, $1.Empty>(
          '/celest.cloud.auth.v1alpha1.Users/DeleteUser',
          ($2.DeleteUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getUserMembership =
      $grpc.ClientMethod<$2.GetUserMembershipRequest, $2.UserMembership>(
          '/celest.cloud.auth.v1alpha1.Users/GetUserMembership',
          ($2.GetUserMembershipRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.UserMembership.fromBuffer(value));
  static final _$listUserMemberships = $grpc.ClientMethod<
          $2.ListUserMembershipsRequest, $2.ListUserMembershipsResponse>(
      '/celest.cloud.auth.v1alpha1.Users/ListUserMemberships',
      ($2.ListUserMembershipsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.ListUserMembershipsResponse.fromBuffer(value));

  UsersClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$2.User> getUser($2.GetUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListUsersResponse> listUsers(
      $2.ListUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$2.User> updateUser($2.UpdateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteUser($2.DeleteUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$2.UserMembership> getUserMembership(
      $2.GetUserMembershipRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserMembership, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListUserMembershipsResponse> listUserMemberships(
      $2.ListUserMembershipsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUserMemberships, request, options: options);
  }
}

@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Users')
abstract class UsersServiceBase extends $grpc.Service {
  $core.String get $name => 'celest.cloud.auth.v1alpha1.Users';

  UsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GetUserRequest, $2.User>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetUserRequest.fromBuffer(value),
        ($2.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListUsersRequest, $2.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListUsersRequest.fromBuffer(value),
        ($2.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdateUserRequest, $2.User>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdateUserRequest.fromBuffer(value),
        ($2.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteUserRequest, $1.Empty>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteUserRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.GetUserMembershipRequest, $2.UserMembership>(
            'GetUserMembership',
            getUserMembership_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.GetUserMembershipRequest.fromBuffer(value),
            ($2.UserMembership value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListUserMembershipsRequest,
            $2.ListUserMembershipsResponse>(
        'ListUserMemberships',
        listUserMemberships_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.ListUserMembershipsRequest.fromBuffer(value),
        ($2.ListUserMembershipsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.User> getUser_Pre($grpc.ServiceCall $call,
      $async.Future<$2.GetUserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$2.ListUsersResponse> listUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$2.ListUsersRequest> $request) async {
    return listUsers($call, await $request);
  }

  $async.Future<$2.User> updateUser_Pre($grpc.ServiceCall $call,
      $async.Future<$2.UpdateUserRequest> $request) async {
    return updateUser($call, await $request);
  }

  $async.Future<$1.Empty> deleteUser_Pre($grpc.ServiceCall $call,
      $async.Future<$2.DeleteUserRequest> $request) async {
    return deleteUser($call, await $request);
  }

  $async.Future<$2.UserMembership> getUserMembership_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$2.GetUserMembershipRequest> $request) async {
    return getUserMembership($call, await $request);
  }

  $async.Future<$2.ListUserMembershipsResponse> listUserMemberships_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$2.ListUserMembershipsRequest> $request) async {
    return listUserMemberships($call, await $request);
  }

  $async.Future<$2.User> getUser(
      $grpc.ServiceCall call, $2.GetUserRequest request);
  $async.Future<$2.ListUsersResponse> listUsers(
      $grpc.ServiceCall call, $2.ListUsersRequest request);
  $async.Future<$2.User> updateUser(
      $grpc.ServiceCall call, $2.UpdateUserRequest request);
  $async.Future<$1.Empty> deleteUser(
      $grpc.ServiceCall call, $2.DeleteUserRequest request);
  $async.Future<$2.UserMembership> getUserMembership(
      $grpc.ServiceCall call, $2.GetUserMembershipRequest request);
  $async.Future<$2.ListUserMembershipsResponse> listUserMemberships(
      $grpc.ServiceCall call, $2.ListUserMembershipsRequest request);
}
