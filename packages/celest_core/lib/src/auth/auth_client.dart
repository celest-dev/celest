import 'package:celest_core/_internal.dart';
import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/auth_protocol.dart';
import 'package:celest_core/src/auth/otp/otp_types.dart';
import 'package:celest_core/src/base/base_protocol.dart';

final class AuthClient with BaseProtocol implements AuthProtocol {
  AuthClient(this.celest);

  @override
  final CelestBase celest;

  @override
  Future<User> userInfo() async {
    final response = await getJson('/_auth/userinfo');
    return User.fromJson(response);
  }

  @override
  late final EmailClient email = EmailClient(celest);
}

final class EmailClient with BaseProtocol implements EmailProtocol {
  EmailClient(this.celest);

  @override
  final CelestBase celest;

  @override
  Future<OtpParameters> sendOtp({
    required OtpSendRequest request,
  }) async {
    final response = await postJson(
      '/_auth/email/otp/send',
      request.toJson(),
    );
    return OtpParameters.fromJson(response);
  }

  @override
  Future<OtpParameters> resendOtp({
    required OtpSendRequest request,
  }) async {
    final response = await postJson(
      '/_auth/email/otp/resend',
      request.toJson(),
    );
    return OtpParameters.fromJson(response);
  }

  @override
  Future<AuthenticatedUser> verifyOtp({
    required OtpVerifyRequest verification,
  }) async {
    final resp = await postJson(
      '/_auth/email/otp/verify',
      verification.toJson(),
    );
    return AuthenticatedUser.fromJson(resp);
  }
}
