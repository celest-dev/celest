// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type DeepobjectTestServers(Uri _) implements Uri {
  static final DeepobjectTestServers defaultServer = server0;

  static final DeepobjectTestServers server0 =
      DeepobjectTestServers(Uri.parse(r'/'));
}

class DeepobjectTestTest {
  DeepobjectTestTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<TestResponse> test({
    required Pet options,
    required Options inputOptions,
  }) async {
    final $queryParameters = <String, String>{};
    $queryParameters['options'] = options.toString();
    $queryParameters['inputOptions'] = inputOptions.toString();
    final $uri =
        Uri.parse('$_baseUri/test').replace(queryParameters: $queryParameters);
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
        return _decodeJson<String$>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<TestPostResponse> testPost({required Pet queryObject}) async {
    final $queryParameters = <String, String>{};
    $queryParameters['query_object'] = queryObject.toString();
    final $uri =
        Uri.parse('$_baseUri/test').replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<String$>($response);
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

final class DeepobjectTestClient {
  DeepobjectTestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? DeepobjectTestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  DeepobjectTestTest get test => DeepobjectTestTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Options {
  Options({
    this.a,
    this.b,
    this.c,
  });

  final DateTime? a;

  final DateTime? b;

  final List<String>? c;
}

final class Category {
  Category({
    this.id,
    this.name,
  });

  final int? id;

  final String? name;
}

final class Tag {
  Tag({
    this.id,
    this.name,
  });

  final int? id;

  final String? name;
}

extension type const Pet_status(String _) implements String {
  static const Pet_status available = Pet_status('available');

  static const Pet_status pending = Pet_status('pending');

  static const Pet_status sold = Pet_status('sold');
}

final class Pet {
  Pet({
    this.id,
    required this.name,
    this.category,
    required this.photoUrls,
    this.tags,
    this.status,
  });

  final int? id;

  final String name;

  final Category? category;

  final List<String> photoUrls;

  final List<Tag>? tags;

  final Pet_status? status;
}

final class String$ {
  const String$(this.value);

  final String value;
}

/// Response type for [DeepobjectTestTest.test].
typedef TestResponse = String$;

/// Response type for [DeepobjectTestTest.testPost].
typedef TestPostResponse = String$;
