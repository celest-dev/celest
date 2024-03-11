import 'package:celest_core/src/http/http_client.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/http/http_client.web.dart';
import 'package:celest_core/src/storage/secure/secure_storage.dart';
import 'package:http/http.dart' as http;

final class CelestHttpClient extends http.BaseClient {
  CelestHttpClient({
    required SecureStorage secureStorage,
    http.Client? baseClient,
  })  : _secureStorage = secureStorage,
        _ownsInner = baseClient == null,
        _inner = baseClient ?? createHttpClient();

  final SecureStorage _secureStorage;
  final bool _ownsInner;
  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final cork = _secureStorage.read('cork');
    if (cork != null) {
      request.headers['authorization'] = 'Bearer $cork';
    }
    return _inner.send(request);
  }

  @override
  void close() {
    if (_ownsInner) {
      _inner.close();
    }
  }
}
