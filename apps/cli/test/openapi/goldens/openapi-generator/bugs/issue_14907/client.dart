// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type TestServers(Uri _) implements Uri {
  static final TestServers defaultServer = server0;

  /// Major version of service
  static final TestServers server0 = TestServers(Uri.parse(r'/v3'));
}

class TestAgreements {
  TestAgreements({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<ReadAgreementsResponse> readAgreements() async {
    final $uri = Uri.parse('$_baseUri/agreements');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.headers['x-client-ismobile'] = xClientIsmobile.toString();
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<ListResponseResponseAgreement>($response);
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

final class TestClient {
  TestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestAgreements get agreements => TestAgreements(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class ResponseAgreement {
  ResponseAgreement({this.agreementId});

  final String$? agreementId;
}

final class ListResponseResponseAgreement_list
    extends _i4.DelegatingList<ResponseAgreement> {
  ListResponseResponseAgreement_list(super.base);
}

final class ListResponseResponseAgreement {
  ListResponseResponseAgreement({this.list});

  final ListResponseResponseAgreement_list? list;
}

/// Response type for [TestAgreements.readAgreements].
typedef ReadAgreementsResponse = ListResponseResponseAgreement;
