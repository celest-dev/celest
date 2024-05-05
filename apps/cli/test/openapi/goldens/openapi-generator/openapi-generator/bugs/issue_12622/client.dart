// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type BugReportServers(Uri _) implements Uri {
  static final BugReportServers defaultServer = server0;

  static final BugReportServers server0 = BugReportServers(Uri.parse(r'/'));
}

class BugReportFoo {
  BugReportFoo({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetFooResponse> getFoo() async {
    final $uri = Uri.parse('$_baseUri/foo');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// get foo
      case 200:
        return _decodeJson<Foo>($response);
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

final class BugReportClient {
  BugReportClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? BugReportServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  BugReportFoo get foo => BugReportFoo(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Foo {
  Foo({
    this.a,
    this.b,
    required this.c,
    this.d,
  });

  final String? a;

  final String? b;

  final int c;

  final bool? d;
}

/// Response type for [BugReportFoo.getFoo].
typedef GetFooResponse = Foo;
