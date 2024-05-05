// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:collection/collection.dart' as _i2;
import 'package:http/http.dart' as _i1;

extension type DemoModelsServers(Uri _) implements Uri {
  static final DemoModelsServers defaultServer = server0;

  static final DemoModelsServers server0 = DemoModelsServers(Uri.parse(r'/'));
}

final class DemoModelsClient {
  DemoModelsClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? DemoModelsServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class Double$ {
  const Double$(this.value);

  final double value;
}

final class ComplexObject_dates extends _i2.DelegatingList<DateTime> {
  ComplexObject_dates(super.base);
}

extension type const ComplexObject_symbolType(String _) implements String {
  static const ComplexObject_symbolType symbol1 =
      ComplexObject_symbolType('SYMBOL1');

  static const ComplexObject_symbolType symbol2 =
      ComplexObject_symbolType('SYMBOL2');

  static const ComplexObject_symbolType symbol3 =
      ComplexObject_symbolType('SYMBOL3');
}

final class ComplexObject {
  ComplexObject({
    this.id,
    this.probability,
    this.dates,
    this.symbolType,
  });

  final String$? id;

  final Double$? probability;

  final ComplexObject_dates? dates;

  final ComplexObject_symbolType? symbolType;
}

final class ComplexArray extends _i2.DelegatingList<ComplexObject> {
  ComplexArray(super.base);
}
