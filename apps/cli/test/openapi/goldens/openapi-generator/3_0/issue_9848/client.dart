// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io:80/v2'));
}

class OpenApiPetstoreUniqueTypes {
  OpenApiPetstoreUniqueTypes({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetUniqueTypesResponse> getUniqueTypes() async {
    final $uri = Uri.parse('$_baseUri/uniqueTypes');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// unique array
      case 200:
        return _decodeJson<uniqueArray>($response);
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

class OpenApiPetstoreNonUniqueTypes {
  OpenApiPetstoreNonUniqueTypes({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetNonUniqueTypesResponse> getNonUniqueTypes() async {
    final $uri = Uri.parse('$_baseUri/nonUniqueTypes');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// non-unique array
      case 200:
        return _decodeJson<nonUniqueArray>($response);
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

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreUniqueTypes get uniqueTypes => OpenApiPetstoreUniqueTypes(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreNonUniqueTypes get nonUniqueTypes =>
      OpenApiPetstoreNonUniqueTypes(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class UniqueArray_array extends _i4.DelegatingSet<String$> {
  UniqueArray_array(super.base);
}

final class UniqueArray {
  UniqueArray({this.array});

  final UniqueArray_array? array;
}

final class NonUniqueArray_array extends _i4.DelegatingList<String$> {
  NonUniqueArray_array(super.base);
}

final class NonUniqueArray {
  NonUniqueArray({this.array});

  final NonUniqueArray_array? array;
}

final class uniqueArray_array extends _i4.DelegatingSet<String$> {
  uniqueArray_array(super.base);
}

final class uniqueArray {
  uniqueArray({this.array});

  final uniqueArray_array? array;
}

/// Response type for [OpenApiPetstoreUniqueTypes.getUniqueTypes].
typedef GetUniqueTypesResponse = uniqueArray;

final class nonUniqueArray_array extends _i4.DelegatingList<String$> {
  nonUniqueArray_array(super.base);
}

final class nonUniqueArray {
  nonUniqueArray({this.array});

  final nonUniqueArray_array? array;
}

/// Response type for [OpenApiPetstoreNonUniqueTypes.getNonUniqueTypes].
typedef GetNonUniqueTypesResponse = nonUniqueArray;
