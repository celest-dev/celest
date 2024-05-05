// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:http/http.dart' as _i1;

extension type FormDataTestApiDocumentationServers(Uri _) implements Uri {
  static final FormDataTestApiDocumentationServers defaultServer = server0;

  static final FormDataTestApiDocumentationServers server0 =
      FormDataTestApiDocumentationServers(Uri.parse(r'/backend/rest'));
}

/// Response type for [FormDataTestApiDocumentationClient.formParamPocUpdate].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
sealed class FormParamPocUpdateResponse {}

final class FormDataTestApiDocumentationClient {
  FormDataTestApiDocumentationClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? FormDataTestApiDocumentationServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// fullUpdate
  Future<FormParamPocUpdateResponse> formParamPocUpdate({
    required int id,
    FormParameters? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/form-param-poc/$id');
    final $request = _i1.Request(
      'PUT',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK.
      case 200:
        return const Empty$._();
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class FormParameters {
  FormParameters({this.id});

  final int? id;
}

final class Empty$ implements FormParamPocUpdateResponse {
  const Empty$._();
}
