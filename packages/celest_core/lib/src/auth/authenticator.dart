import 'package:celest_core/_internal.dart';

final class Authenticator {
  Authenticator({
    required NativeSecureStorage secureStorage,
  }) : _secureStorage = secureStorage.scoped('/celest/auth');

  final NativeSecureStorage _secureStorage;

  Future<String?> get token {
    if (kIsWeb) return Future.sync(() => null);
    return _secureStorage.isolated.read('cork');
  }
}
