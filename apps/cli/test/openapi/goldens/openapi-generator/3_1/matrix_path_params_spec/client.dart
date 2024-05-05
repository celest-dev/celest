// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type MatrixPathParameterStuffServers(Uri _) implements Uri {
  static final MatrixPathParameterStuffServers defaultServer = server0;

  static final MatrixPathParameterStuffServers server0 =
      MatrixPathParameterStuffServers(Uri.parse(r'/'));
}

class MatrixPathParameterStuffPlainMatrixParamFlatMatrixParam {
  MatrixPathParameterStuffPlainMatrixParamFlatMatrixParam({
    required _i1.Client httpClient,
    required Uri baseUri,
    this.matrixParam,
    this.simpleParam,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  final String? matrixParam;

  final String? simpleParam;

  Future<PlainMatrixParamFlatResponse> plainMatrixParamFlat() async {
    final $uri =
        Uri.parse('$_baseUri/plainMatrixParamFlat{matrixParam}/{simpleParam}');
    final $request = _i1.Request(
      'PUT',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
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
}

final class MatrixPathParameterStuffClient {
  MatrixPathParameterStuffClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? MatrixPathParameterStuffServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  MatrixPathParameterStuffPlainMatrixParamFlatMatrixParam
      plainMatrixParamFlatMatrixParam({
    String? matrixParam,
    String? simpleParam,
  }) =>
          MatrixPathParameterStuffPlainMatrixParamFlatMatrixParam(
            baseUri: _baseUri,
            httpClient: _httpClient,
            matrixParam: matrixParam,
            simpleParam: simpleParam,
          );
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [MatrixPathParameterStuffPlainMatrixParamFlatMatrixParam.plainMatrixParamFlat].
typedef PlainMatrixParamFlatResponse = Empty$;
