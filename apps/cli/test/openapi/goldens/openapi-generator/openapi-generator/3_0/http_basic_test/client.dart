// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io/v2'));
}

class OpenApiPetstorePet {
  OpenApiPetstorePet({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Add a new pet to the store
  Future<AddPetResponse> addPet({required Pet body}) async {
    final $uri = Uri.parse('$_baseUri/pet');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return _decodeJson<Pet>($response);

      /// Invalid input
      case 405:
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

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstorePet get pet => OpenApiPetstorePet(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Category {
  Category({
    this.id,
    this.name,
  });

  final int? id;

  final String? name;
}

final class Tag {
  Tag({
    this.id,
    this.name,
  });

  final int? id;

  final String? name;
}

extension type const Pet_status(String _) implements String {
  static const Pet_status available = Pet_status('available');

  static const Pet_status pending = Pet_status('pending');

  static const Pet_status sold = Pet_status('sold');
}

final class Pet implements AddPetResponse {
  Pet({
    this.id,
    this.category,
    required this.name,
    required this.photoUrls,
    this.tags,
    this.status,
  });

  final int? id;

  final Category? category;

  final String name;

  final List<String> photoUrls;

  final List<Tag>? tags;

  final Pet_status? status;
}

final class Empty$ implements AddPetResponse {
  const Empty$._();
}

/// Response type for [OpenApiPetstorePet.addPet].
///
/// This is a marker interface implemented by all response types:
/// - [Pet]
/// - [Empty$]
sealed class AddPetResponse {}
