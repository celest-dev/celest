@internal
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:corks_cedar/corks_cedar.dart';
import 'package:meta/meta.dart';

enum KeyPurpose {
  encryption('ENCRYPT_DECRYPT'),
  signing('ASYMMETRIC_SIGN'),
  mac('MAC');

  const KeyPurpose(this.name);

  final String name;
}

enum KeyAlgorithm {
  hmacSha256('HMAC_SHA256'),
  aesGcm('AES_256_GCM'),
  ed25519('EC_SIGN_ED25519');

  const KeyAlgorithm(this.name);

  final String name;
}

sealed class CryptoKey {
  factory CryptoKey({
    required Uint8List cryptoKeyId,
    required String keyPurpose,
    required String keyAlgorithm,
    Uint8List? keyMaterial,
    String? externalCryptoKeyId,
  }) {
    final purpose = KeyPurpose.values.firstWhere((e) => e.name == keyPurpose);
    final algorithm = KeyAlgorithm.values.firstWhere(
      (e) => e.name == keyAlgorithm,
    );
    if (keyMaterial != null) {
      return LocalCryptoKey(
        cryptoKeyId: cryptoKeyId,
        keyPurpose: purpose,
        keyAlgorithm: algorithm,
        keyMaterial: keyMaterial,
      );
    }
    return KmsCryptoKey(
      cryptoKeyId: cryptoKeyId,
      keyPurpose: purpose,
      keyAlgorithm: algorithm,
      externalCryptoKeyId: externalCryptoKeyId!,
    );
  }

  const CryptoKey._({
    required this.cryptoKeyId,
    required this.keyPurpose,
    required this.keyAlgorithm,
  });

  final Uint8List cryptoKeyId;
  final KeyPurpose keyPurpose;
  final KeyAlgorithm keyAlgorithm;
  Uint8List? get keyMaterial => null;
  String? get externalCryptoKeyId => null;

  Signer get signer;

  @override
  String toString() =>
      'CryptoKey(${keyPurpose.name}): keyId=${base64Encode(cryptoKeyId)}';
}

final class LocalCryptoKey extends CryptoKey {
  const LocalCryptoKey({
    required super.cryptoKeyId,
    required super.keyPurpose,
    required super.keyAlgorithm,
    required this.keyMaterial,
  }) : super._();

  @override
  final Uint8List keyMaterial;

  @override
  Signer get signer => Signer(cryptoKeyId, keyMaterial);
}

final class KmsCryptoKey extends CryptoKey {
  const KmsCryptoKey({
    required super.cryptoKeyId,
    required super.keyPurpose,
    required super.keyAlgorithm,
    required this.externalCryptoKeyId,
  }) : super._();

  @override
  final String externalCryptoKeyId;

  @override
  Signer get signer => throw UnimplementedError();

  @override
  String toString() => '${super.toString()}, externalId=$externalCryptoKeyId';
}
