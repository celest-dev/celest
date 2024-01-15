import 'package:celest_cli/ast/ast.dart';

abstract class AstVisitor<T> {
  T visitNode(AstNode node) => switch (node) {
        final Project project => visitProject(project),
        final Api api => visitApi(api),
        final CloudFunction function => visitFunction(function),
        final CloudFunctionParameter parameter => visitParameter(parameter),
        final ApiPublic apiPublic => visitApiPublic(apiPublic),
        final ApiAuthenticated apiAuthenticated =>
          visitApiAuthenticated(apiAuthenticated),
        final ApiMiddleware apiMiddleware => visitApiMiddleware(apiMiddleware),
        final EnvironmentVariable environmentVariable =>
          visitEnvironmentVariable(environmentVariable),
      };

  T visitProject(Project project);

  T visitApi(Api api);

  T visitFunction(CloudFunction function);

  T visitParameter(CloudFunctionParameter parameter);

  T visitApiAuthenticated(ApiAuthenticated annotation);

  T visitApiPublic(ApiPublic annotation);

  T visitApiMiddleware(ApiMiddleware annotation);

  T visitEnvironmentVariable(EnvironmentVariable variable);
}

abstract class AstVisitorWithContext<R, C> {
  R visitNode(AstNode node, C context) => switch (node) {
        final Project project => visitProject(project, context),
        final Api api => visitApi(api, context),
        final CloudFunction function => visitFunction(function, context),
        final CloudFunctionParameter parameter =>
          visitParameter(parameter, context),
        final ApiPublic apiPublic => visitApiPublic(apiPublic, context),
        final ApiAuthenticated apiAuthenticated =>
          visitApiAuthenticated(apiAuthenticated, context),
        final ApiMiddleware apiMiddleware =>
          visitApiMiddleware(apiMiddleware, context),
        final EnvironmentVariable environmentVariable =>
          visitEnvironmentVariable(environmentVariable, context),
      };

  R visitProject(Project project, covariant C context);

  R visitApi(Api api, covariant C context);

  R visitFunction(CloudFunction function, covariant C context);

  R visitParameter(CloudFunctionParameter parameter, covariant C context);

  R visitApiAuthenticated(ApiAuthenticated annotation, covariant C context);

  R visitApiPublic(ApiPublic annotation, covariant C context);

  R visitApiMiddleware(ApiMiddleware annotation, covariant C context);

  R visitEnvironmentVariable(EnvironmentVariable variable, covariant C context);
}
