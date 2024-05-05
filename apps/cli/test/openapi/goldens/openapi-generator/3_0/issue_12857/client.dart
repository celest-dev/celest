// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:http/http.dart' as _i1;

extension type Openapi303SampleSpecServers(Uri _) implements Uri {
  static final Openapi303SampleSpecServers defaultServer = server0;

  static final Openapi303SampleSpecServers server0 =
      Openapi303SampleSpecServers(Uri.parse(r'/'));
}

final class Openapi303SampleSpecClient {
  Openapi303SampleSpecClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? Openapi303SampleSpecServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;
}

final class Any$ {
  const Any$(this.value);

  final Object value;
}

final class FooRequired {
  FooRequired({required this.foo});

  final Any$ foo;
}

final class FooOptional {
  FooOptional({this.foo});

  final Any$? foo;
}
