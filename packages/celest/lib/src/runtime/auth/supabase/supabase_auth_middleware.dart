import 'dart:async';
import 'dart:typed_data';

import 'package:celest/src/runtime/auth/auth_middleware.dart';
import 'package:celest/src/runtime/auth/supabase/supabase_token_verifier.dart';
import 'package:celest_core/celest_core.dart' show User;
import 'package:collection/collection.dart';
import 'package:shelf/shelf.dart' show Request;

/// {@template celest.runtime.supabase_auth_middleware}
/// A Celest authentication middleware which authenticates users with Supabase
/// as the external auth provider.
/// {@endtemplate}
final class SupabaseAuthMiddleware extends AuthMiddleware {
  /// {@macro celest.runtime.supabase_auth_middleware}
  SupabaseAuthMiddleware({
    required String url,
    Uint8List? jwtSecret,
    this.required = false,
  }) : _tokenVerifier = SupabaseTokenVerifier(url: url, jwtSecret: jwtSecret);

  final SupabaseTokenVerifier _tokenVerifier;

  @override
  final bool required;

  @override
  Future<User?> authenticate(Request request) async {
    final String? token = switch (request.headers['Authorization']?.split(
      ' ',
    )) {
      [final String type, final String token]
          when equalsIgnoreAsciiCase(type, 'bearer') =>
        token,
      _ => null,
    };
    if (token == null) {
      return null;
    }
    return _tokenVerifier.verify(token);
  }
}
