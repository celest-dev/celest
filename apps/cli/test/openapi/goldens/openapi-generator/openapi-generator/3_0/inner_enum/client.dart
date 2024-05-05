// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type SampleApiServers(Uri _) implements Uri {
  static final SampleApiServers defaultServer = server0;

  static final SampleApiServers server0 = SampleApiServers(Uri.parse(r'/'));
}

class SampleApiPonies {
  SampleApiPonies({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns all animals.
  /// Optional extended description in Markdown.
  Future<GetPoniesResponse> getPonies() async {
    final $uri = Uri.parse('$_baseUri/ponies');
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
        return _decodeJson<GetPoniesResponse>($response);
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

final class SampleApiClient {
  SampleApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? SampleApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  SampleApiPonies get ponies => SampleApiPonies(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

extension type const Pony_type(String _) implements String {
  static const Pony_type earth = Pony_type('Earth');

  static const Pony_type pegasi = Pony_type('Pegasi');

  static const Pony_type unicorn = Pony_type('Unicorn');
}

final class Pony {
  Pony({this.type});

  final Pony_type? type;
}

final class GetPoniesResponse extends _i4.DelegatingList<Pony> {
  GetPoniesResponse(super.base);
}
