import 'package:celest_auth/src/platform/passkeys/passkey_platform_impl.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/platform/passkeys/passkey_platform_impl.web.dart';
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';

abstract base class PasskeyPlatform {
  factory PasskeyPlatform() = PasskeyPlatformImpl;

  @protected
  PasskeyPlatform.base();

  /// Returns `true` if the platform supports passkeys.
  ///
  /// If the platform does not support passkeys, the [register] and [authenticate]
  /// methods will throw a [PasskeyException].
  Future<bool> get isSupported;

  /// Cancels the in-progress passkey operation, if any.
  void cancel();

  /// Registers a new passkey.
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationOptions options,
  );

  /// Authenticates with an existing passkey.
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationOptions options,
  );
}
