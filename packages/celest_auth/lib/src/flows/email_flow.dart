import 'dart:async';

import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/auth_protocol.dart';
import 'package:celest_core/src/auth/otp/otp_types.dart';
import 'package:state_notifier/state_notifier.dart';

extension type Email(AuthImpl _hub) {
  Future<EmailNeedsVerification> signIn({
    required String email,
  }) async {
    final flowController = await _hub.requestFlow();
    final flow = EmailFlow._(_hub, flowController);
    return flow._signIn(email: email);
  }
}

final class EmailFlow implements AuthFlow {
  EmailFlow._(this._hub, this._flowController);

  final AuthImpl _hub;
  final AuthFlowController _flowController;

  EmailProtocol get _protocol => _hub.protocol.email;

  Future<EmailNeedsVerification> _signIn({
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
      return Authenticated(user.user);
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
  })  : _parameters = parameters,
        _flow = flow {
    _resendCountdown =
        Stream<void>.periodic(const Duration(seconds: 1)).listen((_) {
      final resendIn = canResendIn;
      _resendEligible.setState(resendIn == Duration.zero, resendIn);
    });
  }

  final EmailFlow _flow;
  OtpParameters _parameters;

  late final _ResendEligibleNotifier _resendEligible =
      _ResendEligibleNotifier(canResendIn);
  StreamSubscription<void>? _resendCountdown;

  StateNotifier<(bool, Duration)> get canResend => _resendEligible;
  Duration get canResendIn {
    final resendIn = _parameters.nextResend.difference(DateTime.now());
    return resendIn.isNegative ? Duration.zero : resendIn;
  }

  @override
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

  @override
  Future<User> verifyOtp(String otp) async {
    final authenticated = await _flow._verifyOtp(email: email, otp: otp);
    _close();
    return authenticated.user;
  }

  void _close() {
    _resendEligible.dispose();
    _resendCountdown?.cancel();
    _resendCountdown = null;
  }

  @override
  void cancel() => _flow.cancel();
}

final class _ResendEligibleNotifier extends StateNotifier<(bool, Duration)> {
  _ResendEligibleNotifier(Duration canResendIn) : super((false, canResendIn));

  void setState(bool state, [Duration? canResendIn]) {
    this.state = (state, canResendIn ?? this.state.$2);
  }
}
