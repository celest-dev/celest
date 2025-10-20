import 'package:celest_ast/celest_ast.dart';
import 'package:collection/collection.dart';

typedef ProjectDiffContext = ({AstNode parent, AstNode? old});

final class ProjectDiff extends AstVisitorWithArg<void, ProjectDiffContext> {
  ProjectDiff(this.oldProject);

  final Project oldProject;

  bool requiresRestart = false;

  @override
  void visitProject(Project project, ProjectDiffContext context) {
    for (final api in project.apis.values) {
      visitApi(api, (parent: project, old: oldProject.apis[api.name]));
    }
    for (final env in project.variables) {
      visitVariable(env, (
        parent: project,
        old: oldProject.variables.firstWhereOrNull(
          (oldEnv) => oldEnv.name == env.name,
        ),
      ));
    }
  }

  @override
  void visitApi(Api api, ProjectDiffContext context) {
    final (parent: _, :old as Api?) = context;
    if (old == null) {
      requiresRestart = true;
    }
    for (final metadata in api.metadata) {
      visitNode(metadata, (
        parent: api,
        old: old?.metadata.firstWhereOrNull(
          (oldMetadata) => oldMetadata == metadata,
        ),
      ));
    }
    for (final function in api.functions.values) {
      visitFunction(function, (
        parent: api,
        old: old?.functions[function.name],
      ));
    }
  }

  @override
  void visitApiAuthenticated(
    ApiAuthenticated annotation,
    ProjectDiffContext context,
  ) {}

  @override
  void visitApiMiddleware(
    ApiMiddleware annotation,
    ProjectDiffContext context,
  ) {}

  @override
  void visitApiPublic(ApiPublic annotation, ProjectDiffContext context) {}

  @override
  void visitApiHttpMetadata(
    ApiHttpMetadata metadata,
    ProjectDiffContext context,
  ) {}

  @override
  void visitVariable(Variable variable, ProjectDiffContext context) {
    final (parent: _, :old as Variable?) = context;
    if (old == null) {
      requiresRestart = true;
    }
  }

  @override
  void visitSecret(Secret secret, covariant ProjectDiffContext context) {
    final (parent: _, :old as Secret?) = context;
    if (old == null) {
      requiresRestart = true;
    }
  }

  @override
  void visitFunction(CloudFunction function, ProjectDiffContext context) {
    final (parent: _, old: oldFunction as CloudFunction?) = context;
    if (oldFunction == null) {
      requiresRestart = true;
      return;
    }
    if (function.returnType != oldFunction.returnType) {
      requiresRestart = true;
      return;
    }
    for (final parameter in function.parameters) {
      visitNode(parameter, (
        parent: function,
        old: oldFunction.parameters.firstWhereOrNull(
          (oldParameter) => oldParameter.name == parameter.name,
        ),
      ));
    }
    for (final metadata in function.metadata) {
      visitNode(metadata, (
        parent: function,
        old: oldFunction.metadata.firstWhereOrNull(
          (oldMetadata) => oldMetadata == metadata,
        ),
      ));
    }
  }

  @override
  void visitParameter(
    CloudFunctionParameter parameter,
    ProjectDiffContext context,
  ) {
    final (parent: _, old: oldParameter as CloudFunctionParameter?) = context;
    if (oldParameter == null) {
      requiresRestart = true;
      return;
    }
    if (parameter.type != oldParameter.type) {
      requiresRestart = true;
      return;
    }
  }

  @override
  void visitAuth(Auth auth, ProjectDiffContext context) {}

  @override
  void visitAuthProvider(AuthProvider provider, ProjectDiffContext context) {}

  @override
  void visitExternalAuthProvider(
    ExternalAuthProvider provider,
    covariant ProjectDiffContext context,
  ) {}

  @override
  void visitDatabase(Database database, covariant ProjectDiffContext context) {
    // TODO(dnys1): implement visitDatabase
  }

  @override
  void visitDatabaseSchema(
    DatabaseSchema schema,
    covariant ProjectDiffContext context,
  ) {
    // TODO(dnys1): implement visitSchema
  }
}
