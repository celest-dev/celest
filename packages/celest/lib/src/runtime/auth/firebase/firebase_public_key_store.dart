@internal
library;

import 'dart:async';
import 'dart:convert';

import 'package:celest/src/core/context.dart';
import 'package:celest_core/celest_core.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:x509/x509.dart' hide AlgorithmIdentifier;

/// A store for public keys for cryptographic verification.
final class FirebasePublicKeyStore {
  static final Uri _publicKeysUri = Uri.parse(
    'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com',
  );
  static final Logger _logger = Logger('PublicKeyStore');

  /// Returns the public key for the given [keyId].
  Future<PublicKey> get(String keyId) async {
    final Map<String, X509Certificate> publicKeys =
        _publicKeys ??= await _loadPublicKeys();
    final X509Certificate? certificate = publicKeys[keyId];
    if (certificate == null) {
      throw CloudException.unauthorized(message: 'Invalid JWT key ID: $keyId');
    }
    if (certificate.tbsCertificate.validity?.notAfter case final notAfter?) {
      Timer(notAfter.difference(DateTime.now()), () {
        _logger.info('Firebase certificate "$keyId" expired. Reloading...');
        _publicKeys = null;
      });
    }
    return certificate.publicKey;
  }

  Map<String, X509Certificate>? _publicKeys;
  Future<Map<String, X509Certificate>> _loadPublicKeys() async {
    try {
      final http.Response response = await context.httpClient.get(
        _publicKeysUri,
      );
      if (response.statusCode != 200) {
        throw http.ClientException(
          'Failed to load public keys: ${response.statusCode}\n'
          '${response.body}',
          _publicKeysUri,
        );
      }
      final Object? body = jsonDecode(response.body);
      if (body is! Map<String, Object?>) {
        throw FormatException(
          'Invalid public keys response: $body\n'
          'Expected Map, got ${body.runtimeType}',
        );
      }
      if (body.isEmpty) {
        throw const FormatException('No public keys found');
      }
      final certificates = <String, X509Certificate>{};
      for (final MapEntry<String, Object?> entry in body.entries) {
        final String key = entry.key;
        final Object? value = entry.value;
        if (value is! String) {
          throw FormatException(
            'Invalid public key "$key": $value\n'
            'Expected String, got ${value.runtimeType}',
          );
        }
        certificates[key] = switch (parsePem(value).toList()) {
          [final X509Certificate certificate] => certificate,
          final List<Object?> unknown =>
            throw FormatException(
              'Invalid public key "$key": $value\n'
              'Expected single certificate, got $unknown',
            ),
        };
      }
      return certificates;
    } on Object catch (e, st) {
      _logger.severe('Failed to load public keys', e, st);
      throw CloudException.internalServerError(
        message: 'Failed to load public keys',
      );
    }
  }
}
