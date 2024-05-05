// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type BugServers(Uri _) implements Uri {
  static final BugServers defaultServer = server0;

  static final BugServers server0 = BugServers(Uri.parse(r'/'));
}

class BugMyRequest {
  BugMyRequest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Update the test
  Future<TestResponse> test({TestEntity? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/MyRequest');
    final $request = _i1.Request(
      'PUT',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Success
      case 200:
        return _decodeJson<TestEntity>($response);
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

class BugV1 {
  BugV1({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  BugMyRequest get myRequest => BugMyRequest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class BugClient {
  BugClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? BugServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  BugV1 get v1 => BugV1(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TestEntity {
  TestEntity({this.name});

  final String? name;
}

/// Response type for [BugMyRequest.test].
typedef TestResponse = TestEntity;
