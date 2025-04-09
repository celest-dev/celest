import 'package:async/async.dart';
import 'package:cedar/ast.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_auth/src/authentication/authentication_model.dart';
import 'package:celest_cloud_auth/src/authorization/cedar_interop.dart';
import 'package:celest_cloud_auth/src/authorization/celest_action.dart';
import 'package:celest_cloud_auth/src/authorization/celest_role.dart';
import 'package:celest_cloud_auth/src/authorization/policy_set.g.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/database/auth_database.steps.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.drift.dart';
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart';
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
    OnBeforeOpen? onBeforeOpen,
  }) {
    final defaultStrategy = MigrationStrategy();
    onCreate ??= defaultStrategy.onCreate;
    onUpgrade ??= defaultStrategy.onUpgrade;
    return MigrationStrategy(
      onCreate: onCreate,
      onUpgrade: (m, from, to) async {
        await onUpgrade!(m, from, to);
        await cloudAuth.onUpgrade(m);
      },
      beforeOpen: (details) async {
        await onBeforeOpen?.call(details);
        await cloudAuth.onBeforeOpen(details);
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

  static const int schemaVersion = 4;

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
    await transaction(() async {
      await batch((b) {
        b.insertAllOnConflictUpdate(cedarTypes, [
          for (final type in allCedarTypes)
            CedarTypesCompanion.insert(fqn: type),
        ]);
        for (final entity in allCedarEntities.values) {
          b.insert(
            cedarEntities,
            CedarEntitiesCompanion.insert(
              entityType: entity.uid.type,
              entityId: entity.uid.id,
              attributeJson: drift.Value(entity.attributes),
            ),
          );
          for (final parent in entity.parents) {
            b.insert(
              cedarRelationships,
              CedarRelationshipsCompanion.insert(
                entityType: entity.uid.type,
                entityId: entity.uid.id,
                parentType: parent.type,
                parentId: parent.id,
              ),
            );
          }
        }
      });
      await upsertPolicySet(corePolicySet.merge(additionalCedarPolicies));
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
    }

    from ??= 1;
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
  }) async {
    await _withoutForeignKeys(() async {
      if (details.wasCreated) {
        await seed();
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
  Future<R> _withoutForeignKeys<R>(Future<R> Function() action) async {
    await customStatement('pragma foreign_keys = OFF');
    R result;
    try {
      result = await action();
    } finally {
      if (kDebugMode) {
        // Fail if the action broke foreign keys
        final wrongForeignKeysAll =
            await customSelect('PRAGMA foreign_key_check').get();
        final cloudAuthTables =
            _cloudAuthTables.map((it) => it.actualTableName).toList();
        final wrongForeignKeys = [
          for (final foreignKey in wrongForeignKeysAll)
            if (cloudAuthTables
                .contains(foreignKey.data['table_name'] as String))
              foreignKey.data,
        ];
        assert(wrongForeignKeys.isEmpty, '$wrongForeignKeys');
      }
      await customStatement('pragma foreign_keys = ON');
    }
    return result;
  }

  final _effectivePolicySetCache =
      AsyncCache<PolicySet>(const Duration(minutes: 5));

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
  }) {
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
      await createEntity(Entity(uid: project.uid));
      for (final api in project.apis.values) {
        _logger.finer('Upserting API: ${api.apiId}');
        await cloudAuthProjectsDrift.upsertApi(
          projectId: project.projectId,
          apiId: api.apiId,
          resolvedAst: api,
          etag: _etag(api.toProto()),
        );
        await createEntity(Entity(uid: api.uid, parents: [project.uid]));
        for (final function in api.functions.values) {
          _logger.finer('Upserting function: ${function.functionId}');
          await cloudAuthProjectsDrift.upsertFunction(
            apiId: api.apiId,
            functionId: function.functionId,
            resolvedAst: function,
            etag: _etag(function.toProto()),
          );
          await createEntity(Entity(uid: function.uid, parents: [api.uid]));
        }
      }

      final differ = _ProjectAuthDiff();
      project.acceptWithArg(differ, oldProject?.resolvedAst);
      for (final linkId in differ.removedTemplateLinks) {
        _logger.finer('Deleting policy template link: $linkId');
        await cedarDrift.deletePolicyTemplateLink(policyId: linkId);
      }
      for (final templateId in differ.removedTemplateIds) {
        _logger.finer('Deleting policy template: $templateId');
        await cedarDrift.deletePolicyTemplate(templateId: templateId);
      }
      for (final policyId in differ.removedPolicyIds) {
        _logger.finer('Deleting policy: $policyId');
        await cedarDrift.deletePolicy(policyId: policyId);
      }
      await upsertPolicySet(corePolicySet.merge(differ.newPolicySet));
    });
  }

  /// Upserts a Cedar [PolicySet] into the database.
  ///
  /// Returns the new, effective [PolicySet].
  Future<void> upsertPolicySet(PolicySet policySet) async {
    await transaction(() async {
      for (final policy in policySet.policies.entries) {
        _logger.finer('Upserting policy: ${policy.key}');
        await cedarDrift.upsertPolicy(
          id: typeId('pol'),
          policyId: policy.key,
          policy: policy.value,
          enforcementLevel: 1,
        );
      }
      for (final template in policySet.templates.entries) {
        _logger.finer('Upserting policy template: ${template.key}');
        await cedarDrift.upsertPolicyTemplate(
          id: typeId('polt'),
          templateId: template.key,
          template: template.value,
        );
      }
      for (final link in policySet.templateLinks) {
        _logger.finer(
          'Upserting policy template link: ${link.shortDisplayString}',
        );

        await cedarDrift.upsertPolicyTemplateLink(
          id: typeId('polk'),
          policyId: link.newId,
          templateId: link.templateId,
          principalType: link.values[SlotId.principal]?.type,
          principalId: link.values[SlotId.principal]?.id,
          resourceType: link.values[SlotId.resource]?.type,
          resourceId: link.values[SlotId.resource]?.id,
          enforcementLevel: 1,
        );
      }
    });
    _effectivePolicySetCache.invalidate();
  }

  /// Creates a new [entity] in the database.
  Future<void> createEntity(Entity entity) async {
    _logger.finer(
      'Creating entity: ${entity.uid} with parents: ${entity.parents}',
    );
    await cedarDrift.createType(
      fqn: entity.uid.type,
    );
    await cedarDrift.createEntity(
      entityType: entity.uid.type,
      entityId: entity.uid.id,
      attributeJson: entity.attributes,
    );
    for (final parent in entity.parents) {
      await cedarDrift.createRelationship(
        entityType: entity.uid.type,
        entityId: entity.uid.id,
        parentType: parent.type,
        parentId: parent.id,
      );
    }
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
      for (final email in user.emails) {
        await cloudAuthUsersDrift.upsertUserEmail(
          userId: user.userId,
          email: email.email,
          isVerified: email.isVerified,
          isPrimary: email.isPrimary,
        );
      }
      for (final phoneNumber in user.phoneNumbers) {
        await cloudAuthUsersDrift.upsertUserPhoneNumber(
          userId: user.userId,
          phoneNumber: phoneNumber.phoneNumber,
          isVerified: phoneNumber.isVerified,
          isPrimary: phoneNumber.isPrimary,
        );
      }
      final roles = await setUserRoles(
        userId: newUser.first.id,
        roles: user.roles,
      );
      return newUser.first.copyWith(
        emails: user.emails,
        phoneNumbers: user.phoneNumbers,
        roles: roles,
      );
    });
  }

  /// Retrieves a user from the database.
  Future<User?> getUser({required String userId}) {
    return transaction(() async {
      final user =
          await cloudAuthUsersDrift.getUser(userId: userId).getSingleOrNull();
      if (user == null) {
        return null;
      }
      final (emails, phoneNumbers, roles) = await (
        cloudAuthUsersDrift.getUserEmails(userId: userId).get(),
        cloudAuthUsersDrift.getUserPhoneNumbers(userId: userId).get(),
        cedarDrift
            .getEntityRoles(entityType: 'Celest::User', entityId: userId)
            .get(),
      ).wait;
      return user.copyWith(
        emails: emails,
        phoneNumbers: phoneNumbers,
        roles: roles.map(EntityUid.parse).toList(),
      );
    });
  }

  Future<List<EntityUid>> setUserRoles({
    required String userId,
    required List<EntityUid> roles,
  }) async {
    return transaction(() async {
      // Remove existing roles
      final removeExisting = delete(cedarRelationships)
        ..where(
          (rel) =>
              rel.entityType.equals('Celest::User') &
              rel.entityId.equals(userId) &
              rel.parentType.equals('Celest::Role'),
        );
      await removeExisting.go();

      for (final role in roles) {
        await cedarDrift.createRelationship(
          entityType: 'Celest::User',
          entityId: userId,
          parentType: role.type,
          parentId: role.id,
        );
      }

      return roles;
    });
  }

  /// Finds a user by email.
  Future<User?> findUserByEmail({required String email}) {
    return transaction(() async {
      final results =
          await cloudAuthUsersDrift.lookupUserByEmail(email: email).get();
      if (results.isEmpty) {
        return null;
      }
      final LookupUserByEmailResult(
        cloudAuthUsers: user,
        cloudAuthUserEmails: emailData,
      ) = results.first;
      if (!emailData.isPrimary) {
        final formattedResults = results.map((it) {
          final Email(:email, isVerified: verified, isPrimary: primary) =
              it.cloudAuthUserEmails;
          return (
            it.cloudAuthUsers,
            (email: email, verified: verified, primary: primary),
          );
        }).join(' | ');
        context.logger.warning(
          'No user found with primary, verified email "$email"\n'
          'Found users with email: $formattedResults',
        );
        return null;
      }
      return getUser(userId: user.userId);
    });
  }

  /// Finds a user by phone number.
  Future<User?> findUserByPhoneNumber({required String phoneNumber}) {
    return transaction(() async {
      final results = await cloudAuthUsersDrift
          .lookupUserByPhone(phoneNumber: phoneNumber)
          .get();
      if (results.isEmpty) {
        return null;
      }
      final LookupUserByPhoneResult(
        cloudAuthUsers: user,
        cloudAuthUserPhoneNumbers: phoneNumberData
      ) = results.first;
      if (!phoneNumberData.isPrimary) {
        final formattedResults = results.map((it) {
          final PhoneNumber(
            :phoneNumber,
            isVerified: verified,
            isPrimary: primary
          ) = it.cloudAuthUserPhoneNumbers;
          return (
            it.cloudAuthUsers,
            (phoneNumber: phoneNumber, verified: verified, primary: primary),
          );
        }).join(' | ');
        context.logger.warning(
          'No user found with primary, verified phone number "$phoneNumber"\n'
          'Found users with phone number: $formattedResults',
        );
        return null;
      }
      return getUser(userId: user.userId);
    });
  }

  Future<Session?> getSession({
    required String sessionId,
  }) async {
    return cloudAuthCoreDrift
        .getSession(sessionId: sessionId)
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
