import 'package:celest_core/_internal.dart';
import 'package:celest_core/src/auth/authenticator.dart';
import 'package:celest_core/src/http/http_client.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/http/http_client.web.dart';
import 'package:http/http.dart' as http;

final class CelestHttpClient extends http.BaseClient {
  CelestHttpClient({
    NativeSecureStorage? secureStorage,
    http.Client? baseClient,
  })  : _authenticator = Authenticator(
          secureStorage:
              secureStorage ?? NativeSecureStorage(scope: 'celest/auth'),
        ),
        _ownsInner = baseClient == null,
        _inner = baseClient ?? createHttpClient();

  final Authenticator _authenticator;
  final bool _ownsInner;
  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final cork = await _authenticator.token;
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
