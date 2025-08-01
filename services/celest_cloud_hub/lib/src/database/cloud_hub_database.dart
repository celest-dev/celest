import 'dart:io';

import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_hub/src/auth/policy_set.g.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.steps.dart';
import 'package:celest_cloud_hub/src/database/db_functions.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:celest_core/_internal.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:drift/internal/versioned_schema.dart';
import 'package:drift/native.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'cloud_hub_database.drift.dart';

@DriftDatabase(
  include: {
    'schema/operations.drift',
    'schema/organizations.drift',
    'schema/projects.drift',
    'schema/project_environments.drift',
    'schema/user_memberships.drift',

    // Cloud Auth
    ...CloudAuthDatabaseMixin.includes,
  },
)
final class CloudHubDatabase extends $CloudHubDatabase
    with CloudAuthDatabaseMixin {
  CloudHubDatabase(super.e);

  CloudHubDatabase.memory()
    : this(NativeDatabase.memory(setup: (db) => db.addHelperFunctions()));

  factory CloudHubDatabase.localFile(String path, {bool verbose = false}) {
    return CloudHubDatabase(
      NativeDatabase(
        File(path),
        logStatements: verbose,
        setup: (db) => db.addHelperFunctions(),
        cachePreparedStatements: true,
        enableMigrations: true,
      ),
    );
  }

  @override
  int get schemaVersion => 2;

  static final Logger _logger = Logger('CloudHubDatabase');

  @visibleForTesting
  static const Set<String> coreTypes = {
    'Celest::Operation',
    'Celest::Organization',
    'Celest::Organization::Member',
    'Celest::Project',
    'Celest::Project::Member',
    'Celest::Project::Environment',
    'Celest::Project::Environment::Member',
  };

  @visibleForTesting
  static final Map<EntityUid, Entity> coreEntities = {
    context.rootOrg.uid: context.rootOrg,
    ProjectEnvironmentAction.deploy: Entity(
      uid: ProjectEnvironmentAction.deploy,
      parents: [CelestAction.owner],
    ),
  };

  // Workaround for https://github.com/simolus3/hrana.dart/pull/9#issuecomment-2848112821
  static OnUpgrade stepByStepHelper({required MigrationStepWithVersion step}) {
    return (m, from, to) async {
      final database = m.database;

      for (var target = from; target < to;) {
        final newVersion = await step(target, database);
        assert(newVersion > target);

        target = newVersion;
      }
    };
  }

  @override
  MigrationStrategy get migration => createMigration(
    onUpgrade: stepByStepHelper(
      step: migrationSteps(
        from1To2: (m, schema) async {
          await m.createTable(schema.tursoDatabases);
          await m.alterTable(
            TableMigration(
              schema.projectEnvironmentStates,
              newColumns: [
                schema.projectEnvironmentStates.flyMacaroonToken,
                schema.projectEnvironmentStates.tursoDatabaseName,
              ],
            ),
          );
          await m.createIndex(schema.idxProjectEnvironmentTursoDatabase);
        },
      ),
    ),
    beforeOpen: (details) async {
      final versionRow = await customSelect(
        'SELECT sqlite_version() as version;',
      ).getSingle();
      final version = versionRow.read<String>('version');
      _logger.config('Using SQLite v$version');

      final rootOrg = await organizationsDrift
          .getOrganization(id: context.rootOrg.uid.id)
          .getSingleOrNull();
      if (rootOrg == null) {
        _logger.config('Creating root organization');
        await organizationsDrift.createOrganization(
          id: context.rootOrg.uid.id,
          displayName: 'Celest',
          organizationId: context.rootOrg.uid.id,
          state: 'ACTIVE',
          primaryRegion: 'NORTH_AMERICA',
        );
      }
    },
    project: project,
    additionalCedarTypes: coreTypes,
    additionalCedarEntities: coreEntities,
    additionalCedarPolicies: corePolicySet,
  );

  /// Runs [action] in a context without foreign keys enabled.
  Future<R> withoutForeignKeys<R>(Future<R> Function() action) async {
    await customStatement('pragma foreign_keys = OFF');
    R result;
    try {
      result = await transaction(action);
    } finally {
      if (kDebugMode) {
        // Fail if the action broke foreign keys
        final wrongForeignKeys = await customSelect(
          'PRAGMA foreign_key_check',
        ).get();
        await _dumpBrokenCedarForeignKeys();
        assert(
          wrongForeignKeys.isEmpty,
          '${wrongForeignKeys.map((e) => e.data)}',
        );
      }
      await customStatement('pragma foreign_keys = ON');
    }
    return result;
  }

  Future<void> _dumpBrokenCedarForeignKeys() async {
    final allCedarTypes = await cedarTypes.select().get();
    final allEntitiesRaw = await cedarEntities.select().get();
    final allEntities = {
      for (final entity in allEntitiesRaw)
        EntityUid.of(entity.entityType, entity.entityId),
    };
    for (final entity in allEntities) {
      final type = allCedarTypes.firstWhereOrNull(
        (typ) => typ.fqn == entity.type,
      );
      if (type == null) {
        print('Entity has bad type: ${entity.type}');
        print('  $entity');
      }
    }
    final allRelationships = await cedarRelationships.select().get();
    for (final relationship in allRelationships) {
      final entityId = EntityUid.of(
        relationship.entityType,
        relationship.entityId,
      );
      final parentId = EntityUid.of(
        relationship.parentType,
        relationship.parentId,
      );
      if (!allEntities.contains(entityId)) {
        print('Relationship has bad (entity_type, entity_id): $entityId');
        print('  $relationship');
      }
      if (!allEntities.contains(parentId)) {
        print('Relationship has bad (parent_type, parent_id): $parentId');
        print('  $relationship');
      }
    }
  }

  Future<void> ping() async {
    await customSelect('SELECT 1').get();
  }
}
