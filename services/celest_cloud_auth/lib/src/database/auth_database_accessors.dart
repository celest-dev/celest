import 'package:async/async.dart';
import 'package:cedar/ast.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_auth/src/authorization/cedar_interop.dart';
import 'package:celest_cloud_auth/src/authorization/celest_action.dart';
import 'package:celest_cloud_auth/src/authorization/celest_role.dart';
import 'package:celest_cloud_auth/src/authorization/policy_set.g.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/database/auth_database.steps.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.drift.dart';
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart';
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_projects.drift.dart';
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/_internal.dart' show kDebugMode;
import 'package:celest_core/celest_core.dart';
import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart' as drift show Value;
import 'package:drift/drift.dart' hide Component;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:protobuf/protobuf.dart';

export 'schema/schema_imports.dart';

/// Database accessors for Cloud Auth tables.
///
/// This class can be used as a Drift DAO to extend your database with Cloud
/// Auth functionality.
///
/// ```dart
/// @DriftDatabase(daos: [AuthDatabaseAccessors])
/// class MyDatabase extends _$MyDatabase with CloudAuthDatabaseMixin {
///   // ...
/// }
/// ```
mixin CloudAuthDatabaseMixin on GeneratedDatabase {
  /// Include paths required for creating the tables used by Cloud Auth.
  static const Set<String> includes = {
    'package:celest_cloud_auth/src/database/schema/cedar.drift',
    'package:celest_cloud_auth/src/database/schema/cloud_auth_core.drift',
    'package:celest_cloud_auth/src/database/schema/cloud_auth_meta.drift',
    'package:celest_cloud_auth/src/database/schema/cloud_auth_projects.drift',
    'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift',
  };

  /// Database accessors for Cloud Auth tables.
  late final CloudAuthDatabaseAccessors cloudAuth =
      CloudAuthDatabaseAccessors(this);

  /// Create a migration wrapping over Cloud Auth migrations.
  MigrationStrategy createMigration({
    OnCreate? onCreate,
    OnUpgrade? onUpgrade,
    OnBeforeOpen? beforeOpen,
    ResolvedProject? project,
    Iterable<String> additionalCedarTypes = const {},
    Map<EntityUid, Entity> additionalCedarEntities = const {},
    PolicySet? additionalCedarPolicies,
  }) {
    final defaultStrategy = MigrationStrategy();
    onCreate ??= defaultStrategy.onCreate;
    onUpgrade ??= defaultStrategy.onUpgrade;
    return MigrationStrategy(
      onCreate: onCreate,
      onUpgrade: onUpgrade,
      beforeOpen: (details) async {
        // First ensure that the cloud auth tables are up-to-date.
        //
        // This must be run here since the cloud auth tables may be updated
        // out-of-sync with the wrapper database, meaning onUpgrade may miss
        // updates related to the cloud auth tables.
        await cloudAuth.onUpgrade(Migrator(this));

        // Then seed the database with core types, entities, and relationships.
        await cloudAuth.onBeforeOpen(
          details,
          project: project,
          additionalCedarTypes: additionalCedarTypes,
          additionalCedarEntities: additionalCedarEntities,
          additionalCedarPolicies: additionalCedarPolicies,
        );

        // Then call beforeOpen, which may reference cloud auth tables.
        await beforeOpen?.call(details);
      },
    );
  }
}

/// Database accessors for Cloud Auth tables.
///
/// This class can be used as a Drift DAO to extend your database with Cloud
/// Auth functionality.
///
/// ```dart
/// @DriftDatabase(
///   daos: [CloudAuthDatabaseAccessors],
///   includes: CloudAuthDatabaseAccessors.includes,
/// )
/// class MyDatabase extends _$MyDatabase {
///   // ...
/// }
/// ```
@DriftAccessor(include: CloudAuthDatabaseMixin.includes)
class CloudAuthDatabaseAccessors extends DatabaseAccessor<GeneratedDatabase>
    with $CloudAuthDatabaseAccessorsMixin {
  CloudAuthDatabaseAccessors(super.attachedDatabase);

  static final Logger _logger = Logger('Celest.CloudAuth.Database');

  static const int schemaVersion = 6;

  /// Types from `authorization/cedar/schema.cedarschema`.
  @visibleForTesting
  static const List<String> coreTypes = [
    'Celest::Service',
    'Celest::Role',
    'Celest::User',
    'Celest::Session',
    'Celest::Api',
    'Celest::Function',
    'Celest::Action',
  ];

  @visibleForTesting
  static final Map<EntityUid, Entity> coreEntities = {
    // Core actions
    CelestAction.owner: const Entity(uid: CelestAction.owner),
    CelestAction.admin: const Entity(
      uid: CelestAction.admin,
      parents: [CelestAction.owner],
    ),
    CelestAction.edit: const Entity(
      uid: CelestAction.edit,
      parents: [CelestAction.admin],
    ),
    CelestAction.view: const Entity(
      uid: CelestAction.view,
      parents: [CelestAction.edit],
    ),
    CelestAction.create: const Entity(
      uid: CelestAction.create,
      parents: [CelestAction.admin],
    ),
    CelestAction.get: const Entity(
      uid: CelestAction.get,
      parents: [CelestAction.view],
    ),
    CelestAction.list: const Entity(
      uid: CelestAction.list,
      parents: [CelestAction.view],
    ),
    CelestAction.update: const Entity(
      uid: CelestAction.update,
      parents: [CelestAction.edit],
    ),
    CelestAction.delete: const Entity(
      uid: CelestAction.delete,
      parents: [CelestAction.owner],
    ),
    CelestAction.undelete: const Entity(
      uid: CelestAction.undelete,
      parents: [CelestAction.admin],
    ),
    CelestAction.invoke: const Entity(
      uid: CelestAction.invoke,
      parents: [CelestAction.owner],
    ),

    // Core roles
    CelestRole.anonymous: const Entity(uid: CelestRole.anonymous),
    CelestRole.authenticated: const Entity(
      uid: CelestRole.authenticated,
      parents: [CelestRole.anonymous],
    ),
    CelestRole.admin: const Entity(
      uid: CelestRole.admin,
      parents: [CelestRole.authenticated],
    ),
    CelestRole.owner: const Entity(
      uid: CelestRole.owner,
      parents: [CelestRole.admin],
    ),
  };

  /// Seeds the database with core types, entities, and relationships.
  Future<void> seed({
    Iterable<String> additionalCedarTypes = const {},
    Map<EntityUid, Entity> additionalCedarEntities = const {},
    PolicySet? additionalCedarPolicies,
  }) async {
    _logger.finer('Seeding database');

    final allCedarTypes = {
      ...coreTypes,
      ...additionalCedarTypes,
    };
    final allCedarEntities = {
      ...coreEntities,
      ...additionalCedarEntities,
    };
    await batch((b) async {
      b.insertAllOnConflictUpdate(cedarTypes, [
        for (final type in allCedarTypes) CedarTypesCompanion.insert(fqn: type),
      ]);
      b.insertAllOnConflictUpdate(cedarEntities, [
        for (final entity in allCedarEntities.values)
          CedarEntitiesCompanion.insert(
            entityType: entity.uid.type,
            entityId: entity.uid.id,
            attributeJson: drift.Value(entity.attributes),
          ),
      ]);
      b.insertAllOnConflictUpdate(cedarRelationships, [
        for (final entity in allCedarEntities.values)
          for (final parent in entity.parents)
            CedarRelationshipsCompanion.insert(
              entityType: entity.uid.type,
              entityId: entity.uid.id,
              parentType: parent.type,
              parentId: parent.id,
            ),
      ]);
      await upsertPolicySet(corePolicySet.merge(additionalCedarPolicies), b);
    });
  }

  late final Future<void> Function(Migrator, int, int) _migrate = stepByStep(
    from1To2: (m, schema) async {
      await transaction(() async {
        // Migrate `sessions.user_id` from `` to `NOT NULL`
        final removeMissingUserId = delete(schema.sessions)
          ..where((s) => schema.sessions.userId.isNull());
        final missingUserId = await removeMissingUserId.goAndReturn();

        // Remove associated values, if any.
        await batch((b) {
          for (final session in missingUserId) {
            b.deleteWhere(
              schema.corks,
              (cork) =>
                  schema.corks.bearerType.equals('Celest::Session') &
                  schema.corks.bearerId.equals(session.read('session_id')),
            );
            b.deleteWhere(
              schema.cryptoKeys,
              (key) => schema.cryptoKeys.cryptoKeyId
                  .equals(session.read('crypto_key_id')),
            );
            b.deleteWhere(
              schema.cedarEntities,
              (entity) =>
                  schema.cedarEntities.entityType.equals('Celest::Session') &
                  schema.cedarEntities.entityId
                      .equals(session.read('session_id')),
            );
          }
        });

        await m.alterTable(TableMigration(schema.sessions));
        await m.alterTable(TableMigration(schema.cedarRelationships));
      });
    },
    from2To3: (m, schema) async {
      await transaction(() async {
        await m.createTable(schema.celestCloudAuthMeta);
      });
    },
    from3To4: (m, schema) async {
      await transaction(() async {
        // core
        await m.renameTable(schema.cloudAuthCryptoKeys, 'crypto_keys');
        await m.alterTable(TableMigration(schema.cloudAuthCryptoKeys));
        await m.renameTable(schema.cloudAuthSessions, 'sessions');
        await m.alterTable(TableMigration(schema.cloudAuthSessions));
        await m.renameTable(schema.cloudAuthCorks, 'corks');
        await m.alterTable(TableMigration(schema.cloudAuthCorks));
        await m.renameTable(schema.cloudAuthOtpCodes, 'otp_codes');
        await m.alterTable(TableMigration(schema.cloudAuthOtpCodes));

        // meta
        await m.renameTable(schema.cloudAuthMeta, '_celest_cloud_auth_meta');
        await m.alterTable(TableMigration(schema.cloudAuthMeta));

        // users
        await m.renameTable(schema.cloudAuthUsers, 'users');
        await m.alterTable(TableMigration(schema.cloudAuthUsers));
        await m.renameTable(schema.cloudAuthUserEmails, 'user_emails');
        await m.alterTable(TableMigration(schema.cloudAuthUserEmails));
        await m.renameTable(
          schema.cloudAuthUserPhoneNumbers,
          'user_phone_numbers',
        );
        await m.alterTable(TableMigration(schema.cloudAuthUserPhoneNumbers));

        // projects
        await m.renameTable(schema.cloudAuthProjects, 'celest_projects');
        await m.alterTable(TableMigration(schema.cloudAuthProjects));
        await m.renameTable(schema.cloudAuthApis, 'celest_apis');
        await m.alterTable(TableMigration(schema.cloudAuthApis));
        await m.renameTable(schema.cloudAuthFunctions, 'celest_functions');
        await m.alterTable(TableMigration(schema.cloudAuthFunctions));

        final indexes = [
          schema.cloudAuthCorksIssuerIdx,
          schema.cloudAuthApisProjectIdx,
          schema.cloudAuthCorksBearerIdx,
          schema.cloudAuthFunctionsApiIdx,
          schema.cloudAuthSessionsUserIdx,
          schema.cloudAuthCorksAudienceIdx,
          schema.cloudAuthCorksCryptoKeyIdx,
          schema.cloudAuthOtpCodesSessionIdIdx,
          schema.cloudAuthOtpCodesSessionIdIdx,
          schema.cloudAuthSessionsCryptoKeyIdx,
          schema.cloudAuthSessionsExternalSessionIdIdx,
          schema.cloudAuthCryptoKeysExternalCryptoKeyIdIdx,
        ];
        for (final index in indexes) {
          await m.createIndex(index);
        }

        final triggers = [
          schema.cloudAuthApisCreateTrg,
          schema.cloudAuthApisDeleteTrg,
          schema.cloudAuthUsersCreateTrg,
          schema.cloudAuthUsersDeleteTrg,
          schema.cloudAuthFunctionsCreateTrg,
          schema.cloudAuthFunctionsDeleteTrg,
          schema.cloudAuthSessionsUpdateTimeTrg,
        ];
        for (final trigger in triggers) {
          await m.createTrigger(trigger);
        }
      });
    },
    from4To5: (m, schema) async {
      await m.alterTable(TableMigration(schema.cloudAuthSessions));
    },
    from5To6: (m, schema) async {
      await m.createView(schema.cloudAuthUsersView);
    },
  );

  /// The default [MigrationStrategy.onUpgrade] for Cloud Auth.
  Future<void> onUpgrade(
    Migrator migrator, {
    @internal int? from,
    @internal int? to,
  }) async {
    try {
      from ??= await cloudAuthMetaDrift.getSchemaVersion().getSingle();
    } on Object catch (e, st) {
      _logger.finest('Error getting latest schema version', e, st);
      if (from == null) {
        // We're mising the meta tables for some reason.
        //
        // This should never happen.
        throw StateError('Invalid schema detected');
      }
    }

    // If the table is empty, then the database was just created and thus
    // the schema version is current.
    if (from == null) {
      await cloudAuthMetaDrift.setSchemaVersion(
        schemaVersion: schemaVersion,
      );
      from = schemaVersion;
    }

    to ??= schemaVersion;
    if (from < to) {
      _logger.fine('Migrating from version $from to version $to');
      await _migrate(migrator, from, to);
      if (to == schemaVersion) {
        await cloudAuthMetaDrift.setSchemaVersion(schemaVersion: to);
      }
      _logger.fine('Migration complete');
    } else {
      _logger.fine('Skipping migration');
    }
  }

  /// The default [MigrationStrategy.onBeforeOpen] for Cloud Auth.
  Future<void> onBeforeOpen(
    OpeningDetails details, {
    ResolvedProject? project,
    Iterable<String> additionalCedarTypes = const {},
    Map<EntityUid, Entity> additionalCedarEntities = const {},
    PolicySet? additionalCedarPolicies,
  }) async {
    await withoutForeignKeys(() async {
      if (details.wasCreated || details.hadUpgrade) {
        await seed(
          additionalCedarTypes: additionalCedarTypes,
          additionalCedarEntities: additionalCedarEntities,
          additionalCedarPolicies: additionalCedarPolicies,
        );
      }
      await upsertProject(project: project);
    });
  }

  List<TableInfo<Table, dynamic>> get _cloudAuthTables => [
        cedarAuthorizationLogs,
        cedarEntities,
        cedarPolicies,
        cedarPolicyTemplateLinks,
        cedarPolicyTemplates,
        cedarRelationships,
        cedarTypes,
        cloudAuthApis,
        cloudAuthCorks,
        cloudAuthCryptoKeys,
        cloudAuthFunctions,
        cloudAuthMeta,
        cloudAuthOtpCodes,
        cloudAuthProjects,
        cloudAuthSessions,
        cloudAuthUserEmails,
        cloudAuthUserPhoneNumbers,
        cloudAuthUsers,
      ];

  /// Runs [action] in a context without foreign keys enabled.
  @visibleForTesting
  Future<R> withoutForeignKeys<R>(Future<R> Function() action) async {
    await customStatement('pragma foreign_keys = OFF');
    R result;
    try {
      result = await action();
    } finally {
      await customStatement('pragma foreign_keys = ON');

      if (kDebugMode) {
        // Fail if the action broke foreign keys
        final wrongForeignKeysAll =
            await customSelect('PRAGMA foreign_key_check').get();
        final cloudAuthTables =
            _cloudAuthTables.map((it) => it.actualTableName).toList();
        final wrongForeignKeys = [
          for (final foreignKey in wrongForeignKeysAll)
            if (foreignKey.data
                case {
                      'table': final String table,
                      'parent': final String parent
                    } ||
                    {'TABLE': final String table, 'PARENT': final String parent}
                when cloudAuthTables.contains(table) ||
                    cloudAuthTables.contains(parent))
              foreignKey.data,
        ];
        assert(wrongForeignKeys.isEmpty, '$wrongForeignKeys');
      }
    }
    return result;
  }

  final _effectivePolicySetCache =
      AsyncCache<PolicySet>(const Duration(hours: 1));

  /// The effective [PolicySet] for the project.
  Future<PolicySet> get effectivePolicySet {
    return _effectivePolicySetCache.fetch(loadEffectivePolicySet);
  }

  /// Loads the effective policy set from the database.
  @visibleForTesting
  Future<PolicySet> loadEffectivePolicySet() async {
    _logger.finest('Fetching effective policy set');
    final (policies, templates, templateLinks) = await (
      select(cedarDrift.cedarPolicies).get(),
      select(cedarDrift.cedarPolicyTemplates).get(),
      select(cedarDrift.cedarPolicyTemplateLinks).get(),
    ).wait;
    final policySet = PolicySet.build((b) {
      for (final policy in policies) {
        b.policies[policy.id] = policy.policy;
      }

      final templatesById = {
        for (final template in templates)
          template.templateId: template.template,
      };
      b.templates.addAll(templatesById);
      for (final link in templateLinks) {
        final template = templatesById[link.templateId];
        if (template == null) {
          _logger.warning('Template not found for link: $link');
          continue;
        }
        // TODO(dnys1): Move this logic to `package:cedar`.
        b.policies[link.id] = template.rebuild((b) {
          if ((link.principalType, link.principalId)
              case (final type?, final id?)) {
            final principal = EntityUid.of(type, id);
            b.principal = switch (template.principal) {
              PrincipalAll() => const PrincipalAll(),
              PrincipalIn() => PrincipalIn(principal),
              PrincipalEquals() => PrincipalEquals(principal),
              final PrincipalIs principalIs => principalIs,
              PrincipalIsIn(:final entityType) =>
                PrincipalIsIn(entityType, principal),
            };
          }
          if ((link.resourceType, link.resourceId)
              case (final type?, final id?)) {
            final resource = EntityUid.of(type, id);
            b.resource = switch (template.resource) {
              ResourceAll() => const ResourceAll(),
              ResourceIn() => ResourceIn(resource),
              ResourceEquals() => ResourceEquals(resource),
              final ResourceIs resourceIs => resourceIs,
              ResourceIsIn(:final entityType) =>
                ResourceIsIn(entityType, resource),
            };
          }
          b.annotations = Annotations({'id': link.policyId});
        });
      }
    });
    _logger.finest(() {
      final policyIds = policySet.policies.entries
          .map((pol) => pol.value.id ?? pol.key)
          .sorted();
      return 'Effective policies: $policyIds';
    });
    return policySet;
  }

  static String _etag(GeneratedMessage input) {
    final buffer = input.writeToBuffer();
    return md5.convert(buffer).toString();
  }

  /// Records the project's AST in the database.
  ///
  /// Returns the new, effective policy set for the project.
  Future<void> upsertProject({
    ResolvedProject? project,
  }) async {
    project ??= context.project;
    _logger.finer('Upserting project: ${project.projectId}');

    return transaction(() async {
      final oldProject = await cloudAuthProjectsDrift
          .getProject(projectId: project!.projectId)
          .getSingleOrNull();
      final newProject = (await cloudAuthProjectsDrift.upsertProject(
        projectId: project.projectId,
        version: 'v1',
        resolvedAst: project,
        etag: _etag(project.toProto()),
      ))
          .single;
      if (oldProject?.etag == newProject.etag) {
        _logger.finer('Project AST is up-to-date. Skipping AST upsert.');
        return;
      }

      await batch((b) async {
        await createEntity(Entity(uid: project!.uid), b);
        for (final api in project.apis.values) {
          _logger.finer('Upserting API: ${api.apiId}');
          b.insert<CloudAuthApis, CloudAuthApi>(
            cloudAuthApis,
            CloudAuthApisCompanion.insert(
              projectId: project.projectId,
              apiId: api.apiId,
              resolvedAst: api,
              etag: _etag(api.toProto()),
            ),
            onConflict: DoUpdate.withExcluded(
              (_, excluded) => CloudAuthApisCompanion.custom(
                projectId: excluded.projectId,
                resolvedAst: excluded.resolvedAst,
                etag: excluded.etag,
              ),
              target: [cloudAuthApis.apiId],
            ),
          );
          await createEntity(Entity(uid: api.uid, parents: [project.uid]), b);
          for (final function in api.functions.values) {
            _logger.finer('Upserting function: ${function.functionId}');
            b.insert<CloudAuthFunctions, CloudAuthFunction>(
              cloudAuthFunctions,
              CloudAuthFunctionsCompanion.insert(
                apiId: api.apiId,
                functionId: function.functionId,
                resolvedAst: function,
                etag: _etag(function.toProto()),
              ),
              onConflict: DoUpdate.withExcluded(
                (_, excluded) => CloudAuthFunctionsCompanion.custom(
                  apiId: excluded.apiId,
                  resolvedAst: excluded.resolvedAst,
                  etag: excluded.etag,
                ),
                target: [cloudAuthFunctions.functionId],
              ),
            );
            await createEntity(
              Entity(uid: function.uid, parents: [api.uid]),
              b,
            );
          }
        }

        final differ = _ProjectAuthDiff();
        project.acceptWithArg(differ, oldProject?.resolvedAst);
        for (final linkId in differ.removedTemplateLinks) {
          _logger.finer('Deleting policy template link: $linkId');
          b.deleteWhere(
            cedarDrift.cedarPolicyTemplateLinks,
            (link) => link.id.equals(linkId),
          );
        }
        for (final templateId in differ.removedTemplateIds) {
          _logger.finer('Deleting policy template: $templateId');
          b.deleteWhere(
            cedarDrift.cedarPolicyTemplates,
            (template) => template.templateId.equals(templateId),
          );
        }
        for (final policyId in differ.removedPolicyIds) {
          _logger.finer('Deleting policy: $policyId');
          b.deleteWhere(
            cedarDrift.cedarPolicies,
            (policy) => policy.id.equals(policyId),
          );
        }
        await upsertPolicySet(corePolicySet.merge(differ.newPolicySet), b);
      });
    });
  }

  /// Upserts a Cedar [PolicySet] into the database.
  ///
  /// Returns the new, effective [PolicySet].
  Future<void> upsertPolicySet(PolicySet policySet, [Batch? batch]) async {
    await _withBatch(batch, (b) async {
      for (final policy in policySet.policies.entries) {
        _logger.finer('Upserting policy: ${policy.key}');
        b.insert<CedarPolicies, CedarPolicy>(
          cedarDrift.cedarPolicies,
          CedarPoliciesCompanion.insert(
            id: typeId('pol'),
            policyId: policy.key,
            policy: policy.value,
            enforcementLevel: drift.Value(1),
          ),
          onConflict: DoUpdate.withExcluded(
            (_, excluded) => CedarPoliciesCompanion.custom(
              policy: excluded.policy,
              enforcementLevel: excluded.enforcementLevel,
            ),
            target: [cedarPolicies.policyId],
          ),
        );
      }

      for (final template in policySet.templates.entries) {
        _logger.finer('Upserting policy template: ${template.key}');
        b.insert<CedarPolicyTemplates, CedarPolicyTemplate>(
          cedarDrift.cedarPolicyTemplates,
          CedarPolicyTemplatesCompanion.insert(
            id: typeId('polt'),
            templateId: template.key,
            template: template.value,
          ),
          onConflict: DoUpdate.withExcluded(
            (_, excluded) => CedarPolicyTemplatesCompanion.custom(
              template: excluded.template,
            ),
            target: [cedarPolicyTemplates.templateId],
          ),
        );
      }

      for (final link in policySet.templateLinks) {
        _logger.finer(
          'Upserting policy template link: ${link.shortDisplayString}',
        );
        b.insert<CedarPolicyTemplateLinks, CedarPolicyTemplateLink>(
          cedarDrift.cedarPolicyTemplateLinks,
          CedarPolicyTemplateLinksCompanion.insert(
            id: typeId('polk'),
            policyId: link.newId,
            templateId: link.templateId,
            principalType: drift.Value.absentIfNull(
              link.values[SlotId.principal]?.type,
            ),
            principalId: drift.Value.absentIfNull(
              link.values[SlotId.principal]?.id,
            ),
            resourceType: drift.Value.absentIfNull(
              link.values[SlotId.resource]?.type,
            ),
            resourceId: drift.Value.absentIfNull(
              link.values[SlotId.resource]?.id,
            ),
            enforcementLevel: drift.Value(1),
          ),
          onConflict: DoUpdate.withExcluded(
            (_, excluded) => CedarPolicyTemplateLinksCompanion.custom(
              principalType: excluded.principalType,
              principalId: excluded.principalId,
              resourceType: excluded.resourceType,
              resourceId: excluded.resourceId,
              enforcementLevel: excluded.enforcementLevel,
            ),
            target: [cedarPolicyTemplateLinks.policyId],
          ),
        );
      }
    });
    _effectivePolicySetCache.invalidate();
  }

  /// Creates a new [entity] in the database.
  Future<void> createEntity(Entity entity, [Batch? batch]) async {
    _logger.finer(
      'Creating entity: ${entity.uid} with parents: ${entity.parents}',
    );
    await _withBatch(batch, (b) async {
      b.insertAllOnConflictUpdate(
        cedarTypes,
        [CedarTypesCompanion.insert(fqn: entity.uid.type)],
      );
      b.insertAllOnConflictUpdate(cedarEntities, [
        CedarEntitiesCompanion.insert(
          entityType: entity.uid.type,
          entityId: entity.uid.id,
          attributeJson: drift.Value(entity.attributes),
        ),
      ]);
      b.insertAllOnConflictUpdate(cedarRelationships, [
        for (final parent in entity.parents)
          CedarRelationshipsCompanion.insert(
            entityType: entity.uid.type,
            entityId: entity.uid.id,
            parentType: parent.type,
            parentId: parent.id,
          ),
      ]);
    });
  }

  Future<void> _withBatch(
    Batch? batch,
    Future<void> Function(Batch) action,
  ) async {
    if (batch != null) {
      await action(batch);
      return;
    }
    await db.batch((b) async {
      await action(b);
    });
  }

  /// Computes the transitive closure for an [AuthorizationRequest].
  Future<Map<EntityUid, Entity>> computeRequestClosure({
    Component? principal,
    Component? resource,
  }) async {
    if (principal == null && resource == null) {
      return coreEntities;
    }
    final principalUid = principal?.uid;
    final resourceUid = resource?.uid;
    final (principalClosure, resourceClosure) = await transaction(() async {
      final principalClosure = switch (principalUid) {
        final principal? => cedarDrift
            .getEntityClosure(
              type: principal.type,
              id: principal.id,
            )
            .getSingle(),
        _ => Future.value(const <Entity>[]),
      };
      final resourceClosure = switch (resourceUid) {
        final resource? => cedarDrift
            .getEntityClosure(
              type: resource.type,
              id: resource.id,
            )
            .getSingle(),
        _ => Future.value(const <Entity>[]),
      };
      return (principalClosure, resourceClosure).wait;
    });
    final closure = {
      ...coreEntities,
      for (final entity in principalClosure) entity.uid: entity,
      for (final entity in resourceClosure) entity.uid: entity,
    };
    _logger.finest(() {
      final entityUids = closure.keys.map((uid) => uid.toString()).sorted();
      return 'Computed closure: $entityUids';
    });
    return closure;
  }

  /// Creates a new user in the database.
  Future<User> createUser({
    required User user,
  }) {
    _logger.finer('Creating user: ${user.userId}');
    return transaction(() async {
      final newUser = await cloudAuthUsersDrift.createUser(
        userId: user.userId,
        givenName: user.givenName,
        familyName: user.familyName,
        timeZone: user.timeZone,
        languageCode: user.languageCode,
      );

      await batch((b) async {
        b.insertAllOnConflictUpdate(
          cloudAuthUserEmails,
          [
            for (final email in user.emails)
              CloudAuthUserEmailsCompanion.insert(
                userId: newUser.first.id,
                email: email.email,
                isVerified: drift.Value(email.isVerified),
                isPrimary: drift.Value(email.isPrimary),
              ),
          ],
        );
        b.insertAllOnConflictUpdate(
          cloudAuthUserPhoneNumbers,
          [
            for (final phoneNumber in user.phoneNumbers)
              CloudAuthUserPhoneNumbersCompanion.insert(
                userId: newUser.first.id,
                phoneNumber: phoneNumber.phoneNumber,
                isVerified: drift.Value(phoneNumber.isVerified),
                isPrimary: drift.Value(phoneNumber.isPrimary),
              ),
          ],
        );
        await setUserRoles(
          userId: newUser.first.id,
          roles: user.roles,
          batch: b,
        );
      });

      return newUser.first.copyWith(
        emails: user.emails,
        phoneNumbers: user.phoneNumbers,
        roles: user.roles,
      );
    });
  }

  /// Retrieves a user from the database.
  Future<User?> getUser({required String userId}) async {
    return cloudAuthUsersDrift.getUser(userId: userId).getSingleOrNull();
  }

  Future<List<EntityUid>> setUserRoles({
    required String userId,
    required List<EntityUid> roles,
    Batch? batch,
  }) async {
    await _withBatch(batch, (b) async {
      // Remove existing roles
      b.deleteWhere(
        cedarRelationships,
        (rel) =>
            rel.entityType.equals('Celest::User') &
            rel.entityId.equals(userId) &
            rel.parentType.equals('Celest::Role'),
      );

      for (final role in roles) {
        b.insert<CedarRelationships, CedarRelationship>(
          cedarRelationships,
          CedarRelationshipsCompanion.insert(
            entityType: 'Celest::User',
            entityId: userId,
            parentType: role.type,
            parentId: role.id,
          ),
        );
      }
    });
    return roles;
  }

  /// Finds a user by email.
  Future<User?> findUserByEmail({required String email}) async {
    return cloudAuthUsersDrift
        .lookupUserByEmail(email: email)
        .getSingleOrNull();
  }

  /// Finds a user by phone number.
  Future<User?> findUserByPhoneNumber({required String phoneNumber}) async {
    return cloudAuthUsersDrift
        .lookupUserByPhone(phoneNumber: phoneNumber)
        .getSingleOrNull();
  }
}

/// Creates a diff of a project's authorization config between two versions.
final class _ProjectAuthDiff extends ResolvedAstVisitorWithArg<void, Node?> {
  _ProjectAuthDiff();

  final PolicySetBuilder _oldPolicySet = PolicySetBuilder();
  final PolicySetBuilder _newPolicySet = PolicySetBuilder();

  late final PolicySet oldPolicySet = _oldPolicySet.build();
  late final PolicySet newPolicySet = _newPolicySet.build();

  Set<String> get removedPolicyIds {
    final oldPolicyIds = oldPolicySet.policies.keys.toSet();
    final newPolicyIds = newPolicySet.policies.keys.toSet();
    return oldPolicyIds.difference(newPolicyIds);
  }

  Set<String> get removedTemplateIds {
    final oldTemplateIds = oldPolicySet.templates.keys.toSet();
    final newTemplateIds = newPolicySet.templates.keys.toSet();
    return oldTemplateIds.difference(newTemplateIds);
  }

  Set<String> get removedTemplateLinks {
    final oldTemplateLinks =
        oldPolicySet.templateLinks.map((link) => link.newId).toSet();
    final newTemplateLinks =
        newPolicySet.templateLinks.map((link) => link.newId).toSet();
    return oldTemplateLinks.difference(newTemplateLinks);
  }

  @override
  void visitProject(ResolvedProject project, ResolvedProject? context) {
    for (final api in project.apis.values) {
      visitApi(api, context?.apis[api.apiId]);
    }
  }

  @override
  void visitApi(ResolvedApi api, ResolvedApi? context) {
    if (api.policySet case final policySet?) {
      _newPolicySet
        ..policies.addAll(policySet.policies.toMap())
        ..templates.addAll(policySet.templates.toMap())
        ..templateLinks.addAll(policySet.templateLinks);
    }
    if (context?.policySet case final policySet?) {
      _oldPolicySet
        ..policies.addAll(policySet.policies.toMap())
        ..templates.addAll(policySet.templates.toMap())
        ..templateLinks.addAll(policySet.templateLinks);
    }
    for (final function in api.functions.values) {
      visitFunction(function, context?.functions[function.functionId]);
    }
  }

  @override
  void visitFunction(
    ResolvedCloudFunction function,
    ResolvedCloudFunction? context,
  ) {
    if (function.policySet case final policySet?) {
      _newPolicySet
        ..policies.addAll(policySet.policies.toMap())
        ..templates.addAll(policySet.templates.toMap())
        ..templateLinks.addAll(policySet.templateLinks);
    }
    if (context?.policySet case final policySet?) {
      _oldPolicySet
        ..policies.addAll(policySet.policies.toMap())
        ..templates.addAll(policySet.templates.toMap())
        ..templateLinks.addAll(policySet.templateLinks);
    }
  }

  @override
  void visitAuth(ResolvedAuth auth, covariant Node context) {}

  @override
  void visitAuthProvider(
    ResolvedAuthProvider provider,
    covariant Node context,
  ) {}

  @override
  void visitDatabase(ResolvedDatabase database, covariant Node context) {}

  @override
  void visitDatabaseSchema(
    ResolvedDatabaseSchema schema,
    covariant Node context,
  ) {}

  @override
  void visitExternalAuthProvider(
    ResolvedExternalAuthProvider provider,
    covariant Node context,
  ) {}

  @override
  void visitSecret(ResolvedSecret secret, covariant Node context) {}

  @override
  void visitVariable(ResolvedVariable variable, covariant Node context) {}
}

extension TemplateLinkDisplayString on TemplateLink {
  String get shortDisplayString {
    final buf = StringBuffer('(');
    buf.write('id=$newId, ');
    buf.write('templateId=$templateId, ');
    for (final (index, value) in values.entries.indexed) {
      buf.write('${value.key.name}=${value.value}');
      if (index < values.length - 1) {
        buf.write(', ');
      }
    }
    buf.write(')');
    return buf.toString();
  }
}
