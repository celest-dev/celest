// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type PetstoreOpenApi30Servers(Uri _) implements Uri {
  static final PetstoreOpenApi30Servers defaultServer = server0;

  static final PetstoreOpenApi30Servers server0 =
      PetstoreOpenApi30Servers(Uri.parse(r'http://localhost:8080/api/v3'));
}

class PetstoreOpenApi30Customers {
  PetstoreOpenApi30Customers({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// getAll
  Future<GetAllUsingGet1Response> getAllUsingGet1() async {
    final $uri = Uri.parse('$_baseUri/customers');
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
        return _decodeJson<ResponseObject>($response);

      /// Unauthorized
      case 401:
        return const Empty$._();

      /// Forbidden
      case 403:
        return const Empty$._();

      /// Not Found
      case 404:
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

final class PetstoreOpenApi30Client {
  PetstoreOpenApi30Client({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? PetstoreOpenApi30Servers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  PetstoreOpenApi30Customers get customers => PetstoreOpenApi30Customers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

extension type const ResponseObject_status(String _) implements String {
  static const ResponseObject_status available =
      ResponseObject_status('available');

  static const ResponseObject_status pending = ResponseObject_status('pending');

  static const ResponseObject_status sold = ResponseObject_status('sold');
}

final class ResponseObject implements GetAllUsingGet1Response {
  ResponseObject({
    this.id,
    this.status,
  });

  final Integer$? id;

  final ResponseObject_status? status;
}

final class Empty$ implements GetAllUsingGet1Response {
  const Empty$._();
}

/// Response type for [PetstoreOpenApi30Customers.getAllUsingGet1].
///
/// This is a marker interface implemented by all response types:
/// - [ResponseObject]
/// - [Empty$]
sealed class GetAllUsingGet1Response {}
