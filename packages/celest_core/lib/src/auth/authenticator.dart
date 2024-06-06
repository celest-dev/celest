import 'package:celest_core/_internal.dart';
import 'package:celest_core/src/util/globals.dart';

final class Authenticator {
  Authenticator({
    required NativeSecureStorage secureStorage,
  }) : _secureStorage = secureStorage.scoped('auth');

  final NativeSecureStorage _secureStorage;

  Future<String?> get token {
    if (kIsWeb) return Future.sync(() => null);
    return _secureStorage.isolated.read('cork');
  }
}
