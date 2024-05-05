// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

/// Response type for [FruityClient.get].
///
/// This is a marker interface implemented by all response types:
/// - [Fruit]
sealed class GetResponse {}

final class FruityClient {
  FruityClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  Future<GetResponse> get() async {
    final $uri = Uri.parse('$_baseUri/');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// desc
      case (200, 'application/json'):
        return _decodeJson<Fruit>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class Fruit implements GetResponse {
  Fruit({this.color});

  final String? color;
}

final class Apple {
  Apple({this.kind});

  final String? kind;
}

final class Banana {
  Banana({this.count});

  final double? count;
}
