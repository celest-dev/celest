// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:collection/collection.dart' as _i2;
import 'package:http/http.dart' as _i1;

extension type MyTitleServers(Uri _) implements Uri {
  static final MyTitleServers defaultServer = server0;

  static final MyTitleServers server0 =
      MyTitleServers(Uri.parse(r'https://localhost:9999/root'));
}

final class MyTitleClient {
  MyTitleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? MyTitleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;
}

final class ArrayWithValidations extends _i2.DelegatingList<Object> {
  ArrayWithValidations(super.base);
}
