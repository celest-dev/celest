// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:http/http.dart' as _i1;

/// Response type for [CustomMethodsClient.undeleteOperation].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class UndeleteOperationResponse {}

final class CustomMethodsClient {
  CustomMethodsClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<UndeleteOperationResponse> undeleteOperation({
    required double eventId,
    UndeleteOperationRequest? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/events/$eventId:undelete');
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
      /// success
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class UndeleteOperationRequest {
  UndeleteOperationRequest({this.someFile});

  final String? someFile;
}

final class Empty$ implements UndeleteOperationResponse {
  const Empty$._();
}
