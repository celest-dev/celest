// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type RequestBodyValidationTestApiServers(Uri _) implements Uri {
  static final RequestBodyValidationTestApiServers defaultServer = server0;

  static final RequestBodyValidationTestApiServers server0 =
      RequestBodyValidationTestApiServers(Uri.parse(r'/'));
}

class RequestBodyValidationTestApiAdd {
  RequestBodyValidationTestApiAdd({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PostAddResponse> postAdd({required int body}) async {
    final $uri = Uri.parse('$_baseUri/add');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<Boolean$>($response);
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

final class RequestBodyValidationTestApiClient {
  RequestBodyValidationTestApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? RequestBodyValidationTestApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  RequestBodyValidationTestApiAdd get add => RequestBodyValidationTestApiAdd(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Boolean$ {
  const Boolean$(this.value);

  final bool value;
}

/// Response type for [RequestBodyValidationTestApiAdd.postAdd].
typedef PostAddResponse = Boolean$;
