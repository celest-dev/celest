import 'package:celest_core/celest_core.dart';

abstract interface class AuthProtocol {
  PasskeyProtocol get passkeys;
}

abstract interface class PasskeyProtocol {
  Future<PasskeyRegistrationOptions> requestRegistration({
    required PasskeyRegistrationRequest request,
  });

  Future<void> verifyRegistration({
    required PasskeyRegistrationResponse registration,
  });

  Future<PasskeyAuthenticationOptions> requestAuthentication({
    required PasskeyAuthenticationRequest request,
  });

  Future<void> verifyAuthentication({
    required PasskeyAuthenticationResponse authentication,
  });
}
