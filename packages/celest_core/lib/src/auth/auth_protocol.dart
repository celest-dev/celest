import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/otp/otp_types.dart';
import 'package:celest_core/src/auth/passkeys/passkey_types.dart';

abstract interface class AuthProtocol {
  PasskeyProtocol get passkeys;
  EmailProtocol get email;

  Future<User> userInfo();
}

abstract interface class PasskeyProtocol {
  /// Starts a new passkey authentication session.
  Future<PasskeyOptions> authenticate({
    required PasskeyRequest request,
  });

  /// Verifies the credential and returns the authenticated user.
  Future<AuthenticatedUser> verify({
    required PasskeyCredential credential,
  });
}

abstract interface class EmailProtocol {
  Future<OtpParameters> sendOtp({
    required OtpSendRequest request,
  });

  Future<OtpParameters> resendOtp({
    required OtpSendRequest request,
  });

  Future<AuthenticatedUser> verifyOtp({
    required OtpVerifyRequest verification,
  });
}
