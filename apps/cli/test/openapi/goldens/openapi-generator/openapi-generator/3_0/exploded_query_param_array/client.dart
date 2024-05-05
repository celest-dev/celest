// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ExplodedQueryParamArrayServers(Uri _) implements Uri {
  static final ExplodedQueryParamArrayServers defaultServer = server0;

  static final ExplodedQueryParamArrayServers server0 =
      ExplodedQueryParamArrayServers(Uri.parse(r'localhost:8080'));
}

class ExplodedQueryParamArrayApi {
  ExplodedQueryParamArrayApi({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetSomeValueResponse> getSomeValue(
      {required QueryObject queryObject}) async {
    final $queryParameters = <String, String>{};
    $queryParameters['QueryObject'] = queryObject.toString();
    final $uri =
        Uri.parse('$_baseUri/api').replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Some return value
      case 200:
        return _decodeJson<SomeReturnValue>($response);
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

final class ExplodedQueryParamArrayClient {
  ExplodedQueryParamArrayClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExplodedQueryParamArrayServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExplodedQueryParamArrayApi get api => ExplodedQueryParamArrayApi(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class SomeReturnValue {
  SomeReturnValue({required this.someValue});

  final String someValue;
}

final class QueryObject {
  QueryObject({this.values});

  final List<String>? values;
}

/// Response type for [ExplodedQueryParamArrayApi.getSomeValue].
typedef GetSomeValueResponse = SomeReturnValue;
