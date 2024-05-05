// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:collection/collection.dart' as _i2;
import 'package:http/http.dart' as _i1;

extension type FooServers(Uri _) implements Uri {
  static final FooServers defaultServer = server0;

  static final FooServers server0 = FooServers(Uri.parse(r'/'));
}

final class FooClient {
  FooClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? FooServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;
}

class A extends _i2.DelegatingMap<String, List<Object>> {
  A(super.base);
}

final class B extends _i2.DelegatingList<Object> {
  B(super.base);
}
