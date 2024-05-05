// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type ApiUsingATypeAliasMappedWithImportMappingServers(Uri _)
    implements Uri {
  static final ApiUsingATypeAliasMappedWithImportMappingServers defaultServer =
      server0;

  static final ApiUsingATypeAliasMappedWithImportMappingServers server0 =
      ApiUsingATypeAliasMappedWithImportMappingServers(Uri.parse(r'/'));
}

class ApiUsingATypeAliasMappedWithImportMappingTypeAlias {
  ApiUsingATypeAliasMappedWithImportMappingTypeAlias({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetTypeAliasResponse> getTypeAlias() async {
    final $uri = Uri.parse('$_baseUri/type-alias');
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
        return _decodeJson<ParentType>($response);
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

final class ApiUsingATypeAliasMappedWithImportMappingClient {
  ApiUsingATypeAliasMappedWithImportMappingClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ??
            ApiUsingATypeAliasMappedWithImportMappingServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ApiUsingATypeAliasMappedWithImportMappingTypeAlias get typeAlias =>
      ApiUsingATypeAliasMappedWithImportMappingTypeAlias(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class ParentType {
  ParentType({this.typeAlias});

  final String$? typeAlias;
}

typedef TypeAlias = String$;

/// Response type for [ApiUsingATypeAliasMappedWithImportMappingTypeAlias.getTypeAlias].
typedef GetTypeAliasResponse = ParentType;
