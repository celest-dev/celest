// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = petstoreSwaggerIo;

  static final OpenApiPetstoreServers petstoreSwaggerIo =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io/v2'));
}

/// Response type for [OpenApiPetstoreClient.getEnum].
///
/// This is a marker interface implemented by all response types:
/// - [String$]
sealed class GetEnumResponse {}

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  /// Get enums
  Future<GetEnumResponse> getEnum() async {
    final $uri = Uri.parse('$_baseUri/enum');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// success
      case (200, 'application/json'):
        return _decodeJson<String$>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class String$ implements GetEnumResponse {
  const String$._({this.value});

  final String? value;
}
