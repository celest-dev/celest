// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ExampleServers(Uri _) implements Uri {
  static final ExampleServers defaultServer = server0;

  static final ExampleServers server0 =
      ExampleServers(Uri.parse(r'http://api.example.xyz/v1'));
}

class ExampleDeprecatedTest {
  ExampleDeprecatedTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostDeprecatedTestResponse> postDeprecatedTest({Request? body}) async {
    final $uri = Uri.parse('$_baseUri/deprecated-test');
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
      /// responses
      case 200:
        return _decodeJson<Response>($response);
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

final class ExampleClient {
  ExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExampleDeprecatedTest get deprecatedTest => ExampleDeprecatedTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Request {
  Request({
    this.customerCode,
    this.firstName,
  });

  final String? customerCode;

  final String? firstName;
}

final class Response {
  Response({
    this.customerCode,
    this.firstName,
  });

  final String? customerCode;

  final String? firstName;
}

/// Response type for [ExampleDeprecatedTest.postDeprecatedTest].
typedef PostDeprecatedTestResponse = Response;
