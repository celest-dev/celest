// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type FooServers(Uri _) implements Uri {
  static final FooServers defaultServer = server0;

  static final FooServers server0 = FooServers(Uri.parse(r'/'));
}

class FooFoo {
  FooFoo({
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
      /// example
      case 200:
        return _decodeJson<GetFooResponse>($response);
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

final class FooClient {
  FooClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? FooServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  FooFoo get foo => FooFoo(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

typedef DateTime$ = DateTime;
typedef AllOfDatetime = DateTime;

final class Double$ {
  const Double$(this.value);

  final double value;
}

final class Payment {
  Payment({
    this.date,
    this.amount,
  });

  final DateTime? date;

  final Double$? amount;
}

final class GetFooResponse extends _i4.DelegatingList<Payment> {
  GetFooResponse(super.base);
}
