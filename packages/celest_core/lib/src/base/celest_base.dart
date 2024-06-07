import 'package:http/http.dart' as http;
import 'package:native_storage/native_storage.dart';

abstract mixin class CelestBase {
  http.Client get httpClient;
  Uri get baseUri;
  NativeStorage get nativeStorage;
}
