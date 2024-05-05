// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:http/http.dart' as _i1;

extension type OpenApiTestApiServers(Uri _) implements Uri {
  static final OpenApiTestApiServers defaultServer = server0;

  static final OpenApiTestApiServers server0 =
      OpenApiTestApiServers(Uri.parse(r'http://api.company.xyz/v2'));
}

/// Response type for [OpenApiTestApiClient.op0].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op0Response {}

/// Response type for [OpenApiTestApiClient.opId].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class OpIdResponse {}

/// Response type for [OpenApiTestApiClient.op1].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op1Response {}

/// Response type for [OpenApiTestApiClient.op2].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op2Response {}

/// Response type for [OpenApiTestApiClient.op3].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op3Response {}

/// Response type for [OpenApiTestApiClient.op4].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op4Response {}

/// Response type for [OpenApiTestApiClient.op5].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op5Response {}

/// Response type for [OpenApiTestApiClient.op6].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op6Response {}

/// Response type for [OpenApiTestApiClient.op7].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op7Response {}

/// Response type for [OpenApiTestApiClient.op8].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class Op8Response {}

final class OpenApiTestApiClient {
  OpenApiTestApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiTestApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<Op0Response> op0() async {
    final $uri = Uri.parse('$_baseUri/');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<OpIdResponse> opId({required int id}) async {
    final $uri = Uri.parse('$_baseUri/$id');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op1Response> op1() async {
    final $uri = Uri.parse('$_baseUri/group1/op1');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op2Response> op2() async {
    final $uri = Uri.parse('$_baseUri/group1/op2');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op3Response> op3() async {
    final $uri = Uri.parse('$_baseUri/group2/op3');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op4Response> op4() async {
    final $uri = Uri.parse('$_baseUri/group3/op4');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op5Response> op5() async {
    final $uri = Uri.parse('$_baseUri/group4/op5');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op6Response> op6() async {
    final $uri = Uri.parse('$_baseUri/group4/op6');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op7Response> op7() async {
    final $uri = Uri.parse('$_baseUri/group5/op7');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<Op8Response> op8() async {
    final $uri = Uri.parse('$_baseUri/group6/op8');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Ok
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class SomeObj {
  SomeObj({this.someProp});

  final String? someProp;
}

final class Empty$
    implements
        Op0Response,
        OpIdResponse,
        Op1Response,
        Op2Response,
        Op3Response,
        Op4Response,
        Op5Response,
        Op6Response,
        Op7Response,
        Op8Response {
  const Empty$._();
}
