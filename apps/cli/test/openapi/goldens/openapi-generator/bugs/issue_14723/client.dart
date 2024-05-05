// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
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

class ResponseTest_details extends _i4.DelegatingMap<String, Object> {
  ResponseTest_details(super.base);
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class ResponseTest2 {
  ResponseTest2({this.label});

  final String$? label;
}

final class ResponseTest_response extends _i4.DelegatingSet<ResponseTest2> {
  ResponseTest_response(super.base);
}

final class ResponseTest_nullableDtos extends _i4.DelegatingSet<ResponseTest2> {
  ResponseTest_nullableDtos(super.base);
}

final class ResponseTest_dtos extends _i4.DelegatingSet<ResponseTest2> {
  ResponseTest_dtos(super.base);
}

final class ResponseTest_listNullableDtos
    extends _i4.DelegatingList<ResponseTest2> {
  ResponseTest_listNullableDtos(super.base);
}

final class ResponseTest_listDtos extends _i4.DelegatingList<ResponseTest2> {
  ResponseTest_listDtos(super.base);
}

final class ResponseTest_nullableStrings extends _i4.DelegatingSet<String$> {
  ResponseTest_nullableStrings(super.base);
}

final class ResponseTest_strings extends _i4.DelegatingSet<String$> {
  ResponseTest_strings(super.base);
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class ResponseTest_nullableInts extends _i4.DelegatingSet<Integer$> {
  ResponseTest_nullableInts(super.base);
}

final class ResponseTest_ints extends _i4.DelegatingSet<Integer$> {
  ResponseTest_ints(super.base);
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

  final ResponseTest_details? details;

  final ResponseTest_response? response;

  final ResponseTest_nullableDtos? nullableDtos;

  final ResponseTest_dtos? dtos;

  final ResponseTest_listNullableDtos? listNullableDtos;

  final ResponseTest_listDtos? listDtos;

  final ResponseTest_nullableStrings? nullableStrings;

  final ResponseTest_strings? strings;

  final ResponseTest_nullableInts? nullableInts;

  final ResponseTest_ints? ints;
}

/// Response type for [TestTest.test].
typedef TestResponse = ResponseTest;
