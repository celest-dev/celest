// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestHandleOfFreeFormQueryParametersServers(Uri _)
    implements Uri {
  static final TestHandleOfFreeFormQueryParametersServers defaultServer =
      server0;

  static final TestHandleOfFreeFormQueryParametersServers server0 =
      TestHandleOfFreeFormQueryParametersServers(
          Uri.parse(r'http://localhost'));
}

class TestHandleOfFreeFormQueryParametersEndpoint {
  TestHandleOfFreeFormQueryParametersEndpoint({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetSomeEndpointResponse> getSomeEndpoint({Object? freeForm}) async {
    final $queryParameters = <String, String>{};
    if (freeForm != null) {
      $queryParameters['free-form'] = freeForm.toString();
    }
    final $uri = Uri.parse('$_baseUri/some/endpoint')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// test
      case 200:
        return const Empty$._();
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

class TestHandleOfFreeFormQueryParametersSome {
  TestHandleOfFreeFormQueryParametersSome({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestHandleOfFreeFormQueryParametersEndpoint get endpoint =>
      TestHandleOfFreeFormQueryParametersEndpoint(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TestHandleOfFreeFormQueryParametersClient {
  TestHandleOfFreeFormQueryParametersClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri =
            baseUri ?? TestHandleOfFreeFormQueryParametersServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestHandleOfFreeFormQueryParametersSome get some =>
      TestHandleOfFreeFormQueryParametersSome(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [TestHandleOfFreeFormQueryParametersEndpoint.getSomeEndpoint].
typedef GetSomeEndpointResponse = Empty$;
