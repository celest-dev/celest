import 'package:celest_core/celest_core.dart';

sealed class AuthState {
  const AuthState();
}

final class Unauthenticated extends AuthState {
  const Unauthenticated();
}

sealed class AuthFlowInProgress extends AuthState {
  const AuthFlowInProgress();

  void cancel();
}

abstract class EmailNeedsVerification extends AuthFlowInProgress {
  const EmailNeedsVerification({
    required this.email,
  });

  final String email;

  Future<void> resend();
  Future<User> verifyOtp(String otp);
}

final class AuthenticatedWithEmail extends Authenticated {
  const AuthenticatedWithEmail(super.user);
}

final class Authenticated extends AuthState {
  const Authenticated(this.user);

  final User user;
}
