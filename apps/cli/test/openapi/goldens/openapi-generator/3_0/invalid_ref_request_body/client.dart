// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:collection/collection.dart' as _i2;
import 'package:http/http.dart' as _i1;

extension type ExampleServers(Uri _) implements Uri {
  static final ExampleServers defaultServer = apiExampleXyz;

  static final ExampleServers apiExampleXyz =
      ExampleServers(Uri.parse(r'http://api.example.xyz/v1'));
}

/// Response type for [ExampleClient.resolveRequestBodyInvalidRef].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class ResolveRequestBodyInvalidRefResponse {}

final class ExampleClient {
  ExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<ResolveRequestBodyInvalidRefResponse>
      resolveRequestBodyInvalidRef() async {
    final $uri = Uri.parse('$_baseUri/resolve_request_body_invalid_ref');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// OK
      case (200, _):
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

class UsersListList extends _i2.DelegatingList<Users> {
  UsersListList(super.base);
}

final class Empty$ implements ResolveRequestBodyInvalidRefResponse {
  const Empty$._();
}
