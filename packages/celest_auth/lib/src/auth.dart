import 'dart:async';

import 'package:celest_auth/celest_auth.dart';

/// Coordinates and delegates to the various [AuthFlow] to orchestrate
/// authentication activities.
///
/// Generated Celest clients extend this class and mix in the various
/// [AuthFlow]s supported by the backend.
abstract interface class Auth {
  /// **NOTE**: Must be called before any other getters or methods are accessed.
  ///
  /// Initializes Celest Auth, returning the initial [AuthState].
  Future<AuthState> init();

  /// Changes to the authentication state over time.
  Stream<AuthState> get authStateChanges;

  /// Signs out the current user, if any.
  void signOut();
}
