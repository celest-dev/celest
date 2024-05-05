// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type FruityServers(Uri _) implements Uri {
  static final FruityServers defaultServer = server0;

  static final FruityServers server0 = FruityServers(Uri.parse(r'/'));
}

final class FruityClient {
  FruityClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? FruityServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetResponse> get() async {
    final $uri = Uri.parse('$_baseUri/');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// desc
      case 200:
        return _decodeJson<banana>($response);
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

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class Banana {
  Banana({this.count});

  final Integer$? count;
}

final class banana {
  banana({this.count});

  final Integer$? count;
}

/// Response type for [FruityClient.get].
typedef GetResponse = banana;
