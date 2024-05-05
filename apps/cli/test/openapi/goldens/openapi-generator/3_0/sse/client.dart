// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type SseTestServers(Uri _) implements Uri {
  static final SseTestServers defaultServer = server0;

  static final SseTestServers server0 = SseTestServers(Uri.parse(r'https'));
}

class SseTestVariant1 {
  SseTestVariant1({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<SseVariant1Response> sseVariant1() async {
    final $uri = Uri.parse('$_baseUri/path/variant1');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// acknowledged
      case 200:
        return _decodeJson<SseVariant1Response>($response);
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

class SseTestVariant2 {
  SseTestVariant2({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<SseVariant2Response> sseVariant2() async {
    final $uri = Uri.parse('$_baseUri/path/variant2');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// acknowledged
      case 200:
        return _decodeJson<SseVariant2Response>($response);
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

class SseTestVariant3 {
  SseTestVariant3({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<NonSseResponse> nonSse() async {
    final $uri = Uri.parse('$_baseUri/path/variant3');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// acknowledged
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

class SseTestPath {
  SseTestPath({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  SseTestVariant1 get variant1 => SseTestVariant1(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  SseTestVariant2 get variant2 => SseTestVariant2(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  SseTestVariant3 get variant3 => SseTestVariant3(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class SseTestClient {
  SseTestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? SseTestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  SseTestPath get path => SseTestPath(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class EventType {
  EventType({this.attribute1});

  final String$? attribute1;
}

final class SseVariant1Response extends _i4.DelegatingList<String$> {
  SseVariant1Response(super.base);
}

final class SseVariant2Response extends _i4.DelegatingList<EventType> {
  SseVariant2Response(super.base);
}

/// Response type for [SseTestVariant3.nonSse].
typedef NonSseResponse = String$;
