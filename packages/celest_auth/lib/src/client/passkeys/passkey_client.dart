import 'package:celest_auth/src/client/passkeys/passkey_client_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/client/passkeys/passkey_client_platform.web.dart';
import 'package:celest_auth/src/client/passkeys/passkey_models.dart';
import 'package:meta/meta.dart';

abstract base class PasskeyClient {
  factory PasskeyClient() = PasskeyClientPlatform;

  @protected
  PasskeyClient.base();

  Future<bool> get isSupported;
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationOptions options,
  );
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  );
}
