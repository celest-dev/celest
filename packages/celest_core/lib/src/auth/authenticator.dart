import 'dart:async';

import 'package:celest_core/_internal.dart';
import 'package:native_storage/native_storage.dart';

typedef OnRevoke = FutureOr<void> Function();

abstract class Authenticator {
  factory Authenticator({
    required NativeSecureStorage secureStorage,
    OnRevoke? onRevoke,
  }) = _Authenticator;

  const factory Authenticator.static({
    String? token,
    OnRevoke? onRevoke,
  }) = _StaticAuthenticator;

  Future<String?> get token;
  Future<void> revoke();
}

final class _StaticAuthenticator implements Authenticator {
  const _StaticAuthenticator({
    String? token,
    OnRevoke? onRevoke,
  })  : _token = token,
        _onRevoke = onRevoke;

  final String? _token;
  final OnRevoke? _onRevoke;

  @override
  Future<String?> get token => Future.value(_token);

  @override
  Future<void> revoke() {
    return Future.value(_onRevoke?.call());
  }
}

final class _Authenticator implements Authenticator {
  _Authenticator({
    required NativeSecureStorage secureStorage,
    OnRevoke? onRevoke,
  })  : _secureStorage = secureStorage.scoped('/celest/auth'),
        _onRevoke = onRevoke;

  final NativeSecureStorage _secureStorage;
  final OnRevoke? _onRevoke;

  @override
  Future<String?> get token {
    if (kIsWeb) return Future.sync(() => null);
    return _secureStorage.isolated.read('cork');
  }

  @override
  Future<void> revoke() async {
    await _onRevoke?.call();
    await _secureStorage.isolated.delete('cork');
  }
}
