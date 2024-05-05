// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestUseAbstractionForFilesForJaxrsCxfServers(Uri _)
    implements Uri {
  static final TestUseAbstractionForFilesForJaxrsCxfServers defaultServer =
      server0;

  static final TestUseAbstractionForFilesForJaxrsCxfServers server0 =
      TestUseAbstractionForFilesForJaxrsCxfServers(
          Uri.parse(r'http://localhost'));
}

/// Response type for [TestUseAbstractionForFilesForJaxrsCxfClient.getFilesId].
///
/// This is a marker interface implemented by all response types:
/// - [Empty$]
/// - [GetFilesIdResponse]
sealed class GetFilesIdResponse {}

/// Response type for [TestUseAbstractionForFilesForJaxrsCxfClient.postFilesUpload].
///
/// This is a marker interface implemented by all response types:
/// - [PostFilesUploadResponse]
sealed class PostFilesUploadResponse {}

final class TestUseAbstractionForFilesForJaxrsCxfClient {
  TestUseAbstractionForFilesForJaxrsCxfClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ??
            TestUseAbstractionForFilesForJaxrsCxfServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }

  Future<GetFilesIdResponse> getFilesId({required String id}) async {
    final $uri = Uri.parse('$_baseUri/files/$id');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// File content
      case 200:
        return const Empty$._();

      /// error message
      case 500:
        return _decodeJson<GetFilesIdResponse>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<PostFilesUploadResponse> postFilesUpload({String body}) async {
    final $uri = Uri.parse('$_baseUri/files/upload');
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// id
      case 200:
        return _decodeJson<PostFilesUploadResponse>($response);
      default:
        throw Exception('Unexpected response');
    }
  }
}

final class Empty$ implements GetFilesIdResponse {
  const Empty$._();
}

final class GetFilesIdResponse implements GetFilesIdResponse {
  GetFilesIdResponse({this.errormsg});

  final String? errormsg;
}

final class PostFilesUploadResponse implements PostFilesUploadResponse {
  PostFilesUploadResponse({this.id});

  final String? id;
}
