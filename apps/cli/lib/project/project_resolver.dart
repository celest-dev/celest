import 'package:cedar_common/cedar_common.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_proto/ast.dart';
import 'package:collection/collection.dart';

extension on ApiAuth {
  String get name => switch (this) {
        ApiPublic() => 'public',
        ApiAuthenticated() => 'authenticated',
      };
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
      final apiHash =
          api.hashCode.toRadixString(16).padRight(8, '0').substring(0, 8);
      final policyName = '${api.id.type}::${api.name}_${apiAuth.name}_$apiHash';
      final policy = CedarPolicy(
        effect: CedarPolicyEffect.permit,
        principal: switch (apiAuth) {
          ApiPublic() => CedarPolicyPrincipal(op: CedarPolicyOp.all),
          ApiAuthenticated(:final id) =>
            CedarPolicyPrincipal(op: CedarPolicyOp.in$, entity: id),
        },
        action: CedarPolicyAction(
          op: CedarPolicyOp.equals,
          entity: CloudFunctionAction.invoke.id,
        ),
        resource: CedarPolicyResource(
          op: CedarPolicyOp.in$,
          entity: api.id,
        ),
        conditions: [],
      );
      resolvedApi.policySet.policies.updateValue(
        policyName,
        (_) => throw StateError('Duplicate policy name: $policyName'),
        ifAbsent: () => policy,
      );
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
              final functionHash = function.hashCode
                  .toRadixString(16)
                  .padRight(8, '0')
                  .substring(0, 8);
              final policyName =
                  '${function.id.type}::${function.name}_${functionAuth.name}_$functionHash';
              final policy = CedarPolicy(
                effect: CedarPolicyEffect.permit,
                principal: switch (functionAuth) {
                  ApiPublic() => CedarPolicyPrincipal(op: CedarPolicyOp.all),
                  ApiAuthenticated(:final id) =>
                    CedarPolicyPrincipal(op: CedarPolicyOp.in$, entity: id),
                },
                action: CedarPolicyAction(
                  op: CedarPolicyOp.equals,
                  entity: CloudFunctionAction.invoke.id,
                ),
                resource: CedarPolicyResource(
                  op: CedarPolicyOp.equals,
                  entity: function.id,
                ),
                conditions: [],
              );
              resolvedFunction.policySet.policies.updateValue(
                policyName,
                (_) => throw StateError('Duplicate policy name: $policyName'),
                ifAbsent: () => policy,
              );
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
