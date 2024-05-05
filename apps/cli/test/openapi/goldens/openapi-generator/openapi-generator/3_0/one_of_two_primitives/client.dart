// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OneOfTwoPrimitivesServers(Uri _) implements Uri {
  static final OneOfTwoPrimitivesServers defaultServer = server0;

  static final OneOfTwoPrimitivesServers server0 =
      OneOfTwoPrimitivesServers(Uri.parse(r'/'));
}

class OneOfTwoPrimitivesMyExample {
  OneOfTwoPrimitivesMyExample({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostMyExampleResponse> postMyExample({postMyExample? body}) async {
    final $uri = Uri.parse('$_baseUri/myExample');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
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

final class OneOfTwoPrimitivesClient {
  OneOfTwoPrimitivesClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OneOfTwoPrimitivesServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OneOfTwoPrimitivesMyExample get myExample => OneOfTwoPrimitivesMyExample(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

sealed class postMyExample {
  const postMyExample();
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [OneOfTwoPrimitivesMyExample.postMyExample].
typedef PostMyExampleResponse = Empty$;
