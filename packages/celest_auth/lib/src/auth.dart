import 'dart:async';

import 'package:celest_auth/celest_auth.dart';

/// Coordinates and delegates to the various auth flows to orchestrate
/// authentication activities.
///
/// This class can be accessed in generated code via `celest.auth`.
abstract interface class Auth {
  /// **NOTE**: Must be called before any other getters or methods are accessed.
  ///
  /// Initializes Celest Auth, returning the initial [AuthState].
  ///
  /// When using external auth providers, the [externalAuth] parameter should be
  /// provided to configure the token sources for the external auth providers.
  /// The property only needs to be passed once, but passing it again will
  /// update the token sources.
  Future<AuthState> init({TokenSource? externalAuth});

  /// Changes to the authentication state over time.
  ///
  /// The first state emitted from this stream when the app is starting is the
  /// current authentication state, either [Unauthenticated] or [Authenticated].
  /// This is the same state returned from [init].
  Stream<AuthState> get authStateChanges;

  /// Signs out the current user, if any.
  Future<void> signOut();

  /// Closes the Auth plugin.
  Future<void> close();
}
