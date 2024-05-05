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

class MetadataSvcAPath {
  MetadataSvcAPath({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// A generic getter operation.
  /// Get something from somewhere.
  Future<GetSomethingResponse> getSomething() async {
    final $uri = Uri.parse('$_baseUri/v1/a-path');
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
        return _decodeJson<GetSomethingResponse>($response);
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

class MetadataSvcAnotherPath {
  MetadataSvcAnotherPath({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Insert something.
  /// Insert something somewhere.
  Future<PutSomethingResponse> putSomething() async {
    final $uri = Uri.parse('$_baseUri/v1/another-path');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// List of groups.
      case 201:
        return _decodeJson<String$>($response);
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

  MetadataSvcAPath get aPath => MetadataSvcAPath(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  MetadataSvcAnotherPath get anotherPath => MetadataSvcAnotherPath(
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

final class String$ {
  const String$(this.value);

  final String value;
}

final class GetSomethingResponse extends _i4.DelegatingList<String$> {
  GetSomethingResponse(super.base);
}

/// Response type for [MetadataSvcAnotherPath.putSomething].
typedef PutSomethingResponse = String$;
