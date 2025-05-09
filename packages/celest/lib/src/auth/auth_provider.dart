import 'package:celest/celest.dart';
import 'package:celest/src/config/config_values.dart';

/// {@template celest.auth.auth_provider}
/// An authentication provider which can be used to sign in to Celest.
///
/// Currently, Celest supports the following authentication methods:
///
/// - [AuthProvider.email] Email sign-in with OTP codes.
/// - [ExternalAuthProvider.firebase] Firebase as an external identity provider.
/// - [ExternalAuthProvider.supabase] Supabase as an external identity provider.
/// {@endtemplate}
sealed class AuthProvider {
  /// {@macro celest.auth.auth_provider}
  const AuthProvider();

  /// A provider which enables email sign-in with OTP codes.
  const factory AuthProvider.email() = _EmailAuthProvider;
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
  const factory ExternalAuthProvider.firebase() = _FirebaseExternalAuthProvider;

  /// A provider which enables Supabase as an external identity provider.
  ///
  /// When using Supabase as your identity provider, users are managed entirely
  /// by Supabase. This provider is useful when you want to use Supabase's
  /// authentication system to manage your users.
  ///
  /// If [jwtSecret] is provided, it will be used to verify the JWT token.
  /// Otherwise, a request will be made to the Supabase server to fetch the
  /// user's information.
  const factory ExternalAuthProvider.supabase({secret? jwtSecret}) =
      _SupabaseExternalAuthProvider;
}

final class _EmailAuthProvider extends AuthProvider {
  const _EmailAuthProvider();
}

final class _FirebaseExternalAuthProvider extends ExternalAuthProvider {
  const _FirebaseExternalAuthProvider({
    // ignore: unused_element_parameter
    this.projectId = const env('FIREBASE_PROJECT_ID'),
  });

  final env projectId;
}

final class _SupabaseExternalAuthProvider extends ExternalAuthProvider {
  const _SupabaseExternalAuthProvider({
    // ignore: unused_element_parameter
    this.url = const env('SUPABASE_URL'),
    this.jwtSecret,
  });

  final env url;
  final secret? jwtSecret;
}
