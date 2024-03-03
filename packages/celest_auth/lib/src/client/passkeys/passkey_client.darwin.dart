import 'package:celest_auth/src/client/passkeys/passkey_client_platform.vm.dart';
import 'package:celest_core/celest_core.dart';

final class PasskeyClientDarwin extends PasskeyClientPlatform {
  PasskeyClientDarwin({
    required super.protocol,
  }) : super.base();

  @override
  Future<bool> get isSupported => throw UnimplementedError();

  @override
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationRequest request,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  ) {
    throw UnimplementedError();
  }
}
