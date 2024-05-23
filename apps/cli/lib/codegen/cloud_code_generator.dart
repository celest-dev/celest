import 'package:api_celest/ast.dart';
import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/api/entrypoint_generator.dart';
import 'package:celest_cli/codegen/api/local_api_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/codegen/project/resources_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart';
import 'package:meta/meta.dart';

final class CloudCodeGenerator extends AstVisitor<void> {
  CloudCodeGenerator({
    @visibleForTesting this.pathStrategy = PathStrategy.robust,
  });

  final PathStrategy pathStrategy;

  /// A map of generated files to their contents.
  final Map<String, String> fileOutputs = {};

  /// A map of API routes to their target reference.
  final Map<String, Reference> _targets = {};

  static String generateResourcesDart(Project project) {
    final resourcesFile = projectPaths.resourcesDart;
    final resources = ResourcesGenerator(project: project).generate();
    return CodeGenerator.emit(
      resources,
      forFile: resourcesFile,
      prefixingStrategy: PrefixingStrategy.none,
      pathStrategy: PathStrategy.pretty,
    );
  }

  @override
  void visitProject(Project project) {
    fileOutputs[projectPaths.resourcesDart] = generateResourcesDart(project);

    project.apis.values.forEach(visitApi);

    if (project.apis.isNotEmpty) {
      final localApiFile = projectPaths.localApiEntrypoint;
      final localApi = LocalApiGenerator(targets: _targets).generate();
      fileOutputs[localApiFile] = CodeGenerator.emit(
        localApi,
        forFile: localApiFile,
        pathStrategy: pathStrategy,
      );
    }
  }

  @override
  void visitApi(Api api) {
    final outputDir = projectPaths.apiOutput(api.name);
    for (final function in api.functions.values) {
      final generator = EntrypointGenerator(
        api: api,
        function: function,
        outputDir: outputDir,
      );
      final entrypoint = generator.generate();
      final entrypointFile =
          projectPaths.functionEntrypoint(api.name, function.name);
      fileOutputs[entrypointFile] = CodeGenerator.emit(
        entrypoint,
        forFile: entrypointFile,
        pathStrategy: pathStrategy,
      );
      _targets[function.route] = refer(
        generator.targetName,
        p.toUri(entrypointFile).toString(),
      );
    }
  }

  @override
  void visitApiAuthenticated(ApiAuthenticated annotation) {}

  @override
  void visitApiPublic(ApiPublic annotation) {}

  @override
  void visitApiMiddleware(ApiMiddleware annotation) {}

  @override
  void visitApiHttpMetadata(ApiHttpMetadata metadata) {}

  @override
  void visitFunction(CloudFunction function) {}

  @override
  void visitParameter(CloudFunctionParameter parameter) {}

  @override
  void visitEnvironmentVariable(EnvironmentVariable variable) {}

  @override
  void visitAuth(Auth auth) {
    throw UnimplementedError();
  }

  @override
  void visitAuthProvider(AuthProvider provider) {
    throw UnimplementedError();
  }
}
