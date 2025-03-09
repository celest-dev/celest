import 'package:celest_cloud/src/cloud/users/users_protocol.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:celest_cloud/src/proto/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';

final class UsersProtocolGrpc implements UsersProtocol {
  UsersProtocolGrpc(
    ClientChannel channel, {
    List<ClientInterceptor>? interceptors,
  }) : _client = UsersClient(channel, interceptors: interceptors);

  final UsersClient _client;

  @override
  Future<User> get(GetUserRequest request) {
    return _client.getUser(request);
  }

  @override
  Future<UserMembership> getMembership(GetUserMembershipRequest request) {
    return _client.getUserMembership(request);
  }

  @override
  Future<ListUsersResponse> list(ListUsersRequest request) {
    return _client.listUsers(request);
  }

  @override
  Future<ListUserMembershipsResponse> listMemberships(
    ListUserMembershipsRequest request,
  ) {
    return _client.listUserMemberships(request);
  }

  @override
  Future<User> update(UpdateUserRequest request) {
    return _client.updateUser(request);
  }

  @override
  Future<Empty> delete(DeleteUserRequest request) {
    return _client.deleteUser(request);
  }
}
