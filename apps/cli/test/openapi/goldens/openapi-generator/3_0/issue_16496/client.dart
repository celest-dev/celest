// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OpenApiZooServers(Uri _) implements Uri {
  static final OpenApiZooServers defaultServer = server0;

  static final OpenApiZooServers server0 =
      OpenApiZooServers(Uri.parse(r'localhost:8080'));
}

class OpenApiZooZebras {
  OpenApiZooZebras({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetZebrasResponse> getZebras() async {
    final $uri = Uri.parse('$_baseUri/zebras');
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
        return _decodeJson<GetZebrasResponse>($response);
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

final class OpenApiZooClient {
  OpenApiZooClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiZooServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiZooZebras get zebras => OpenApiZooZebras(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class Animal {
  Animal({
    this.name,
    this.age,
    this.alias,
  });

  final String? type = 'zebra';

  final String$? name;

  final Integer$? age;

  final String$? alias;
}

extension type const Zebra_stripePattern(String _) implements String {
  static const Zebra_stripePattern horizontal =
      Zebra_stripePattern('horizontal');

  static const Zebra_stripePattern vertical = Zebra_stripePattern('vertical');
}

final class Zebra {
  Zebra({
    this.name,
    this.age,
    this.alias,
    this.stripePattern,
  });

  final String? type = 'zebra';

  final String$? name;

  final Integer$? age;

  final String$? alias;

  final Zebra_stripePattern? stripePattern;
}

final class GetZebrasResponse extends _i4.DelegatingList<Zebra> {
  GetZebrasResponse(super.base);
}
