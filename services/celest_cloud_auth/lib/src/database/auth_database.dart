import 'package:async/async.dart';
import 'package:cedar/ast.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_auth/src/authorization/cedar_interop.dart';
import 'package:celest_cloud_auth/src/authorization/policy_set.g.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart';
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart';
import 'package:celest_cloud_auth/src/database/schema_versions.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/celest_core.dart';
import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart' hide Component;
import 'package:drift/native.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:protobuf/protobuf.dart';

import 'auth_database.drift.dart';

@DriftDatabase(
  include: {
    'schema/auth.drift',
    'schema/cedar.drift',
    'schema/projects.drift',
    'schema/users.drift',
  },
)
class AuthDatabase extends $AuthDatabase {
  AuthDatabase(super.e) : _project = null;

  AuthDatabase._(super.e, this._project);

  factory AuthDatabase.localDir(
    Directory dir, {
    ResolvedProject? project,
    bool verbose = false,
  }) {
    return AuthDatabase._(
      _openDirConnection(dir, verbose: verbose),
      project,
    );
  }

  factory AuthDatabase.memory({
    bool verbose = false,
    ResolvedProject? project,
  }) {
    final nativeDb = NativeDatabase.memory(
      logStatements: verbose,
      cachePreparedStatements: true,
    );
    return AuthDatabase._(nativeDb, project);
  }

  static final Logger _logger = Logger('Celest.AuthDatabase');

  static QueryExecutor _openDirConnection(
    Directory dir, {
    required bool verbose,
  }) {
    return LazyDatabase(() async {
      final file = dir.childFile('auth.celest.db');
      if (!file.existsSync()) {
        await file.create(recursive: true);
      }
      return NativeDatabase(
        file,
        logStatements: verbose,
        cachePreparedStatements: true,
        enableMigrations: true,
      );
    });
  }

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
    const EntityUid.of('Celest::Action', 'create'): const Entity(
      uid: EntityUid.of('Celest::Action', 'create'),
    ),
    const EntityUid.of('Celest::Action', 'get'): const Entity(
      uid: EntityUid.of('Celest::Action', 'get'),
    ),
    const EntityUid.of('Celest::Action', 'list'): const Entity(
      uid: EntityUid.of('Celest::Action', 'list'),
    ),
    const EntityUid.of('Celest::Action', 'update'): const Entity(
      uid: EntityUid.of('Celest::Action', 'update'),
    ),
    const EntityUid.of('Celest::Action', 'delete'): const Entity(
      uid: EntityUid.of('Celest::Action', 'delete'),
    ),
    const EntityUid.of('Celest::Action', 'invoke'): const Entity(
      uid: EntityUid.of('Celest::Action', 'invoke'),
    ),
    const EntityUid.of('Celest::Role', 'anonymous'): const Entity(
      uid: EntityUid.of('Celest::Role', 'anonymous'),
    ),
    const EntityUid.of('Celest::Role', 'authenticated'): const Entity(
      uid: EntityUid.of('Celest::Role', 'authenticated'),
      parents: [
        EntityUid.of('Celest::Role', 'anonymous'),
      ],
    ),
    const EntityUid.of('Celest::Role', 'admin'): const Entity(
      uid: EntityUid.of('Celest::Role', 'admin'),
      parents: [
        EntityUid.of('Celest::Role', 'authenticated'),
      ],
    ),
  };

  final ResolvedProject? _project;
  ResolvedProject get project => _project ?? context.project;

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        await seed();
      },
      onUpgrade: stepByStep(),
      beforeOpen: (details) {
        return _withoutForeignKeys(() async {
          await upsertProject();
        });
      },
    );
  }

  /// Runs [action] in a context without foreign keys enabled.
  Future<R> _withoutForeignKeys<R>(Future<R> Function() action) async {
    await customStatement('pragma foreign_keys = OFF');
    R result;
    try {
      result = await action();
    } finally {
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

  /// Pings the database to ensure a valid connection.
  Future<void> ping() async {
    await customSelect('SELECT 1').get();
  }

  /// Seeds the database with core types, entities, and relationships.
  Future<void> seed() async {
    _logger.finer('Seeding database');
    await transaction(() async {
      await batch((b) {
        b.insertAllOnConflictUpdate(cedarTypes, [
          for (final type in coreTypes) CedarTypesCompanion.insert(fqn: type),
        ]);
      });
      await Future.wait(
        coreEntities.values.map(createEntity),
        eagerError: true,
      );
      await upsertPolicySet(corePolicySet);
    });
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
  Future<void> upsertProject() {
    _logger.finer('Upserting project: ${project.projectId}');

    return transaction(() async {
      final oldProject = await projectsDrift
          .getProject(projectId: project.projectId)
          .getSingleOrNull();
      final newProject = (await projectsDrift.upsertProject(
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
        await projectsDrift.upsertApi(
          projectId: project.projectId,
          apiId: api.apiId,
          resolvedAst: api,
          etag: _etag(api.toProto()),
        );
        await createEntity(Entity(uid: api.uid, parents: [project.uid]));
        for (final function in api.functions.values) {
          _logger.finer('Upserting function: ${function.functionId}');
          await projectsDrift.upsertFunction(
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
      final newUser = await usersDrift.createUser(
        userId: user.userId,
        givenName: user.givenName,
        familyName: user.familyName,
        timeZone: user.timeZone,
        languageCode: user.languageCode,
      );
      for (final email in user.emails) {
        await usersDrift.upsertUserEmail(
          userId: user.userId,
          email: email.email,
          isVerified: email.isVerified,
          isPrimary: email.isPrimary,
        );
      }
      for (final phoneNumber in user.phoneNumbers) {
        await usersDrift.upsertUserPhoneNumber(
          userId: user.userId,
          phoneNumber: phoneNumber.phoneNumber,
          isVerified: phoneNumber.isVerified,
          isPrimary: phoneNumber.isPrimary,
        );
      }
      for (final role in user.roles) {
        await cedarDrift.createRelationship(
          entityType: 'Celest::User',
          entityId: newUser.first.userId,
          parentType: role.type,
          parentId: role.id,
        );
      }
      return newUser.first.copyWith(
        emails: user.emails,
        phoneNumbers: user.phoneNumbers,
      );
    });
  }

  /// Retrieves a user from the database.
  Future<User?> getUser({required String userId}) {
    return transaction(() async {
      final user = await usersDrift.getUser(userId: userId).getSingleOrNull();
      if (user == null) {
        return null;
      }
      final (emails, phoneNumbers) = await (
        usersDrift.getUserEmails(userId: userId).get(),
        usersDrift.getUserPhoneNumbers(userId: userId).get(),
      ).wait;
      return user.copyWith(
        emails: emails,
        phoneNumbers: phoneNumbers,
      );
    });
  }

  /// Finds a user by email.
  Future<User?> findUserByEmail({required String email}) {
    return transaction(() async {
      final results = await usersDrift.lookupUserByEmail(email: email).get();
      if (results.isEmpty) {
        return null;
      }
      final LookupUserByEmailResult(
        users: user,
        userEmails: emailData,
      ) = results.first;
      if (!emailData.isPrimary) {
        final formattedResults = results.map((it) {
          final Email(:email, isVerified: verified, isPrimary: primary) =
              it.userEmails;
          return (
            it.users,
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
      final results =
          await usersDrift.lookupUserByPhone(phoneNumber: phoneNumber).get();
      if (results.isEmpty) {
        return null;
      }
      final LookupUserByPhoneResult(
        users: user,
        userPhoneNumbers: phoneNumberData
      ) = results.first;
      if (!phoneNumberData.isPrimary) {
        final formattedResults = results.map((it) {
          final PhoneNumber(
            :phoneNumber,
            isVerified: verified,
            isPrimary: primary
          ) = it.userPhoneNumbers;
          return (
            it.users,
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
