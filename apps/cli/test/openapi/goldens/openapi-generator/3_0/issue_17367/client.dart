// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:http/http.dart' as _i1;

final class FooApi_Vars {
  const FooApi_Vars({this.basePath = v1});

  final String basePath;
}

extension type FooApiServers(Uri _) implements Uri {
  static final FooApiServers defaultServer = server0();

  static FooApiServers server0(FooApi_Vars vars) =>
      FooApiServers(Uri.parse('http://127.0.0.1:8080/${vars.basePath}'));
}

/// Response type for [FooApiClient.postFoo].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class PostFooResponse {}

final class FooApiClient {
  FooApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? FooApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostFooResponse> postFoo({PostFooRequest? body}) async {
    final $uri = Uri.parse('$_baseUri/foo');
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
}

final class PostFooRequest {
  PostFooRequest({this.bar});

  final String? bar;
}

final class Empty$ implements PostFooResponse {
  const Empty$._();
}
