// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type BuggyApiServers(Uri _) implements Uri {
  static final BuggyApiServers defaultServer = server0;

  static final BuggyApiServers server0 = BuggyApiServers(Uri.parse(r'/'));
}

class BuggyApiBar {
  BuggyApiBar({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostFooBarResponse> postFooBar() async {
    final $uri = Uri.parse('$_baseUri/foo/bar');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ok
      case 200:
        return _decodeJson<_foo_bar_post_200_response>($response);
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

class BuggyApiBar2 {
  BuggyApiBar2({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostFooBar2Response> postFooBar2() async {
    final $uri = Uri.parse('$_baseUri/foo/bar2');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ok
      case 200:
        return _decodeJson<bar2>($response);
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

class BuggyApiFoo {
  BuggyApiFoo({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  BuggyApiBar get bar => BuggyApiBar(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  BuggyApiBar2 get bar2 => BuggyApiBar2(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class BuggyApiClient {
  BuggyApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? BuggyApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  BuggyApiFoo get foo => BuggyApiFoo(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Bar2 {
  Bar2({this.n});

  final double? n;
}

final class FooBarPost200Response {
  FooBarPost200Response({this.n});

  final double? n;
}

final class _foo_bar_post_200_response {
  _foo_bar_post_200_response({this.n});

  final double? n;
}

/// Response type for [BuggyApiBar.postFooBar].
typedef PostFooBarResponse = _foo_bar_post_200_response;

final class bar2 {
  bar2({this.n});

  final double? n;
}

/// Response type for [BuggyApiBar2.postFooBar2].
typedef PostFooBar2Response = bar2;
