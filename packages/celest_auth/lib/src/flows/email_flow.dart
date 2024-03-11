import 'dart:async';

import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/auth_protocol.dart';
import 'package:celest_core/src/auth/otp/otp_types.dart';

extension type Email(AuthImpl _hub) {
  /// Authenticates a user with the given [email] using a one-time password
  /// (OTP) sent to that email.
  ///
  /// OTP codes are valid for 15 minutes and can be resent after 60 seconds
  /// by calling `resend` on the returned state object.
  Future<EmailNeedsVerification> authenticate({
    required String email,
  }) async {
    final flowController = await _hub.requestFlow();
    final flow = EmailFlow._(_hub, flowController);
    return flow._authenticate(email: email);
  }
}

final class EmailFlow implements AuthFlow {
  EmailFlow._(this._hub, this._flowController);

  final AuthImpl _hub;
  final AuthFlowController _flowController;

  EmailProtocol get _protocol => _hub.protocol.email;

  Future<EmailNeedsVerification> _authenticate({
    required String email,
  }) {
    return _flowController.capture(() async {
      final parameters = await _protocol.sendOtp(
        request: OtpSendRequest(email: email),
      );
      return _EmailNeedsVerification(
        flow: this,
        email: email,
        parameters: parameters,
      );
    });
  }

  Future<Authenticated> _verifyOtp({
    required String email,
    required String otp,
  }) {
    return _flowController.capture(() async {
      final user = await _protocol.verifyOtp(
        verification: OtpVerifyRequest(email: email, otp: otp),
      );
      _hub.secureStorage.write('cork', user.cork);
      _hub.localStorage.write('userId', user.user.userId);
      return Authenticated(user: user.user);
    });
  }

  @override
  void cancel() => _flowController.cancel();
}

final class _EmailNeedsVerification extends EmailNeedsVerification {
  _EmailNeedsVerification({
    required EmailFlow flow,
    required super.email,
    required OtpParameters parameters,
  }) : _flow = flow;

  final EmailFlow _flow;

  @override
  Future<void> resend() async {
    await _flow._protocol.resendOtp(
      request: OtpSendRequest(email: email),
    );
  }

  @override
  Future<User> verify({required String otpCode}) async {
    final authenticated = await _flow._verifyOtp(email: email, otp: otpCode);
    return authenticated.user;
  }

  @override
  void cancel() => _flow.cancel();
}
