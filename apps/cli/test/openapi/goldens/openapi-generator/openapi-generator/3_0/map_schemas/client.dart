// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type ExampleApiServers(Uri _) implements Uri {
  static final ExampleApiServers defaultServer = server0;

  static final ExampleApiServers server0 = ExampleApiServers(Uri.parse(r'/'));
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

  /// Empty Route
  Future<GetResponse> get() async {
    final $uri = Uri.parse('$_baseUri/');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Good Request.
      case 200:
        return _decodeJson<GetResponse>($response);

      /// Bad Request.
      case 400:
        return const Empty$._();

      /// Forbidden. Access denied.
      case 403:
        return const Empty$._();
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

final class ModelWithAdditionalProperties {
  ModelWithAdditionalProperties({this.id});

  final String? id;
}

final class ExampleModel {
  ExampleModel({
    this.id,
    this.withAdditionalProperties,
  });

  final String? id;

  final ModelWithAdditionalProperties? withAdditionalProperties;
}

class ModelWithStringToStringMapping extends _i4.DelegatingMap<String, String> {
  ModelWithStringToStringMapping(super.base);
}

final class ComplexModel {
  ComplexModel({
    this.id,
    required this.name,
  });

  final int? id;

  final String name;
}

class ModelWithStringToModelMapping
    extends _i4.DelegatingMap<String, ComplexModel> {
  ModelWithStringToModelMapping(super.base);
}

final class FreeformObjectTypes {
  FreeformObjectTypes({
    this.exampleModel,
    this.modelWithAdditionalProperties,
    this.modelWithStringToStringMapping,
    this.modelWithStringToModelMapping,
    this.complexModel,
  });

  final ExampleModel? exampleModel;

  final ModelWithAdditionalProperties? modelWithAdditionalProperties;

  final Map<String, String>? modelWithStringToStringMapping;

  final Map<String, ComplexModel>? modelWithStringToModelMapping;

  final ComplexModel? complexModel;
}

final class GetResponse extends _i4.DelegatingList<FreeformObjectTypes>
    implements GetResponse {
  GetResponse(super.base);
}

final class Empty$ implements GetResponse {
  const Empty$._();
}
