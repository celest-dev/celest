import 'package:celest_auth/src/client/passkeys/passkey_platform_impl.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/client/passkeys/passkey_platform_impl.web.dart';
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';

abstract base class PasskeyPlatform {
  factory PasskeyPlatform({
    required PasskeyProtocol protocol,
  }) = PasskeyPlatformImpl;

  @protected
  PasskeyPlatform.base({
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
