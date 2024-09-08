import 'dart:convert';

import 'package:celest_cloud/src/cloud/base/base_protocol.dart';
import 'package:celest_cloud/src/cloud/cloud.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/projects.pb.dart';
import 'package:celest_cloud/src/proto/google/longrunning/operations.pb.dart';
import 'package:http/http.dart' as http;

final class ProjectsProtocolHttp with BaseProtocol implements ProjectsProtocol {
  ProjectsProtocolHttp({
    required Uri uri,
    http.Client? httpClient,
  })  : _client = httpClient ?? http.Client(),
        _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  Future<Operation> create(CreateProjectRequest request) async {
    final path = '/v1alpha1/${request.parent}/projects';
    final uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasParent()) 'parent': request.parent,
        if (request.hasProjectId()) 'projectId': request.projectId,
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
      },
    );
    final req = http.Request('POST', uri)
      ..body = jsonEncode(
        request.project.toProto3Json(
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
    return Operation()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<Operation> delete(DeleteProjectRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasForce()) 'force': request.force.toString(),
        if (request.hasEtag()) 'etag': request.etag,
        if (request.hasAllowMissing())
          'allowMissing': request.allowMissing.toString(),
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
      },
    );
    final req = http.Request('DELETE', uri)
      ..body = jsonEncode(
        request.toProto3Json(
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
    return Operation()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
        // JSON for Empty has `value` field for some reason.
        ignoreUnknownFields: true,
      );
  }

  @override
  Future<Project> get(GetProjectRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('GET', uri)
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return Project()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<ListProjectsResponse> list(
    ListProjectsRequest request,
  ) async {
    final path = '/v1alpha1/${request.parent}/projects';
    final uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasPageSize()) 'pageSize': request.pageSize.toString(),
        if (request.hasPageToken()) 'pageToken': request.pageToken,
        if (request.hasFilter()) 'filter': request.filter,
        if (request.hasOrderBy()) 'orderBy': request.orderBy,
        if (request.hasShowDeleted())
          'showDeleted': request.showDeleted.toString(),
      },
    );
    final req = http.Request('GET', uri)
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return ListProjectsResponse()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<Operation> update(UpdateProjectRequest request) async {
    final path = '/v1alpha1/${request.project.name}';
    final uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasUpdateMask())
          'updateMask': request.updateMask.paths.join(','),
        if (request.hasAllowMissing())
          'allowMissing': request.allowMissing.toString(),
        if (request.hasValidateOnly())
          'validateOnly': request.validateOnly.toString(),
      },
    );
    final req = http.Request('PATCH', uri)
      ..body = jsonEncode(
        request.project.toProto3Json(
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
    return Operation()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<Operation> rename(RenameProjectRequest request) async {
    final path = '/v1alpha1/${request.name}:rename';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('POST', uri)
      ..body = jsonEncode(
        request.toProto3Json(
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
    return Operation()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }
}
