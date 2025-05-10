import 'package:cedar/ast.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart'
    show AuthenticationService, UsersService;

extension on CloudFunction {
  EntityUid get uid => EntityUid.of('Celest::Function', '$apiName/$name');
}

extension on Api {
  EntityUid get uid => EntityUid.of('Celest::Api', name);
}

extension on AstNode {
  EntityUid get uid => switch (this) {
    final CloudFunction function => function.uid,
    final Api api => api.uid,
    _ => unreachable(),
  };
  ResourceConstraint get resource => switch (this) {
    final Api api => ResourceIn(api.uid),
    final CloudFunction function => ResourceEquals(function.uid),
    _ => unreachable(),
  };
}

extension on ApiAuth {
  String get tag => switch (this) {
    ApiPublic() => 'public',
    ApiAuthenticated() => 'authenticated',
  };

  String get templateId => 'cloud.functions.$tag';

  void appendPolicies(AstNode node, PolicySetBuilder builder) {
    final policyId = '${node.uid.id}.$tag';
    final templateLink = TemplateLink(
      templateId: templateId,
      newId: policyId,
      values: {SlotId.resource: node.uid},
    );
    builder.templateLinks.add(templateLink);
    if (this is ApiAuthenticated) {
      // Add a forbid policy for `@authenticated` so that it overrides
      // any other allow policies, e.g. if the library has `@public`.
      builder.policies['${policyId}_restrict'] = Policy(
        effect: Effect.forbid,
        principal: const PrincipalAll(),
        action: const ActionEquals(EntityUid.of('Celest::Action', 'invoke')),
        resource: node.resource,
        conditions: [
          Condition(
            kind: ConditionKind.unless,
            body: Expr.in_(
              left: const Expr.variable(CedarVariable.principal),
              right: Expr.value(
                Value.entity(uid: EntityUid.of('Celest::Role', tag)),
              ),
            ),
          ),
        ],
      );
    }
  }
}

final class ProjectLinker extends AstVisitorWithArg<Node?, AstNode> {
  ProjectLinker({
    required Map<String, String> configValues,
    required String environmentId,
    this.driftSchemas = const {},
  }) : configValues = {...configValues, 'CELEST_ENVIRONMENT': environmentId},
       _resolvedProject =
           ResolvedProjectBuilder()..environmentId = environmentId;

  final ResolvedProjectBuilder _resolvedProject;
  late final ResolvedProject resolvedProject = run(() {
    final celestConfigValues = configValues.keys.toSet().difference(
      _seenConfigValues,
    );
    for (final name in celestConfigValues) {
      _resolvedProject.variables.add(
        ResolvedVariable(name: name, value: configValues[name]!),
      );
    }
    return _resolvedProject.build();
  });

  final Map<String, String> configValues;
  final Set<String> _seenConfigValues = {};
  final Map<String, DriftDatabaseSchema>? driftSchemas;

  @override
  ResolvedProject visitProject(Project project, AstNode context) {
    _resolvedProject
      ..projectId = project.name
      ..environmentId = project.environment
      ..sdkConfig.replace(project.sdkConfig);
    for (final variable in project.variables) {
      _resolvedProject.variables.add(visitVariable(variable, project));
    }
    for (final secret in project.secrets) {
      _resolvedProject.secrets.add(visitSecret(secret, project));
    }
    for (final api in project.apis.values) {
      _resolvedProject.apis[api.name] = visitApi(api, project);
    }
    if (project.auth case final auth?) {
      _resolvedProject.auth.replace(visitAuth(auth, project));
    }
    for (final database in project.databases.values) {
      _resolvedProject.databases[database.name] = visitDatabase(
        database,
        project,
      );
    }
    return resolvedProject;
  }

  @override
  ResolvedApi visitApi(Api api, Project context) {
    return ResolvedApi.build((resolvedApi) {
      resolvedApi.apiId = api.name;
      for (final f in api.functions.values) {
        resolvedApi.functions[f.name] = visitFunction(f, api);
      }
      final apiAuth = api.metadata.whereType<ApiAuth>().singleOrNull;
      if (apiAuth != null) {
        apiAuth.appendPolicies(api, resolvedApi.policySet);
      }
    });
  }

  @override
  Node? visitApiAuthenticated(ApiAuthenticated annotation, Api context) {
    return null;
  }

  @override
  Node? visitApiPublic(ApiPublic annotation, AstNode context) {
    return null;
  }

  @override
  Node? visitApiMiddleware(ApiMiddleware annotation, AstNode context) {
    return null;
  }

  @override
  ResolvedCloudFunction visitFunction(CloudFunction function, Api context) {
    return ResolvedCloudFunction.build((resolvedFunction) {
      resolvedFunction
        ..functionId = function.name
        ..apiId = function.apiName
        ..httpConfig.route.path = function.route
        ..streamConfig.type = function.streamType;

      // Add an additional route for the GET request required to connect via
      // websockets.
      if (function.streamType != null) {
        resolvedFunction.httpConfig.additionalRoutes.add(
          ResolvedHttpRoute(method: 'GET', path: function.route),
        );
      }

      final funcHttpMetadata = [
        ...context.metadata.whereType<ApiHttpMetadata>(),
        ...function.metadata.whereType<ApiHttpMetadata>(),
      ];
      for (final metadata in funcHttpMetadata) {
        switch (metadata) {
          case ApiHttpConfig(:final method, :final statusCode):
            resolvedFunction.httpConfig
              ..status = statusCode
              ..route.method = method;
          case ApiHttpError(:final type, :final statusCode):
            resolvedFunction.httpConfig.statusMappings[type] = statusCode;
        }
      }
      final functionAuth = function.metadata.whereType<ApiAuth>().singleOrNull;
      if (functionAuth != null) {
        functionAuth.appendPolicies(function, resolvedFunction.policySet);
      }

      for (final parameter in function.parameters) {
        switch (parameter.references) {
          case NodeReference(type: NodeType.variable, :final name):
            resolvedFunction.variables.add(name);
          case NodeReference(type: NodeType.secret, :final name):
            resolvedFunction.secrets.add(name);
        }
      }
    });
  }

  @override
  Node? visitParameter(
    CloudFunctionParameter parameter,
    CloudFunction context,
  ) {
    return null;
  }

  @override
  ResolvedVariable visitVariable(Variable variable, AstNode context) {
    final name = variable.name;
    _seenConfigValues.add(name);
    final value = configValues[name];
    if (value == null) {
      // Should have been caught before this.
      unreachable('Missing value for environment variable: $name');
    }
    return ResolvedVariable(name: name, value: value);
  }

  @override
  ResolvedSecret visitSecret(Secret secret, covariant AstNode context) {
    final name = secret.name;
    _seenConfigValues.add(name);
    final value = configValues[name];
    if (value == null) {
      // Should have been caught before this.
      unreachable('Missing value for secret: $name');
    }
    return ResolvedSecret(name: name, value: value);
  }

  @override
  ResolvedAuth visitAuth(Auth auth, Project context) {
    assert(
      auth.providers.isNotEmpty || auth.externalProviders.isNotEmpty,
      'Must have at least one auth provider',
    );

    // Ensure auth routes are exposed in the route map.
    //
    // External auth providers do not require custom routes exposed on the
    // Celest backend.
    if (auth.providers.isNotEmpty) {
      final authService = AuthenticationService.api;
      final usersService = UsersService.api;
      _resolvedProject.apis.addAll({
        authService.apiId: authService,
        usersService.apiId: usersService,
      });
    }

    return ResolvedAuth.build((b) {
      for (final authProvider in auth.providers) {
        b.providers.add(visitAuthProvider(authProvider, auth));
      }
      for (final externalAuthProvider in auth.externalProviders) {
        b.externalProviders.add(
          visitExternalAuthProvider(externalAuthProvider, auth),
        );
      }
    });
  }

  @override
  ResolvedAuthProvider visitAuthProvider(AuthProvider provider, Auth context) {
    switch (provider) {
      case EmailAuthProvider(:final name):
        return ResolvedEmailAuthProvider(authProviderId: name);
      case SmsAuthProvider(:final name):
        return ResolvedSmsAuthProvider(authProviderId: name);
      case GoogleAuthProvider(
        :final name,
        :final clientId,
        :final clientSecret,
      ):
        return ResolvedGoogleAuthProvider(
          authProviderId: name,
          clientId: visitSecret(clientId, context),
          clientSecret: visitSecret(clientSecret, context),
        );
      case GitHubAuthProvider(
        :final name,
        :final clientId,
        :final clientSecret,
      ):
        return ResolvedGitHubAuthProvider(
          authProviderId: name,
          clientId: visitSecret(clientId, context),
          clientSecret: visitSecret(clientSecret, context),
        );
      case AppleAuthProvider(
        :final name,
        :final clientId,
        :final teamId,
        :final keyId,
        :final privateKey,
      ):
        return ResolvedAppleAuthProvider(
          authProviderId: name,
          clientId: visitSecret(clientId, context),
          teamId: visitSecret(teamId, context),
          keyId: visitSecret(keyId, context),
          privateKey: visitSecret(privateKey, context),
        );
    }
  }

  @override
  ResolvedExternalAuthProvider visitExternalAuthProvider(
    ExternalAuthProvider provider,
    covariant AstNode context,
  ) {
    return switch (provider) {
      FirebaseExternalAuthProvider(:final name, :final projectId) =>
        ResolvedFirebaseExternalAuthProvider(
          authProviderId: name,
          projectId: visitVariable(projectId, context),
        ),
      SupabaseExternalAuthProvider(
        :final name,
        :final projectUrl,
        :final jwtSecret,
      ) =>
        ResolvedSupabaseExternalAuthProvider(
          authProviderId: name,
          projectUrl: visitVariable(projectUrl, context),
          jwtSecret: jwtSecret?.let((secret) => visitSecret(secret, context)),
        ),
    };
  }

  @override
  Node? visitApiHttpMetadata(ApiHttpMetadata metadata, AstNode context) {
    return null;
  }

  void _addDbStudio(ResolvedApiBuilder api) {
    api.apiId = '_admin';
    api.functions['studio'] = ResolvedCloudFunction(
      apiId: '_admin',
      functionId: 'studio',
      httpConfig: ResolvedHttpConfig(
        route: ResolvedHttpRoute(method: 'GET', path: '/_admin/studio'),
      ),
    );
    api.functions['studio/query'] = ResolvedCloudFunction(
      apiId: '_admin',
      functionId: 'studio/query',
      httpConfig: ResolvedHttpConfig(
        route: ResolvedHttpRoute(method: 'POST', path: '/_admin/studio/query'),
      ),
    );
    if (api.policySet.templateLinks.isEmpty) {
      api.policySet.templateLinks.add(
        TemplateLink(
          templateId: 'cloud.functions.admin',
          newId: 'celest.cloud._admin',
          values: {SlotId.resource: EntityUid.of('Celest::Api', '_admin')},
        ),
      );
    }
  }

  @override
  ResolvedDatabase visitDatabase(Database database, Project context) {
    // Add a route for DB studio
    _resolvedProject.apis.updateValue(
      '_admin',
      (api) => api.rebuild(_addDbStudio),
      ifAbsent: () => ResolvedApi.build(_addDbStudio),
    );
    return ResolvedDatabase.build((b) {
      b.databaseId = database.name;
      b.config = switch (database.config) {
        CelestDatabaseConfig(:final hostname, :final token) =>
          ResolvedCelestDatabaseConfig(
            // The deployed environments, values for these are filled in only
            // after the project is deployed.
            //
            // For local environments, the values are never needed.
            hostname: ResolvedVariable(name: hostname.name, value: ''),
            token: ResolvedSecret(name: token.name, value: ''),
          ),
      };
      b.schema = visitDatabaseSchema(database.schema, database);
    });
  }

  @override
  ResolvedDatabaseSchema visitDatabaseSchema(
    DatabaseSchema schema,
    Database context,
  ) {
    return switch (schema) {
      // TODO(dnys1): Use drift_dev to resolve the schema.
      DriftDatabaseSchema() => ResolvedDriftDatabaseSchema(
        databaseSchemaId: context.name,
        version: schema.version,
        schemaJson: {},
      ),
    };
  }
}
