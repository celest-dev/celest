import 'package:celest_cli/ast/ast.dart' as ast show Parameter;
import 'package:celest_cli/ast/ast.dart' hide Parameter;
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/api/entrypoint.dart';
import 'package:celest_cli/codegen/project/build.dart';
import 'package:celest_cli/codegen/project/resources.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

final class CodeGenerator extends AstVisitor<void> {
  CodeGenerator({
    required ProjectPaths projectPaths,
  }) : _projectPaths = projectPaths;

  static final _formatter = DartFormatter(
    fixes: StyleFix.all,
  );
  DartEmitter _emitter({
    required String forFile,
  }) =>
      DartEmitter(
        allocator: CelestAllocator(
          forFile: forFile,
          projectPaths: _projectPaths,
        ),
        useNullSafetySyntax: true,
        orderDirectives: true,
      );

  String _emit(
    Spec spec, {
    required String forFile,
  }) {
    return _formatter.format(
      spec.accept(_emitter(forFile: forFile)).toString(),
    );
  }

  final ProjectPaths _projectPaths;

  /// A map of generated files to their contents.
  final Map<String, String> fileOutputs = {};

  @override
  void visitProject(Project project) {
    final projectBuildFile = _projectPaths.projectBuildDart;
    final projectBuild = ProjectBuildGenerator(
      projectPaths: _projectPaths,
      projectType: project.reference,
    ).generate();
    fileOutputs[projectBuildFile] =
        _emit(projectBuild, forFile: projectBuildFile);

    final resourcesFile = _projectPaths.resourcesDart;
    final resources = ResourcesGenerator(project: project).generate();
    fileOutputs[resourcesFile] = _emit(resources, forFile: resourcesFile);

    project.environments.values.forEach(visitEnvironment);
  }

  @override
  void visitEnvironment(Environment environment) {
    for (final api in environment.apis.values) {
      visitApi(api, environment);
    }
  }

  @override
  void visitApi(Api api, [Environment? environment]) {
    final environmentPaths = _projectPaths.environment(environment!.name!);
    final outputDir = environmentPaths.apiOutput(api.name);
    for (final function in api.functions.values) {
      final entrypoint = EntrypointGenerator(
        api: api,
        function: function,
        projectRoot: _projectPaths.projectRoot,
        outputDir: outputDir,
      ).generate();
      final entrypointFile =
          environmentPaths.functionEntrypoint(api.name, function.name);
      fileOutputs[entrypointFile] = _emit(entrypoint, forFile: entrypointFile);
    }
  }

  @override
  void visitApiAuthenticated(ApiMetadataAuthenticated annotation) {}

  @override
  void visitApiMiddleware(ApiMetadataMiddleware annotation) {}

  @override
  void visitFunction(CloudFunction function) {}

  @override
  void visitParameter(ast.Parameter parameter) {}
}
