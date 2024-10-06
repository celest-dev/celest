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
  /// [clientId], [teamId], [keyId], and [privateKey] are required to
  /// authenticate with Apple.
  const factory AuthProvider.apple({
    required secret clientId,
    required secret teamId,
    required secret keyId,
    required secret privateKey,
  }) = _AppleAuthProvider;
}

/// {@template celest.auth.external_auth_provider}
/// An external authentication provider which can be used to sign in to Celest.
///
/// External auth providers can be used to managed users outside of Celest.
/// Users sign in through the external provider and are authenticated to Celest
/// by passing the ID token to `celest.auth`.
/// {@endtemplate}
sealed class ExternalAuthProvider implements AuthProvider {
  /// {@macro celest.auth.external_auth_provider}
  const ExternalAuthProvider();

  /// A provider which enables Firebase as an external identity provider.
  ///
  /// When using Firebase as your identity provider, users are managed entirely
  /// by Firebase. This provider is useful when you want to use Firebase's
  /// authentication system to manage your users.
  ///
  /// You may specify a custom environment variable for the [projectId] if
  /// desired. If not provided, a default environment variable will be created
  /// for you.
  const factory ExternalAuthProvider.firebase({
    env projectId,
  }) = _FirebaseExternalAuthProvider;

  /// A provider which enables Supabase as an external identity provider.
  ///
  /// When using Supabase as your identity provider, users are managed entirely
  /// by Supabase. This provider is useful when you want to use Supabase's
  /// authentication system to manage your users.
  ///
  /// You may specify a custom secret value for the [jwtSecret] if desired. If
  /// not provided, a default secret will be created for you.
  const factory ExternalAuthProvider.supabase({
    secret jwtSecret,
  }) = _SupabaseExternalAuthProvider;
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
    required this.privateKey,
  });

  final secret clientId;
  final secret teamId;
  final secret keyId;
  final secret privateKey;
}

final class _FirebaseExternalAuthProvider extends ExternalAuthProvider {
  const _FirebaseExternalAuthProvider({
    this.projectId = const env('FIREBASE_PROJECT_ID'),
  });

  final env projectId;
}

final class _SupabaseExternalAuthProvider extends ExternalAuthProvider {
  const _SupabaseExternalAuthProvider({
    this.jwtSecret = const secret('SUPABASE_JWT_SECRET'),
  });

  final secret jwtSecret;
}
