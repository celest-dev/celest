import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:celest/src/runtime/auth/firebase/firebase_public_key_store.dart';
import 'package:celest/src/runtime/auth/jwt/base64_raw_url.dart';
import 'package:celest_core/celest_core.dart' show CloudException, Email, User;
import 'package:crypto_keys/crypto_keys.dart'
    show AlgorithmIdentifier, PublicKey, Signature, Verifier;

/// {@template celest.runtime.firebase_token_verifier}
/// Verifies ID tokens issued by Firebase by validating the JWT signature
/// using the public keys provided by Google.
/// {@endtemplate}
final class FirebaseTokenVerifier {
  /// {@macro celest.runtime.firebase_token_verifier}
  FirebaseTokenVerifier({required String projectId})
    : _projectId = projectId,
      _issuer = 'https://securetoken.google.com/$projectId';

  final String _projectId;
  final String _issuer;

  static final FirebasePublicKeyStore _publicKeysStore =
      FirebasePublicKeyStore();
  static final _decoder = utf8.decoder.fuse(json.decoder);

  Object? _decodeJwtPart(String part) {
    final Uint8List decoded = base64RawUrl.decode(part);
    return _decoder.convert(decoded);
  }

  /// Verifies the given [token] and returns the user identified by the token.
  Future<User> verify(String token) async {
    final (String header, String payload, String signature) = switch (token
        .split('.')) {
      [final String header, final String payload, final String signature] => (
        header,
        payload,
        signature,
      ),
      _ => throw const FormatException('Invalid JWT format'),
    };
    final (String keyId, String alg) = switch (_decodeJwtPart(header)) {
      {'kid': final String keyId, 'alg': final String alg} => (keyId, alg),
      _ => throw const FormatException('Invalid JWT header'),
    };
    final PublicKey publicKey = await _publicKeysStore.get(keyId);
    final AlgorithmIdentifier? algorithm = AlgorithmIdentifier.getByJwaName(
      alg,
    );
    if (algorithm == null) {
      throw CloudException.unauthorized(message: 'Invalid JWT algorithm: $alg');
    }
    final Verifier<PublicKey> verifier = publicKey.createVerifier(algorithm);
    final Uint8List data = utf8.encode('$header.$payload');
    final bool validSignature = verifier.verify(
      data,
      Signature(base64RawUrl.decode(signature)),
    );
    if (!validSignature) {
      throw const CloudException.unauthorized(message: 'Invalid JWT signature');
    }
    final Map<String, Object?> claims = switch (_decodeJwtPart(payload)) {
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
