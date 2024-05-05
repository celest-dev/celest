// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type OaiSpecificationExampleForPolymorphismServers(Uri _)
    implements Uri {
  static final OaiSpecificationExampleForPolymorphismServers defaultServer =
      server0;

  static final OaiSpecificationExampleForPolymorphismServers server0 =
      OaiSpecificationExampleForPolymorphismServers(Uri.parse(r'/'));
}

class OaiSpecificationExampleForPolymorphismStatus {
  OaiSpecificationExampleForPolymorphismStatus({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetStatusResponse> getStatus() async {
    final $uri = Uri.parse('$_baseUri/status');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// desc
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

final class OaiSpecificationExampleForPolymorphismClient {
  OaiSpecificationExampleForPolymorphismClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ??
            OaiSpecificationExampleForPolymorphismServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OaiSpecificationExampleForPolymorphismStatus get status =>
      OaiSpecificationExampleForPolymorphismStatus(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class TokenMetadata {
  TokenMetadata({this.tag1});

  final String$? tag1;
}

final class Token {
  Token({
    required this.type,
    this.metadata,
  });

  final String$ type;

  final TokenMetadata? metadata;
}

final class StringToken {
  StringToken({
    required this.type,
    this.metadata,
    this.value,
  });

  final String$ type;

  final TokenMetadata? metadata;

  final String$? value;
}

final class ExpressionToken_tokens extends _i4.DelegatingList<Token> {
  ExpressionToken_tokens(super.base);
}

final class ExpressionToken {
  ExpressionToken({
    required this.type,
    this.metadata,
    this.tokens,
  });

  final String$ type;

  final TokenMetadata? metadata;

  final ExpressionToken_tokens? tokens;
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [OaiSpecificationExampleForPolymorphismStatus.getStatus].
typedef GetStatusResponse = Empty$;
