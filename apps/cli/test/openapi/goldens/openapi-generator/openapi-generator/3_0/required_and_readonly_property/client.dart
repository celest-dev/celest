// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TitleServers(Uri _) implements Uri {
  static final TitleServers defaultServer = server0;

  static final TitleServers server0 = TitleServers(Uri.parse(r'https'));
}

class TitleUser {
  TitleUser({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetUserResponse> getUser() async {
    final $uri = Uri.parse('$_baseUri/user');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// success
      case 200:
        return _decodeJson<ReadonlyAndRequiredProperties>($response);
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

final class TitleClient {
  TitleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TitleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TitleUser get user => TitleUser(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ReadonlyAndRequiredProperties {
  ReadonlyAndRequiredProperties({
    required this.requiredYesReadonlyYes,
    required this.requiredYesReadonlyNo,
    this.requiredNoReadonlyYes,
    this.requiredNoReadonlyNo,
  });

  final String requiredYesReadonlyYes;

  final String requiredYesReadonlyNo;

  final String? requiredNoReadonlyYes;

  final String? requiredNoReadonlyNo;
}

/// Response type for [TitleUser.getUser].
typedef GetUserResponse = ReadonlyAndRequiredProperties;
