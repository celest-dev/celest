import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/codegen/code_outputs.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_proto/ast.dart' as ast;

final class ClientCodeGenerator {
  ClientCodeGenerator({
    required this.project,
    required this.projectUris,
  });

  final ast.Project project;
  final CelestProjectUris projectUris;

  CodeOutputs generate() {
    final generator = ClientGenerator(
      project: project,
      projectUris: projectUris,
    );
    return CodeOutputs(
      generator.generate().map(
            (path, library) => MapEntry(
              path,
              CodeGenerator.emit(
                library,
                forFile: path,
                prefixingStrategy: PrefixingStrategy.none,
                pathStrategy: PathStrategy.pretty,
              ),
            ),
          ),
    );
  }
}
