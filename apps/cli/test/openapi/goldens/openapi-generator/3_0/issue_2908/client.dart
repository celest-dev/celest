// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type Issue2908CookieParametersServers(Uri _) implements Uri {
  static final Issue2908CookieParametersServers defaultServer = server0;

  static final Issue2908CookieParametersServers server0 =
      Issue2908CookieParametersServers(Uri.parse(r'/'));
}

class Issue2908CookieParametersSomething {
  Issue2908CookieParametersSomething({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<WithCookieParamResponse> withCookieParam() async {
    final $uri = Uri.parse('$_baseUri/something');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// success
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

final class Issue2908CookieParametersClient {
  Issue2908CookieParametersClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? Issue2908CookieParametersServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Issue2908CookieParametersSomething get something =>
      Issue2908CookieParametersSomething(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [Issue2908CookieParametersSomething.withCookieParam].
typedef WithCookieParamResponse = Empty$;
