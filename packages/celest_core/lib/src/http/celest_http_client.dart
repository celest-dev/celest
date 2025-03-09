import 'package:celest_core/_internal.dart';
import 'package:celest_core/src/http/http_client.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/http/http_client.web.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:native_storage/native_storage.dart';

final class CelestHttpClient extends http.BaseClient {
  CelestHttpClient({
    NativeSecureStorage? secureStorage,
    Authenticator? authenticator,
    http.Client? baseClient,
    Logger? logger,
  })  : _authenticator = authenticator ??
            Authenticator(
              secureStorage: secureStorage ?? NativeSecureStorage(),
            ),
        _ownsInner = baseClient == null,
        _inner = baseClient ?? createHttpClient(),
        _logger = logger;

  final Authenticator _authenticator;
  final bool _ownsInner;
  final http.Client _inner;
  final Logger? _logger;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await _authenticator.token;
    if (token != null) {
      request.headers['authorization'] = 'Bearer $token';
    }
    return _inner.send(request).then((response) async {
      if (response.statusCode == HttpStatus.unauthorized) {
        _logger?.finer('Revoking token');
        await _authenticator.revoke();
      }
      return response;
    });
  }

  @override
  void close() {
    if (_ownsInner) {
      _inner.close();
    }
  }
}
