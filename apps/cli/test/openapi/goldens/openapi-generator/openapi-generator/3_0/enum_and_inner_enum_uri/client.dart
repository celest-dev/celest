// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ExampleApiServers(Uri _) implements Uri {
  static final ExampleApiServers defaultServer = localhost;

  /// Global Endpoint
  static final ExampleApiServers localhost =
      ExampleApiServers(Uri.parse(r'http://localhost'));
}

class ExampleApiSchemas {
  ExampleApiSchemas({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get a list of schemas
  Future<GetV1SchemasResponse> getV1Schemas() async {
    final $uri = Uri.parse('$_baseUri/v1/schemas');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// List of schemas
      default:
        return _decodeJson<GetV1SchemasResponse>($response);
    }
  }

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

class ExampleApiV1 {
  ExampleApiV1({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExampleApiSchemas get schemas => ExampleApiSchemas(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ExampleApiClient {
  ExampleApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExampleApiV1 get v1 => ExampleApiV1(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

extension type const Metadata(String _) implements String {
  static const Metadata httpsExampleComV1MetadataJson =
      Metadata('https://example.com/v1/metadata.json');

  static const Metadata httpsExampleComV2MetadataJson =
      Metadata('https://example.com/v2/metadata.json');
}
extension type const GetV1SchemasResponse_data(String _) implements String {
  static const GetV1SchemasResponse_data httpsExampleComV1SchemaJson =
      GetV1SchemasResponse_data('https://example.com/v1/schema.json');

  static const GetV1SchemasResponse_data httpsExampleComV2SchemaJson =
      GetV1SchemasResponse_data('https://example.com/v2/schema.json');
}

final class GetV1SchemasResponse {
  GetV1SchemasResponse({
    this.data,
    this.metadata,
  });

  final GetV1SchemasResponse_data? data;

  final Metadata? metadata;
}
