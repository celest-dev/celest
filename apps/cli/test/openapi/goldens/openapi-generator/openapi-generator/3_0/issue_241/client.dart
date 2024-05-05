// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type MyTestServers(Uri _) implements Uri {
  static final MyTestServers defaultServer = server0;

  static final MyTestServers server0 =
      MyTestServers(Uri.parse(r'http://localhost:9998/v1'));
}

class MyTestCreate {
  MyTestCreate({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<CreateUserResponse> createUser({required String username}) async {
    final $uri = Uri.parse('$_baseUri/users/create/$username');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// The User just created
      case 200:
        return _decodeJson<User>($response);
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

class MyTestUsers {
  MyTestUsers({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MyTestCreate get create => MyTestCreate(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class MyTestClient {
  MyTestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? MyTestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MyTestUsers get users => MyTestUsers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class User {
  User({this.name});

  final String? name;
}

final class UserDetail {
  UserDetail({this.name});

  final String? name;
}

/// Response type for [MyTestCreate.createUser].
typedef CreateUserResponse = User;
