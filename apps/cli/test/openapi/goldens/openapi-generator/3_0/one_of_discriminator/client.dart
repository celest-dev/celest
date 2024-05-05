// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type FruityServers(Uri _) implements Uri {
  static final FruityServers defaultServer = server0;

  static final FruityServers server0 = FruityServers(Uri.parse(r'/'));
}

final class FruityClient {
  FruityClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? FruityServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetResponse> get() async {
    final $uri = Uri.parse('$_baseUri/');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// desc
      case 200:
        return _decodeJson<FruitAllOfDisc>($response);
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

final class String$ {
  const String$(this.value);

  final String value;
}

final class FruitType {
  FruitType({required this.fruitType});

  final String$ fruitType;
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class TODO {
  TODO({
    required this.seeds,
    required this.fruitType,
  });

  final Integer$ seeds;

  final String$ fruitType;
}

sealed class FruitInlineDisc {
  const FruitInlineDisc();
}

sealed class FruitInlineInlineDisc {
  const FruitInlineInlineDisc();
}

final class AppleReqDisc {
  AppleReqDisc({
    required this.seeds,
    required this.fruitType,
  });

  final Integer$ seeds;

  final String$ fruitType;
}

final class BananaReqDisc {
  BananaReqDisc({
    required this.length,
    required this.fruitType,
  });

  final Integer$ length;

  final String$ fruitType;
}

sealed class FruitReqDisc {
  const FruitReqDisc();
}

final class AppleAllOfDisc {
  AppleAllOfDisc({required this.fruitType});

  final String$ fruitType;
}

final class BananaAllOfDisc {
  BananaAllOfDisc({required this.fruitType});

  final String$ fruitType;
}

sealed class FruitAllOfDisc {
  const FruitAllOfDisc();
}

sealed class FruitAnyOfDisc {
  const FruitAnyOfDisc();
}

final class AppleAnyOfDisc {
  AppleAnyOfDisc({required this.fruitType});

  final String$ fruitType;
}

final class BananaAnyOfDisc {
  BananaAnyOfDisc({required this.fruitType});

  final String$ fruitType;
}

sealed class AppleOneOfDisc {
  const AppleOneOfDisc();
}

sealed class BananaOneOfDisc {
  const BananaOneOfDisc();
}

sealed class FruitOneOfDisc {
  const FruitOneOfDisc();
}

extension type const FruitTypeEnum(String _) implements String {
  static const FruitTypeEnum apple = FruitTypeEnum('APPLE');

  static const FruitTypeEnum banana = FruitTypeEnum('BANANA');
}

final class AppleOneOfEnumMappingDisc {
  AppleOneOfEnumMappingDisc({required this.seeds});

  final Integer$ seeds;
}

final class BananaOneOfEnumMappingDisc {
  BananaOneOfEnumMappingDisc({required this.length});

  final Integer$ length;
}

sealed class FruitOneOfEnumMappingDisc {
  const FruitOneOfEnumMappingDisc();
}

final class AppleGrandparentDisc {
  AppleGrandparentDisc({required this.fruitType});

  final String$ fruitType;
}

final class BananaGrandparentDisc {
  BananaGrandparentDisc({required this.fruitType});

  final String$ fruitType;
}

sealed class FruitGrandparentDisc {
  const FruitGrandparentDisc();
}

final class Parent {
  Parent({required this.fruitType});

  final String$ fruitType;
}

final class Any$ {
  const Any$(this.value);

  final Object value;
}

sealed class ComposedDiscMissingNoProperties {
  const ComposedDiscMissingNoProperties();
}

typedef DiscMissingNoProperties = Any$;

final class DiscMissingFromProperties {
  DiscMissingFromProperties({this.length});

  final Integer$? length;
}

sealed class ComposedDiscMissingFromProperties {
  const ComposedDiscMissingFromProperties();
}

final class DiscOptionalTypeCorrect {
  DiscOptionalTypeCorrect({this.fruitType});

  final String$? fruitType;
}

sealed class ComposedDiscOptionalTypeCorrect {
  const ComposedDiscOptionalTypeCorrect();
}

final class DiscOptionalTypeIncorrect {
  DiscOptionalTypeIncorrect({this.fruitType});

  final Integer$? fruitType;
}

sealed class ComposedDiscOptionalTypeIncorrect {
  const ComposedDiscOptionalTypeIncorrect();
}

sealed class ComposedDiscOptionalTypeInconsistent {
  const ComposedDiscOptionalTypeInconsistent();
}

final class DiscTypeIncorrect {
  DiscTypeIncorrect({required this.fruitType});

  final Integer$ fruitType;
}

sealed class ComposedDiscTypeIncorrect {
  const ComposedDiscTypeIncorrect();
}

sealed class ComposedDiscTypeInconsistent {
  const ComposedDiscTypeInconsistent();
}

sealed class ComposedDiscRequiredInconsistent {
  const ComposedDiscRequiredInconsistent();
}

/// Response type for [FruityClient.get].
typedef GetResponse = FruitAllOfDisc;
