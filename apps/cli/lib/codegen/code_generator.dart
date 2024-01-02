import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/api/entrypoint_generator.dart';
import 'package:celest_cli/codegen/api/local_api_generator.dart';
import 'package:celest_cli/codegen/project/project_build_generator.dart';
import 'package:celest_cli/codegen/project/resources_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

final class CodeGenerator extends AstVisitor<void> {
  static const _ignoredRules = [
    'type=lint',
    'unused_local_variable',
    'unnecessary_cast',
  ];
  static final _header = '// ignore_for_file: ${_ignoredRules.join(', ')}';
  static final _formatter = DartFormatter(
    fixes: StyleFix.all,
  );
  static DartEmitter _emitter({
    required String forFile,
  }) =>
      DartEmitter(
        allocator: CelestAllocator(
          forFile: forFile,
          projectPaths: projectPaths,
        ),
        useNullSafetySyntax: true,
        orderDirectives: true,
      );

  static String _emit(
    Spec spec, {
    required String forFile,
  }) {
    final code = spec.accept(_emitter(forFile: forFile)).toString();
    try {
      return _formatter.format('$_header\n$code');
    } on Object {
      print(code);
      rethrow;
    }
  }

  /// A map of generated files to their contents.
  final Map<String, String> fileOutputs = {};

  /// A map of API routes to their target reference.
  final Map<String, Reference> _targets = {};

  static String generateResourcesDart(Project project) {
    final resourcesFile = projectPaths.resourcesDart;
    final resources = ResourcesGenerator(project: project).generate();
    return _emit(resources, forFile: resourcesFile);
  }

  @override
  void visitProject(Project project) {
    final projectBuildFile = projectPaths.projectBuildDart;
    final projectBuild = ProjectBuildGenerator(
      projectReference: project.reference,
    ).generate();
    fileOutputs[projectBuildFile] =
        _emit(projectBuild, forFile: projectBuildFile);

    fileOutputs[projectPaths.resourcesDart] = generateResourcesDart(project);

    project.apis.values.forEach(visitApi);

    if (project.apis.isNotEmpty) {
      final localApiFile = projectPaths.localApiEntrypoint;
      final localApi = LocalApiGenerator(targets: _targets).generate();
      fileOutputs[localApiFile] = _emit(localApi, forFile: localApiFile);
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
      fileOutputs[entrypointFile] = _emit(entrypoint, forFile: entrypointFile);
      _targets['/${api.name}/${function.name}'] = refer(
        generator.targetName,
        entrypointFile,
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
  void visitFunction(CloudFunction function) {}

  @override
  void visitParameter(CloudFunctionParameter parameter) {}

  @override
  void visitEnvironmentVariable(EnvironmentVariable variable) {}
}
