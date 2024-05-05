// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type DemoServers(Uri _) implements Uri {
  static final DemoServers defaultServer = server0;

  static final DemoServers server0 = DemoServers(Uri.parse(r'/'));
}

class DemoTest {
  DemoTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostTestResponse> postTest({required Apa body}) async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Successful operation
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

final class DemoClient {
  DemoClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? DemoServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  DemoTest get test => DemoTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Apa {
  Apa({
    required this.bepa,
    required this.cepa,
    this.depa,
    this.epa,
    this.fepa,
    this.gepa,
  });

  final double bepa;

  final double cepa;

  final double? depa;

  final double? epa;

  final double? fepa;

  final double? gepa;
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [DemoTest.postTest].
typedef PostTestResponse = Empty$;
