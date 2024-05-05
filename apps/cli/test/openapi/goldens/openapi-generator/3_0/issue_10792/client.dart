// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ExampleServers(Uri _) implements Uri {
  static final ExampleServers defaultServer = server0;

  static final ExampleServers server0 =
      ExampleServers(Uri.parse(r'http://example.org'));
}

class ExampleBird {
  ExampleBird({
    required _i1.Client httpClient,
    required Uri baseUri,
    required this.id,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  final String id;

  Future<GetBirdResponse> getBird() async {
    final $uri = Uri.parse('$_baseUri/v1/bird/{id}');
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
        return _decodeJson<bird>($response);
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

class ExampleV1 {
  ExampleV1({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExampleBird bird({required String id}) => ExampleBird(
        baseUri: _baseUri,
        httpClient: _httpClient,
        id: id,
      );
}

final class ExampleClient {
  ExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExampleV1 get v1 => ExampleV1(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Animal {
  Animal({required this.id});

  final String$ id;
}

final class Bird {
  Bird({
    required this.id,
    required this.featherType,
  });

  final String$ id;

  final String$ featherType;
}

final class bird {
  bird({
    required this.id,
    required this.featherType,
  });

  final String$ id;

  final String$ featherType;
}

/// Response type for [ExampleBird.getBird].
typedef GetBirdResponse = bird;
