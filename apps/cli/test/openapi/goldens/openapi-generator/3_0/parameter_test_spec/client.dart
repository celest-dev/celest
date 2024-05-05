// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestParametersServers(Uri _) implements Uri {
  static final TestParametersServers defaultServer = server0;

  static final TestParametersServers server0 =
      TestParametersServers(Uri.parse(r'/'));
}

class TestParametersPathDefault {
  TestParametersPathDefault({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Finds Pets by status
  /// Multiple status values can be provided with comma separated strings
  Future<FindPetsByStatusResponse> findPetsByStatus({
    required String pathDefault,
    required String pathNullable,
    String? queryDefault,
    required TODO queryDefaultEnum,
    double? queryDefaultInt,
    String? queryNullable,
    String? queryDollarSign,
  }) async {
    final $queryParameters = <String, String>{};
    if (queryDefault != null) {
      $queryParameters['query_default'] = queryDefault;
    }
    $queryParameters['query_default_enum'] = queryDefaultEnum.toString();
    if (queryDefaultInt != null) {
      $queryParameters['query_default_int'] = queryDefaultInt.toString();
    }
    if (queryNullable != null) {
      $queryParameters['query_nullable'] = queryNullable;
    }
    if (queryDollarSign != null) {
      $queryParameters['$query-$dollar-sign'] = queryDollarSign;
    }
    final $uri =
        Uri.parse('$_baseUri/test/parameters/$pathDefault/$pathNullable')
            .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (headerDefault != null) {
      $request.headers['header_default'] = headerDefault;
    }
    $request.headers['header_default_enum'] = headerDefaultEnum.toString();
    if (headerDefaultInt != null) {
      $request.headers['header_default_int'] = headerDefaultInt.toString();
    }
    if (headerNullable != null) {
      $request.headers['header_nullable'] = headerNullable;
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return const Empty$._();

      /// Invalid status value
      case 400:
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

class TestParametersParameters {
  TestParametersParameters({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestParametersPathDefault get pathDefault => TestParametersPathDefault(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class TestParametersTest {
  TestParametersTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestParametersParameters get parameters => TestParametersParameters(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TestParametersClient {
  TestParametersClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestParametersServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestParametersTest get test => TestParametersTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

extension type const TODO(String _) implements String {
  static const TODO a = TODO('A');

  static const TODO b = TODO('B');

  static const TODO c = TODO('C');
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [TestParametersPathDefault.findPetsByStatus].
typedef FindPetsByStatusResponse = Empty$;
