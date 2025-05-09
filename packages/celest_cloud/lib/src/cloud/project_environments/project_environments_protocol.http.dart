import 'dart:convert';
import 'dart:typed_data';

import 'package:celest_cloud/src/cloud/base/base_protocol.dart';
import 'package:celest_cloud/src/cloud/cloud.dart';
import 'package:celest_cloud/src/cloud/project_environments/project_environments_protocol.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/project_environments.pb.dart';
import 'package:celest_cloud/src/proto/google/longrunning/operations.pb.dart';
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;

final class ProjectEnvironmentsProtocolHttp
    with BaseProtocol
    implements ProjectEnvironmentsProtocol {
  ProjectEnvironmentsProtocolHttp({required Uri uri, http.Client? httpClient})
    : _client = httpClient ?? http.Client(),
      _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  Future<Operation> create(CreateProjectEnvironmentRequest request) async {
    final path = '/v1alpha1/${request.parent}/environments';
    final Uri uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasParent()) 'parent': request.parent,
        if (request.hasProjectEnvironmentId())
          'projectEnvironmentId': request.projectEnvironmentId,
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
      },
    );
    final req =
        http.Request('POST', uri)
          ..body = jsonEncode(
            request.projectEnvironment.toProto3Json(
              typeRegistry: CelestCloud.typeRegistry,
            ),
          )
          ..headers['content-type'] = 'application/json'
          ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return Operation()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }

  @override
  Future<Operation> delete(DeleteProjectEnvironmentRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final Uri uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasRequestId()) 'requestId': request.requestId,
        if (request.hasEtag()) 'etag': request.etag,
        if (request.hasAllowMissing())
          'allowMissing': request.allowMissing.toString(),
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
      },
    );
    final req =
        http.Request('DELETE', uri)
          ..headers['content-type'] = 'application/json'
          ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return Operation()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
      // JSON for Empty has `value` field for some reason.
      ignoreUnknownFields: true,
    );
  }

  @override
  Future<ProjectEnvironment> get(GetProjectEnvironmentRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final Uri uri = _baseUri.replace(path: path);
    final req = http.Request('GET', uri)
      ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return ProjectEnvironment()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }

  @override
  Future<ListProjectEnvironmentsResponse> list(
    ListProjectEnvironmentsRequest request,
  ) async {
    final path = '/v1alpha1/${request.parent}/environments';
    final Uri uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasPageSize()) 'pageSize': request.pageSize.toString(),
        if (request.hasPageToken()) 'pageToken': request.pageToken,
        if (request.hasFilter()) 'filter': request.filter,
        if (request.hasOrderBy()) 'orderBy': request.orderBy,
      },
    );
    final req = http.Request('GET', uri)
      ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return ListProjectEnvironmentsResponse()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }

  @override
  Future<Operation> update(UpdateProjectEnvironmentRequest request) async {
    final path = '/v1alpha1/${request.projectEnvironment.name}';
    final Uri uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasUpdateMask())
          'updateMask': request.updateMask.paths.join(','),
        if (request.hasRequestId()) 'requestId': request.requestId,
        if (request.hasAllowMissing())
          'allowMissing': request.allowMissing.toString(),
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
      },
    );
    final req =
        http.Request('PATCH', uri)
          ..body = jsonEncode(
            request.projectEnvironment.toProto3Json(
              typeRegistry: CelestCloud.typeRegistry,
            ),
          )
          ..headers['content-type'] = 'application/json'
          ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return Operation()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }

  @override
  Future<Operation> deploy(DeployProjectEnvironmentRequest request) async {
    final path = '/v1alpha1/${request.name}:deploy';
    final Uri uri = _baseUri.replace(path: path);
    final req =
        http.Request('POST', uri)
          ..body = jsonEncode(
            request.toProto3Json(typeRegistry: CelestCloud.typeRegistry),
          )
          ..headers['content-type'] = 'application/json'
          ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return Operation()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }
}
