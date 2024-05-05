// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type ByRefOrValueServers(Uri _) implements Uri {
  static final ByRefOrValueServers defaultServer = server0;

  static final ByRefOrValueServers server0 =
      ByRefOrValueServers(Uri.parse(r'http://localhost:8080'));
}

class ByRefOrValueFoo {
  ByRefOrValueFoo({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// GET all Foos
  Future<GetAllFoosResponse> getAllFoos() async {
    final $uri = Uri.parse('$_baseUri/foo');
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
        return _decodeJson<GetAllFoosResponse>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  /// Create a Foo
  Future<CreateFooResponse> createFoo({Foo? body}) async {
    final $uri = Uri.parse('$_baseUri/foo');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Error
      case 201:
        return _decodeJson<FooRefOrValue>($response);
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

final class ByRefOrValueClient {
  ByRefOrValueClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ByRefOrValueServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ByRefOrValueFoo get foo => ByRefOrValueFoo(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Entity {
  Entity({
    this.href,
    this.id,
    this.schemaLocation,
    this.baseType,
    required this.type,
  });

  final String$? href;

  final String$? id;

  final String$? schemaLocation;

  final String$? baseType;

  final String$ type;
}

final class EntityRef {
  EntityRef({
    this.name,
    this.referredType,
    this.href,
    this.id,
    this.schemaLocation,
    this.baseType,
    required this.type,
  });

  final String$? name;

  final String$? referredType;

  final String$? href;

  final String$? id;

  final String$? schemaLocation;

  final String$? baseType;

  final String$ type;
}

final class Addressable {
  Addressable({
    this.href,
    this.id,
  });

  final String$? href;

  final String$? id;
}

final class Extensible {
  Extensible({
    this.schemaLocation,
    this.baseType,
    required this.type,
  });

  final String$? schemaLocation;

  final String$? baseType;

  final String$ type;
}

final class Foo {
  Foo({
    this.href,
    this.id,
    this.schemaLocation,
    this.baseType,
    required this.type,
  });

  final String$? href;

  final String$? id;

  final String$? schemaLocation;

  final String$? baseType;

  final String$ type;
}

final class FooRef {
  FooRef({
    this.name,
    this.referredType,
    this.href,
    this.id,
    this.schemaLocation,
    this.baseType,
    required this.type,
  });

  final String$? name;

  final String$? referredType;

  final String$? href;

  final String$? id;

  final String$? schemaLocation;

  final String$? baseType;

  final String$ type;
}

sealed class FooRefOrValue {
  const FooRefOrValue();
}

final class GetAllFoosResponse extends _i4.DelegatingList<FooRefOrValue> {
  GetAllFoosResponse(super.base);
}

/// Response type for [ByRefOrValueFoo.createFoo].
typedef CreateFooResponse = FooRefOrValue;
