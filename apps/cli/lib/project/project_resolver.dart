import 'package:celest_cli/ast/actions.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/resolved_ast.dart';
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:collection/collection.dart';

final class ProjectResolver extends AstVisitor<void> {
  final _resolvedProject = ResolvedProjectBuilder();
  ResolvedProject get resolvedProject => _resolvedProject.build();

  @override
  void visitProject(ast.Project project) {
    _resolvedProject.name = project.name;
    project.apis.values.forEach(visitApi);
    project.envVars.forEach(visitEnvironmentVariable);
  }

  @override
  void visitApi(ast.Api api) {
    _resolvedProject.apis[api.name] = ResolvedApi.build((resolvedApi) {
      resolvedApi.name = api.name;
      final apiAuth = api.metadata.whereType<ast.ApiAuth>().singleOrNull;
      if (apiAuth == null) {
        return;
      }
      resolvedApi.policy.statements.add(
        PolicyStatement(
          grantee: switch (apiAuth) {
            ast.ApiAuthenticated() => Role.authenticated,
            ast.ApiPublic() => Role.public,
          },
          actions: [CloudFunctionAction.invoke],
        ),
      );
    });

    api.functions.values.forEach(visitFunction);
  }

  @override
  void visitApiAuthenticated(ast.ApiAuthenticated annotation) {}

  @override
  void visitApiPublic(ast.ApiPublic annotation) {}

  @override
  void visitApiMiddleware(ast.ApiMiddleware annotation) {}

  @override
  void visitFunction(ast.CloudFunction function) {
    _resolvedProject.apis.updateValue(function.apiName, (resolvedApi) {
      return resolvedApi.rebuild((resolvedApi) {
        resolvedApi.functions[function.name] = ResolvedCloudFunction.build(
          (resolvedFunction) {
            resolvedFunction
              ..name = function.name
              ..apiName = function.apiName;
            resolvedFunction.policy.statements.add(
              PolicyStatement(
                grantee: Role.authenticated,
                actions: [CloudFunctionAction.invoke],
              ),
            );

            for (final parameter in function.parameters) {
              if (parameter.references
                  case ast.NodeReference(
                        type: ast.NodeType.environmentVariable
                      ) &&
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
  void visitParameter(ast.CloudFunctionParameter parameter) {}

  @override
  void visitEnvironmentVariable(ast.EnvironmentVariable variable) {
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
}
