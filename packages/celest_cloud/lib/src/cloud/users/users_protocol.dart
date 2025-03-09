import 'package:celest_cloud/src/proto.dart';

abstract interface class UsersProtocol {
  Future<User> get(GetUserRequest request);
  Future<User> update(UpdateUserRequest request);
  Future<Empty> delete(DeleteUserRequest request);
  Future<ListUsersResponse> list(ListUsersRequest request);
  Future<UserMembership> getMembership(GetUserMembershipRequest request);
  Future<ListUserMembershipsResponse> listMemberships(
    ListUserMembershipsRequest request,
  );
}
