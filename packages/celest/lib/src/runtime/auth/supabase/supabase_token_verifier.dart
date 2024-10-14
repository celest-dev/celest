import 'dart:convert';
import 'dart:typed_data';

import 'package:celest/celest.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/auth/jwt/base64_raw_url.dart';
import 'package:crypto_keys/crypto_keys.dart'
    show AlgorithmIdentifier, Signature, SymmetricKey;

/// {@template celest.runtime.supabase_token_verifier}
/// Verifies access tokens issued by Supabase by issuing a request to the
/// Supabase `/auth/v1/user` endpoint.
/// {@endtemplate}
final class SupabaseTokenVerifier {
  /// Creates an instance of [SupabaseTokenVerifier] for the Supabase project
  /// at the given [url].
  SupabaseTokenVerifier({
    required String url,
    Uint8List? jwtSecret,
  })  : _userUri = Uri.parse(url).resolve('./auth/v1/user'),
        _jwtSecret = switch (jwtSecret) {
          final secret? => SymmetricKey(keyValue: secret),
          _ => null,
        };

  final Uri _userUri;
  final SymmetricKey? _jwtSecret;
  static final _decoder = utf8.decoder.fuse(json.decoder);

  Object? _decodeJwtPart(String part) {
    final decoded = base64RawUrl.decode(part);
    return _decoder.convert(decoded);
  }

  User? _verifyLocally(String token) {
    final jwtSecret = _jwtSecret;
    if (jwtSecret == null) {
      return null;
    }
    final (header, payload, signature) = switch (token.split('.')) {
      [final header, final payload, final signature] => (
          header,
          payload,
          signature
        ),
      _ => throw const FormatException('Invalid JWT format'),
    };
    final alg = switch (_decodeJwtPart(header)) {
      {
        'alg': final String alg,
      } =>
        AlgorithmIdentifier.getByJwaName(alg),
      _ => throw const FormatException('Invalid JWT header'),
    };
    if (alg == null || alg.name != 'sig/HMAC/SHA-256') {
      throw FormatException('Invalid JWT algorithm: $alg');
    }
    final data = utf8.encode('$header.$payload');
    final verifier = jwtSecret.createVerifier(alg);
    final validSignature = verifier.verify(
      data,
      Signature(base64RawUrl.decode(signature)),
    );
    if (!validSignature) {
      throw const CloudException.unauthorized(message: 'Invalid JWT signature');
    }
    final claims = switch (_decodeJwtPart(payload)) {
      final Map<String, Object?> payload => payload,
      _ => throw const FormatException('Invalid JWT payload'),
    };
    return User(
      userId: claims['sub'] as String,
      emails: switch (claims['email'] as String?) {
        final email? => [Email(email: email)],
        _ => const [],
      },
    );
  }

  /// Verifies the given [token] and returns the authenticated user.
  Future<User> verify(String token) async {
    if (_verifyLocally(token) case final user?) {
      return user;
    }
    context.logger.fine('Local Supabase verification skipped');
    final response = await context.httpClient.get(
      _userUri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw CloudException.fromHttpResponse(response);
    }
    try {
      final jsonResp = jsonDecode(response.body) as Map<String, Object?>;
      if (jsonResp case {'user': final Map<String, Object?> user}) {
        final userId = user['id'] as String;
        final email = user['email'] as String?;
        final emailVerified =
            (user['email_confirmed_at'] ?? user['confirmed_at']) != null;
        return User(
          userId: userId,
          emails: email != null
              ? [Email(email: email, isVerified: emailVerified)]
              : const [],
        );
      }
      // Shouldn't ever happened for a well-formed response.
      throw FormatException('Bad user JSON: $jsonResp');
    } on Object catch (e, st) {
      context.logger.severe('Failed to parse Supabase response', e, st);
      rethrow;
    }
  }
}
