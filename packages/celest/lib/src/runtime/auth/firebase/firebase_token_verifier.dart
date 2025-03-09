import 'dart:async';
import 'dart:convert';

import 'package:celest/src/runtime/auth/firebase/firebase_public_key_store.dart';
import 'package:celest/src/runtime/auth/jwt/base64_raw_url.dart';
import 'package:celest_core/celest_core.dart' show CloudException, Email, User;
import 'package:crypto_keys/crypto_keys.dart'
    show AlgorithmIdentifier, Signature;

/// {@template celest.runtime.firebase_token_verifier}
/// Verifies ID tokens issued by Firebase by validating the JWT signature
/// using the public keys provided by Google.
/// {@endtemplate}
final class FirebaseTokenVerifier {
  /// {@macro celest.runtime.firebase_token_verifier}
  FirebaseTokenVerifier({
    required String projectId,
  })  : _projectId = projectId,
        _issuer = 'https://securetoken.google.com/$projectId';

  final String _projectId;
  final String _issuer;

  static final FirebasePublicKeyStore _publicKeysStore =
      FirebasePublicKeyStore();
  static final _decoder = utf8.decoder.fuse(json.decoder);

  Object? _decodeJwtPart(String part) {
    final decoded = base64RawUrl.decode(part);
    return _decoder.convert(decoded);
  }

  /// Verifies the given [token] and returns the user identified by the token.
  Future<User> verify(String token) async {
    final (header, payload, signature) = switch (token.split('.')) {
      [final header, final payload, final signature] => (
          header,
          payload,
          signature
        ),
      _ => throw const FormatException('Invalid JWT format'),
    };
    final (keyId, alg) = switch (_decodeJwtPart(header)) {
      {
        'kid': final String keyId,
        'alg': final String alg,
      } =>
        (keyId, alg),
      _ => throw const FormatException('Invalid JWT header'),
    };
    final publicKey = await _publicKeysStore.get(keyId);
    final algorithm = AlgorithmIdentifier.getByJwaName(alg);
    if (algorithm == null) {
      throw CloudException.unauthorized(message: 'Invalid JWT algorithm: $alg');
    }
    final verifier = publicKey.createVerifier(algorithm);
    final data = utf8.encode('$header.$payload');
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

    // Verify the issuer and audience.
    if (claims['iss'] != _issuer) {
      throw const CloudException.unauthorized(message: 'Invalid JWT issuer');
    }
    if (claims['aud'] != _projectId) {
      throw const CloudException.unauthorized(message: 'Invalid JWT audience');
    }

    return User(
      userId: claims['sub'] as String,
      emails: switch (claims['email'] as String?) {
        final email? => [
            Email(
              email: email,
              isVerified: claims['email_verified'] as bool? ?? false,
            ),
          ],
        _ => [],
      },
    );
  }
}
