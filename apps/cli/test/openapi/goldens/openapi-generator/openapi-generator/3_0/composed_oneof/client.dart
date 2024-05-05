// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OneOfTestServers(Uri _) implements Uri {
  static final OneOfTestServers defaultServer = server0;

  static final OneOfTestServers server0 =
      OneOfTestServers(Uri.parse(r'http://localhost:8000/'));
}

class OneOfTestState {
  OneOfTestState({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetStateResponse> getState() async {
    final $uri = Uri.parse('$_baseUri/state');
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
        return _decodeJson<GetStateResponse>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<CreateStateResponse> createState({required createState body}) async {
    final $uri = Uri.parse('$_baseUri/state');
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
      case 201:
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

final class OneOfTestClient {
  OneOfTestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OneOfTestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OneOfTestState get state => OneOfTestState(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class ObjA {
  ObjA({
    this.realtype,
    this.message,
  });

  final String? realtype;

  final String? message;
}

final class ObjB {
  ObjB({
    this.realtype,
    this.description,
    this.code,
  });

  final String? realtype;

  final String? description;

  final int? code;
}

sealed class CustomOneOfSchema {
  const CustomOneOfSchema();
}

final class ObjC {
  ObjC({
    this.realtype,
    this.state,
  });

  final String? realtype;

  final String? state;
}

sealed class CustomOneOfArraySchema_item {
  const CustomOneOfArraySchema_item();
}

final class CustomOneOfArraySchema
    extends _i4.DelegatingList<CustomOneOfArraySchema_item> {
  CustomOneOfArraySchema(super.base);
}

final class Obja {
  Obja({
    this.realtype,
    this.message,
  });

  final String? realtype;

  final String? message;
}

final class Objb {
  Objb({
    this.realtype,
    this.description,
    this.code,
  });

  final String? realtype;

  final String? description;

  final int? code;
}

final class Objc {
  Objc({
    this.realtype,
    this.state,
  });

  final String? realtype;

  final String? state;
}

final class Objd {
  Objd({
    this.realtype,
    this.color,
  });

  final String? realtype;

  final String? color;
}

final class ObjD {
  ObjD({
    this.realtype,
    this.color,
  });

  final String? realtype;

  final String? color;
}

sealed class GetStateResponse {
  const GetStateResponse();
}

sealed class createState {
  const createState();
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [OneOfTestState.createState].
typedef CreateStateResponse = Empty$;
