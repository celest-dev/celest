// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestApiServers(Uri _) implements Uri {
  static final TestApiServers defaultServer = server0;

  static final TestApiServers server0 = TestApiServers(Uri.parse(r'/'));
}

class TestApiOnlybasicauth {
  TestApiOnlybasicauth({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get with basic auth
  Future<GetWithBasicAuthResponse> getWithBasicAuth() async {
    final $uri = Uri.parse('$_baseUri/examples/onlybasicauth');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// some result
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

class TestApiBasicauthwithoauth {
  TestApiBasicauthwithoauth({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// get with basic auth and oauth
  Future<GetWithBasicAuthAndOauthResponse> getWithBasicAuthAndOauth() async {
    final $uri = Uri.parse('$_baseUri/examples/basicauthwithoauth');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// some result
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

class TestApiOnlyoauthauth {
  TestApiOnlyoauthauth({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// get with oauth
  Future<GetWithOauthAuthResponse> getWithOauthAuth() async {
    final $uri = Uri.parse('$_baseUri/examples/onlyoauthauth');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// some result
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

class TestApiExamples {
  TestApiExamples({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestApiOnlybasicauth get onlybasicauth => TestApiOnlybasicauth(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  TestApiBasicauthwithoauth get basicauthwithoauth => TestApiBasicauthwithoauth(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  TestApiOnlyoauthauth get onlyoauthauth => TestApiOnlyoauthauth(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TestApiClient {
  TestApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestApiExamples get examples => TestApiExamples(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [TestApiOnlybasicauth.getWithBasicAuth].
typedef GetWithBasicAuthResponse = Empty$;

/// Response type for [TestApiBasicauthwithoauth.getWithBasicAuthAndOauth].
typedef GetWithBasicAuthAndOauthResponse = Empty$;

/// Response type for [TestApiOnlyoauthauth.getWithOauthAuth].
typedef GetWithOauthAuthResponse = Empty$;
