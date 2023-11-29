import 'package:celest_cli/analyzer/ast.dart';

abstract class AstVisitor<T> {
  T visitNode(AstNode node) => switch (node) {
        final ProjectAst project => visitProject(project),
        final ApiAst api => visitApi(api),
        final FunctionAst function => visitFunction(function),
        final ParameterAst parameter => visitParameter(parameter),
        final ApiAuthenticated apiAuthenticated =>
          visitApiAuthenticated(apiAuthenticated),
        final ApiMiddleware apiMiddleware => visitApiMiddleware(apiMiddleware),
      };

  T visitProject(ProjectAst project);

  T visitApi(ApiAst api);

  T visitFunction(FunctionAst function);

  T visitParameter(ParameterAst parameter);

  T visitApiAuthenticated(ApiAuthenticated annotation);

  T visitApiMiddleware(ApiMiddleware annotation);
}
