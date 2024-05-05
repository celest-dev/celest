// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:http/http.dart' as _i1;

/// Response type for [ExampleClient.description].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class DescriptionResponse {}

final class ExampleClient {
  ExampleClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// summary
  Future<DescriptionResponse> description() async {
    final $uri = Uri.parse('$_baseUri/example/api');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// response
      case (200, _):
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class Empty$ implements DescriptionResponse {
  const Empty$._();
}
