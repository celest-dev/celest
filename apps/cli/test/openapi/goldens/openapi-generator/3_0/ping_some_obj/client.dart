// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type PingSomeObjectServers(Uri _) implements Uri {
  static final PingSomeObjectServers defaultServer = server0;

  static final PingSomeObjectServers server0 =
      PingSomeObjectServers(Uri.parse(r'http://localhost:8082/'));
}

class PingSomeObjectPing {
  PingSomeObjectPing({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostPingResponse> postPing({SomeObj? body}) async {
    final $uri = Uri.parse('$_baseUri/ping');
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
        return _decodeJson<SomeObj>($response);
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

final class PingSomeObjectClient {
  PingSomeObjectClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? PingSomeObjectServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  PingSomeObjectPing get ping => PingSomeObjectPing(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Boolean$ {
  const Boolean$(this.value);

  final bool value;
}

final class SomeObj {
  SomeObj({
    this.id,
    this.name,
    this.active,
    this.type,
  });

  final String? type = 'SomeObjIdentifier';

  final Integer$? id;

  final String$? name;

  final Boolean$? active;

  final String$? type;
}

/// Response type for [PingSomeObjectPing.postPing].
typedef PostPingResponse = SomeObj;
