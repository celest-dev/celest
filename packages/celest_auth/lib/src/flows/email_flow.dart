import 'dart:async';

import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/model/cloud_interop.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:celest_core/celest_core.dart';

extension type Email(AuthImpl _hub) {
  /// Authenticates a user with the given [email] using a one-time password
  /// (OTP) sent to that email.
  ///
  /// OTP codes are valid for 15 minutes and can be resent after 30 seconds
  /// by calling `resend` on the returned state object.
  Future<EmailNeedsVerification> authenticate({required String email}) async {
    final AuthFlowController flowController = await _hub.requestFlow();
    final flow = EmailFlow._(_hub, flowController);
    return flow._authenticate(email: email);
  }
}

final class EmailFlow implements AuthFlow {
  EmailFlow._(this._hub, this._flowController);

  final AuthImpl _hub;
  final AuthFlowController _flowController;

  Future<EmailNeedsVerification> _authenticate({required String email}) {
    return _flowController.capture(() async {
      final cloud.EmailSessionState state = await _hub
          .cloud
          .authentication
          .email
          .start(email: email);
      switch (state) {
        case cloud.EmailSessionVerifyCode():
          return _EmailNeedsVerification(
            flow: this,
            innerState: state,
            email: state.email,
          );
        default:
          throw StateError('Unexpected state after start: $state');
      }
    });
  }

  Future<Authenticated> _verifyOtp({
    required cloud.EmailSessionVerifyCode state,
    required String code,
  }) {
    return _flowController.capture(() async {
      final cloud.EmailSessionSuccess success = await _hub
          .cloud
          .authentication
          .email
          .verifyCode(state: state, code: code);
      await _hub.secureStorage.write('cork', success.identityToken);
      _hub.localStorage.write('userId', success.user.userId);
      return Authenticated(user: success.user.toCelest());
    });
  }

  Future<EmailNeedsVerification> _resendOtp({
    required cloud.EmailSessionVerifyCode state,
  }) {
    return _flowController.capture(() async {
      state = await _hub.cloud.authentication.email.resendCode(state: state);
      return _EmailNeedsVerification(
        flow: this,
        innerState: state,
        email: state.email,
      );
    });
  }

  Future<AuthState> _confirm({required cloud.EmailSessionRegisterUser state}) {
    return _flowController.capture(() async {
      final cloud.EmailSessionState newState = await _hub
          .cloud
          .authentication
          .email
          .confirm(state: state);
      switch (newState) {
        case cloud.EmailSessionSuccess(:final identityToken, :final user):
          await _hub.secureStorage.write('cork', identityToken);
          _hub.localStorage.write('userId', user.userId);
          return Authenticated(user: user.toCelest());
        case cloud.EmailSessionRegisterUser(:final user):
          return _EmailRegisterUser(
            user: user.toCelest(),
            flow: this,
            innerState: newState,
          );
        case cloud.EmailSessionVerifyCode():
          return _EmailNeedsVerification(
            flow: this,
            innerState: newState,
            email: state.email,
          );
      }
    });
  }

  @override
  void cancel() => _flowController.cancel();
}

final class _EmailNeedsVerification extends EmailNeedsVerification {
  _EmailNeedsVerification({
    required EmailFlow flow,
    required this.innerState,
    required super.email,
  }) : _flow = flow;

  final EmailFlow _flow;
  final cloud.EmailSessionVerifyCode innerState;

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

final class _EmailRegisterUser extends AuthRegisterUser {
  _EmailRegisterUser({
    required super.user,
    required EmailFlow flow,
    required cloud.EmailSessionRegisterUser innerState,
  }) : _flow = flow,
       _innerState = innerState;

  final EmailFlow _flow;
  final cloud.EmailSessionRegisterUser _innerState;

  @override
  void cancel() => _flow.cancel();

  @override
  Future<User> confirm() async {
    final authenticated =
        await _flow._confirm(state: _innerState) as Authenticated;
    return authenticated.user;
  }
}
