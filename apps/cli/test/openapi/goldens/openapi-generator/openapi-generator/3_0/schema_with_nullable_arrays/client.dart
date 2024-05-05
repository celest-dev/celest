// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type MinimalExampleServers(Uri _) implements Uri {
  static final MinimalExampleServers defaultServer = server0;

  static final MinimalExampleServers server0 =
      MinimalExampleServers(Uri.parse(r'/'));
}

class MinimalExampleNullableArrayTest {
  MinimalExampleNullableArrayTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetNullableArrayTestResponse> getNullableArrayTest() async {
    final $uri = Uri.parse('$_baseUri/nullable-array-test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      case 200:
        return _decodeJson<GetNullableArrayTestResponse>($response);
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

final class MinimalExampleClient {
  MinimalExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? MinimalExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MinimalExampleNullableArrayTest get nullableArrayTest =>
      MinimalExampleNullableArrayTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ByteArrayObject {
  ByteArrayObject({
    this.nullableArray,
    this.normalArray,
    this.nullableString,
    this.stringField,
    this.intField,
  });

  final String? nullableArray;

  final String? normalArray;

  final String? nullableString;

  final String? stringField;

  final double? intField;
}

final class GetNullableArrayTestResponse
    extends _i4.DelegatingList<ByteArrayObject> {
  GetNullableArrayTestResponse(super.base);
}
