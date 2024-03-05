import 'package:celest_core/celest_core.dart';

abstract interface class AuthProtocol {
  PasskeyProtocol get passkeys;
  EmailProtocol get email;
}

abstract interface class PasskeyProtocol {
  Future<PasskeyRegistrationOptions> requestRegistration({
    required PasskeyRegistrationRequest request,
  });

  /// Verifies the registration response and returns the user auth token.
  Future<AuthenticatedUser> verifyRegistration({
    required PasskeyRegistrationResponse registration,
  });

  Future<PasskeyAuthenticationOptions> requestAuthentication({
    required PasskeyAuthenticationRequest request,
  });

  /// Verifies the authentication response and returns the user auth token.
  Future<AuthenticatedUser> verifyAuthentication({
    required PasskeyAuthenticationResponse authentication,
  });
}

abstract interface class EmailProtocol {
  Future<OtpParameters> sendOtp({
    required OtpSendRequest request,
  });

  Future<AuthenticatedUser> verifyOtp({
    required OtpVerifyRequest verification,
  });
}
