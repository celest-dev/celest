// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestServers(Uri _) implements Uri {
  static final TestServers defaultServer = stage;

  /// stage
  static final TestServers stage = TestServers(Uri.parse(r'http://test.com'));
}

class TestDemo {
  TestDemo({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// placeholder summary
  Future<GetDemoResponse> getDemo() async {
    final $uri = Uri.parse('$_baseUri/demo');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Success
      case 200:
        return _decodeJson<Pet>($response);
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

final class TestClient {
  TestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestDemo get demo => TestDemo(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Pet {
  Pet({required this.petType});

  final String petType;
}

final class AllPets {
  AllPets({this.pets});

  final List<Pet>? pets;
}

final class Cat {
  Cat({
    required this.petType,
    this.name,
  });

  final String petType;

  final String? name;
}

final class Dog {
  Dog({
    required this.petType,
    this.bark,
  });

  final String petType;

  final String? bark;
}

final class Lizard {
  Lizard({
    required this.petType,
    this.lovesRocks,
  });

  final String petType;

  final bool? lovesRocks;
}

/// Response type for [TestDemo.getDemo].
typedef GetDemoResponse = Pet;
