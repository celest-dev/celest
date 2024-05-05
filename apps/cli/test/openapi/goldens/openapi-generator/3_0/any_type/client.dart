// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type PingTestServers(Uri _) implements Uri {
  static final PingTestServers defaultServer = server0;

  static final PingTestServers server0 =
      PingTestServers(Uri.parse(r'http://localhost:8000/'));
}

class PingTestPing {
  PingTestPing({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PingGetResponse> pingGet() async {
    final $uri = Uri.parse('$_baseUri/ping');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
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

final class PingTestClient {
  PingTestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? PingTestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  PingTestPing get ping => PingTestPing(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Any$ {
  const Any$(this.value);

  final Object value;
}

typedef AnyValue = Any$;
typedef AnyValueWithDesc = Any$;
typedef AnyValueNullable = Any$?;

final class AnyValueModel {
  AnyValueModel({
    this.anyValue,
    this.anyValueWithDesc,
    this.anyValueNullable,
  });

  final Any$? anyValue;

  final Any$? anyValueWithDesc;

  final Any$? anyValueNullable;
}

class AnyValueModelInline_map_free_form_object
    extends _i4.DelegatingMap<String, Object> {
  AnyValueModelInline_map_free_form_object(super.base);
}

class AnyValueModelInline_map_any_value_with_desc
    extends _i4.DelegatingMap<String, Object> {
  AnyValueModelInline_map_any_value_with_desc(super.base);
}

class AnyValueModelInline_map_any_value_nullable
    extends _i4.DelegatingMap<String, Object?> {
  AnyValueModelInline_map_any_value_nullable(super.base);
}

final class AnyValueModelInline {
  AnyValueModelInline({
    this.anyValue,
    this.anyValueWithDesc,
    this.anyValueNullable,
    this.mapFreeFormObject,
    this.mapAnyValueWithDesc,
    this.mapAnyValueNullable,
    this.arrayAnyValue,
    this.arrayAnyValueWithDesc,
    this.arrayAnyValueNullable,
  });

  final Any$? anyValue;

  final Any$? anyValueWithDesc;

  final Any$? anyValueNullable;

  final AnyValueModelInline_map_free_form_object? mapFreeFormObject;

  final AnyValueModelInline_map_any_value_with_desc? mapAnyValueWithDesc;

  final AnyValueModelInline_map_any_value_nullable? mapAnyValueNullable;

  final Any$? arrayAnyValue;

  final Any$? arrayAnyValueWithDesc;

  final Any$? arrayAnyValueNullable;
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [PingTestPing.pingGet].
typedef PingGetResponse = Empty$;
