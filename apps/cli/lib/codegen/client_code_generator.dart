import 'dart:async';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/codegen/code_outputs.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/src/context.dart';
import 'package:collection/collection.dart';

final class ClientCodeGenerator {
  ClientCodeGenerator({
    required this.project,
    required this.resolvedProject,
    required this.projectUris,
  });

  final ast.Project project;
  final ast.ResolvedProject resolvedProject;
  final CelestProjectUris projectUris;

  CodeOutputs generate() {
    final clientDeps = CodegenDependencies(rootDir: projectPaths.clientRoot);
    final outputs = runZoned(() {
      final generator = ClientGenerator(
        project: project,
        resolvedProject: resolvedProject,
        projectUris: projectUris,
      );
      return generator.generate();
    }, zoneValues: {CodegenDependencies: clientDeps});
    return CodeOutputs(
      outputs.map(
        (path, library) => MapEntry(
          path,
          CodeGenerator.emit(
            library,
            forFile: path,
            prefixingStrategy: PrefixingStrategy.pretty,
            pathStrategy: PathStrategy.pretty,
          ),
        ),
      ),
      codegenDependencies: clientDeps,
    );
  }
}

final class CodegenDependencies extends DelegatingSet<String> {
  CodegenDependencies({required this.rootDir}) : super({});

  final String rootDir;

  static CodegenDependencies get current {
    return Zone.current[CodegenDependencies] as CodegenDependencies;
  }
}
