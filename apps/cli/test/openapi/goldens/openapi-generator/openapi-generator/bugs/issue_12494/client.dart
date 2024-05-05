// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type ExampleApiServers(Uri _) implements Uri {
  static final ExampleApiServers defaultServer = server0;

  static final ExampleApiServers server0 = ExampleApiServers(Uri.parse(r'/'));
}

class ExampleApiDummy {
  ExampleApiDummy({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// dummy
  Future<DummyResponse> dummy() async {
    final $uri = Uri.parse('$_baseUri/dummy');
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

final class ExampleApiClient {
  ExampleApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExampleApiDummy get dummy => ExampleApiDummy(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ChildClass {
  ChildClass({
    this.objectType,
    this.someMap,
  });

  final String? objectType;

  final Map<String, String>? someMap;
}

final class ParentClass {
  ParentClass({
    this.objectType,
    this.someMap,
  });

  final String? objectType;

  final Map<String, String>? someMap;
}

class MapClass extends _i4.DelegatingMap<String, String> {
  MapClass(super.base);
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [ExampleApiDummy.dummy].
typedef DummyResponse = Empty$;
