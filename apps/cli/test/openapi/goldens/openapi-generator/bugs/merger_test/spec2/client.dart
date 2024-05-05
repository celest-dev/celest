// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ArrayNullableTestApiServers(Uri _) implements Uri {
  static final ArrayNullableTestApiServers defaultServer = server0;

  static final ArrayNullableTestApiServers server0 =
      ArrayNullableTestApiServers(Uri.parse(r'/'));
}

class ArrayNullableTestApiSpec2 {
  ArrayNullableTestApiSpec2({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// dummy
  Future<Spec2OperationResponse> spec2Operation() async {
    final $uri = Uri.parse('$_baseUri/spec2');
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
        return _decodeJson<Spec2Model>($response);
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

final class ArrayNullableTestApiClient {
  ArrayNullableTestApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ArrayNullableTestApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ArrayNullableTestApiSpec2 get spec2 => ArrayNullableTestApiSpec2(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Double$ {
  const Double$(this.value);

  final double value;
}

final class Spec2Model {
  Spec2Model({this.spec2Field});

  final Double$? spec2Field;
}

/// Response type for [ArrayNullableTestApiSpec2.spec2Operation].
typedef Spec2OperationResponse = Spec2Model;
