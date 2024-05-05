// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type MetadataSvcServers(Uri _) implements Uri {
  static final MetadataSvcServers defaultServer = server0;

  static final MetadataSvcServers server0 =
      MetadataSvcServers(Uri.parse(r'https://localhost:8080/'));
}

class MetadataSvcArrayOfString {
  MetadataSvcArrayOfString({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get groups.
  /// Get the list of groups for this example.
  Future<GetWithArrayOfStringResponse> getWithArrayOfString() async {
    final $uri = Uri.parse('$_baseUri/v1/array-of-string');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// List of groups.
      case 200:
        return _decodeJson<GetWithArrayOfStringResponse>($response);
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

class MetadataSvcArrayOfObjects {
  MetadataSvcArrayOfObjects({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get groups.
  /// Get the list of groups for this example.
  Future<GetWithArrayOfObjectsResponse> getWithArrayOfObjects() async {
    final $uri = Uri.parse('$_baseUri/v1/array-of-objects');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// List of groups.
      case 200:
        return _decodeJson<GetWithArrayOfObjectsResponse>($response);
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

class MetadataSvcSetOfStrings {
  MetadataSvcSetOfStrings({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get groups.
  /// Get the set of strings for this example.
  Future<GetWithSetOfStringsResponse> getWithSetOfStrings() async {
    final $uri = Uri.parse('$_baseUri/v1/set-of-strings');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Set of strings.
      case 200:
        return _decodeJson<GetWithSetOfStringsResponse>($response);
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

class MetadataSvcSetOfObjects {
  MetadataSvcSetOfObjects({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get groups.
  /// Get the set of groups for this example.
  Future<GetWithSetOfObjectsResponse> getWithSetOfObjects() async {
    final $uri = Uri.parse('$_baseUri/v1/set-of-objects');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Set of groups.
      case 200:
        return _decodeJson<GetWithSetOfObjectsResponse>($response);
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

class MetadataSvcMapOfStrings {
  MetadataSvcMapOfStrings({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get groups.
  /// Get the map of strings for this example.
  Future<GetWithMapOfStringsResponse> getWithMapOfStrings() async {
    final $uri = Uri.parse('$_baseUri/v1/map-of-strings');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Map of strings.
      case 200:
        return _decodeJson<GetWithMapOfStringsResponse>($response);
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

class MetadataSvcMapOfObjects {
  MetadataSvcMapOfObjects({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get groups.
  /// Get the map of groups for this example.
  Future<GetWithMapOfObjectsResponse> getWithMapOfObjects() async {
    final $uri = Uri.parse('$_baseUri/v1/map-of-objects');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Map of groups.
      case 200:
        return _decodeJson<GetWithMapOfObjectsResponse>($response);
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

class MetadataSvcV1 {
  MetadataSvcV1({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MetadataSvcArrayOfString get arrayOfString => MetadataSvcArrayOfString(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  MetadataSvcArrayOfObjects get arrayOfObjects => MetadataSvcArrayOfObjects(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  MetadataSvcSetOfStrings get setOfStrings => MetadataSvcSetOfStrings(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  MetadataSvcSetOfObjects get setOfObjects => MetadataSvcSetOfObjects(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  MetadataSvcMapOfStrings get mapOfStrings => MetadataSvcMapOfStrings(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  MetadataSvcMapOfObjects get mapOfObjects => MetadataSvcMapOfObjects(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class MetadataSvcClient {
  MetadataSvcClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? MetadataSvcServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MetadataSvcV1 get v1 => MetadataSvcV1(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TestResponse {
  TestResponse({required this.enabled});

  final bool enabled;
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class GetWithArrayOfStringResponse extends _i4.DelegatingList<String$> {
  GetWithArrayOfStringResponse(super.base);
}

final class GetWithArrayOfObjectsResponse
    extends _i4.DelegatingList<TestResponse> {
  GetWithArrayOfObjectsResponse(super.base);
}

final class GetWithSetOfStringsResponse extends _i4.DelegatingSet<String$> {
  GetWithSetOfStringsResponse(super.base);
}

final class GetWithSetOfObjectsResponse
    extends _i4.DelegatingSet<TestResponse> {
  GetWithSetOfObjectsResponse(super.base);
}

class GetWithMapOfStringsResponse extends _i4.DelegatingMap<String, String> {
  GetWithMapOfStringsResponse(super.base);
}

class GetWithMapOfObjectsResponse
    extends _i4.DelegatingMap<String, TestResponse> {
  GetWithMapOfObjectsResponse(super.base);
}
