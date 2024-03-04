import 'package:celest_core/celest_core.dart';

abstract interface class AuthProtocol {
  PasskeyProtocol get passkeys;
}

abstract interface class PasskeyProtocol {
  Future<PasskeyRegistrationOptions> requestRegistration({
    required PasskeyRegistrationRequest request,
  });

  /// Verifies the registration response and returns the user auth token.
  Future<void> verifyRegistration({
    required PasskeyRegistrationResponse registration,
  });

  Future<PasskeyAuthenticationOptions> requestAuthentication({
    required PasskeyAuthenticationRequest request,
  });

  /// Verifies the authentication response and returns the user auth token.
  Future<void> verifyAuthentication({
    required PasskeyAuthenticationResponse authentication,
  });
}
