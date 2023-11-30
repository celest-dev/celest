import 'package:celest_cli/ast/ast.dart' as ast show Parameter;
import 'package:celest_cli/ast/ast.dart' hide Parameter;
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/codegen/api/entrypoint.dart';
import 'package:celest_cli/codegen/project/build.dart';
import 'package:celest_cli/codegen/project/resources.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

// TODO(dnys1): Create custom allocator so that all file paths are relative.
final class CodeGenerator extends AstVisitor<void> {
  CodeGenerator(this._projectPaths);

  static final _formatter = DartFormatter(
    fixes: StyleFix.all,
  );
  static DartEmitter get _emitter => DartEmitter.scoped(
        useNullSafetySyntax: true,
        orderDirectives: true,
      );

  String _emit(Spec spec) {
    return _formatter.format(spec.accept(_emitter).toString());
  }

  final ProjectPaths _projectPaths;

  /// A map of generated files to their contents.
  final Map<String, String> outputs = {};

  @override
  void visitProject(Project project) {
    final resourcesFile = _projectPaths.resourcesDart;
    final resources = ResourceGenerator(project).generate();
    outputs[resourcesFile] = _emit(resources);

    final projectBuildFile = _projectPaths.projectBuildDart;
    final projectBuild = ProjectBuildGenerator(project.type).generate();
    outputs[projectBuildFile] = _emit(projectBuild);

    project.apis.forEach(visitApi);
  }

  @override
  void visitApi(Api api) {
    final outputDir = _projectPaths.apiOutput(api.name);
    for (final function in api.functions) {
      final entrypoint = EntrypointGenerator(
        api: api,
        function: function,
        outputDir: outputDir,
      ).generate();
      final entrypointFile =
          _projectPaths.functionEntrypoint(api.name, function.name);
      outputs[entrypointFile] = _emit(entrypoint);
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
