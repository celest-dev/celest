// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type TestServers(Uri _) implements Uri {
  static final TestServers defaultServer = server0;

  static final TestServers server0 = TestServers(Uri.parse(r'/'));
}

class TestTest {
  TestTest({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<TestResponse> test() async {
    final $uri = Uri.parse('$_baseUri/test');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return _decodeJson<EmbeddedEnumArray>($response);
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

  TestTest get test => TestTest(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

extension type const EmbeddedEnumArray_colors_item(String _) implements String {
  static const EmbeddedEnumArray_colors_item black =
      EmbeddedEnumArray_colors_item('BLACK');

  static const EmbeddedEnumArray_colors_item red =
      EmbeddedEnumArray_colors_item('RED');

  static const EmbeddedEnumArray_colors_item orange =
      EmbeddedEnumArray_colors_item('ORANGE');

  static const EmbeddedEnumArray_colors_item yellow =
      EmbeddedEnumArray_colors_item('YELLOW');

  static const EmbeddedEnumArray_colors_item blue =
      EmbeddedEnumArray_colors_item('BLUE');

  static const EmbeddedEnumArray_colors_item green =
      EmbeddedEnumArray_colors_item('GREEN');
}

final class EmbeddedEnumArray_colors
    extends _i4.DelegatingList<EmbeddedEnumArray_colors_item> {
  EmbeddedEnumArray_colors(super.base);
}

extension type const EmbeddedEnumArray_reqColors_item(String _)
    implements String {
  static const EmbeddedEnumArray_reqColors_item black =
      EmbeddedEnumArray_reqColors_item('BLACK');

  static const EmbeddedEnumArray_reqColors_item red =
      EmbeddedEnumArray_reqColors_item('RED');

  static const EmbeddedEnumArray_reqColors_item orange =
      EmbeddedEnumArray_reqColors_item('ORANGE');

  static const EmbeddedEnumArray_reqColors_item yellow =
      EmbeddedEnumArray_reqColors_item('YELLOW');

  static const EmbeddedEnumArray_reqColors_item blue =
      EmbeddedEnumArray_reqColors_item('BLUE');

  static const EmbeddedEnumArray_reqColors_item green =
      EmbeddedEnumArray_reqColors_item('GREEN');
}

final class EmbeddedEnumArray_reqColors
    extends _i4.DelegatingList<EmbeddedEnumArray_reqColors_item> {
  EmbeddedEnumArray_reqColors(super.base);
}

final class EmbeddedEnumArray {
  EmbeddedEnumArray({
    this.colors,
    required this.reqColors,
  });

  final EmbeddedEnumArray_colors? colors;

  final EmbeddedEnumArray_reqColors reqColors;
}

extension type const Colors(String _) implements String {
  static const Colors black = Colors('BLACK');

  static const Colors red = Colors('RED');

  static const Colors orange = Colors('ORANGE');

  static const Colors yellow = Colors('YELLOW');

  static const Colors blue = Colors('BLUE');

  static const Colors green = Colors('GREEN');
}

final class NoEmbeddedEnumArray_colors extends _i4.DelegatingList<Colors> {
  NoEmbeddedEnumArray_colors(super.base);
}

final class NoEmbeddedEnumArray_reqColors extends _i4.DelegatingList<Colors> {
  NoEmbeddedEnumArray_reqColors(super.base);
}

final class NoEmbeddedEnumArray {
  NoEmbeddedEnumArray({
    this.colors,
    this.reqColors,
  });

  final NoEmbeddedEnumArray_colors? colors;

  final NoEmbeddedEnumArray_reqColors? reqColors;
}

extension type const SimpleColorContainer_color(String _) implements String {
  static const SimpleColorContainer_color black =
      SimpleColorContainer_color('BLACK');

  static const SimpleColorContainer_color red =
      SimpleColorContainer_color('RED');

  static const SimpleColorContainer_color orange =
      SimpleColorContainer_color('ORANGE');

  static const SimpleColorContainer_color yellow =
      SimpleColorContainer_color('YELLOW');

  static const SimpleColorContainer_color blue =
      SimpleColorContainer_color('BLUE');

  static const SimpleColorContainer_color green =
      SimpleColorContainer_color('GREEN');
}
extension type const SimpleColorContainer_reqColor(String _) implements String {
  static const SimpleColorContainer_reqColor black =
      SimpleColorContainer_reqColor('BLACK');

  static const SimpleColorContainer_reqColor red =
      SimpleColorContainer_reqColor('RED');

  static const SimpleColorContainer_reqColor orange =
      SimpleColorContainer_reqColor('ORANGE');

  static const SimpleColorContainer_reqColor yellow =
      SimpleColorContainer_reqColor('YELLOW');

  static const SimpleColorContainer_reqColor blue =
      SimpleColorContainer_reqColor('BLUE');

  static const SimpleColorContainer_reqColor green =
      SimpleColorContainer_reqColor('GREEN');
}

final class SimpleColorContainer {
  SimpleColorContainer({
    this.color,
    required this.reqColor,
  });

  final SimpleColorContainer_color? color;

  final SimpleColorContainer_reqColor reqColor;
}

/// Response type for [TestTest.test].
typedef TestResponse = EmbeddedEnumArray;
