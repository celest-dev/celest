// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type MyTitleServers(Uri _) implements Uri {
  static final MyTitleServers defaultServer = server0;

  static final MyTitleServers server0 =
      MyTitleServers(Uri.parse(r'https://localhost:9999/root'));
}

class MyTitlePetPreference {
  MyTitlePetPreference({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostPreferenceResponse> postPreference({petPreference? body}) async {
    final $uri = Uri.parse('$_baseUri/pet_preference');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 201:
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

final class MyTitleClient {
  MyTitleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? MyTitleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MyTitlePetPreference get petPreference => MyTitlePetPreference(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Dog {
  Dog();

  final String attr = 'DOG';
}

final class Cat {
  Cat();

  final String attr = 'CAT';
}

final class dog {
  dog();

  final String attr = 'DOG';
}

final class cat {
  cat();

  final String attr = 'CAT';
}

sealed class Pet {
  const Pet();
}

sealed class pet {
  const pet();
}

final class PetPreference {
  PetPreference({
    required this.pet1,
    required this.pet2,
    required this.pet3,
  });

  final pet pet1;

  final pet pet2;

  final pet pet3;
}

final class petPreference {
  petPreference({
    required this.pet1,
    required this.pet2,
    required this.pet3,
  });

  final pet pet1;

  final pet pet2;

  final pet pet3;
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [MyTitlePetPreference.postPreference].
typedef PostPreferenceResponse = Empty$;
