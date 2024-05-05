// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type InfoServers(Uri _) implements Uri {
  static final InfoServers defaultServer = server0;

  static final InfoServers server0 = InfoServers(Uri.parse(r'/'));
}

class InfoApi {
  InfoApi({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// summary
  /// description
  Future<GetExampleApiResponse> getExampleApi({required DateTime start}) async {
    final $queryParameters = <String, String>{};
    $queryParameters['start'] = start.toString();
    final $uri = Uri.parse('$_baseUri/example/api')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// response
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

class InfoExample {
  InfoExample({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  InfoApi get api => InfoApi(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class InfoClient {
  InfoClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? InfoServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  InfoExample get example => InfoExample(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

/// Response type for [InfoApi.getExampleApi].
typedef GetExampleApiResponse = String$;
