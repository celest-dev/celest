// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestServers(Uri _) implements Uri {
  static final TestServers defaultServer = server0;

  static final TestServers server0 = TestServers(Uri.parse(r'/'));
}

class TestTest {
  TestTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// test
  Future<TestResponse> test() async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      case 200:
        return _decodeJson<ResponseTest>($response);
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

final class TestClient {
  TestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestTest get test => TestTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ResponseTest2 {
  ResponseTest2({this.label});

  final String? label;
}

final class ResponseTest {
  ResponseTest({
    this.details,
    this.response,
    this.nullableDtos,
    this.dtos,
    this.listNullableDtos,
    this.listDtos,
    this.nullableStrings,
    this.strings,
    this.nullableInts,
    this.ints,
  });

  final Map<String, Object>? details;

  final Set<ResponseTest2>? response;

  final Set<ResponseTest2>? nullableDtos;

  final Set<ResponseTest2>? dtos;

  final List<ResponseTest2>? listNullableDtos;

  final List<ResponseTest2>? listDtos;

  final Set<String>? nullableStrings;

  final Set<String>? strings;

  final Set<int>? nullableInts;

  final Set<int>? ints;
}

/// Response type for [TestTest.test].
typedef TestResponse = ResponseTest;
