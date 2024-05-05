// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:http/http.dart' as _i1;

extension type TestServers(Uri _) implements Uri {
  static final TestServers defaultServer = server0;

  static final TestServers server0 = TestServers(Uri.parse(r'/'));
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
}

extension type const StringEnum(String _) implements String {
  static const StringEnum $367B9C = StringEnum('#367B9C');

  static const StringEnum ffa5A4 = StringEnum('#FFA5A4');
}
