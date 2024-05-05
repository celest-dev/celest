// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestBigdecimalAsStringServers(Uri _) implements Uri {
  static final TestBigdecimalAsStringServers defaultServer = server0;

  static final TestBigdecimalAsStringServers server0 =
      TestBigdecimalAsStringServers(Uri.parse(r'https://test.org'));
}

class TestBigdecimalAsStringTest {
  TestBigdecimalAsStringTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetResponse> get() async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<MyResponse>($response);
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

final class TestBigdecimalAsStringClient {
  TestBigdecimalAsStringClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestBigdecimalAsStringServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestBigdecimalAsStringTest get test => TestBigdecimalAsStringTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class MyResponse {
  MyResponse({this.myPropTypeNumber});

  final double? myPropTypeNumber;
}

/// Response type for [TestBigdecimalAsStringTest.get].
typedef GetResponse = MyResponse;
