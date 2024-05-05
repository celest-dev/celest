// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestApiServers(Uri _) implements Uri {
  static final TestApiServers defaultServer = server0;

  static final TestApiServers server0 = TestApiServers(Uri.parse(r'/'));
}

class TestApiTest {
  TestApiTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Test
  Future<TestApiResponse> testApi() async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return _decodeJson<ModelC>($response);
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

final class TestApiClient {
  TestApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestApiTest get test => TestApiTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Modela {
  Modela({
    this.foo,
    this.duplicatedOptional,
    required this.duplicatedRequired,
  });

  final String? foo;

  final String? duplicatedOptional;

  final String duplicatedRequired;
}

final class Modelb {
  Modelb({
    this.bar,
    this.duplicatedOptional,
    required this.duplicatedRequired,
  });

  final String? bar;

  final int? duplicatedOptional;

  final int duplicatedRequired;
}

final class Modelc {
  Modelc({
    this.foo,
    this.duplicatedOptional,
    required this.duplicatedRequired,
    this.bar,
    this.baz,
  });

  final String? foo;

  final int? duplicatedOptional;

  final int duplicatedRequired;

  final String? bar;

  final String? baz;
}

final class ModelC {
  ModelC({
    this.foo,
    this.duplicatedOptional,
    required this.duplicatedRequired,
    this.bar,
    this.baz,
  });

  final String? foo;

  final int? duplicatedOptional;

  final int duplicatedRequired;

  final String? bar;

  final String? baz;
}

/// Response type for [TestApiTest.testApi].
typedef TestApiResponse = ModelC;
