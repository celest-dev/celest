import 'dart:async';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/codegen/code_outputs.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:collection/collection.dart';

final class ClientCodeGenerator {
  ClientCodeGenerator({
    required this.project,
    required this.projectUris,
  });

  final ast.Project project;
  final CelestProjectUris projectUris;

  CodeOutputs generate() {
    final clientDeps = ClientDependencies();
    final outputs = runZoned(
      () {
        final generator = ClientGenerator(
          project: project,
          projectUris: projectUris,
        );
        return generator.generate();
      },
      zoneValues: {ClientDependencies: clientDeps},
    );
    return CodeOutputs(
      outputs.map(
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
      clientDependencies: clientDeps,
    );
  }
}

final class ClientDependencies extends DelegatingSet<String> {
  ClientDependencies() : super({});

  static ClientDependencies get current {
    return Zone.current[ClientDependencies] as ClientDependencies;
  }
}
