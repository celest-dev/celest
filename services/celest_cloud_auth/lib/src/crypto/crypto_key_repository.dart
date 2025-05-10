import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/util/random_bytes.dart';
import 'package:drift/drift.dart';

typedef _Deps = ({CloudAuthDatabaseMixin db, CryptoKey rootKey});

extension type CryptoKeyRepository._(_Deps _deps) implements Object {
  static Future<CryptoKeyRepository> create({
    required CloudAuthDatabaseMixin db,
    CryptoKey? rootKey,
  }) async {
    rootKey ??= LocalCryptoKey(
      cryptoKeyId: secureRandomBytes(16),
      keyPurpose: KeyPurpose.signing,
      keyAlgorithm: KeyAlgorithm.hmacSha256,
      keyMaterial: secureRandomBytes(32),
    );
    rootKey =
        (await db.cloudAuth.cloudAuthCoreDrift.createCryptoKey(
          cryptoKeyId: rootKey.cryptoKeyId,
          keyPurpose: rootKey.keyPurpose.name,
          keyAlgorithm: rootKey.keyAlgorithm.name,
          keyMaterial: rootKey.keyMaterial,
        )).first;
    return CryptoKeyRepository._((db: db, rootKey: rootKey));
  }

  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;
  CryptoKey get rootKey => _deps.rootKey;

  Future<CryptoKey> getKey({required Uint8List cryptoKeyId}) async {
    return _db.cloudAuthCoreDrift
        .getCryptoKey(cryptoKeyId: cryptoKeyId)
        .getSingle();
  }

  Future<CryptoKey> insertKey({
    required CryptoKey cryptoKey,
    Batch? batch,
  }) async {
    final result = await _db.cloudAuthCoreDrift.createCryptoKey(
      cryptoKeyId: cryptoKey.cryptoKeyId,
      keyPurpose: cryptoKey.keyPurpose.name,
      keyAlgorithm: cryptoKey.keyAlgorithm.name,
      keyMaterial: cryptoKey.keyMaterial,
      externalCryptoKeyId: cryptoKey.externalCryptoKeyId,
    );
    return result.first;
  }

  Future<CryptoKey> getOrMintHmacKey({required Uint8List cryptoKeyId}) async {
    final key =
        await _db.cloudAuthCoreDrift
            .getCryptoKey(cryptoKeyId: cryptoKeyId)
            .getSingleOrNull();
    return key ?? mintHmacKey(cryptoKeyId: cryptoKeyId);
  }

  Future<CryptoKey> mintHmacKey({required Uint8List cryptoKeyId}) async {
    final key = LocalCryptoKey(
      cryptoKeyId: cryptoKeyId,
      keyPurpose: KeyPurpose.signing,
      keyAlgorithm: KeyAlgorithm.hmacSha256,
      keyMaterial: secureRandomBytes(32),
    );
    return insertKey(cryptoKey: key);
  }
}
