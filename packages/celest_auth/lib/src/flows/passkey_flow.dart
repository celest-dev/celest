import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/auth.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_exception_impl.dart';
import 'package:celest_core/celest_core.dart';

base mixin Passkeys on AuthImpl {
  @override
  void init() {
    super.init();
    register(passkeys);
  }

  late final PasskeyFlow passkeys = PasskeyFlow(
    protocol: protocol,
  );
}

final class PasskeyFlow implements AuthFlow {
  PasskeyFlow({
    required AuthProtocol protocol,
  }) : _protocol = protocol.passkeys;

  final PasskeyPlatform _platform = PasskeyPlatform();
  final PasskeyProtocol _protocol;

  @override
  void init() {}

  Future<String> signUp({
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
    await _protocol.verifyRegistration(registration: registration);
    return (_protocol as PasskeyClient).token!;
  }

  Future<void> signIn({
    required String email,
  }) async {
    if (!await _platform.isSupported) {
      throw const PasskeyUnsupportedException();
    }
    final options = await _protocol.requestAuthentication(
      request: PasskeyAuthenticationRequest(username: email),
    );
    final authentication = await _platform.authenticate(options);
    await _protocol.verifyAuthentication(authentication: authentication);
  }

  /// Cancels the in-progress passkey operation, if any.
  void cancel() => _platform.cancel();
}
