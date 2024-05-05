// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type Issue11242PathParamEncodingServers(Uri _) implements Uri {
  static final Issue11242PathParamEncodingServers defaultServer = server0;

  static final Issue11242PathParamEncodingServers server0 =
      Issue11242PathParamEncodingServers(Uri.parse(r'localhost:8080'));
}

class Issue11242PathParamEncodingApi {
  Issue11242PathParamEncodingApi({
    required _i1.Client httpClient,
    required Uri baseUri,
    required this.someParam,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  final String someParam;

  /// View some param
  Future<GetSomeParamResponse> getSomeParam() async {
    final $uri = Uri.parse('$_baseUri/api/{someParam}');
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

final class Issue11242PathParamEncodingClient {
  Issue11242PathParamEncodingClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? Issue11242PathParamEncodingServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Issue11242PathParamEncodingApi api({required String someParam}) =>
      Issue11242PathParamEncodingApi(
        baseUri: _baseUri,
        httpClient: _httpClient,
        someParam: someParam,
      );
}

final class SomeReturnValue {
  SomeReturnValue({required this.someParam});

  final String someParam;
}

/// Response type for [Issue11242PathParamEncodingApi.getSomeParam].
typedef GetSomeParamResponse = SomeReturnValue;
