// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:http/http.dart' as _i1;

/// Response type for [MultipartFileTestClient.multipartArray].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class MultipartArrayResponse {}

/// Response type for [MultipartFileTestClient.multipartSingle].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class MultipartSingleResponse {}

/// Response type for [MultipartFileTestClient.multipartMixed].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class MultipartMixedResponse {}

final class MultipartFileTestClient {
  MultipartFileTestClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// MultipartFile array test
  Future<MultipartArrayResponse> multipartArray(
      {MultipartArrayRequest? body}) async {
    final $uri = Uri.parse('$_baseUri/multipart-array');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Successful operation
      case 204:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  /// Single MultipartFile test
  Future<MultipartSingleResponse> multipartSingle(
      {MultipartSingleRequest? body}) async {
    final $uri = Uri.parse('$_baseUri/multipart-single');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Successful operation
      case 204:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }

  /// Mixed MultipartFile test
  Future<MultipartMixedResponse> multipartMixed(
      {MultipartMixedRequest? body}) async {
    final $uri = Uri.parse('$_baseUri/multipart-mixed');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Successful operation
      case 204:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

extension type const MultipartMixedStatus(String _) implements String {
  static const MultipartMixedStatus allowed = MultipartMixedStatus('ALLOWED');

  static const MultipartMixedStatus inProgress =
      MultipartMixedStatus('IN_PROGRESS');

  static const MultipartMixedStatus rejected = MultipartMixedStatus('REJECTED');
}

final class MultipartArrayRequest {
  MultipartArrayRequest({this.files});

  final MultipartArrayRequest? files;
}

final class Empty$
    implements
        MultipartArrayResponse,
        MultipartSingleResponse,
        MultipartMixedResponse {
  const Empty$._();
}

final class MultipartSingleRequest {
  MultipartSingleRequest({this.file});

  final String? file;
}

final class MultipartMixedRequest {
  MultipartMixedRequest({
    required this.status,
    this.marker,
    required this.file,
    this.statusArray,
  });

  final MultipartMixedStatus status;

  final MultipartMixedRequest? marker;

  final String file;

  final MultipartMixedRequest? statusArray;
}
