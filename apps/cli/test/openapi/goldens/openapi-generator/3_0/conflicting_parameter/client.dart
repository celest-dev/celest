// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:http/http.dart' as _i1;

/// Response type for [OpenApiPetstoreClient.create].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class CreateResponse {}

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<CreateResponse> create({
    required int id,
    int? id,
    int? id,
    int? id,
    CreateRequest? body,
  }) async {
    final $queryParameters = <String, String>{};
    if (id != null) {
      $queryParameters['id'] = id.toString();
    }
    final $uri = Uri.parse('$_baseUri/pet/$id')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (id != null) {
      $request.headers['id'] = id.toString();
    }
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Invalid pet value
      case 400:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class CreateRequest {
  CreateRequest({
    this.id,
    this.pathid,
    this.headerId2,
    this.cookieId2,
    this.queryId2,
  });

  final int? id;

  final int? pathid;

  final int? headerId2;

  final int? cookieId2;

  final int? queryId2;
}

final class Empty$ implements CreateResponse {
  const Empty$._();
}
