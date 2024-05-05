// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type CallbackExampleServers(Uri _) implements Uri {
  static final CallbackExampleServers defaultServer = server0;

  static final CallbackExampleServers server0 =
      CallbackExampleServers(Uri.parse(r'/'));
}

class CallbackExampleStreams {
  CallbackExampleStreams({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// subscribes a client to receive out-of-band data
  Future<PostStreamsResponse> postStreams({required String callbackUrl}) async {
    final $queryParameters = <String, String>{};
    $queryParameters['callbackUrl'] = callbackUrl;
    final $uri = Uri.parse('$_baseUri/streams')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// subscription successfully created
      case 201:
        return _decodeJson<PostStreamsResponse>($response);
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

final class CallbackExampleClient {
  CallbackExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? CallbackExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  CallbackExampleStreams get streams => CallbackExampleStreams(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class NewNotificationData {
  NewNotificationData({
    this.timestamp,
    this.userData,
  });

  final DateTime? timestamp;

  final String? userData;
}

final class DeleteNotificationData {
  DeleteNotificationData({this.timestamp});

  final DateTime? timestamp;
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class PostStreamsResponse {
  PostStreamsResponse({required this.subscriptionId});

  final String$ subscriptionId;
}
