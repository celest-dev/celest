// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OaiSpecificationExampleForPolymorphismServers(Uri _)
    implements Uri {
  static final OaiSpecificationExampleForPolymorphismServers defaultServer =
      server0;

  static final OaiSpecificationExampleForPolymorphismServers server0 =
      OaiSpecificationExampleForPolymorphismServers(Uri.parse(r'/'));
}

class OaiSpecificationExampleForPolymorphismPet {
  OaiSpecificationExampleForPolymorphismPet({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetPetResponse> getPet() async {
    final $uri = Uri.parse('$_baseUri/pet');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// desc
      case 200:
        return _decodeJson<Pet>($response);
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

class OaiSpecificationExampleForPolymorphismReptile {
  OaiSpecificationExampleForPolymorphismReptile({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetReptileResponse> getReptile() async {
    final $uri = Uri.parse('$_baseUri/reptile');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// desc
      case 200:
        return _decodeJson<Reptile>($response);
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

class OaiSpecificationExampleForPolymorphismMypets {
  OaiSpecificationExampleForPolymorphismMypets({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetMypetsResponse> getMypets() async {
    final $uri = Uri.parse('$_baseUri/mypets');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// desc
      case 200:
        return _decodeJson<MyPets>($response);
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

final class OaiSpecificationExampleForPolymorphismClient {
  OaiSpecificationExampleForPolymorphismClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ??
            OaiSpecificationExampleForPolymorphismServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OaiSpecificationExampleForPolymorphismPet get pet =>
      OaiSpecificationExampleForPolymorphismPet(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OaiSpecificationExampleForPolymorphismReptile get reptile =>
      OaiSpecificationExampleForPolymorphismReptile(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OaiSpecificationExampleForPolymorphismMypets get mypets =>
      OaiSpecificationExampleForPolymorphismMypets(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Pet {
  Pet({required this.petType});

  final String petType;
}

final class Cat {
  Cat({
    required this.petType,
    this.name,
  });

  final String petType;

  final String? name;
}

final class Reptile {
  Reptile({required this.petType});

  final String petType;
}

final class Dog {
  Dog({
    required this.petType,
    this.bark,
  });

  final String petType;

  final String? bark;
}

final class Lizard {
  Lizard({this.lovesRocks});

  final bool? lovesRocks;
}

final class Snake {
  Snake({this.hasLegs});

  final bool? hasLegs;
}

sealed class MyPets {
  const MyPets();
}

sealed class MyPetsNoDisc {
  const MyPetsNoDisc();
}

final class A {
  A({required this.petType});

  final String petType;
}

final class B {
  B({required this.petType});

  final String petType;
}

final class C {
  C({required this.petType});

  final String petType;
}

/// Response type for [OaiSpecificationExampleForPolymorphismPet.getPet].
typedef GetPetResponse = Pet;

/// Response type for [OaiSpecificationExampleForPolymorphismReptile.getReptile].
typedef GetReptileResponse = Reptile;

/// Response type for [OaiSpecificationExampleForPolymorphismMypets.getMypets].
typedef GetMypetsResponse = MyPets;
