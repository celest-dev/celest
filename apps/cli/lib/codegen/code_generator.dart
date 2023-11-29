import 'package:celest_cli/ast/ast.dart' as ast show Parameter;
import 'package:celest_cli/ast/ast.dart' hide Parameter;
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/codegen/function/entrypoint.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

final class CodeGenerator extends AstVisitor<void> {
  CodeGenerator(
    String projectRoot, {
    String? outputDir,
  }) : _outputDir = outputDir ?? p.join(projectRoot, '.dart_tool', 'celest');

  static final _formatter = DartFormatter();

  final String _outputDir;

  /// A map of generated files to their contents.
  final Map<String, String> outputs = {};

  @override
  void visitProject(Project project) {
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
      outputs[entrypointFile] = _formatter.format(generator.generate());
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
