import 'package:celest_cli/ast/ast.dart';

abstract class AstVisitor<T> {
  T visitNode(Node node) => switch (node) {
        final Project project => visitProject(project),
        final Environment environment => visitEnvironment(environment),
        final Api api => visitApi(api),
        final CloudFunction function => visitFunction(function),
        final Parameter parameter => visitParameter(parameter),
        final ApiMetadataAuthenticated apiAuthenticated =>
          visitApiAuthenticated(apiAuthenticated),
        final ApiMetadataMiddleware apiMiddleware =>
          visitApiMiddleware(apiMiddleware),
      };

  T visitProject(Project project);

  T visitEnvironment(Environment environment);

  T visitApi(Api api);

  T visitFunction(CloudFunction function);

  T visitParameter(Parameter parameter);

  T visitApiAuthenticated(ApiMetadataAuthenticated annotation);

  T visitApiMiddleware(ApiMetadataMiddleware annotation);
}
