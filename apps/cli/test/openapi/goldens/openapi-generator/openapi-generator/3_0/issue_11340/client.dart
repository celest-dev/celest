// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type Issue11340BeanValidationBreaksGeneratedJavaCodeServers(Uri _)
    implements Uri {
  static final Issue11340BeanValidationBreaksGeneratedJavaCodeServers
      defaultServer = server0;

  static final Issue11340BeanValidationBreaksGeneratedJavaCodeServers server0 =
      Issue11340BeanValidationBreaksGeneratedJavaCodeServers(Uri.parse(r'/'));
}

class Issue11340BeanValidationBreaksGeneratedJavaCodeConfiguration {
  Issue11340BeanValidationBreaksGeneratedJavaCodeConfiguration({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Operation with required header and required request body
  Future<OperationResponse> operation(
      {required Map<String, Object> body}) async {
    final $uri = Uri.parse('$_baseUri/configuration');
    final $request = _i1.Request(
      'PUT',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.headers['x-non-null-header-parameter'] = xNonNullHeaderParameter;
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
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

final class Issue11340BeanValidationBreaksGeneratedJavaCodeClient {
  Issue11340BeanValidationBreaksGeneratedJavaCodeClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ??
            Issue11340BeanValidationBreaksGeneratedJavaCodeServers
                .defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Issue11340BeanValidationBreaksGeneratedJavaCodeConfiguration
      get configuration =>
          Issue11340BeanValidationBreaksGeneratedJavaCodeConfiguration(
            baseUri: _baseUri,
            httpClient: _httpClient,
          );
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [Issue11340BeanValidationBreaksGeneratedJavaCodeConfiguration.operation].
typedef OperationResponse = Empty$;
