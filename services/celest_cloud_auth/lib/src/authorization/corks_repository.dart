import 'dart:typed_data';

import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/authentication/authentication_model.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database.dart';
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart' as drift;
import 'package:celest_cloud_auth/src/util/typeid.dart';
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
  Future<Cork> createUserCork({
    required User user,
    EntityUid? audience,
  }) async {
    final corkId = TypeId<Cork>().uuid.value;
    final userEntity = Entity(
      uid: EntityUid.of('Celest::User', user.userId),
      parents: [
        ...user.roles,
        issuer,
      ],
      attributes: RecordValue.fromJson(user.toJson()).attributes,
    );
    final corkBuilder = CedarCork.builder(corkId)
      ..bearer = EntityUid.of('Celest::User', user.userId)
      ..issuer = issuer
      ..audience = audience ?? issuer
      ..claims = userEntity;
    final hmacKey = _cryptoKeys.rootKey;
    final cork = await corkBuilder.build().sign(hmacKey.signer);
    await _db.transaction(() async {
      await _db.createEntity(userEntity);
      await _db.authDrift.createCork(
        corkId: corkId,
        cryptoKeyId: hmacKey.cryptoKeyId,
        bearerType: 'Celest::User',
        bearerId: user.userId,
        expireTime: DateTime.timestamp().add(const Duration(days: 30)),
      );
    });
    return cork;
  }

  /// Creates a new cork for the given [session].
  Future<Cork> createSessionCork({
    required Session session,
  }) async {
    final cryptoKey = await _cryptoKeys.getOrMintHmacKey(
      cryptoKeyId: session.cryptoKeyId,
    );
    final sessionUid = EntityUid.of(
      'Celest::Session',
      session.sessionId.encoded,
    );
    final sessionEntity = Entity(
      uid: sessionUid,
      parents: [
        if (session.userId case final userId?)
          EntityUid.of('Celest::User', userId),
      ],
      attributes: {
        'expireTime': Value.integer(
          session.expireTime.millisecondsSinceEpoch ~/ 1000,
        ),
      },
    );
    final corkBuilder = CedarCork.builder(cryptoKey.cryptoKeyId)
      ..bearer = sessionUid
      ..issuer = issuer
      ..audience = issuer
      ..claims = sessionEntity;
    final cork = await corkBuilder.build().sign(cryptoKey.signer);
    await _db.transaction(() async {
      await _db.createEntity(sessionEntity);
      await _db.authDrift.createCork(
        corkId: cork.id,
        cryptoKeyId: session.cryptoKeyId,
        bearerType: sessionUid.type,
        bearerId: sessionUid.id,
        expireTime: session.expireTime,
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
