// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OpenApiZooServers(Uri _) implements Uri {
  static final OpenApiZooServers defaultServer = server0;

  static final OpenApiZooServers server0 =
      OpenApiZooServers(Uri.parse(r'localhost:8080'));
}

class OpenApiZooZebras {
  OpenApiZooZebras({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetZebrasResponse> getZebras() async {
    final $uri = Uri.parse('$_baseUri/zebras');
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
        return _decodeJson<GetZebrasResponse>($response);
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

final class OpenApiZooClient {
  OpenApiZooClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiZooServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiZooZebras get zebras => OpenApiZooZebras(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class Zebra {
  Zebra({
    required this.name,
    this.age,
  });

  final String$ name;

  final Integer$? age;
}

final class Animal_names extends _i4.DelegatingList<String$> {
  Animal_names(super.base);
}

final class Animal_colors extends _i4.DelegatingList<String$> {
  Animal_colors(super.base);
}

final class Double$ {
  const Double$(this.value);

  final double value;
}

final class Animal {
  Animal({
    required this.name,
    this.age,
    this.alias,
    this.color,
    this.names,
    this.colors,
    this.stringPattern,
    this.stringMaxMinLength,
    this.stringMinLength,
    this.stringMaxLength,
    this.stringEmail,
    this.intMinMax,
    this.intMin,
    this.intMax,
    this.numberMinMax,
    this.numberMin,
    this.numberMax,
    this.stringDefault,
    this.zebra,
    this.stringPatternNullable,
    this.stringMaxMinLengthNullable,
    this.stringMinLengthNullable,
    this.stringMaxLengthNullable,
    this.stringEmailNullable,
    this.intMinMaxNullable,
    this.intMinNullable,
    this.intMaxNullable,
    this.numberMinMaxNullable,
    this.numberMinNullable,
    this.numberMaxNullable,
    this.stringDefaultNullable,
  });

  final String$ name;

  final Integer$? age;

  final String$? alias;

  final String$? color;

  final Animal_names? names;

  final Animal_colors? colors;

  final String$? stringPattern;

  final String$? stringMaxMinLength;

  final String$? stringMinLength;

  final String$? stringMaxLength;

  final String$? stringEmail;

  final Integer$? intMinMax;

  final Integer$? intMin;

  final Integer$? intMax;

  final Double$? numberMinMax;

  final Double$? numberMin;

  final Double$? numberMax;

  final String$? stringDefault;

  final Zebra? zebra;

  final String$? stringPatternNullable;

  final String$? stringMaxMinLengthNullable;

  final String$? stringMinLengthNullable;

  final String$? stringMaxLengthNullable;

  final String$? stringEmailNullable;

  final Integer$? intMinMaxNullable;

  final Integer$? intMinNullable;

  final Integer$? intMaxNullable;

  final Double$? numberMinMaxNullable;

  final Double$? numberMinNullable;

  final Double$? numberMaxNullable;

  final String$? stringDefaultNullable;
}

final class GetZebrasResponse extends _i4.DelegatingList<Animal> {
  GetZebrasResponse(super.base);
}
