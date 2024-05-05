// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:http/http.dart' as _i1;

final class ProblemExampleWithNestedAnyOfClient {
  ProblemExampleWithNestedAnyOfClient({
    _i1.Client? httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;
}

final class SomeData {
  SomeData();
}
