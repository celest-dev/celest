// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type FooServiceServers(Uri _) implements Uri {
  static final FooServiceServers defaultServer = server0;

  static final FooServiceServers server0 = FooServiceServers(Uri.parse(r'/'));
}

class FooServiceParentWithMapping {
  FooServiceParentWithMapping({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// put parent
  Future<PutParentWithMappingResponse> putParentWithMapping(
      {required ParentWithMapping body}) async {
    final $uri = Uri.parse('$_baseUri/parentWithMapping');
    final $request = _i1.Request(
      'PUT',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<ParentWithMapping>($response);
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

class FooServiceParentWithoutMapping {
  FooServiceParentWithoutMapping({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// put parent
  Future<PutParentWithoutMappingResponse> putParentWithoutMapping(
      {required ParentWithoutMapping body}) async {
    final $uri = Uri.parse('$_baseUri/parentWithoutMapping');
    final $request = _i1.Request(
      'PUT',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// The saved account definition.
      case 200:
        return _decodeJson<ParentWithoutMapping>($response);
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

final class FooServiceClient {
  FooServiceClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? FooServiceServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  FooServiceParentWithMapping get parentWithMapping =>
      FooServiceParentWithMapping(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  FooServiceParentWithoutMapping get parentWithoutMapping =>
      FooServiceParentWithoutMapping(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ParentWithMapping {
  ParentWithMapping({this.childType});

  final String? childType;
}

final class ChildWithMappinga {
  ChildWithMappinga({
    this.childType,
    this.namea,
  });

  final String? childType;

  final String? namea;
}

final class ChildWithMappingb {
  ChildWithMappingb({
    this.childType,
    this.nameb,
  });

  final String? childType;

  final String? nameb;
}

typedef ChildType = String;

final class ParentWithoutMapping {
  ParentWithoutMapping({this.childType});

  final String? childType;
}

final class ChildWithoutMappinga {
  ChildWithoutMappinga({
    this.childType,
    this.namea,
  });

  final String? childType;

  final String? namea;
}

final class ChildWithoutMappingb {
  ChildWithoutMappingb({
    this.childType,
    this.nameb,
  });

  final String? childType;

  final String? nameb;
}

/// Response type for [FooServiceParentWithMapping.putParentWithMapping].
typedef PutParentWithMappingResponse = ParentWithMapping;

/// Response type for [FooServiceParentWithoutMapping.putParentWithoutMapping].
typedef PutParentWithoutMappingResponse = ParentWithoutMapping;
