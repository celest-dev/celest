import 'dart:isolate';

import 'package:celest_core/src/storage/secure/secure_storage.dart';
import 'package:celest_core/src/storage/storage.dart';
import 'package:celest_core/src/util/globals.dart';
import 'package:http/http.dart' as http;

final class CelestHttpClient extends http.BaseClient {
  CelestHttpClient({
    required SecureStorage secureStorage,
    http.Client? baseClient,
  })  : _secureStorage = secureStorage,
        _ownsInner = baseClient == null,
        _inner = baseClient ?? http.Client();

  final SecureStorage _secureStorage;
  final bool _ownsInner;
  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final cork = await _readStorage(_secureStorage, 'cork');
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

Future<String?> _readStorage(Storage storage, String key) async {
  if (kIsWeb) {
    return null;
  }
  return Isolate.run(() => storage.read(key));
}
