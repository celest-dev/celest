// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'dart:convert';

import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/util/random_bytes.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:sqlite3/common.dart' show AllowedArgumentCount;
import 'package:test/test.dart';

import '../../tester.dart';
import '../db_functions.dart';
import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;
import 'generated/schema_v3.dart' as v3;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(
      GeneratedHelper(),
      setup: (db) => db.addHelperFunctions(),
    );
  });

  group('simple database migrations', () {
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = CloudAuthDatabase(
              schema.newConnection(),
              project: defaultProject,
            );
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  test('migration from v1 to v2', () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    final createTime = DateTime.now().millisecondsSinceEpoch / 1000.0;
    final userId = typeId<User>();
    final sessionId1 = TypeId<Session>();
    final sessionId2 = TypeId<Session>();
    final cryptoKey1 = secureRandomBytes(16);
    final cryptoKey2 = secureRandomBytes(16);

    final oldUsers = <v1.UsersData>[
      v1.UsersData(userId: userId, createTime: createTime),
    ];
    final newUsers = <v2.UsersData>[
      v2.UsersData(userId: userId, createTime: createTime),
    ];

    final oldCryptoKeys = <v1.CryptoKeysData>[
      v1.CryptoKeysData(
        cryptoKeyId: sessionId1.uuid.value,
        keyPurpose: 'MAC',
        keyAlgorithm: 'HMAC_SHA256',
        keyMaterial: cryptoKey1,
      ),
      v1.CryptoKeysData(
        cryptoKeyId: sessionId2.uuid.value,
        keyPurpose: 'MAC',
        keyAlgorithm: 'HMAC_SHA256',
        keyMaterial: cryptoKey2,
      ),
    ];
    final newCryptoKeys = <v2.CryptoKeysData>[
      v2.CryptoKeysData(
        cryptoKeyId: sessionId2.uuid.value,
        keyPurpose: 'MAC',
        keyAlgorithm: 'HMAC_SHA256',
        keyMaterial: cryptoKey2,
      ),
    ];

    final oldSessions = <v1.SessionsData>[
      v1.SessionsData(
        rowid: 1,
        sessionId: sessionId1.encoded,
        userId: null,
        cryptoKeyId: sessionId1.uuid.value,
        clientInfo: Uint8List(0),
        authenticationFactor: Uint8List(0),
        createTime: createTime,
        expireTime: createTime,
      ),
      v1.SessionsData(
        rowid: 2,
        sessionId: sessionId2.encoded,
        userId: userId,
        cryptoKeyId: sessionId2.uuid.value,
        clientInfo: Uint8List(0),
        authenticationFactor: Uint8List(0),
        createTime: createTime,
        expireTime: createTime,
      ),
    ];
    final newSessions = <v2.SessionsData>[
      v2.SessionsData(
        rowid: 2,
        sessionId: sessionId2.encoded,
        userId: userId,
        cryptoKeyId: sessionId2.uuid.value,
        clientInfo: Uint8List(0),
        authenticationFactor: Uint8List(0),
        createTime: createTime,
        expireTime: createTime,
      ),
    ];

    final oldEntities = <v1.CedarEntitiesCompanion>[
      v1.CedarEntitiesCompanion(
        entityType: Value('Celest::Session'),
        entityId: Value(sessionId1.encoded),
      ),
      v1.CedarEntitiesCompanion(
        entityType: Value('Celest::Session'),
        entityId: Value(sessionId2.encoded),
      ),
      v1.CedarEntitiesCompanion(
        entityType: Value('Celest::User'),
        entityId: Value(userId),
      ),
    ];
    final newEntities = <v2.CedarEntitiesCompanion>[
      v2.CedarEntitiesCompanion(
        entityType: Value('Celest::Session'),
        entityId: Value(sessionId2.encoded),
      ),
      v2.CedarEntitiesCompanion(
        entityType: Value('Celest::User'),
        entityId: Value(userId),
      ),
    ];
    final removedEntities = <v2.CedarEntitiesCompanion>[
      v2.CedarEntitiesCompanion(
        entityType: Value('Celest::Session'),
        entityId: Value(sessionId1.encoded),
      ),
    ];

    final oldCorks = <v1.CorksData>[
      v1.CorksData(
        corkId: sessionId1.uuid.value,
        cryptoKeyId: sessionId1.uuid.value,
        createTime: createTime,
        bearerType: 'Celest::Session',
        bearerId: sessionId1.encoded,
      ),
      v1.CorksData(
        corkId: sessionId2.uuid.value,
        cryptoKeyId: sessionId2.uuid.value,
        createTime: createTime,
        bearerType: 'Celest::Session',
        bearerId: sessionId2.encoded,
      ),
    ];
    final newCorks = <v2.CorksData>[
      v2.CorksData(
        corkId: sessionId2.uuid.value,
        cryptoKeyId: sessionId2.uuid.value,
        createTime: createTime,
        bearerType: 'Celest::Session',
        bearerId: sessionId2.encoded,
      ),
    ];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: (e) => CloudAuthDatabase(e, project: defaultProject),
      createItems: (batch, oldDb) {
        batch.insertAll(
          oldDb.cedarTypes,
          CloudAuthDatabaseAccessors.coreTypes
              .map((fqn) => v1.CedarTypesData(fqn: fqn)),
        );
        batch.insertAll(oldDb.cryptoKeys, oldCryptoKeys);
        batch.insertAll(oldDb.users, oldUsers);
        batch.insertAll(oldDb.sessions, oldSessions);
        batch.insertAll(oldDb.cedarEntities, oldEntities);
        batch.insertAll(oldDb.corks, oldCorks);
      },
      validateItems: (newDb) async {
        expect(
          await newDb.select(newDb.cryptoKeys).get(),
          newCryptoKeys,
        );
        expect(
          await newDb.select(newDb.users).get(),
          newUsers,
        );
        expect(
          await newDb.select(newDb.sessions).get(),
          newSessions,
        );
        expect(
          (await newDb.select(newDb.cedarEntities).get())
              .map((it) => EntityUid.of(it.entityType, it.entityId)),
          allOf([
            containsAll(
              newEntities.map(
                (it) => EntityUid.of(it.entityType.value, it.entityId.value),
              ),
            ),
            isNot(containsAll(
              removedEntities.map(
                (it) => EntityUid.of(it.entityType.value, it.entityId.value),
              ),
            )),
          ]),
        );
        expect(
          await newDb.select(newDb.corks).get(),
          newCorks,
        );
      },
    );
  });

  test('migration from v2 to v3', () async {
    await verifier.testWithDataIntegrity(
      oldVersion: 2,
      newVersion: 3,
      createOld: v2.DatabaseAtV2.new,
      createNew: v3.DatabaseAtV3.new,
      openTestedDatabase: (e) => CloudAuthDatabase(e, project: defaultProject),
      createItems: (batch, oldDb) {},
      validateItems: (newDb) async {
        final max = newDb.celestCloudAuthMeta.schemaVersion.max();
        final latestSchemaVersion = newDb.celestCloudAuthMeta.selectOnly()
          ..addColumns([max]);
        expect(
          latestSchemaVersion.getSingle().then((it) => it.read(max)),
          completion(3),
        );
      },
    );
  });
}
