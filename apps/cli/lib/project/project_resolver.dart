import 'package:cedar/cedar.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:api_celest/ast.dart';
import 'package:collection/collection.dart';

extension on AstNode {
  CedarPolicyResource get resource => switch (this) {
        final Api api => CedarPolicyResource(
            op: CedarPolicyOp.in$,
            entity: api.id,
          ),
        final CloudFunction function => CedarPolicyResource(
            op: CedarPolicyOp.equals,
            entity: function.id,
          ),
        _ => unreachable(),
      };
}

extension on ApiAuth {
  String get name => switch (this) {
        ApiPublic() => 'public',
        ApiAuthenticated() => 'authenticated',
      };

  List<CedarPolicy> policiesFor(AstNode node) {
    return switch (this) {
      ApiAuthenticated(:final role) => [
          CedarPolicy(
            effect: CedarPolicyEffect.permit,
            principal: CedarPolicyPrincipal(
              op: CedarPolicyOp.in$,
              entity: role,
            ),
            action: CedarPolicyAction(
              op: CedarPolicyOp.equals,
              entity: CloudFunctionAction.invoke.id,
            ),
            resource: node.resource,
          ),

          // Add a forbid policy for `@authenticated` so that it overrides
          // any other allow policies, e.g. if the library has `@public`.
          CedarPolicy(
            effect: CedarPolicyEffect.forbid,
            principal: CedarPolicyPrincipal(op: CedarPolicyOp.all),
            action: CedarPolicyAction(
              op: CedarPolicyOp.equals,
              entity: CloudFunctionAction.invoke.id,
            ),
            resource: node.resource,
            conditions: [
              CedarPolicyCondition(
                kind: CedarPolicyConditionKind.unless,
                body: JsonExpr.in$(
                  const JsonExpr.variable(CedarVariable.principal),
                  JsonExpr.value(
                    CedarValueJson.entity(role),
                  ),
                ),
              ),
            ],
          ),
        ],
      ApiPublic() => [
          CedarPolicy(
            effect: CedarPolicyEffect.permit,
            principal: CedarPolicyPrincipal(op: CedarPolicyOp.all),
            action: CedarPolicyAction(
              op: CedarPolicyOp.equals,
              entity: CloudFunctionAction.invoke.id,
            ),
            resource: node.resource,
          ),
        ],
    };
  }
}

final class ProjectResolver extends AstVisitor<void> {
  final _resolvedProject = ResolvedProjectBuilder();
  ResolvedProject get resolvedProject => _resolvedProject.build();

  @override
  void visitProject(Project project) {
    _resolvedProject
      ..name = project.name
      ..sdkInfo.replace(project.sdkInfo);
    project.apis.values.forEach(visitApi);
    project.envVars.forEach(visitEnvironmentVariable);
    project.auth?.accept(this);
  }

  @override
  void visitApi(Api api) {
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

    api.functions.values.forEach(visitFunction);
  }

  @override
  void visitApiAuthenticated(ApiAuthenticated annotation) {}

  @override
  void visitApiPublic(ApiPublic annotation) {}

  @override
  void visitApiMiddleware(ApiMiddleware annotation) {}

  @override
  void visitFunction(CloudFunction function) {
    _resolvedProject.apis.updateValue(function.apiName, (resolvedApi) {
      return resolvedApi.rebuild((resolvedApi) {
        resolvedApi.functions[function.name] = ResolvedCloudFunction.build(
          (resolvedFunction) {
            resolvedFunction
              ..name = function.name
              ..route = function.route
              ..apiName = function.apiName;
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
  void visitParameter(CloudFunctionParameter parameter) {}

  @override
  void visitEnvironmentVariable(EnvironmentVariable variable) {
    final envName = variable.envName;
    final envValue = projectPaths.envManager.get(envName);
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
  void visitAuth(Auth auth) {
    auth.providers.forEach(visitAuthProvider);
  }

  @override
  void visitAuthProvider(AuthProvider provider) {
    _resolvedProject.auth.providers.add(
      ResolvedAuthProvider(name: provider.name, type: provider.type),
    );
  }
}
