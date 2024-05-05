// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type DummyServers(Uri _) implements Uri {
  static final DummyServers defaultServer = server0;

  static final DummyServers server0 = DummyServers(Uri.parse(r'/'));
}

class DummyParameterNameMapping {
  DummyParameterNameMapping({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// parameter name mapping test
  Future<GetParameterNameMappingResponse> getParameterNameMapping({
    required String type,
    required String httpDebugOption,
  }) async {
    final $queryParameters = <String, String>{};
    $queryParameters['type'] = type;
    $queryParameters['http_debug_option'] = httpDebugOption;
    final $uri = Uri.parse('$_baseUri/fake/parameter-name-mapping')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.headers['_type'] = type.toString();
    $request.headers['type_'] = type;
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<Environment>($response);
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

class DummyFake {
  DummyFake({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  DummyParameterNameMapping get parameterNameMapping =>
      DummyParameterNameMapping(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class DummyClient {
  DummyClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? DummyServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  DummyFake get fake => DummyFake(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Environment {
  Environment({this.dummy});

  final String$? dummy;
}

final class PropertyNameMapping {
  PropertyNameMapping({
    this.httpDebugOperation,
    this.type,
    this.type,
    this.type,
  });

  final String$? httpDebugOperation;

  final String$? type;

  final String$? type;

  final String$? type;
}

/// Response type for [DummyParameterNameMapping.getParameterNameMapping].
typedef GetParameterNameMappingResponse = Environment;
