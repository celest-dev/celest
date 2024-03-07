import 'dart:async';

import 'package:celest_auth/src/auth.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_core/celest_core.dart';
import 'package:state_notifier/state_notifier.dart';

base mixin EmailProvider on AuthImpl {
  late final Email email = Email(this);
}

final class Email {
  Email(this._hub);

  final AuthImpl _hub;

  Future<EmailSignUpNeedsVerification> signUp({
    required String email,
  }) async {
    final flowSink = await _hub.requestFlow<EmailFlowState>();
    final flow = EmailFlow._(_hub, _EmailFlowController(flowSink));
    return flow._signUp(email: email);
  }
}

final class EmailFlow implements AuthFlow {
  EmailFlow._(this._hub, this._flowController);

  final AuthImpl _hub;
  final _EmailFlowController _flowController;

  EmailProtocol get _protocol => _hub.protocol.email;

  Future<EmailSignUpNeedsVerification> _signUp({
    required String email,
  }) {
    return _flowController.capture(() async {
      final parameters = await _protocol.sendOtp(
        request: OtpSendRequest(email: email),
      );
      return EmailSignUpNeedsVerification(
        flow: this,
        email: email,
        parameters: parameters,
      );
    });
  }

  Future<EmailAuthenticated> _verifyOtp({
    required String email,
    required String otp,
  }) {
    return _flowController.capture(() async {
      final user = await _protocol.verifyOtp(
        verification: OtpVerifyRequest(email: email, otp: otp),
      );
      _hub.secureStorage.write('cork', user.cork);
      _hub.localStorage.write('userId', user.user.userId);
      return EmailAuthenticated(flow: this, user: user.user);
    });
  }

  @override
  void cancel() {
    // TODO(dnys1)
    throw UnimplementedError();
  }
}

final class EmailSignUpNeedsVerification extends EmailFlowState {
  EmailSignUpNeedsVerification({
    required super.flow,
    required this.email,
    required OtpParameters parameters,
  }) : _parameters = parameters {
    _resendCountdown =
        Stream<void>.periodic(const Duration(seconds: 1)).listen((_) {
      final resendIn = canResendIn;
      _resendEligible.setState(resendIn == Duration.zero, resendIn);
    });
  }

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
      _parameters = await flow._protocol.resendOtp(
        request: OtpSendRequest(email: email),
      );
    } finally {
      _resendCountdown?.resume();
      _resendEligible.setState(canResendIn == Duration.zero, canResendIn);
    }
  }

  Future<User> verifyOtp(String otp) async {
    final authenticated = await flow._verifyOtp(email: email, otp: otp);
    _close();
    return authenticated.user;
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

extension type _EmailFlowController(StreamSink<EmailFlowState> _sink) {
  Future<R> capture<R extends EmailFlowState>(
    Future<R> Function() action,
  ) async {
    try {
      final result = await action();
      _sink.add(result);
      return result;
    } on Object catch (e, st) {
      _sink.addError(e, st);
      rethrow;
    }
  }
}
