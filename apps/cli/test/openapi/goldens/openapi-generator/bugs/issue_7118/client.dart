// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'/'));
}

class OpenApiPetstoreIdTypeSet {
  OpenApiPetstoreIdTypeSet({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetUserIdSetResponse> getUserIdSet() async {
    final $uri = Uri.parse('$_baseUri/users/id?type=set');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// response
      case 200:
        return _decodeJson<GetUserIdSetResponse>($response);
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

class OpenApiPetstoreIdTypeList {
  OpenApiPetstoreIdTypeList({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetUserIdListResponse> getUserIdList() async {
    final $uri = Uri.parse('$_baseUri/users/id?type=list');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// response
      case 200:
        return _decodeJson<GetUserIdListResponse>($response);
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

class OpenApiPetstoreUsers {
  OpenApiPetstoreUsers({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreIdTypeSet get idTypeSet => OpenApiPetstoreIdTypeSet(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreIdTypeList get idTypeList => OpenApiPetstoreIdTypeList(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreUsers get users => OpenApiPetstoreUsers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class GetUserIdSetResponse extends _i4.DelegatingSet<String$> {
  GetUserIdSetResponse(super.base);
}

final class GetUserIdListResponse extends _i4.DelegatingList<String$> {
  GetUserIdListResponse(super.base);
}
