import 'package:celest_core/celest_core.dart';

/// {@template celest_auth.auth_state}
/// The current state of authentication.
/// {@endtemplate}
sealed class AuthState {
  /// {@macro celest_auth.auth_state}
  const AuthState();
}

/// {@template celest_auth.unauthenticated}
/// There is no user authenticated currently.
/// {@endtemplate}
final class Unauthenticated extends AuthState {
  /// {@macro celest_auth.unauthenticated}
  const Unauthenticated();
}

/// {@template celest_auth.auth_flow_in_progress}
/// There is an ongoing authentication flow.
///
/// To stop the flow, call [cancel].
/// {@endtemplate}
sealed class AuthFlowInProgress extends AuthState {
  /// {@macro celest_auth.auth_flow_in_progress}
  const AuthFlowInProgress();

  /// Cancel the current flow.
  void cancel();
}

/// {@template celest_auth.otp_needs_verification}
/// The user is in the process of authenticating with an OTP code.
/// {@endtemplate}
abstract interface class OtpNeedsVerification implements AuthFlowInProgress {
  /// Resend the verification code.
  Future<void> resend();

  /// Verify the [otpCode] sent to the user.
  Future<User> verify({required String otpCode});
}

/// {@template celest_auth.email_needs_verification}
/// The user is in the process of authenticating with their email.
/// {@endtemplate}
abstract class EmailNeedsVerification extends AuthFlowInProgress
    implements OtpNeedsVerification {
  /// {@macro celest_auth.email_needs_verification}
  const EmailNeedsVerification({required this.email});

  /// The email address to be verified.
  final String email;
}

/// {@template celest_auth.sms_needs_verification}
/// The user is in the process of authenticating with their phone number.
/// {@endtemplate}
abstract class SmsNeedsVerification extends AuthFlowInProgress
    implements OtpNeedsVerification {
  /// {@macro celest_auth.sms_needs_verification}
  const SmsNeedsVerification({required this.phoneNumber});

  /// The phone number to be verified.
  final String phoneNumber;
}

/// {@template celest_auth.auth_link_user}
/// A user with the same identity already exists.
///
/// Call [confirm] to link the new login method to the existing account.
/// {@endtemplate}
abstract class AuthLinkUser extends AuthFlowInProgress {
  /// {@macro celest_auth.auth_link_user}
  const AuthLinkUser({required this.user});

  /// The existing user.
  final User user;

  /// Confirm the link to the existing [user].
  Future<User> confirm();
}

/// {@template celest_auth.auth_register_user}
/// A new user must be created.
///
/// Call [confirm] to complete the registration or [cancel] to stop the flow.
/// {@endtemplate}
abstract class AuthRegisterUser extends AuthFlowInProgress {
  /// {@macro celest_auth.auth_register_user}
  const AuthRegisterUser({required this.user});

  /// The user to be created.
  final User user;

  /// Confirm the creation of a new [user].
  Future<User> confirm();
}

/// {@template celest_auth.authenticated}
/// A [user] has been authenticated and their identity has been verified.
/// {@endtemplate}
final class Authenticated extends AuthState {
  /// {@macro celest_auth.authenticated}
  const Authenticated({required this.user});

  /// The authenticated user.
  final User user;
}
