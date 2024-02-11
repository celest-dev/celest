/// {@template celest.auth.auth_provider}
/// An authentication provider which can be used to sign in to Celest.
///
/// Currently, Celest supports the following authentication methods:
/// - [AuthProvider.google] Sign in with Google
/// {@endtemplate}
sealed class AuthProvider {
  const AuthProvider();

  /// A provider which enables Sign in with Google.
  const factory AuthProvider.google() = _GoogleAuthProvider;
}

final class _GoogleAuthProvider extends AuthProvider {
  const _GoogleAuthProvider();
}
