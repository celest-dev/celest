// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type PropertyNameCollisionServers(Uri _) implements Uri {
  static final PropertyNameCollisionServers defaultServer = server0;

  static final PropertyNameCollisionServers server0 =
      PropertyNameCollisionServers(Uri.parse(r'/'));
}

final class PropertyNameCollisionClient {
  PropertyNameCollisionClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? PropertyNameCollisionServers.defaultServer;

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
      /// test
      case 200:
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

final class PropertyNameCollision {
  PropertyNameCollision({
    this.type,
    this.type,
    this.type,
  });

  final String? type;

  final String? type;

  final String? type;
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [PropertyNameCollisionClient.get].
typedef GetResponse = Empty$;
