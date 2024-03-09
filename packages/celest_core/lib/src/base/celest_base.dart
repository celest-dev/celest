import 'package:http/http.dart' as http;

abstract mixin class CelestBase {
  http.Client get httpClient;
  Uri get baseUri;
}
