// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type MySampleUserApiServers(Uri _) implements Uri {
  static final MySampleUserApiServers defaultServer = server0;

  static final MySampleUserApiServers server0 =
      MySampleUserApiServers(Uri.parse(r'/'));
}

class MySampleUserApiUsers {
  MySampleUserApiUsers({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get a specific user
  Future<GetUserByIdResponse> getUserById({required String userId}) async {
    final $uri = Uri.parse('$_baseUri/api/Users/$userId');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Success
      case 200:
        return _decodeJson<UserDto>($response);

      /// No Content
      case 204:
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

class MySampleUserApiApi {
  MySampleUserApiApi({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MySampleUserApiUsers get users => MySampleUserApiUsers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class MySampleUserApiClient {
  MySampleUserApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? MySampleUserApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MySampleUserApiApi get api => MySampleUserApiApi(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class UserDto implements GetUserByIdResponse {
  UserDto({
    required this.id,
    this.name,
  });

  final String$ id;

  final String$? name;
}

final class Empty$ implements GetUserByIdResponse {
  const Empty$._();
}

/// Response type for [MySampleUserApiUsers.getUserById].
///
/// This is a marker interface implemented by all response types:
/// - [UserDto]
/// - [Empty$]
sealed class GetUserByIdResponse {}
