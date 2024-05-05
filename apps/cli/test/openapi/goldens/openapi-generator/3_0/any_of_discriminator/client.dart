// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

/// Response type for [FruityClient.get].
///
/// This is a marker interface implemented by all response types:
/// - [FruitAllOfDisc]
sealed class GetResponse {}

final class FruityClient {
  FruityClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  Future<GetResponse> get() async {
    final $uri = Uri.parse('$_baseUri/');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch (($response.statusCode, $contentType)) {
      /// desc
      case (200, 'application/json'):
        return _decodeJson<FruitAllOfDisc>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class FruitType {
  FruitType({required this.fruitType});

  final String fruitType;
}

final class FruitInlineDisc {
  FruitInlineDisc();
}

final class FruitInlineInlineDisc {
  FruitInlineInlineDisc();
}

final class FruitReqDisc {
  FruitReqDisc();
}

final class AppleReqDisc {
  AppleReqDisc({
    required this.seeds,
    required this.fruitType,
  });

  final int seeds;

  final String fruitType;
}

final class BananaReqDisc {
  BananaReqDisc({
    required this.length,
    required this.fruitType,
  });

  final int length;

  final String fruitType;
}

final class FruitAllOfDisc implements GetResponse {
  FruitAllOfDisc();
}

final class AppleAllOfDisc {
  AppleAllOfDisc({required this.seeds});

  final int seeds;
}

final class BananaAllOfDisc {
  BananaAllOfDisc({required this.length});

  final int length;
}

final class FruitAnyOfDisc {
  FruitAnyOfDisc();
}

final class AppleAnyOfDisc {
  AppleAnyOfDisc({required this.seeds});

  final int seeds;
}

final class BananaAnyOfDisc {
  BananaAnyOfDisc({required this.length});

  final int length;
}

final class FruitGrandparentDisc {
  FruitGrandparentDisc();
}

final class Parent {
  Parent();
}

final class AppleGrandparentDisc {
  AppleGrandparentDisc({required this.seeds});

  final int seeds;
}

final class BananaGrandparentDisc {
  BananaGrandparentDisc({required this.length});

  final int length;
}

final class ComposedDiscMissingNoProperties {
  ComposedDiscMissingNoProperties();
}

final class DiscMissingNoProperties {
  DiscMissingNoProperties();
}

final class ComposedDiscMissingFromProperties {
  ComposedDiscMissingFromProperties();
}

final class DiscMissingFromProperties {
  DiscMissingFromProperties({this.length});

  final int? length;
}

final class ComposedDiscOptionalTypeCorrect {
  ComposedDiscOptionalTypeCorrect();
}

final class DiscOptionalTypeCorrect {
  DiscOptionalTypeCorrect({this.fruitType});

  final String? fruitType;
}

final class ComposedDiscOptionalTypeIncorrect {
  ComposedDiscOptionalTypeIncorrect();
}

final class DiscOptionalTypeIncorrect {
  DiscOptionalTypeIncorrect({this.fruitType});

  final int? fruitType;
}

final class ComposedDiscOptionalTypeInconsistent {
  ComposedDiscOptionalTypeInconsistent();
}

final class ComposedDiscTypeIncorrect {
  ComposedDiscTypeIncorrect();
}

final class DiscTypeIncorrect {
  DiscTypeIncorrect({required this.fruitType});

  final int fruitType;
}

final class ComposedDiscTypeInconsistent {
  ComposedDiscTypeInconsistent();
}

final class ComposedDiscRequiredInconsistent {
  ComposedDiscRequiredInconsistent();
}
