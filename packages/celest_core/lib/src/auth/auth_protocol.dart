import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/otp/otp_types.dart';

abstract interface class AuthProtocol {
  EmailProtocol get email;

  Future<User> userInfo();
  Future<void> signOut();
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
