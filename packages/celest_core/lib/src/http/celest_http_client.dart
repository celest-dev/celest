import 'package:celest_core/_internal.dart';
import 'package:celest_core/src/http/http_client.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/http/http_client.web.dart';
import 'package:http/http.dart' as http;

final class CelestHttpClient extends http.BaseClient {
  CelestHttpClient({
    NativeSecureStorage? secureStorage,
    http.Client? baseClient,
  })  : _secureStorage = secureStorage,
        _ownsInner = baseClient == null,
        _inner = baseClient ?? createHttpClient();

  final NativeSecureStorage? _secureStorage;
  final bool _ownsInner;
  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (_secureStorage != null) {
      final cork = await _secureStorage.isolated.read('auth/cork');
      if (cork != null) {
        request.headers['authorization'] = 'Bearer $cork';
      }
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
