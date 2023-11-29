import 'package:celest_cli/ast/ast.dart';

abstract class AstVisitor<T> {
  T visitNode(Node node) => switch (node) {
        final Project project => visitProject(project),
        final Api api => visitApi(api),
        final CloudFunction function => visitFunction(function),
        final Parameter parameter => visitParameter(parameter),
        final ApiMetadataAuthenticated apiAuthenticated =>
          visitApiAuthenticated(apiAuthenticated),
        final ApiMetadataMiddleware apiMiddleware =>
          visitApiMiddleware(apiMiddleware),
      };

  T visitProject(Project project);

  T visitApi(Api api);

  T visitFunction(CloudFunction function);

  T visitParameter(Parameter parameter);

  T visitApiAuthenticated(ApiMetadataAuthenticated annotation);

  T visitApiMiddleware(ApiMetadataMiddleware annotation);
}
