// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io:80/v2'));
}

class OpenApiPetstoreTxRxByteArray {
  OpenApiPetstoreTxRxByteArray({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostTxRxByteArrayResponse> postTxRxByteArray(
      {required String body}) async {
    final $uri = Uri.parse('$_baseUri/TxRxByteArray');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedObject
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

class OpenApiPetstoreRxRefObjectContainingByteArray {
  OpenApiPetstoreRxRefObjectContainingByteArray({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetRxRefObjectContainingByteArrayResponse>
      getRxRefObjectContainingByteArray() async {
    final $uri = Uri.parse('$_baseUri/RxRefObjectContainingByteArray');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedNumber
      case 200:
        return _decodeJson<ObjectContainingByteArray>($response);
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

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreTxRxByteArray get txRxByteArray =>
      OpenApiPetstoreTxRxByteArray(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreRxRefObjectContainingByteArray
      get rxRefObjectContainingByteArray =>
          OpenApiPetstoreRxRefObjectContainingByteArray(
            baseUri: _baseUri,
            httpClient: _httpClient,
          );
}

final class ObjectContainingByteArray {
  ObjectContainingByteArray({this.byteArray});

  final String? byteArray;
}

final class String$ {
  const String$(this.value);

  final String value;
}

/// Response type for [OpenApiPetstoreTxRxByteArray.postTxRxByteArray].
typedef PostTxRxByteArrayResponse = String$;

/// Response type for [OpenApiPetstoreRxRefObjectContainingByteArray.getRxRefObjectContainingByteArray].
typedef GetRxRefObjectContainingByteArrayResponse = ObjectContainingByteArray;
