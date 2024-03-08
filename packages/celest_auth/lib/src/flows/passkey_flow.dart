import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_exception_impl.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_platform.dart';
import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/auth_protocol.dart';
import 'package:celest_core/src/auth/passkeys/passkey_types.dart';

final class PasskeyFlow implements AuthFlow {
  PasskeyFlow(this._hub);

  final AuthImpl _hub;
  final PasskeyPlatform _platform = PasskeyPlatform();
  late final PasskeyProtocol _protocol = _hub.protocol.passkeys;

  Future<User> authenticate({
    required String email,
    String? name,
  }) async {
    if (!await _platform.isSupported) {
      throw const PasskeyUnsupportedException();
    }
    final options = await _protocol.authenticate(
      request: PasskeyRequest(
        username: email,
        displayName: name,
      ),
    );
    final credential = await switch (options) {
      final PasskeyRegistrationOptions options => _platform.register(options),
      final PasskeyAuthenticationOptions options =>
        _platform.authenticate(options),
    };
    final user = await _protocol.verify(credential: credential);
    _hub.secureStorage.write('cork', user.cork);
    return user.user;
  }

  /// Cancels the in-progress passkey operation, if any.
  @override
  void cancel() => _platform.cancel();
}
