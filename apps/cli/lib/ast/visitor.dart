import 'package:celest_cli/ast/ast.dart';

abstract class AstVisitor<T> {
  T visitNode(Node node) => switch (node) {
        final Project project => visitProject(project),
        final Environment environment => visitEnvironment(environment),
        final Api api => visitApi(api),
        final CloudFunction function => visitFunction(function),
        final CloudFunctionParameter parameter => visitParameter(parameter),
        final ApiAnonymous apiAnonymous => visitApiAnonymous(apiAnonymous),
        final ApiAuthenticated apiAuthenticated =>
          visitApiAuthenticated(apiAuthenticated),
        final ApiMiddleware apiMiddleware => visitApiMiddleware(apiMiddleware),
        final EnvironmentVariable environmentVariable =>
          visitEnvironmentVariable(environmentVariable),
      };

  T visitProject(Project project);

  T visitEnvironment(Environment environment);

  T visitApi(Api api);

  T visitFunction(CloudFunction function);

  T visitParameter(CloudFunctionParameter parameter);

  T visitApiAuthenticated(ApiAuthenticated annotation);

  T visitApiAnonymous(ApiAnonymous annotation);

  T visitApiMiddleware(ApiMiddleware annotation);

  T visitEnvironmentVariable(EnvironmentVariable variable);
}
