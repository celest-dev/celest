// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type PingThatReturnPrimitiveTypesServers(Uri _) implements Uri {
  static final PingThatReturnPrimitiveTypesServers defaultServer = server0;

  static final PingThatReturnPrimitiveTypesServers server0 =
      PingThatReturnPrimitiveTypesServers(Uri.parse(r'http://localhost:8082/'));
}

class PingThatReturnPrimitiveTypesPingBoolean {
  PingThatReturnPrimitiveTypesPingBoolean({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PingGetBooleanResponse> pingGetBoolean() async {
    final $uri = Uri.parse('$_baseUri/pingBoolean');
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
        return _decodeJson<Boolean$>($response);
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

class PingThatReturnPrimitiveTypesPingInteger {
  PingThatReturnPrimitiveTypesPingInteger({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PingGetIntegerResponse> pingGetInteger() async {
    final $uri = Uri.parse('$_baseUri/pingInteger');
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
        return _decodeJson<Integer$>($response);
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

final class PingThatReturnPrimitiveTypesClient {
  PingThatReturnPrimitiveTypesClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? PingThatReturnPrimitiveTypesServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  PingThatReturnPrimitiveTypesPingBoolean get pingBoolean =>
      PingThatReturnPrimitiveTypesPingBoolean(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  PingThatReturnPrimitiveTypesPingInteger get pingInteger =>
      PingThatReturnPrimitiveTypesPingInteger(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Boolean$ {
  const Boolean$(this.value);

  final bool value;
}

/// Response type for [PingThatReturnPrimitiveTypesPingBoolean.pingGetBoolean].
typedef PingGetBooleanResponse = Boolean$;

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

/// Response type for [PingThatReturnPrimitiveTypesPingInteger.pingGetInteger].
typedef PingGetIntegerResponse = Integer$;
