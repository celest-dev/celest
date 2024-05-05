// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ArrayNullableTestApiServers(Uri _) implements Uri {
  static final ArrayNullableTestApiServers defaultServer = server0;

  static final ArrayNullableTestApiServers server0 =
      ArrayNullableTestApiServers(Uri.parse(r'/'));
}

class ArrayNullableTestApiPath {
  ArrayNullableTestApiPath({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// dummy
  Future<Spec1OperationComplexResponse> spec1OperationComplex(
      {required String param1}) async {
    final $uri = Uri.parse('$_baseUri/spec1/complex/$param1/path');
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
        return _decodeJson<Spec1Model>($response);
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

class ArrayNullableTestApiParam1 {
  ArrayNullableTestApiParam1({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ArrayNullableTestApiPath get path => ArrayNullableTestApiPath(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class ArrayNullableTestApiComplex {
  ArrayNullableTestApiComplex({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ArrayNullableTestApiParam1 get param1 => ArrayNullableTestApiParam1(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class ArrayNullableTestApiSpec1 {
  ArrayNullableTestApiSpec1({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// dummy
  Future<Spec1OperationResponse> spec1Operation() async {
    final $uri = Uri.parse('$_baseUri/spec1');
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
        return _decodeJson<Spec1Model>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  ArrayNullableTestApiComplex get complex => ArrayNullableTestApiComplex(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ArrayNullableTestApiClient {
  ArrayNullableTestApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ArrayNullableTestApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ArrayNullableTestApiSpec1 get spec1 => ArrayNullableTestApiSpec1(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Spec1Model {
  Spec1Model({this.spec1Field});

  final String? spec1Field;
}

/// Response type for [ArrayNullableTestApiSpec1.spec1Operation].
typedef Spec1OperationResponse = Spec1Model;

/// Response type for [ArrayNullableTestApiPath.spec1OperationComplex].
typedef Spec1OperationComplexResponse = Spec1Model;
