// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsServers(
    Uri _) implements Uri {
  static final OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsServers
      defaultServer = petstoreServer;

  /// petstore server
  static final OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsServers
      petstoreServer =
      OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsServers(
          Uri.parse(r'http://petstore.swagger.io/v2'));
}

class OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsMap {
  OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsMap({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Use alias to map
  /// Use alias to map
  Future<MapResponse> map({Map<String, String>? body}) async {
    final $uri = Uri.parse('$_baseUri/map');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsArray {
  OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsArray({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Use alias to array
  /// Use alias to array
  Future<ArrayResponse> array({List<int>? body}) async {
    final $uri = Uri.parse('$_baseUri/array');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return _decodeJson<Any$>($response);
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

final class OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsClient {
  OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ??
            OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsServers
                .defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsMap get map =>
      OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsMap(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsArray get array =>
      OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsArray(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ArrayAlias extends _i4.DelegatingList<int> {
  ArrayAlias(super.base);
}

class MapAlias extends _i4.DelegatingMap<String, String> {
  MapAlias(super.base);
}

final class Any$ {
  const Any$(this.value);

  final Object value;
}

/// Response type for [OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsMap.map].
typedef MapResponse = Any$;

/// Response type for [OpenApiExtensionGeneratingAliasesToMapsAndArraysAsModelsArray.array].
typedef ArrayResponse = Any$;
