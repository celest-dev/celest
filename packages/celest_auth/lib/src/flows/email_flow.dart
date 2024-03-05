import 'package:celest_auth/src/auth.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_core/celest_core.dart';

base mixin Email on AuthImpl {
  late final EmailFlow email = EmailFlow(this);
}

final class EmailFlow implements AuthFlow {
  EmailFlow(this._hub);

  final AuthImpl _hub;
  EmailProtocol get _protocol => _hub.protocol.email;

  Future<EmailSignUpNeedsVerification> signUp({
    required String email,
  }) async {
    final parameters = await _protocol.sendOtp(
      request: OtpSendRequest(email: email),
    );
    return EmailSignUpNeedsVerification(
      flow: this,
      email: email,
      parameters: parameters,
    );
  }

  Future<User> _verifyOtp({
    required String email,
    required String otp,
  }) async {
    final user = await _protocol.verifyOtp(
      verification: OtpVerifyRequest(email: email, otp: otp),
    );
    _hub.secureStorage.write('cork', user.cork);
    return user.user;
  }
}

final class EmailSignUpNeedsVerification {
  EmailSignUpNeedsVerification({
    required EmailFlow flow,
    required String email,
    required OtpParameters parameters,
  })  : _flow = flow,
        _email = email,
        _parameters = parameters;

  final EmailFlow _flow;
  final String _email;
  final OtpParameters _parameters;

  bool get canResend => _parameters.nextRetry.isBefore(DateTime.now());
  Duration get resendAfter => canResend
      ? Duration.zero
      : _parameters.nextRetry.difference(DateTime.now());

  Future<EmailSignUpNeedsVerification> resend() async {
    return _flow.signUp(email: _email);
  }

  Future<User> verifyOtp(String otp) async {
    return _flow._verifyOtp(email: _email, otp: otp);
  }
}
