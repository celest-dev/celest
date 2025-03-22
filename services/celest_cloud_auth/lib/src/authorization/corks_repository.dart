import 'dart:typed_data';

import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/authentication/authentication_model.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database.dart';
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart' as drift;
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_core/celest_core.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:drift/drift.dart' as drift;

typedef _Dependencies = ({
  EntityUid issuer,
  AuthDatabase db,
  CryptoKeyRepository cryptoKeys,
});

extension type CorksRepository._(_Dependencies _deps) implements Object {
  CorksRepository({
    required EntityUid issuer,
    required AuthDatabase db,
    required CryptoKeyRepository cryptoKeys,
  }) : this._(
          (
            issuer: issuer,
            db: db,
            cryptoKeys: cryptoKeys,
          ),
        );

  EntityUid get issuer => _deps.issuer;
  AuthDatabase get _db => _deps.db;
  CryptoKeyRepository get _cryptoKeys => _deps.cryptoKeys;

  Future<drift.Cork?> getCork({
    required Uint8List corkId,
  }) async {
    return _db.authDrift.getCork(corkId: corkId).getSingleOrNull();
  }

  /// Creates a new cork for the given [user].
  Future<Cork> createCork({
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
      await _db.authDrift.upsertCork(
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
    return cork;
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
      final query = _db.update(_db.authDrift.corks)
        ..where((tbl) => tbl.corkId.equals(cork.id));
      await query.write(
        drift.CorksCompanion(
          lastUseTime: drift.Value(DateTime.timestamp()),
        ),
      );
    } on Object catch (e, st) {
      context.logger.severe('Failed to update cork', e, st);
    }
  }
}
