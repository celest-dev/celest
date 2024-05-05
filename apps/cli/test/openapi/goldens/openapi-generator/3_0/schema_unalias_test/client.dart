// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:http/http.dart' as _i1;

extension type ApiDocumentationServers(Uri _) implements Uri {
  static final ApiDocumentationServers defaultServer = server0;

  static final ApiDocumentationServers server0 =
      ApiDocumentationServers(Uri.parse(r'/'));
}

/// Response type for [ApiDocumentationClient.updatePetWithForm].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class UpdatePetWithFormResponse {}

final class ApiDocumentationClient {
  ApiDocumentationClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ApiDocumentationServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// update with form data
  Future<UpdatePetWithFormResponse> updatePetWithForm({
    required DateTime date,
    UpdatePetWithFormRequest? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/thingy/$date');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Invalid input
      case 405:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class UpdatePetWithFormRequest {
  UpdatePetWithFormRequest({this.visitDate});

  final DateTime? visitDate;
}

final class Empty$ implements UpdatePetWithFormResponse {
  const Empty$._();
}
