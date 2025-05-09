import 'dart:async';

import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/model/cloud_interop.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:celest_core/celest_core.dart';

extension type Sms(AuthImpl _hub) {
  /// Authenticates a user with the given [phoneNumber] using a one-time password
  /// (OTP) sent to that email.
  ///
  /// OTP codes are valid for 15 minutes and can be resent after 30 seconds
  /// by calling `resend` on the returned state object.
  Future<SmsNeedsVerification> authenticate({
    required String phoneNumber,
  }) async {
    final AuthFlowController flowController = await _hub.requestFlow();
    final flow = SmsFlow._(_hub, flowController);
    return flow._authenticate(phoneNumber: phoneNumber);
  }
}

final class SmsFlow implements AuthFlow {
  SmsFlow._(this._hub, this._flowController);

  final AuthImpl _hub;
  final AuthFlowController _flowController;

  Future<SmsNeedsVerification> _authenticate({required String phoneNumber}) {
    return _flowController.capture(() async {
      final cloud.SmsSessionState state = await _hub.cloud.authentication.sms
          .start(phoneNumber: phoneNumber);
      switch (state) {
        case cloud.SmsSessionVerifyCode():
          return _SmsNeedsVerification(
            flow: this,
            innerState: state,
            phoneNumber: state.phoneNumber,
          );
        default:
          throw StateError('Unexpected state after start: $state');
      }
    });
  }

  Future<Authenticated> _verifyOtp({
    required cloud.SmsSessionVerifyCode state,
    required String code,
  }) {
    return _flowController.capture(() async {
      final cloud.SmsSessionSuccess success = await _hub
          .cloud
          .authentication
          .sms
          .verifyCode(state: state, code: code);
      await _hub.secureStorage.write('cork', success.identityToken);
      _hub.localStorage.write('userId', success.user.userId);
      return Authenticated(user: success.user.toCelest());
    });
  }

  Future<SmsNeedsVerification> _resendOtp({
    required cloud.SmsSessionVerifyCode state,
  }) {
    return _flowController.capture(() async {
      state = await _hub.cloud.authentication.sms.resendCode(state: state);
      return _SmsNeedsVerification(
        flow: this,
        innerState: state,
        phoneNumber: state.phoneNumber,
      );
    });
  }

  Future<AuthState> _confirm({required cloud.SmsSessionRegisterUser state}) {
    return _flowController.capture(() async {
      final cloud.SmsSessionState newState = await _hub.cloud.authentication.sms
          .confirm(state: state);
      switch (newState) {
        case cloud.SmsSessionSuccess(:final identityToken, :final user):
          await _hub.secureStorage.write('cork', identityToken);
          _hub.localStorage.write('userId', user.userId);
          return Authenticated(user: user.toCelest());
        case cloud.SmsSessionRegisterUser(:final user):
          return _SmsRegisterUser(
            user: user.toCelest(),
            flow: this,
            innerState: newState,
          );
        case cloud.SmsSessionVerifyCode():
          return _SmsNeedsVerification(
            flow: this,
            innerState: newState,
            phoneNumber: newState.phoneNumber,
          );
      }
    });
  }

  @override
  void cancel() => _flowController.cancel();
}

final class _SmsNeedsVerification extends SmsNeedsVerification {
  _SmsNeedsVerification({
    required SmsFlow flow,
    required this.innerState,
    required super.phoneNumber,
  }) : _flow = flow;

  final SmsFlow _flow;
  final cloud.SmsSessionVerifyCode innerState;

  @override
  Future<void> resend() async {
    await _flow._resendOtp(state: innerState);
  }

  @override
  Future<User> verify({required String otpCode}) async {
    final Authenticated authenticated = await _flow._verifyOtp(
      state: innerState,
      code: otpCode,
    );
    return authenticated.user;
  }

  @override
  void cancel() => _flow.cancel();
}

final class _SmsRegisterUser extends AuthRegisterUser {
  _SmsRegisterUser({
    required super.user,
    required SmsFlow flow,
    required cloud.SmsSessionRegisterUser innerState,
  }) : _flow = flow,
       _innerState = innerState;

  final SmsFlow _flow;
  final cloud.SmsSessionRegisterUser _innerState;

  @override
  void cancel() => _flow.cancel();

  @override
  Future<User> confirm() async {
    final authenticated =
        await _flow._confirm(state: _innerState) as Authenticated;
    return authenticated.user;
  }
}
