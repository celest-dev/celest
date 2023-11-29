import 'package:celest_cli/ast/ast.dart' as ast show Parameter;
import 'package:celest_cli/ast/ast.dart' hide Parameter;
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/codegen/api/entrypoint.dart';
import 'package:celest_cli/codegen/project/resources.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

final class CodeGenerator extends AstVisitor<void> {
  CodeGenerator(
    this._projectRoot, {
    String? outputDir,
  }) : _outputDir = outputDir ?? p.join(_projectRoot, '.dart_tool', 'celest');

  static final _formatter = DartFormatter(
    fixes: StyleFix.all,
  );
  static DartEmitter get _emitter => DartEmitter.scoped(
        useNullSafetySyntax: true,
        orderDirectives: true,
      );

  final String _projectRoot;
  final String _outputDir;

  /// A map of generated files to their contents.
  final Map<String, String> outputs = {};

  @override
  void visitProject(Project project) {
    final resourcesFile = p.join(_projectRoot, 'resources.dart');
    final resourcesGenerator = ResourceGenerator(project).generate();
    outputs[resourcesFile] = _formatter.format(
      resourcesGenerator.accept(_emitter).toString(),
    );
    project.apis.forEach(visitApi);
  }

  @override
  void visitApi(Api api) {
    final outputDir = p.join(_outputDir, 'apis', api.name);
    for (final function in api.functions) {
      final generator = EntrypointGenerator(
        api: api,
        function: function,
        outputDir: outputDir,
      );
      final entrypointFile = p.join(outputDir, '${function.name}.dart');
      outputs[entrypointFile] = _formatter.format(
        generator.generate().accept(_emitter).toString(),
      );
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
