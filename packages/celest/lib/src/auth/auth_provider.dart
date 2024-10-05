import 'package:celest/src/config/env.dart';

/// {@template celest.auth.auth_provider}
/// An authentication provider which can be used to sign in to Celest.
///
/// Currently, Celest supports the following authentication methods:
/// - [AuthProvider.email] Email sign-in with OTP codes.
/// - [AuthProvider.sms] SMS sign-in with OTP codes.
/// {@endtemplate}
sealed class AuthProvider {
  /// {@macro celest.auth.auth_provider}
  const AuthProvider();

  /// A provider which enables email sign-in with OTP codes.
  const factory AuthProvider.email() = _EmailAuthProvider;

  /// A provider which enables SMS sign-in with OTP codes.
  const factory AuthProvider.sms() = _SmsAuthProvider;

  /// A provider which enables GitHub sign-in.
  ///
  /// [clientId] and [clientsecret] are required to authenticate with GitHub.
  const factory AuthProvider.gitHub({
    required secret clientId,
    required secret clientsecret,
  }) = _GitHubAuthProvider;

  /// A provider which enables Google sign-in.
  ///
  /// [clientId] and [clientsecret] are required to authenticate with Google.
  const factory AuthProvider.google({
    required secret clientId,
    required secret clientsecret,
  }) = _GoogleAuthProvider;

  /// A provider which enables Sign In with Apple.
  ///
  /// [clientId], [teamId], [keyId], and [key] are required to authenticate
  /// with Apple.
  const factory AuthProvider.apple({
    required secret clientId,
    required secret teamId,
    required secret keyId,
    required secret key,
  }) = _AppleAuthProvider;
}

final class _EmailAuthProvider extends AuthProvider {
  const _EmailAuthProvider();
}

final class _SmsAuthProvider extends AuthProvider {
  const _SmsAuthProvider();
}

final class _GitHubAuthProvider extends AuthProvider {
  const _GitHubAuthProvider({
    required this.clientId,
    required this.clientsecret,
  });

  final secret clientId;
  final secret clientsecret;
}

final class _GoogleAuthProvider extends AuthProvider {
  const _GoogleAuthProvider({
    required this.clientId,
    required this.clientsecret,
  });

  final secret clientId;
  final secret clientsecret;
}

final class _AppleAuthProvider extends AuthProvider {
  const _AppleAuthProvider({
    required this.clientId,
    required this.teamId,
    required this.keyId,
    required this.key,
  });

  final secret clientId;
  final secret teamId;
  final secret keyId;
  final secret key;
}
