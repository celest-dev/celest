import 'package:celest_auth/src/client/passkeys/passkey_client_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/client/passkeys/passkey_client_platform.web.dart';
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';

abstract base class PasskeyClient {
  factory PasskeyClient({
    required PasskeyProtocol protocol,
  }) = PasskeyClientPlatform;

  @protected
  PasskeyClient.base({
    required this.protocol,
  });

  @protected
  final PasskeyProtocol protocol;

  Future<bool> get isSupported;
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationRequest request,
  );
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  );
}
