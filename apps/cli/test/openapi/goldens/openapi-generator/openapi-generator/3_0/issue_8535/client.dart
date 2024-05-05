// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TotoServers(Uri _) implements Uri {
  static final TotoServers defaultServer = server0;

  /// /
  static final TotoServers server0 = TotoServers(Uri.parse(r'/'));
}

class TotoTestHeaders {
  TotoTestHeaders({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// test headers
  /// desc
  Future<HeadersTestResponse> headersTest() async {
    final $uri = Uri.parse('$_baseUri/test-headers');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (headerNumber != null) {
      $request.headers['headerNumber'] = headerNumber.toString();
    }
    if (headerString != null) {
      $request.headers['headerString'] = headerString;
    }
    if (headerStringWrapped != null) {
      $request.headers['headerStringWrapped'] = headerStringWrapped;
    }
    if (headerStringQuotes != null) {
      $request.headers['headerStringQuotes'] = headerStringQuotes;
    }
    if (headerStringQuotesWrapped != null) {
      $request.headers['headerStringQuotesWrapped'] = headerStringQuotesWrapped;
    }
    $request.headers['headerBoolean'] = headerBoolean.toString();
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// default response
      default:
        return _decodeJson<TestResponse>($response);
    }
  }

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

class TotoTestQueryParams {
  TotoTestQueryParams({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// test query params
  /// desc
  Future<QueryParamsTestResponse> queryParamsTest({
    double? queryNumber,
    String? queryString,
    String? queryStringWrapped,
    String? queryStringQuotes,
    String? queryStringQuotesWrapped,
    required bool queryBoolean,
  }) async {
    final $queryParameters = <String, String>{};
    if (queryNumber != null) {
      $queryParameters['queryNumber'] = queryNumber.toString();
    }
    if (queryString != null) {
      $queryParameters['queryString'] = queryString;
    }
    if (queryStringWrapped != null) {
      $queryParameters['queryStringWrapped'] = queryStringWrapped;
    }
    if (queryStringQuotes != null) {
      $queryParameters['queryStringQuotes'] = queryStringQuotes;
    }
    if (queryStringQuotesWrapped != null) {
      $queryParameters['queryStringQuotesWrapped'] = queryStringQuotesWrapped;
    }
    $queryParameters['queryBoolean'] = queryBoolean.toString();
    final $uri = Uri.parse('$_baseUri/test-query-params')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// default response
      default:
        return _decodeJson<TestResponse>($response);
    }
  }

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

final class TotoClient {
  TotoClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TotoServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TotoTestHeaders get testHeaders => TotoTestHeaders(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  TotoTestQueryParams get testQueryParams => TotoTestQueryParams(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TestResponse {
  TestResponse({
    required this.id,
    required this.stringField,
    required this.numberField,
    required this.booleanField,
  });

  final int id;

  final String stringField;

  final double numberField;

  final bool booleanField;
}

/// Response type for [TotoTestHeaders.headersTest].
typedef HeadersTestResponse = TestResponse;

/// Response type for [TotoTestQueryParams.queryParamsTest].
typedef QueryParamsTestResponse = TestResponse;
