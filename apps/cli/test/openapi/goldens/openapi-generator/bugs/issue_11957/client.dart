// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type SearchApiServers(Uri _) implements Uri {
  static final SearchApiServers defaultServer = server0;

  static final SearchApiServers server0 =
      SearchApiServers(Uri.parse(r'http://localhost:8080/api/v1'));
}

class SearchApiDefaultList {
  SearchApiDefaultList({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<DefaultListResponse> defaultList({
    int? p,
    required List<TODO_item> orderBy,
  }) async {
    final $queryParameters = <String, String>{};
    if (p != null) {
      $queryParameters['p'] = p.toString();
    }
    $queryParameters['orderBy'] = orderBy.toString();
    final $uri = Uri.parse('$_baseUri/default-list')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Custom response
      case 204:
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

class SearchApiEmptyDefaultList {
  SearchApiEmptyDefaultList({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<EmptyDefaultListResponse> emptyDefaultList({
    int? p,
    required List<TODO_item> orderBy,
  }) async {
    final $queryParameters = <String, String>{};
    if (p != null) {
      $queryParameters['p'] = p.toString();
    }
    $queryParameters['orderBy'] = orderBy.toString();
    final $uri = Uri.parse('$_baseUri/empty-default-list')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Custom response
      case 204:
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

class SearchApiDefaultSet {
  SearchApiDefaultSet({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<DefaultSetResponse> defaultSet({
    int? p,
    required Set<TODO_item> orderBy,
  }) async {
    final $queryParameters = <String, String>{};
    if (p != null) {
      $queryParameters['p'] = p.toString();
    }
    $queryParameters['orderBy'] = orderBy.toString();
    final $uri = Uri.parse('$_baseUri/default-set')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Custom response
      case 204:
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

class SearchApiEmptyDefaultSet {
  SearchApiEmptyDefaultSet({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<EmptyDefaultSetResponse> emptyDefaultSet({
    int? p,
    required Set<TODO_item> orderBy,
  }) async {
    final $queryParameters = <String, String>{};
    if (p != null) {
      $queryParameters['p'] = p.toString();
    }
    $queryParameters['orderBy'] = orderBy.toString();
    final $uri = Uri.parse('$_baseUri/empty-default-set')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Custom response
      case 204:
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

final class SearchApiClient {
  SearchApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? SearchApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  SearchApiDefaultList get defaultList => SearchApiDefaultList(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  SearchApiEmptyDefaultList get emptyDefaultList => SearchApiEmptyDefaultList(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  SearchApiDefaultSet get defaultSet => SearchApiDefaultSet(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  SearchApiEmptyDefaultSet get emptyDefaultSet => SearchApiEmptyDefaultSet(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

extension type const TODO_item(String _) implements String {
  static const TODO_item createdAtAsc = TODO_item('createdAt:ASC');

  static const TODO_item createdAtDesc = TODO_item('createdAt:DESC');

  static const TODO_item updatedAtAsc = TODO_item('updatedAt:ASC');

  static const TODO_item updatedAtDesc = TODO_item('updatedAt:DESC');
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [SearchApiDefaultList.defaultList].
typedef DefaultListResponse = Empty$;

/// Response type for [SearchApiEmptyDefaultList.emptyDefaultList].
typedef EmptyDefaultListResponse = Empty$;

/// Response type for [SearchApiDefaultSet.defaultSet].
typedef DefaultSetResponse = Empty$;

/// Response type for [SearchApiEmptyDefaultSet.emptyDefaultSet].
typedef EmptyDefaultSetResponse = Empty$;
