import 'dart:async';

import 'package:celest/src/runtime/auth/auth_middleware.dart';
import 'package:celest/src/runtime/auth/firebase/firebase_token_verifier.dart';
import 'package:celest_core/celest_core.dart' show User;
import 'package:collection/collection.dart';
import 'package:shelf/shelf.dart' show Request;

/// {@template celest.runtime.firebase_auth_middleware}
/// A Celest authentication middleware which authenticates users with Firebase
/// Auth as the external auth provider.
/// {@endtemplate}
final class FirebaseAuthMiddleware extends AuthMiddleware {
  /// {@macro celest.runtime.firebase_auth_middleware}
  factory FirebaseAuthMiddleware({
    required String projectId,
    bool required = false,
  }) {
    final tokenVerifier = FirebaseTokenVerifier(
      projectId: projectId,
    );
    return FirebaseAuthMiddleware._(
      tokenVerifier: tokenVerifier,
      required: required,
    );
  }

  const FirebaseAuthMiddleware._({
    required this.required,
    required FirebaseTokenVerifier tokenVerifier,
  }) : _tokenVerifier = tokenVerifier;

  final FirebaseTokenVerifier _tokenVerifier;

  @override
  final bool required;

  @override
  Future<User?> authenticate(Request request) async {
    final token = switch (request.headers['Authorization']?.split(' ')) {
      [final type, final token] when equalsIgnoreAsciiCase(type, 'bearer') =>
        token,
      _ => null,
    };
    if (token == null) {
      return null;
    }
    return _tokenVerifier.verify(token);
  }
}
