import 'package:celest_auth/src/platform/passkeys/passkey_platform_impl.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/platform/passkeys/passkey_platform_impl.web.dart';
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

  /// Returns `true` if the platform supports passkeys.
  ///
  /// If the platform does not support passkeys, the [register] and [authenticate]
  /// methods will throw a [PasskeyException].
  Future<bool> get isSupported;

  /// Cancels the in-progress operation, if any.
  void cancel();

  /// Registers a new passkey.
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationRequest request,
  );

  /// Authenticates with an existing passkey.
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  );
}
