// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io/v2'));
}

/// Response type for [OpenApiPetstoreClient.example1GetSingular].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Example1GetSingularResponse {}

/// Response type for [OpenApiPetstoreClient.example1GetPlural].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Example1GetPluralResponse {}

/// Response type for [OpenApiPetstoreClient.example2GetSingular].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Example2GetSingularResponse {}

/// Response type for [OpenApiPetstoreClient.example3GetSingular].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Example3GetSingularResponse {}

/// Response type for [OpenApiPetstoreClient.example3GetPlural].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Example3GetPluralResponse {}

/// Response type for [OpenApiPetstoreClient.example4PostSingular].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Example4PostSingularResponse {}

/// Response type for [OpenApiPetstoreClient.example4PostPlural].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Example4PostPluralResponse {}

/// Response type for [OpenApiPetstoreClient.generateFromResponseSchemaWithOneOfModel].
///
/// This is a marker interface implemented by all response types:
/// - [String$]
sealed class GenerateFromResponseSchemaWithOneOfModelResponse {}

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<Example1GetSingularResponse> example1GetSingular(
      {String? parameter}) async {
    final $queryParameters = <String, String>{};
    if (parameter != null) {
      $queryParameters['parameter'] = parameter;
    }
    final $uri = Uri.parse('$_baseUri/example1/singular')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Example1GetPluralResponse> example1GetPlural(
      {String? parameter}) async {
    final $queryParameters = <String, String>{};
    if (parameter != null) {
      $queryParameters['parameter'] = parameter;
    }
    final $uri = Uri.parse('$_baseUri/example1/plural')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Example2GetSingularResponse> example2GetSingular(
      {String? parameter}) async {
    final $queryParameters = <String, String>{};
    if (parameter != null) {
      $queryParameters['parameter'] = parameter;
    }
    final $uri = Uri.parse('$_baseUri/example2/singular')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Example3GetSingularResponse> example3GetSingular(
      {String? parameter}) async {
    final $queryParameters = <String, String>{};
    if (parameter != null) {
      $queryParameters['parameter'] = parameter;
    }
    final $uri = Uri.parse('$_baseUri/example3/singular')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Example3GetPluralResponse> example3GetPlural(
      {String? parameter}) async {
    final $queryParameters = <String, String>{};
    if (parameter != null) {
      $queryParameters['parameter'] = parameter;
    }
    final $uri = Uri.parse('$_baseUri/example3/plural')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Example4PostSingularResponse> example4PostSingular(
      {Example4PostSingularRequest? body}) async {
    final $uri = Uri.parse('$_baseUri/example4/singular');
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
      /// successful operation
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Example4PostPluralResponse> example4PostPlural(
      {Example4PostPluralRequest? body}) async {
    final $uri = Uri.parse('$_baseUri/example4/plural');
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
      /// successful operation
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

  Future<GenerateFromResponseSchemaWithOneOfModelResponse>
      generateFromResponseSchemaWithOneOfModel() async {
    final $uri = Uri.parse('$_baseUri/example5/multiple_responses');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// successful operation
      case 200:
        return _decodeJson<String$>($response);

      /// permanent redirect
      case 301:
        return _decodeJson<String$>($response);

      /// not found
      case 404:
        return _decodeJson<String$>($response);

      /// internal server error
      case 500:
        return _decodeJson<String$>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class User {
  User({this.address});

  final User? address;
}

final class DummyUser {
  DummyUser({
    this.name,
    this.number,
    this.address,
  });

  final String? name;

  final String? number;

  final String? address;
}

final class Empty$
    implements
        Example1GetSingularResponse,
        Example1GetPluralResponse,
        Example2GetSingularResponse,
        Example3GetSingularResponse,
        Example3GetPluralResponse,
        Example4PostSingularResponse,
        Example4PostPluralResponse {
  const Empty$._();
}

final class Example4PostSingularRequest {
  Example4PostSingularRequest({this.name});

  final String? name;
}

final class Example4PostPluralRequest {
  Example4PostPluralRequest({this.name});

  final String? name;
}

final class String$
    implements GenerateFromResponseSchemaWithOneOfModelResponse {
  const String$(this.value);

  final String value;
}
