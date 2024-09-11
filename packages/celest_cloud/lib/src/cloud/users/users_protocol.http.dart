import 'dart:convert';

import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud/src/cloud/base/base_protocol.dart';
import 'package:celest_cloud/src/cloud/users/users_protocol.dart';
import 'package:celest_cloud/src/proto/celest/cloud/auth/v1alpha1/users.pb.dart';
import 'package:celest_cloud/src/proto/google/protobuf/empty.pb.dart';
import 'package:http/http.dart' as http;

final class UsersProtocolHttp with BaseProtocol implements UsersProtocol {
  UsersProtocolHttp({
    required Uri uri,
    http.Client? httpClient,
  })  : _client = httpClient ?? http.Client(),
        _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  Future<User> get(GetUserRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final url = _baseUri.replace(path: path);
    final req = http.Request('GET', url)
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return User()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<UserMembership> getMembership(GetUserMembershipRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final url = _baseUri.replace(path: path);
    final req = http.Request('GET', url)
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return UserMembership()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<ListUsersResponse> list(ListUsersRequest request) async {
    final path = switch (request.parent) {
      '' => '/v1alpha1/organizations/celest-dev/users',
      final parent => '/v1alpha1/$parent/users',
    };
    final url = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasPageSize()) 'pageSize': request.pageSize.toString(),
        if (request.hasPageToken()) 'pageToken': request.pageToken,
        if (request.hasFilter()) 'filter': request.filter,
        if (request.hasOrderBy()) 'orderBy': request.orderBy,
      },
    );
    final req = http.Request('GET', url)
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return ListUsersResponse()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<ListUserMembershipsResponse> listMemberships(
    ListUserMembershipsRequest request,
  ) async {
    final path = '/v1alpha1/${request.parent}/memberships';
    final url = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasPageSize()) 'pageSize': request.pageSize.toString(),
        if (request.hasPageToken()) 'pageToken': request.pageToken,
        if (request.hasFilter()) 'filter': request.filter,
      },
    );
    final req = http.Request('GET', url)
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return ListUserMembershipsResponse()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<User> update(UpdateUserRequest request) async {
    final path = '/v1alpha1/${request.user.name}';
    final url = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasUpdateMask())
          'updateMask': request.updateMask.paths.join(','),
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
      },
    );
    final req = http.Request('PATCH', url)
      ..body = jsonEncode(
        request.user.toProto3Json(
          typeRegistry: CelestCloud.typeRegistry,
        ),
      )
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return User()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<Empty> delete(DeleteUserRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final url = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasEtag()) 'etag': request.etag,
        if (request.hasAllowMissing())
          'allowMissing': request.allowMissing.toString(),
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
        if (request.hasForce()) 'force': request.force.toString(),
      },
    );
    final req = http.Request('DELETE', url)
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    if (res.statusCode != 200) {
      final body = await res.stream.bytesToString();
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return Empty();
  }
}
