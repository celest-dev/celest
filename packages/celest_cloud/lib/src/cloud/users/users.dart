import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/users/users_protocol.dart';
import 'package:celest_cloud/src/proto.dart';
import 'package:logging/logging.dart';

final class Users with BaseService {
  Users({required UsersProtocol protocol, this.logger}) : _protocol = protocol;

  @override
  final Logger? logger;
  final UsersProtocol _protocol;

  Future<User> get(String name) async {
    final request = GetUserRequest(name: name);
    return run('Users.Get', request: request, action: _protocol.get);
  }

  Future<User> update({
    required User user,
    bool validateOnly = false,
    FieldMask? updateMask,
  }) async {
    final request = UpdateUserRequest(
      user: user,
      validateOnly: validateOnly,
      updateMask: updateMask,
    );
    return run('Users.Update', request: request, action: _protocol.update);
  }

  Future<Empty> delete(String name) async {
    final request = DeleteUserRequest(name: name);
    return run('Users.Delete', request: request, action: _protocol.delete);
  }

  Future<ListUsersResponse> list({
    String? parent,
    int? pageSize,
    String? pageToken,
    String? filter,
    String? orderBy,
  }) async {
    final request = ListUsersRequest(
      parent: parent,
      pageSize: pageSize,
      pageToken: pageToken,
      filter: filter,
      orderBy: orderBy,
    );
    return run('Users.List', request: request, action: _protocol.list);
  }

  Future<UserMembership> getMembership(String name) async {
    final request = GetUserMembershipRequest(name: name);
    return run(
      'Users.GetMembership',
      request: request,
      action: _protocol.getMembership,
    );
  }

  Future<ListUserMembershipsResponse> listMemberships({
    String? parent,
    int? pageSize,
    String? pageToken,
    String? filter,
  }) async {
    final request = ListUserMembershipsRequest(
      parent: parent,
      pageSize: pageSize,
      pageToken: pageToken,
      filter: filter,
    );
    return run(
      'Users.ListMemberships',
      request: request,
      action: _protocol.listMemberships,
    );
  }
}
