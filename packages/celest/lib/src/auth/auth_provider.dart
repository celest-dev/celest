/// {@template celest.auth.auth_provider}
/// An authentication provider which can be used to sign in to Celest.
///
/// Currently, Celest supports the following authentication methods:
/// - [AuthProvider.email] Email sign-in with OTP codes.
/// {@endtemplate}
sealed class AuthProvider {
  const AuthProvider();

  /// A provider which enables email sign-in with OTP codes.
  const factory AuthProvider.email() = _EmailAuthProvider;
}

final class _EmailAuthProvider extends AuthProvider {
  const _EmailAuthProvider();
}
