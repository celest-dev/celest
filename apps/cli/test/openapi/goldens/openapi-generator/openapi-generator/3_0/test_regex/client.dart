// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestRegexGenerationForParameterValidationServers(Uri _)
    implements Uri {
  static final TestRegexGenerationForParameterValidationServers defaultServer =
      server0;

  static final TestRegexGenerationForParameterValidationServers server0 =
      TestRegexGenerationForParameterValidationServers(Uri.parse(r'/'));
}

class TestRegexGenerationForParameterValidationPing {
  TestRegexGenerationForParameterValidationPing({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get Payment Information
  /// Returns the content of a payment object
  Future<GetPingResponse> getPing() async {
    final $uri = Uri.parse('$_baseUri/ping');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (patternNoForwardSlashes != null) {
      $request.headers['pattern_no_forward_slashes'] = patternNoForwardSlashes;
    }
    if (patternTwoSlashes != null) {
      $request.headers['pattern_two_slashes'] = patternTwoSlashes;
    }
    if (patternDontEscapeBackslash != null) {
      $request.headers['pattern_dont_escape_backslash'] =
          patternDontEscapeBackslash;
    }
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

final class TestRegexGenerationForParameterValidationClient {
  TestRegexGenerationForParameterValidationClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ??
            TestRegexGenerationForParameterValidationServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestRegexGenerationForParameterValidationPing get ping =>
      TestRegexGenerationForParameterValidationPing(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [TestRegexGenerationForParameterValidationPing.getPing].
typedef GetPingResponse = Empty$;
