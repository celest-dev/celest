// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type PingSomeObjectServers(Uri _) implements Uri {
  static final PingSomeObjectServers defaultServer = localhost;

  static final PingSomeObjectServers localhost =
      PingSomeObjectServers(Uri.parse(r'http://localhost:8082/'));
}

/// Response type for [PingSomeObjectClient.getPing].
///
/// This is a marker interface implemented by all response types:
/// - [SomeObj]
sealed class GetPingResponse {}

/// Response type for [PingSomeObjectClient.postPing].
///
/// This is a marker interface implemented by all response types:
/// - [SomeObj]
sealed class PostPingResponse {}

final class PingSomeObjectClient {
  PingSomeObjectClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? PingSomeObjectServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  Future<GetPingResponse> getPing({required int petId}) async {
    final $queryParameters = <String, String>{};
    $queryParameters['petId'] = petId.toString();
    final $uri =
        Uri.parse('$_baseUri/ping').replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// OK
      case (200, 'application/json'):
        return _decodeJson<SomeObj>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<PostPingResponse> postPing() async {
    final $uri = Uri.parse('$_baseUri/ping');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// OK
      case (200, 'application/json'):
        return _decodeJson<SomeObj>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class SomeObj implements GetPingResponse, PostPingResponse {
  SomeObj({
    this.id,
    this.name,
    this.active,
    this.type1,
  });

  final String? type = 'SomeObjIdentifier';

  final int? id;

  final String? name;

  final bool? active;

  final String? type1;
}

final class SimpleOneOf {
  SimpleOneOf();
}
