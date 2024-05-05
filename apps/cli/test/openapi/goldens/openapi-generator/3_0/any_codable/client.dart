// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type SwaggerPetstoreServers(Uri _) implements Uri {
  static final SwaggerPetstoreServers defaultServer = server0;

  static final SwaggerPetstoreServers server0 =
      SwaggerPetstoreServers(Uri.parse(r'/'));
}

class SwaggerPetstorePets {
  SwaggerPetstorePets({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetPetsResponse> getPets() async {
    final $uri = Uri.parse('$_baseUri/pets');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Expected response to a valid request
      case 200:
        return _decodeJson<Pet>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  /// Info for a specific pet
  Future<ShowPetByIdResponse> showPetById({required String petId}) async {
    final $uri = Uri.parse('$_baseUri/pets/$petId');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Expected response to a valid request
      case 200:
        return _decodeJson<Any$>($response);
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

final class SwaggerPetstoreClient {
  SwaggerPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? SwaggerPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  SwaggerPetstorePets get pets => SwaggerPetstorePets(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Pet {
  Pet({required this.testProperty});

  final String$ testProperty;
}

/// Response type for [SwaggerPetstorePets.getPets].
typedef GetPetsResponse = Pet;

final class Any$ {
  const Any$(this.value);

  final Object value;
}

/// Response type for [SwaggerPetstorePets.showPetById].
typedef ShowPetByIdResponse = Any$;
