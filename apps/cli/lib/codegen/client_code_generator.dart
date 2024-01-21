import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/codegen/code_outputs.dart';

final class ClientCodeGenerator {
  ClientCodeGenerator({
    required this.project,
  });

  final ast.Project project;

  CodeOutputs generate() {
    final generator = ClientGenerator(project: project);
    return CodeOutputs(
      generator.generate().map(
            (path, library) => MapEntry(
              path,
              CodeGenerator.emit(library, forFile: path),
            ),
          ),
    );
  }
}
