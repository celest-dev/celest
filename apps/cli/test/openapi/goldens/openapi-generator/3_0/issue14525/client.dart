// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type DemoAppServers(Uri _) implements Uri {
  static final DemoAppServers defaultServer = server0;

  static final DemoAppServers server0 = DemoAppServers(Uri.parse(r'/'));
}

class DemoAppDemo {
  DemoAppDemo({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Demo
  Future<DemoResponse> demo() async {
    final $uri = Uri.parse('$_baseUri/demo');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Demo response
      case 200:
        return _decodeJson<DemoResponse>($response);
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

final class DemoAppClient {
  DemoAppClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? DemoAppServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  DemoAppDemo get demo => DemoAppDemo(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class DemoResponse extends _i4.DelegatingList<String$> {
  DemoResponse(super.base);
}
