// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ExampleApiServers(Uri _) implements Uri {
  static final ExampleApiServers defaultServer = server0;

  static final ExampleApiServers server0 = ExampleApiServers(Uri.parse(r'/'));
}

class ExampleApiNone {
  ExampleApiNone({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// No Tag
  Future<GetNoneResponse> getNone() async {
    final $uri = Uri.parse('$_baseUri/none');
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

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

class ExampleApiSingle {
  ExampleApiSingle({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Single Tag
  Future<GetSingleTagResponse> getSingleTag() async {
    final $uri = Uri.parse('$_baseUri/single');
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

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

class ExampleApiMultiple {
  ExampleApiMultiple({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Multiple Tags
  Future<GetMultipleTagsResponse> getMultipleTags() async {
    final $uri = Uri.parse('$_baseUri/multiple');
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

  ExampleApiNone get none => ExampleApiNone(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  ExampleApiSingle get single => ExampleApiSingle(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  ExampleApiMultiple get multiple => ExampleApiMultiple(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

/// Response type for [ExampleApiNone.getNone].
typedef GetNoneResponse = String$;

/// Response type for [ExampleApiSingle.getSingleTag].
typedef GetSingleTagResponse = String$;

/// Response type for [ExampleApiMultiple.getMultipleTags].
typedef GetMultipleTagsResponse = String$;
