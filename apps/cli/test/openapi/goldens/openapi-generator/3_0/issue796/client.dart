// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:http/http.dart' as _i1;

extension type Issue796Servers(Uri _) implements Uri {
  static final Issue796Servers defaultServer = localhost;

  static final Issue796Servers localhost =
      Issue796Servers(Uri.parse(r'http://localhost:123/api'));
}

/// Response type for [Issue796Client.getTest].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class GetTestResponse {}

final class Issue796Client {
  Issue796Client({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? Issue796Servers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetTestResponse> getTest() async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// Successful response
      case (201, _):
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

/// This type example 1
final class MapTest1 {
  MapTest1();
}

/// This type example 2
final class MapTest2 {
  MapTest2();
}

/// This type example 3
final class MapTest3 {
  MapTest3();
}

/// This type example 4
final class OtherObj {
  OtherObj();
}

final class MapObject {
  MapObject({
    this.mapTest1,
    this.mapTest2,
    this.mapTest3,
    this.otherObj,
  });

  final MapTest1? mapTest1;

  final MapTest2? mapTest2;

  final MapTest3? mapTest3;

  final OtherObj? otherObj;
}

final class Empty$ implements GetTestResponse {
  const Empty$._();
}
