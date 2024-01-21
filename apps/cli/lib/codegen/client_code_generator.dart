import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/codegen/code_outputs.dart';

final class ClientCodeGenerator {
  ClientCodeGenerator({
    required this.project,
    required this.projectOutputs,
  });

  final ast.Project project;
  final ast.DeployedProject projectOutputs;

  CodeOutputs generate() {
    final generator = ClientGenerator(
      project: project,
      projectOutputs: projectOutputs,
    );
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
