import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/auth.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_exception_impl.dart';
import 'package:celest_core/celest_core.dart';

base mixin Passkeys on AuthImpl {
  late final PasskeyFlow passkeys = PasskeyFlow(this);
}

final class PasskeyFlow implements AuthFlow {
  PasskeyFlow(this._hub);

  final AuthImpl _hub;
  final PasskeyPlatform _platform = PasskeyPlatform();
  late final PasskeyProtocol _protocol = _hub.protocol.passkeys;

  Future<User> signUp({
    required String email,
    String? name,
  }) async {
    if (!await _platform.isSupported) {
      throw const PasskeyUnsupportedException();
    }
    final options = await _protocol.requestRegistration(
      request: PasskeyRegistrationRequest(username: email, displayName: name),
    );
    final registration = await _platform.register(options);
    final user = await _protocol.verifyRegistration(registration: registration);
    _hub.secureStorage.write('cork', user.cork);
    return user.user;
  }

  Future<User> signIn({
    required String email,
  }) async {
    if (!await _platform.isSupported) {
      throw const PasskeyUnsupportedException();
    }
    final options = await _protocol.requestAuthentication(
      request: PasskeyAuthenticationRequest(username: email),
    );
    final authentication = await _platform.authenticate(options);
    final user = await _protocol.verifyAuthentication(
      authentication: authentication,
    );
    _hub.secureStorage.write('cork', user.cork);
    return user.user;
  }

  /// Cancels the in-progress passkey operation, if any.
  void cancel() => _platform.cancel();
}
