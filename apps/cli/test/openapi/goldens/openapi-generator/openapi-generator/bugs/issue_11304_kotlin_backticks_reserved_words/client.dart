// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type KotlinIssueServers(Uri _) implements Uri {
  static final KotlinIssueServers defaultServer = server0;

  static final KotlinIssueServers server0 =
      KotlinIssueServers(Uri.parse(r'http://localhost'));
}

class KotlinIssueTest {
  KotlinIssueTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// test
  Future<TestResponse> test({required String value}) async {
    final $uri = Uri.parse('$_baseUri/test/$value');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
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

final class KotlinIssueClient {
  KotlinIssueClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? KotlinIssueServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  KotlinIssueTest get test => KotlinIssueTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [KotlinIssueTest.test].
typedef TestResponse = Empty$;
