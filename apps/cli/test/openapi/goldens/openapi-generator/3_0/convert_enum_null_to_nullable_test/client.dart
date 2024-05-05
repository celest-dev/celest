// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ExampleServers(Uri _) implements Uri {
  static final ExampleServers defaultServer = apiExampleXyz;

  static final ExampleServers apiExampleXyz =
      ExampleServers(Uri.parse(r'http://api.example.xyz/v1'));
}

/// Response type for [ExampleClient.list].
///
/// This is a marker interface implemented by all response types:
/// - [AnyOfTest]
sealed class ListResponse {}

final class ExampleClient {
  ExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  Future<ListResponse> list({required String personId}) async {
    final $uri = Uri.parse('$_baseUri/person/display/$personId');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// OK
      case (200, 'application/json'):
        return _decodeJson<AnyOfTest>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

/// to test anyOf (string, enum string)
final class AnyOfTest implements ListResponse {
  AnyOfTest();
}
