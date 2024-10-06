import 'package:cedar/ast.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:collection/collection.dart';

extension on AstNode {
  ResourceConstraint get resource => switch (this) {
        final Api api => ResourceIn(api.id),
        final CloudFunction function => ResourceEquals(function.id),
        _ => unreachable(),
      };
}

extension on ApiAuth {
  String get name => switch (this) {
        ApiPublic() => 'public',
        ApiAuthenticated() => 'authenticated',
      };

  List<Policy> policiesFor(AstNode node) {
    return switch (this) {
      ApiAuthenticated(:final role) => [
          Policy(
            effect: Effect.permit,
            principal: PrincipalIn(role),
            action: ActionEquals(CloudFunctionAction.invoke.id),
            resource: node.resource,
          ),

          // Add a forbid policy for `@authenticated` so that it overrides
          // any other allow policies, e.g. if the library has `@public`.
          Policy(
            effect: Effect.forbid,
            principal: const PrincipalAll(),
            action: ActionEquals(CloudFunctionAction.invoke.id),
            resource: node.resource,
            conditions: [
              Condition(
                kind: ConditionKind.unless,
                body: Expr.in_(
                  left: const Expr.variable(CedarVariable.principal),
                  right: Expr.value(Value.entity(uid: role)),
                ),
              ),
            ],
          ),
        ],
      ApiPublic() => [
          Policy(
            effect: Effect.permit,
            principal: const PrincipalAll(),
            action: ActionEquals(CloudFunctionAction.invoke.id),
            resource: node.resource,
          ),
        ],
    };
  }
}

final class ProjectResolver extends AstVisitorWithArg<Node?, AstNode> {
  ProjectResolver({
    required Map<String, String> configValues,
    String environmentId = 'local',
  }) : configValues = {
          ...configValues,
          'CELEST_ENVIRONMENT': environmentId,
        };

  final _resolvedProject = ResolvedProjectBuilder();
  late final ResolvedProject resolvedProject = _resolvedProject.build();

  final Map<String, String> configValues;

  @override
  ResolvedProject visitProject(Project project, AstNode context) {
    _resolvedProject
      ..name = project.name
      ..sdkInfo.replace(project.sdkInfo);
    for (final envVar in project.envVars) {
      _resolvedProject.envVars.add(
        visitEnvironmentVariable(envVar, project),
      );
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
    return resolvedProject;
  }

  @override
  ResolvedApi visitApi(Api api, Project context) {
    return ResolvedApi.build((resolvedApi) {
      resolvedApi.name = api.name;
      final apiAuth = api.metadata.whereType<ApiAuth>().singleOrNull;
      if (apiAuth != null) {
        final policies = apiAuth.policiesFor(api);
        for (final (i, policy) in policies.indexed) {
          final policyName = '${api.id.type}::${api.name}_${apiAuth.name}_$i';
          resolvedApi.policySet.policies.updateValue(
            policyName,
            (_) => throw StateError('Duplicate policy name: $policyName'),
            ifAbsent: () => policy,
          );
        }
      }

      for (final f in api.functions.values) {
        resolvedApi.functions[f.name] = visitFunction(f, api);
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
    return ResolvedCloudFunction.build(
      (resolvedFunction) {
        resolvedFunction
          ..name = function.name
          ..route = function.route
          ..apiName = function.apiName
          ..streamType = function.streamType;
        final functionAuth =
            function.metadata.whereType<ApiAuth>().singleOrNull;
        if (functionAuth != null) {
          final policies = functionAuth.policiesFor(function);
          for (final (i, policy) in policies.indexed) {
            final policyName =
                '${function.id.type}::${function.name}_${functionAuth.name}_$i';
            resolvedFunction.policySet.policies.updateValue(
              policyName,
              (_) => throw StateError('Duplicate policy name: $policyName'),
              ifAbsent: () => policy,
            );
          }
        }

        final funcHttpMetadata = [
          ...context.metadata.whereType<ApiHttpMetadata>(),
          ...function.metadata.whereType<ApiHttpMetadata>(),
        ];
        for (final metadata in funcHttpMetadata) {
          switch (metadata) {
            case ApiHttpConfig(:final method, :final statusCode):
              resolvedFunction.httpConfig
                ..method = method
                ..statusCode = statusCode;
            case ApiHttpError(:final type, :final statusCode):
              resolvedFunction.httpConfig.errorStatuses[type] = statusCode;
          }
        }

        for (final parameter in function.parameters) {
          switch (parameter.references) {
            case NodeReference(type: NodeType.environmentVariable, :final name):
              resolvedFunction.envVars.add(name);
            case NodeReference(type: NodeType.secret, :final name):
              resolvedFunction.secrets.add(name);
          }
        }
      },
    );
  }

  @override
  Node? visitParameter(
    CloudFunctionParameter parameter,
    CloudFunction context,
  ) {
    return null;
  }

  @override
  ResolvedEnvironmentVariable visitEnvironmentVariable(
    EnvironmentVariable variable,
    AstNode context,
  ) {
    final envName = variable.envName;
    final envValue = configValues[envName];
    if (envValue == null) {
      // Should have been caught before this.
      unreachable('Missing value for environment variable: $envName');
    }
    return ResolvedEnvironmentVariable(
      name: envName,
      value: envValue,
    );
  }

  @override
  ResolvedSecret visitSecret(Secret secret, covariant AstNode context) {
    final envName = secret.envName;
    final envValue = configValues[envName];
    if (envValue == null) {
      // Should have been caught before this.
      unreachable('Missing value for secret: $envName');
    }
    return ResolvedSecret(
      name: envName,
      value: envValue,
    );
  }

  @override
  ResolvedAuth visitAuth(Auth auth, Project context) {
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
        return ResolvedEmailAuthProvider(name: name);
      case SmsAuthProvider(:final name):
        return ResolvedSmsAuthProvider(name: name);
      case GoogleAuthProvider(
          :final name,
          :final clientId,
          :final clientSecret
        ):
        return ResolvedGoogleAuthProvider(
          name: name,
          clientId: visitSecret(clientId, context),
          clientSecret: visitSecret(clientSecret, context),
        );
      case GitHubAuthProvider(
          :final name,
          :final clientId,
          :final clientSecret
        ):
        return ResolvedGitHubAuthProvider(
          name: name,
          clientId: visitSecret(clientId, context),
          clientSecret: visitSecret(clientSecret, context),
        );
      case AppleAuthProvider(
          :final name,
          :final clientId,
          :final teamId,
          :final keyId,
          :final privateKey
        ):
        return ResolvedAppleAuthProvider(
          name: name,
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
      FirebaseExternalAuthProvider(
        :final name,
        :final projectId,
      ) =>
        ResolvedFirebaseExternalAuthProvider(
          name: name,
          projectId: visitEnvironmentVariable(projectId, context),
        ),
      SupabaseExternalAuthProvider(
        :final name,
        :final jwtSecret,
      ) =>
        ResolvedSupabaseExternalAuthProvider(
          name: name,
          jwtSecret: visitSecret(jwtSecret, context),
        ),
    };
  }

  @override
  Node? visitApiHttpMetadata(ApiHttpMetadata metadata, AstNode context) {
    return null;
  }
}
