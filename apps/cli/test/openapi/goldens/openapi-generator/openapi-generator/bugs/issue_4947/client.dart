// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type TestIssueServers(Uri _) implements Uri {
  static final TestIssueServers defaultServer = server0;

  static final TestIssueServers server0 = TestIssueServers(Uri.parse(r'/'));
}

class TestIssueTest {
  TestIssueTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<GetTestResponse> getTest() async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// default response
      case 200:
        return _decodeJson<Foo>($response);
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

final class TestIssueClient {
  TestIssueClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? TestIssueServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  TestIssueTest get test => TestIssueTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

typedef String50 = String;

final class Foo {
  Foo({
    this.category,
    this.stringPattern,
    this.stringMaxMinLength,
    this.stringMinLength,
    this.stringMaxLength,
    this.stringEmail,
    this.intMinMax,
    this.intMin,
    this.intMax,
    this.numberMinMax,
    this.numberMin,
    this.numberMax,
    this.stringPatternWithMin,
    this.stringPatternNullable,
    this.stringMaxMinLengthNullable,
    this.stringMinLengthNullable,
    this.stringMaxLengthNullable,
    this.stringNumbers,
    this.stringEmailNullable,
    this.intMinMaxNullable,
    this.intMinNullable,
    this.intMaxNullable,
    this.numberMinMaxNullable,
    this.numberMinNullable,
    this.numberMaxNullable,
  });

  final List<String>? category;

  final Set<String>? stringPattern;

  final Set<String>? stringMaxMinLength;

  final List<String>? stringMinLength;

  final Set<String>? stringMaxLength;

  final List<String>? stringEmail;

  final List<int>? intMinMax;

  final List<int>? intMin;

  final List<int>? intMax;

  final List<double>? numberMinMax;

  final List<double>? numberMin;

  final List<double>? numberMax;

  final Set<String>? stringPatternWithMin;

  final Set<String>? stringPatternNullable;

  final Set<String>? stringMaxMinLengthNullable;

  final List<String>? stringMinLengthNullable;

  final Set<String>? stringMaxLengthNullable;

  final Set<String>? stringNumbers;

  final List<String>? stringEmailNullable;

  final List<int>? intMinMaxNullable;

  final List<int>? intMinNullable;

  final List<int>? intMaxNullable;

  final List<double>? numberMinMaxNullable;

  final List<double>? numberMinNullable;

  final List<double>? numberMaxNullable;
}

/// Response type for [TestIssueTest.getTest].
typedef GetTestResponse = Foo;
