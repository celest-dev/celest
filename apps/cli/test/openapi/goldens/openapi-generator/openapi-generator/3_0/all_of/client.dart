// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ExampleServers(Uri _) implements Uri {
  static final ExampleServers defaultServer = server0;

  static final ExampleServers server0 =
      ExampleServers(Uri.parse(r'http://api.example.xyz/v1'));
}

class ExampleDisplay {
  ExampleDisplay({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<ListResponse> list({required String personId}) async {
    final $uri = Uri.parse('$_baseUri/person/display/$personId');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<Person>($response);
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

class ExamplePerson {
  ExamplePerson({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExampleDisplay get display => ExampleDisplay(
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

  ExamplePerson get person => ExamplePerson(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Person {
  Person({
    this.type,
    this.lastName,
    this.firstName,
  });

  final String? type;

  final String? lastName;

  final String? firstName;
}

final class Child {
  Child({
    this.boosterSeat,
    this.age,
    this.type,
    this.lastName,
    this.firstName,
  });

  final bool? boosterSeat;

  final int? age;

  final String? type;

  final String? lastName;

  final String? firstName;
}

final class Adult {
  Adult({
    this.type,
    this.lastName,
    this.firstName,
    this.children,
  });

  final String? type;

  final String? lastName;

  final String? firstName;

  final List<Child>? children;
}

/// Response type for [ExampleDisplay.list].
typedef ListResponse = Person;
