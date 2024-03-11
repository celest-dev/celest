import 'package:celest_core/celest_core.dart';

/// The current state of authentication.
sealed class AuthState {
  const AuthState();
}

/// There is no user authenticated currently.
final class Unauthenticated extends AuthState {
  const Unauthenticated();
}

/// There is an ongoing authentication flow.
///
/// To stop the flow, call [cancel].
sealed class AuthFlowInProgress extends AuthState {
  const AuthFlowInProgress();

  void cancel();
}

/// The user is in the process of authenticating with their email.
abstract class EmailNeedsVerification extends AuthFlowInProgress {
  const EmailNeedsVerification({
    required this.email,
  });

  final String email;

  Future<void> resend();
  Future<User> verify({required String otpCode});
}

/// The [user] is authenticated and their identity has been verified.
final class Authenticated extends AuthState {
  const Authenticated({
    required this.user,
  });

  final User user;
}
