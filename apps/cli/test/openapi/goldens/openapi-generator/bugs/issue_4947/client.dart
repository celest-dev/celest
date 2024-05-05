// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
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

final class String$ {
  const String$(this.value);

  final String value;
}

typedef String50 = String$;

final class Foo_category extends _i4.DelegatingList<String$> {
  Foo_category(super.base);
}

final class Foo_stringPattern extends _i4.DelegatingSet<String$> {
  Foo_stringPattern(super.base);
}

final class Foo_stringMaxMinLength extends _i4.DelegatingSet<String$> {
  Foo_stringMaxMinLength(super.base);
}

final class Foo_stringMinLength extends _i4.DelegatingList<String$> {
  Foo_stringMinLength(super.base);
}

final class Foo_stringMaxLength extends _i4.DelegatingSet<String$> {
  Foo_stringMaxLength(super.base);
}

final class Foo_stringEmail extends _i4.DelegatingList<String$> {
  Foo_stringEmail(super.base);
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class Foo_intMinMax extends _i4.DelegatingList<Integer$> {
  Foo_intMinMax(super.base);
}

final class Foo_intMin extends _i4.DelegatingList<Integer$> {
  Foo_intMin(super.base);
}

final class Foo_intMax extends _i4.DelegatingList<Integer$> {
  Foo_intMax(super.base);
}

final class Double$ {
  const Double$(this.value);

  final double value;
}

final class Foo_numberMinMax extends _i4.DelegatingList<Double$> {
  Foo_numberMinMax(super.base);
}

final class Foo_numberMin extends _i4.DelegatingList<Double$> {
  Foo_numberMin(super.base);
}

final class Foo_numberMax extends _i4.DelegatingList<Double$> {
  Foo_numberMax(super.base);
}

final class Foo_stringPatternWithMin extends _i4.DelegatingSet<String$> {
  Foo_stringPatternWithMin(super.base);
}

final class Foo_stringPatternNullable extends _i4.DelegatingSet<String$> {
  Foo_stringPatternNullable(super.base);
}

final class Foo_stringMaxMinLengthNullable extends _i4.DelegatingSet<String$> {
  Foo_stringMaxMinLengthNullable(super.base);
}

final class Foo_stringMinLengthNullable extends _i4.DelegatingList<String$> {
  Foo_stringMinLengthNullable(super.base);
}

final class Foo_stringMaxLengthNullable extends _i4.DelegatingSet<String$> {
  Foo_stringMaxLengthNullable(super.base);
}

final class Foo_stringNumbers extends _i4.DelegatingSet<String$> {
  Foo_stringNumbers(super.base);
}

final class Foo_stringEmailNullable extends _i4.DelegatingList<String$> {
  Foo_stringEmailNullable(super.base);
}

final class Foo_intMinMaxNullable extends _i4.DelegatingList<Integer$> {
  Foo_intMinMaxNullable(super.base);
}

final class Foo_intMinNullable extends _i4.DelegatingList<Integer$> {
  Foo_intMinNullable(super.base);
}

final class Foo_intMaxNullable extends _i4.DelegatingList<Integer$> {
  Foo_intMaxNullable(super.base);
}

final class Foo_numberMinMaxNullable extends _i4.DelegatingList<Double$> {
  Foo_numberMinMaxNullable(super.base);
}

final class Foo_numberMinNullable extends _i4.DelegatingList<Double$> {
  Foo_numberMinNullable(super.base);
}

final class Foo_numberMaxNullable extends _i4.DelegatingList<Double$> {
  Foo_numberMaxNullable(super.base);
}

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

  final Foo_category? category;

  final Foo_stringPattern? stringPattern;

  final Foo_stringMaxMinLength? stringMaxMinLength;

  final Foo_stringMinLength? stringMinLength;

  final Foo_stringMaxLength? stringMaxLength;

  final Foo_stringEmail? stringEmail;

  final Foo_intMinMax? intMinMax;

  final Foo_intMin? intMin;

  final Foo_intMax? intMax;

  final Foo_numberMinMax? numberMinMax;

  final Foo_numberMin? numberMin;

  final Foo_numberMax? numberMax;

  final Foo_stringPatternWithMin? stringPatternWithMin;

  final Foo_stringPatternNullable? stringPatternNullable;

  final Foo_stringMaxMinLengthNullable? stringMaxMinLengthNullable;

  final Foo_stringMinLengthNullable? stringMinLengthNullable;

  final Foo_stringMaxLengthNullable? stringMaxLengthNullable;

  final Foo_stringNumbers? stringNumbers;

  final Foo_stringEmailNullable? stringEmailNullable;

  final Foo_intMinMaxNullable? intMinMaxNullable;

  final Foo_intMinNullable? intMinNullable;

  final Foo_intMaxNullable? intMaxNullable;

  final Foo_numberMinMaxNullable? numberMinMaxNullable;

  final Foo_numberMinNullable? numberMinNullable;

  final Foo_numberMaxNullable? numberMaxNullable;
}

/// Response type for [TestIssueTest.getTest].
typedef GetTestResponse = Foo;
