import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_proto/ast.dart';
import 'package:collection/collection.dart';

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
  }

  @override
  void visitApi(Api api) {
    _resolvedProject.apis[api.name] = ResolvedApi.build((resolvedApi) {
      resolvedApi.name = api.name;
      final apiAuth = api.metadata.whereType<ApiAuth>().singleOrNull;
      if (apiAuth == null) {
        return;
      }
      resolvedApi.policy.statements.add(
        PolicyStatement(
          grantee: switch (apiAuth) {
            ApiAuthenticated() => Role.authenticated,
            ApiPublic() => Role.public,
          },
          actions: [CloudFunctionAction.invoke],
        ),
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
            resolvedFunction.policy.statements.add(
              PolicyStatement(
                grantee: Role.authenticated,
                actions: [CloudFunctionAction.invoke],
              ),
            );

            for (final parameter in function.parameters) {
              if (parameter.references
                  case NodeReference(type: NodeType.environmentVariable) &&
                      final nodeReference) {
                resolvedFunction.envVars.add(nodeReference.name);
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
    _resolvedProject.auth.providers.addAll([
      for (final provider in auth.providers)
        ResolvedAuthProvider(name: provider.name, type: provider.type),
    ]);
  }

  @override
  void visitAuthProvider(AuthProvider provider) {}
}
