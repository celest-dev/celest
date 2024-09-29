import 'package:cedar/ast.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/context.dart';
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

final class ProjectResolver extends AstVisitorWithArg<void, AstNode> {
  final _resolvedProject = ResolvedProjectBuilder();
  ResolvedProject get resolvedProject => _resolvedProject.build();

  @override
  void visitProject(Project project, AstNode context) {
    _resolvedProject
      ..name = project.name
      ..sdkInfo.replace(project.sdkInfo);
    for (final api in project.apis.values) {
      visitApi(api, project);
    }
    for (final envVar in project.envVars) {
      visitEnvironmentVariable(envVar, project);
    }
    if (project.auth case final auth?) {
      visitAuth(auth, project);
    }
  }

  @override
  void visitApi(Api api, Project context) {
    _resolvedProject.apis[api.name] = ResolvedApi.build((resolvedApi) {
      resolvedApi.name = api.name;
      final apiAuth = api.metadata.whereType<ApiAuth>().singleOrNull;
      if (apiAuth == null) {
        return;
      }
      final policies = apiAuth.policiesFor(api);
      for (final (i, policy) in policies.indexed) {
        final policyName = '${api.id.type}::${api.name}_${apiAuth.name}_$i';
        resolvedApi.policySet.policies.updateValue(
          policyName,
          (_) => throw StateError('Duplicate policy name: $policyName'),
          ifAbsent: () => policy,
        );
      }
    });

    for (final f in api.functions.values) {
      visitFunction(f, api);
    }
  }

  @override
  void visitApiAuthenticated(ApiAuthenticated annotation, AstNode context) {}

  @override
  void visitApiPublic(ApiPublic annotation, AstNode context) {}

  @override
  void visitApiMiddleware(ApiMiddleware annotation, AstNode context) {}

  @override
  void visitFunction(CloudFunction function, Api context) {
    _resolvedProject.apis.updateValue(function.apiName, (resolvedApi) {
      return resolvedApi.rebuild((resolvedApi) {
        resolvedApi.functions[function.name] = ResolvedCloudFunction.build(
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
              if (parameter.references
                  case NodeReference(
                    type: NodeType.environmentVariable,
                    :final name
                  )) {
                resolvedFunction.envVars.add(name);
              }
            }
          },
        );
      });
    });
  }

  @override
  void visitParameter(
    CloudFunctionParameter parameter,
    CloudFunction context,
  ) {}

  @override
  void visitEnvironmentVariable(EnvironmentVariable variable, Project context) {
    final envName = variable.envName;
    final envValue = celestProject.envManager.cachedValueFor(envName);
    if (envValue == null) {
      unreachable('Should have been caught before this');
    }
    _resolvedProject.envVars.add(
      ResolvedEnvironmentVariable(
        name: envName,
        value: envValue,
      ),
    );
  }

  @override
  void visitAuth(Auth auth, Project context) {
    for (final authProvider in auth.providers) {
      visitAuthProvider(authProvider, auth);
    }
  }

  @override
  void visitAuthProvider(AuthProvider provider, Auth context) {
    _resolvedProject.auth.providers.add(
      ResolvedAuthProvider(name: provider.name, type: provider.type),
    );
  }

  @override
  void visitApiHttpMetadata(ApiHttpMetadata metadata, AstNode context) {}
}
