import 'package:celest/src/auth/auth_provider.dart';

/// {@template celest.auth.auth}
/// The authentication component of your Celest project.
///
/// The Auth widget defines the authentication providers which can be used to
/// sign in to your Celest project.
/// {@endtemplate}
final class Auth {
  /// {@macro celest.auth.auth}
  const Auth({required this.providers});

  /// The authentication providers which can be used by your users when signing
  /// in.
  final List<AuthProvider> providers;
}
