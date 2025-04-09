//
//  Generated code. Do not modify.
//  source: celest/cloud/auth/v1alpha1/users.proto
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

import '../../../../google/protobuf/empty.pb.dart' as $1;
import 'users.pb.dart' as $0;

export 'users.pb.dart';

@$pb.GrpcServiceName('celest.cloud.auth.v1alpha1.Users')
class UsersClient extends $grpc.Client {
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.User>(
      '/celest.cloud.auth.v1alpha1.Users/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$listUsers =
      $grpc.ClientMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
          '/celest.cloud.auth.v1alpha1.Users/ListUsers',
          ($0.ListUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListUsersResponse.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UpdateUserRequest, $0.User>(
      '/celest.cloud.auth.v1alpha1.Users/UpdateUser',
      ($0.UpdateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$0.DeleteUserRequest, $1.Empty>(
          '/celest.cloud.auth.v1alpha1.Users/DeleteUser',
          ($0.DeleteUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getUserMembership =
      $grpc.ClientMethod<$0.GetUserMembershipRequest, $0.UserMembership>(
          '/celest.cloud.auth.v1alpha1.Users/GetUserMembership',
          ($0.GetUserMembershipRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UserMembership.fromBuffer(value));
  static final _$listUserMemberships = $grpc.ClientMethod<
          $0.ListUserMembershipsRequest, $0.ListUserMembershipsResponse>(
      '/celest.cloud.auth.v1alpha1.Users/ListUserMemberships',
      ($0.ListUserMembershipsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ListUserMembershipsResponse.fromBuffer(value));

  UsersClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.User> getUser($0.GetUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUsersResponse> listUsers(
      $0.ListUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> updateUser($0.UpdateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteUser($0.DeleteUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserMembership> getUserMembership(
      $0.GetUserMembershipRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserMembership, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUserMembershipsResponse> listUserMemberships(
      $0.ListUserMembershipsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUserMemberships, request, options: options);
  }
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

  $async.Future<$0.User> getUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.ListUsersResponse> listUsers_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListUsersRequest> request) async {
    return listUsers(call, await request);
  }

  $async.Future<$0.User> updateUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateUserRequest> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$1.Empty> deleteUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteUserRequest> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$0.UserMembership> getUserMembership_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetUserMembershipRequest> request) async {
    return getUserMembership(call, await request);
  }

  $async.Future<$0.ListUserMembershipsResponse> listUserMemberships_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListUserMembershipsRequest> request) async {
    return listUserMemberships(call, await request);
  }

  $async.Future<$0.User> getUser(
      $grpc.ServiceCall call, $0.GetUserRequest request);
  $async.Future<$0.ListUsersResponse> listUsers(
      $grpc.ServiceCall call, $0.ListUsersRequest request);
  $async.Future<$0.User> updateUser(
      $grpc.ServiceCall call, $0.UpdateUserRequest request);
  $async.Future<$1.Empty> deleteUser(
      $grpc.ServiceCall call, $0.DeleteUserRequest request);
  $async.Future<$0.UserMembership> getUserMembership(
      $grpc.ServiceCall call, $0.GetUserMembershipRequest request);
  $async.Future<$0.ListUserMembershipsResponse> listUserMemberships(
      $grpc.ServiceCall call, $0.ListUserMembershipsRequest request);
}
