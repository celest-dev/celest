// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TitleServers(Uri _) implements Uri {
  static final TitleServers defaultServer = server0;

  static final TitleServers server0 = TitleServers(Uri.parse(r'/'));
}

class TitleTest {
  TitleTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetTestResponse> getTest() async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Success
      case 200:
        return _decodeJson<TestObject>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

final class TitleClient {
  TitleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TitleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TitleTest get test => TitleTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TestObject {
  TestObject({
    this.nullableProperty,
    this.notNullableProperty,
    this.notNullablePropertyNotRo,
  });

  final String? nullableProperty;

  final String? notNullableProperty;

  final int? notNullablePropertyNotRo;
}

/// Response type for [TitleTest.getTest].
typedef GetTestResponse = TestObject;
