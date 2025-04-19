import 'dart:typed_data';

import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_core.drift.dart'
    as drift;
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_core/celest_core.dart';
import 'package:clock/clock.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:drift/drift.dart' as drift;

typedef _Dependencies = ({
  EntityUid issuer,
  CloudAuthDatabaseMixin db,
  CryptoKeyRepository cryptoKeys,
});

extension type CorksRepository._(_Dependencies _deps) implements Object {
  CorksRepository({
    required EntityUid issuer,
    required CloudAuthDatabaseMixin db,
    required CryptoKeyRepository cryptoKeys,
  }) : this._(
          (
            issuer: issuer,
            db: db,
            cryptoKeys: cryptoKeys,
          ),
        );

  EntityUid get issuer => _deps.issuer;
  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;
  CryptoKeyRepository get _cryptoKeys => _deps.cryptoKeys;

  Future<drift.CloudAuthCork?> getCork({
    required Uint8List corkId,
  }) async {
    return _db.cloudAuthCoreDrift.getCork(corkId: corkId).getSingleOrNull();
  }

  /// Creates a new cork for the given [user].
  Future<CedarCork> createCork({
    required Session session,
    required User user,
    EntityUid? audience,
  }) async {
    audience ??= issuer;
    final cryptoKey = await _cryptoKeys.getOrMintHmacKey(
      cryptoKeyId: session.cryptoKeyId,
    );
    final userEntity = user.toEntity(parents: [issuer]);

    final sessionUid = EntityUid.of(
      'Celest::Session',
      session.sessionId.encoded,
    );
    final expireTime = session.expireTime;
    final sessionEntity = Entity(
      uid: sessionUid,
      parents: [
        userEntity.uid,
      ],
      attributes: {
        'expireTime': Value.integer(expireTime.millisecondsSinceEpoch ~/ 1000),
      },
    );

    final corkBuilder = CedarCork.builder(session.sessionId.uuid.value)
      ..bearer = sessionEntity.uid
      ..audience = audience
      ..issuer = issuer
      ..claims = sessionEntity;
    final cork = await corkBuilder.build().sign(cryptoKey.signer);
    await _db.transaction(() async {
      await _db.createEntity(userEntity);
      await _db.createEntity(sessionEntity);
      await _db.cloudAuthCoreDrift.upsertCork(
        corkId: cork.id,
        cryptoKeyId: cryptoKey.cryptoKeyId,
        bearerType: sessionUid.type,
        bearerId: sessionUid.id,
        audienceType: audience!.type,
        audienceId: audience.id,
        issuerType: issuer.type,
        issuerId: issuer.id,
        expireTime: expireTime,
      );
    });
    return CedarCork(cork);
  }

  /// Verifies the given [cork].
  Future<void> verify({
    required Cork cork,
  }) async {
    final corkData = await getCork(corkId: cork.id);
    if (corkData == null) {
      throw const UnauthorizedException('Invalid cork');
    }
    recordUse(cork: cork);
    final corkKey = await _cryptoKeys.getKey(
      cryptoKeyId: corkData.cryptoKeyId,
    );
    await cork.verify(corkKey.signer);
  }

  /// Records usage of the given [cork] in the database.
  void recordUse({
    required Cork cork,
  }) async {
    try {
      final query = _db.update(_db.cloudAuthCorks)
        ..where((tbl) => tbl.corkId.equals(cork.id));
      await query.write(
        drift.CloudAuthCorksCompanion(
          lastUseTime: drift.Value(clock.now()),
        ),
      );
    } on Object catch (e, st) {
      context.logger.severe('Failed to update cork', e, st);
    }
  }
}
