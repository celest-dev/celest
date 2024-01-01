import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/ast/visitor.dart';
import 'package:collection/collection.dart';

final class ProjectDiff extends AstVisitor<void> {
  ProjectDiff(this.project);

  final Project project;

  var requiresRestart = false;

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
    if (project.apis[function.apiName]?.functions[function.name] == null) {
      requiresRestart = true;
    }
    function.parameters.forEach(visitNode);
    function.metadata.forEach(visitNode);
  }

  @override
  void visitParameter(CloudFunctionParameter parameter) {}

  @override
  void visitProject(Project project) {
    project.apis.values.forEach(visitApi);
    project.envVars.forEach(visitEnvironmentVariable);
  }
}
