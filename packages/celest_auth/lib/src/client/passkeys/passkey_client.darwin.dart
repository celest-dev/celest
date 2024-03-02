import 'package:celest_auth/src/client/passkeys/passkey_client_platform.vm.dart';
import 'package:celest_auth/src/client/passkeys/passkey_models.dart';

final class PasskeyClientDarwin extends PasskeyClientPlatform {
  PasskeyClientDarwin() : super.base();

  @override
  Future<bool> get isSupported => throw UnimplementedError();

  @override
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationOptions options,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  ) {
    throw UnimplementedError();
  }
}
