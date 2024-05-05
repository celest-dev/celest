// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io:80/v2'));
}

class OpenApiPetstoreComposedObject {
  OpenApiPetstoreComposedObject({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedObjectResponse> getComposedObject({
    Object? composedObject,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedObject != null) {
      $queryParameters['ComposedObject'] = composedObject.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedObject')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedObject
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiPetstoreComposedNumber {
  OpenApiPetstoreComposedNumber({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedNumberResponse> getComposedNumber({
    Object? composedNumber,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedNumber != null) {
      $queryParameters['ComposedNumber'] = composedNumber.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedNumber')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedNumber
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiPetstoreComposedInteger {
  OpenApiPetstoreComposedInteger({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedIntegerResponse> getComposedInteger({
    Object? composedInteger,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedInteger != null) {
      $queryParameters['ComposedInteger'] = composedInteger.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedInteger')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedInteger
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiPetstoreComposedString {
  OpenApiPetstoreComposedString({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedStringResponse> getComposedString({
    Object? composedString,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedString != null) {
      $queryParameters['ComposedString'] = composedString.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedString')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedString
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiPetstoreComposedBool {
  OpenApiPetstoreComposedBool({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedBoolResponse> getComposedBool({
    Object? composedBool,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedBool != null) {
      $queryParameters['ComposedBool'] = composedBool.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedBool')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedBool
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiPetstoreComposedArray {
  OpenApiPetstoreComposedArray({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedArrayResponse> getComposedArray({
    Object? composedArray,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedArray != null) {
      $queryParameters['ComposedArray'] = composedArray.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedArray')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedArray
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiPetstoreComposedNone {
  OpenApiPetstoreComposedNone({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedNoneResponse> getComposedNone({
    Object? composedNone,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedNone != null) {
      $queryParameters['ComposedNone'] = composedNone.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedNone')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedNone
      case 200:
        return _decodeJson<Any$>($response);
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

class OpenApiPetstoreComposedAnyType {
  OpenApiPetstoreComposedAnyType({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetComposedAnyTypeResponse> getComposedAnyType({
    Object? composedAnyType,
    required Object body,
  }) async {
    final $queryParameters = <String, String>{};
    if (composedAnyType != null) {
      $queryParameters['ComposedAnyType'] = composedAnyType.toString();
    }
    final $uri = Uri.parse('$_baseUri/ComposedAnyType')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// ComposedAnyType
      case 200:
        return _decodeJson<Any$>($response);
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

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreComposedObject get composedObject =>
      OpenApiPetstoreComposedObject(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreComposedNumber get composedNumber =>
      OpenApiPetstoreComposedNumber(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreComposedInteger get composedInteger =>
      OpenApiPetstoreComposedInteger(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreComposedString get composedString =>
      OpenApiPetstoreComposedString(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreComposedBool get composedBool => OpenApiPetstoreComposedBool(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreComposedArray get composedArray =>
      OpenApiPetstoreComposedArray(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreComposedNone get composedNone => OpenApiPetstoreComposedNone(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  OpenApiPetstoreComposedAnyType get composedAnyType =>
      OpenApiPetstoreComposedAnyType(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ObjectWithComposedProperties {
  ObjectWithComposedProperties({
    this.composedObject,
    this.composedNumber,
    this.composedInteger,
    this.composedString,
    this.composedBool,
    this.composedArray,
    this.composedNone,
    this.composedAnyType,
  });

  final Object? composedObject;

  final Object? composedNumber;

  final Object? composedInteger;

  final Object? composedString;

  final Object? composedBool;

  final Object? composedArray;

  final Object? composedNone;

  final Object? composedAnyType;
}

typedef ComposedObject = Object;
typedef ComposedNumber = Object;
typedef ComposedInteger = Object;
typedef ComposedString = Object;
typedef ComposedBool = Object;
typedef ComposedArray = Object;
typedef ComposedNone = Object;
typedef ComposedAnyType = Object;

final class Any$ {
  const Any$(this.value);

  final Object value;
}

/// Response type for [OpenApiPetstoreComposedObject.getComposedObject].
typedef GetComposedObjectResponse = Any$;

/// Response type for [OpenApiPetstoreComposedNumber.getComposedNumber].
typedef GetComposedNumberResponse = Any$;

/// Response type for [OpenApiPetstoreComposedInteger.getComposedInteger].
typedef GetComposedIntegerResponse = Any$;

/// Response type for [OpenApiPetstoreComposedString.getComposedString].
typedef GetComposedStringResponse = Any$;

/// Response type for [OpenApiPetstoreComposedBool.getComposedBool].
typedef GetComposedBoolResponse = Any$;

/// Response type for [OpenApiPetstoreComposedArray.getComposedArray].
typedef GetComposedArrayResponse = Any$;

/// Response type for [OpenApiPetstoreComposedNone.getComposedNone].
typedef GetComposedNoneResponse = Any$;

/// Response type for [OpenApiPetstoreComposedAnyType.getComposedAnyType].
typedef GetComposedAnyTypeResponse = Any$;
