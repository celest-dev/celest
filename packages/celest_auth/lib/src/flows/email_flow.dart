import 'dart:async';

import 'package:celest_auth/src/auth.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_core/celest_core.dart';
import 'package:state_notifier/state_notifier.dart';

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
    required this.email,
    required OtpParameters parameters,
  })  : _flow = flow,
        _parameters = parameters {
    _resendCountdown =
        Stream<void>.periodic(const Duration(seconds: 1)).listen((_) {
      final resendIn = canResendIn;
      _resendEligible.setState(resendIn == Duration.zero, resendIn);
    });
  }

  final EmailFlow _flow;
  final String email;
  OtpParameters _parameters;

  late final _ResendEligibleNotifier _resendEligible =
      _ResendEligibleNotifier(canResendIn);
  StreamSubscription<void>? _resendCountdown;

  StateNotifier<(bool, Duration)> get canResend => _resendEligible;
  Duration get canResendIn {
    final resendIn = _parameters.nextResend.difference(DateTime.now());
    return resendIn.isNegative ? Duration.zero : resendIn;
  }

  Future<void> resend() async {
    _resendCountdown?.pause();
    _resendEligible.setState(false);
    try {
      _parameters = await _flow._protocol.resendOtp(
        request: OtpSendRequest(email: email),
      );
    } finally {
      _resendCountdown?.resume();
      _resendEligible.setState(canResendIn == Duration.zero, canResendIn);
    }
  }

  Future<User> verifyOtp(String otp) async {
    final user = await _flow._verifyOtp(email: email, otp: otp);
    _close();
    return user;
  }

  void _close() {
    _resendEligible.dispose();
    _resendCountdown?.cancel();
    _resendCountdown = null;
  }
}

final class _ResendEligibleNotifier extends StateNotifier<(bool, Duration)> {
  _ResendEligibleNotifier(Duration canResendIn) : super((false, canResendIn));

  void setState(bool state, [Duration? canResendIn]) {
    this.state = (state, canResendIn ?? this.state.$2);
  }
}
