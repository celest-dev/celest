// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:collection/collection.dart' as _i2;
import 'package:http/http.dart' as _i1;

/// Response type for [DemoClient.getIds].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class GetIdsResponse {}

final class DemoClient {
  DemoClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetIdsResponse> getIds({required TODO ids}) async {
    final $uri = Uri.parse('$_baseUri/$ids');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
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
}

class TODO extends _i2.DelegatingList<String> {
  TODO(super.base);
}

final class Empty$ implements GetIdsResponse {
  const Empty$._();
}
