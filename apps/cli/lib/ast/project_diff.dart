import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/ast/visitor.dart';
import 'package:collection/collection.dart';

final class ProjectDiff extends AstVisitor<void> {
  ProjectDiff(this.project);

  final Project project;

  var requiresRestart = false;

  @override
  void visitProject(Project project) {
    project.apis.values.forEach(visitApi);
    project.envVars.forEach(visitEnvironmentVariable);
  }

  @override
  void visitApi(Api api) {
    if (!project.apis.containsKey(api.name)) {
      requiresRestart = true;
    }
    api.metadata.forEach(visitNode);
    api.functions.values.forEach(visitNode);
  }

  @override
  void visitApiAuthenticated(ApiAuthenticated annotation) {}

  @override
  void visitApiMiddleware(ApiMiddleware annotation) {}

  @override
  void visitApiPublic(ApiPublic annotation) {}

  @override
  void visitEnvironmentVariable(EnvironmentVariable variable) {
    if (project.envVars.none((envVar) => envVar.envName == variable.envName)) {
      requiresRestart = true;
    }
  }

  @override
  void visitFunction(CloudFunction function) {
    final oldFunction =
        project.apis[function.apiName]?.functions[function.name];
    if (oldFunction == null) {
      requiresRestart = true;
      return;
    }
    if (function.returnType != oldFunction.returnType) {
      requiresRestart = true;
      return;
    }
    for (final parameter in function.parameters) {
      visitNode(parameter);

      final oldParameter = oldFunction.parameters.firstWhereOrNull(
        (oldParameter) => oldParameter.name == parameter.name,
      );
      if (oldParameter == null || oldParameter != parameter) {
        requiresRestart = true;
        return;
      }
    }
    function.metadata.forEach(visitNode);
  }

  @override
  void visitParameter(CloudFunctionParameter parameter) {}
}
