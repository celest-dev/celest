import 'dart:convert';

import 'package:celest_cloud/src/cloud/base/base_protocol.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/proto.dart';
import 'package:http/http.dart' as http;

final class OperationsProtocolHttp
    with BaseProtocol
    implements OperationsProtocol {
  OperationsProtocolHttp({
    required Uri uri,
    http.Client? httpClient,
  })  : _client = httpClient ?? http.Client(),
        _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  Future<void> cancel(CancelOperationRequest request) async {
    final path = '/v1alpha1/${request.name}:cancel';
    final url = _baseUri.replace(path: path);
    final req = http.Request('POST', url)
      ..body = jsonEncode(request.toProto3Json())
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
  }

  @override
  Future<Operation> get(GetOperationRequest request) async {
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
    return Operation()..mergeFromProto3Json(jsonDecode(body));
  }

  @override
  Future<ListOperationsResponse> list(ListOperationsRequest request) async {
    const path = '/v1alpha1/operations';
    final url = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.hasFilter()) 'filter': request.filter,
        if (request.hasPageSize()) 'pageSize': request.pageSize.toString(),
        if (request.hasPageToken()) 'pageToken': request.pageToken,
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
    return ListOperationsResponse()..mergeFromProto3Json(jsonDecode(body));
  }
}
