// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type ExampleServers(Uri _) implements Uri {
  static final ExampleServers defaultServer = server0;

  static final ExampleServers server0 =
      ExampleServers(Uri.parse(r'http://api.example.xyz/v1'));
}

class ExamplePetType {
  ExamplePetType({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetPetsPetTypeTypeResponse> getPetsPetTypeType(
      {required PetByType type}) async {
    final $uri = Uri.parse('$_baseUri/pets/petType/$type');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// get by type
      case 200:
        return _decodeJson<GetPetsPetTypeTypeResponse>($response);
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

class ExamplePets {
  ExamplePets({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExamplePetType get petType => ExamplePetType(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ExampleClient {
  ExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExamplePets get pets => ExamplePets(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

extension type const PetByType(String _) implements String {
  static const PetByType cat = PetByType('Cat');

  static const PetByType dog = PetByType('Dog');
}

final class Pet {
  Pet({required this.petType});

  final PetByType petType;
}

final class Boolean$ {
  const Boolean$(this.value);

  final bool value;
}

extension type const Dog_breed(String _) implements String {
  static const Dog_breed dingo = Dog_breed('Dingo');

  static const Dog_breed husky = Dog_breed('Husky');

  static const Dog_breed retriever = Dog_breed('Retriever');

  static const Dog_breed shepherd = Dog_breed('Shepherd');
}

final class Dog {
  Dog({
    required this.petType,
    this.bark,
    this.breed,
  });

  final PetByType petType;

  final Boolean$? bark;

  final Dog_breed? breed;
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class Cat {
  Cat({
    required this.petType,
    this.hunts,
    this.age,
  });

  final PetByType petType;

  final Boolean$? hunts;

  final Integer$? age;
}

final class GetPetsPetTypeTypeResponse extends _i4.DelegatingList<Pet> {
  GetPetsPetTypeTypeResponse(super.base);
}
