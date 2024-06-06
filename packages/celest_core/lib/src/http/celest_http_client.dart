import 'dart:developer';
import 'dart:isolate';

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
    // Support setting breakpoints in Celest functions when debugging the
    // parent application.
    //
    // This is only enabled in debug mode when targeting the local environment.
    // TODO(dnys1): Use celest.env to make sure we're in local env.
    if (kDebugMode) {
      final serviceInfo = await Service.getInfo();
      final (majorVersion, minorVersion) =
          (serviceInfo.majorVersion, serviceInfo.minorVersion);
      request.headers['X-Celest-Debug-Server-Protocol-Major'] = '$majorVersion';
      request.headers['X-Celest-Debug-Server-Protocol-Minor'] = '$minorVersion';
      if (serviceInfo.serverUri case final serverUri?) {
        request.headers['X-Celest-Debug-Server-Uri'] = serverUri.toString();
      }
      if (serviceInfo.serverWebSocketUri case final serverWsUri?) {
        request.headers['X-Celest-Debug-Server-WebSocket-Uri'] =
            serverWsUri.toString();
      }
      if (!kIsWeb) {
        if (Service.getIsolateId(Isolate.current) case final isolateId?) {
          request.headers['X-Celest-Debug-Isolate-Id'] = isolateId;
        }
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
