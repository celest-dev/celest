import 'package:celest_ast/celest_ast.dart';

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
        final ApiHttpMetadata httpMetadata =>
          visitApiHttpMetadata(httpMetadata),
        final Variable variable => visitVariable(variable),
        final Secret secret => visitSecret(secret),
        final Auth auth => visitAuth(auth),
        final AuthProvider provider => visitAuthProvider(provider),
        final ExternalAuthProvider provider =>
          visitExternalAuthProvider(provider),
      };

  T visitProject(Project project);

  T visitApi(Api api);

  T visitFunction(CloudFunction function);

  T visitParameter(CloudFunctionParameter parameter);

  T visitApiAuthenticated(ApiAuthenticated annotation);

  T visitApiPublic(ApiPublic annotation);

  T visitApiMiddleware(ApiMiddleware annotation);

  T visitApiHttpMetadata(ApiHttpMetadata metadata);

  T visitVariable(Variable variable);

  T visitSecret(Secret secret);

  T visitAuth(Auth auth);

  T visitAuthProvider(AuthProvider provider);

  T visitExternalAuthProvider(ExternalAuthProvider provider);
}

abstract class AstVisitorWithArg<T, A> {
  T visitNode(AstNode node, covariant A context) => switch (node) {
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
        final ApiHttpMetadata httpMetadata =>
          visitApiHttpMetadata(httpMetadata, context),
        final Variable variable => visitVariable(variable, context),
        final Secret secret => visitSecret(secret, context),
        final Auth auth => visitAuth(auth, context),
        final AuthProvider provider => visitAuthProvider(provider, context),
        final ExternalAuthProvider provider =>
          visitExternalAuthProvider(provider, context),
      };

  T visitProject(Project project, covariant A context);

  T visitApi(Api api, covariant A context);

  T visitFunction(CloudFunction function, covariant A context);

  T visitParameter(CloudFunctionParameter parameter, covariant A context);

  T visitApiAuthenticated(ApiAuthenticated annotation, covariant A context);

  T visitApiPublic(ApiPublic annotation, covariant A context);

  T visitApiMiddleware(ApiMiddleware annotation, covariant A context);

  T visitApiHttpMetadata(ApiHttpMetadata metadata, covariant A context);

  T visitVariable(Variable variable, covariant A context);

  T visitSecret(Secret secret, covariant A context);

  T visitAuth(Auth auth, covariant A context);

  T visitAuthProvider(AuthProvider provider, covariant A context);

  T visitExternalAuthProvider(
    ExternalAuthProvider provider,
    covariant A context,
  );
}

abstract class ResolvedAstVisitor<T> {
  T visitNode(Node node) => switch (node) {
        final ResolvedProject project => visitProject(project),
        final ResolvedApi api => visitApi(api),
        final ResolvedCloudFunction function => visitFunction(function),
        final ResolvedVariable variable => visitVariable(variable),
        final ResolvedSecret secret => visitSecret(secret),
        final ResolvedAuth auth => visitAuth(auth),
        final ResolvedAuthProvider provider => visitAuthProvider(provider),
        final ResolvedExternalAuthProvider provider =>
          visitExternalAuthProvider(provider),
      };

  T visitProject(ResolvedProject project);

  T visitApi(ResolvedApi api);

  T visitFunction(ResolvedCloudFunction function);

  T visitVariable(ResolvedVariable variable);

  T visitSecret(ResolvedSecret secret);

  T visitAuth(ResolvedAuth auth);

  T visitAuthProvider(ResolvedAuthProvider provider);

  T visitExternalAuthProvider(ResolvedExternalAuthProvider provider);
}

abstract class ResolvedAstVisitorWithArg<T, A> {
  T visitNode(Node node, covariant A context) => switch (node) {
        final ResolvedProject project => visitProject(project, context),
        final ResolvedApi api => visitApi(api, context),
        final ResolvedCloudFunction function =>
          visitFunction(function, context),
        final ResolvedVariable variable => visitVariable(variable, context),
        final ResolvedSecret secret => visitSecret(secret, context),
        final ResolvedAuth auth => visitAuth(auth, context),
        final ResolvedAuthProvider provider =>
          visitAuthProvider(provider, context),
        final ResolvedExternalAuthProvider provider =>
          visitExternalAuthProvider(provider, context),
      };

  T visitProject(ResolvedProject project, covariant A context);

  T visitApi(ResolvedApi api, covariant A context);

  T visitFunction(ResolvedCloudFunction function, covariant A context);

  T visitVariable(ResolvedVariable variable, covariant A context);

  T visitSecret(ResolvedSecret secret, covariant A context);

  T visitAuth(ResolvedAuth auth, covariant A context);

  T visitAuthProvider(ResolvedAuthProvider provider, covariant A context);

  T visitExternalAuthProvider(
    ResolvedExternalAuthProvider provider,
    covariant A context,
  );
}
