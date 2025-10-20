import 'dart:async';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/codegen/allocator.dart';
import 'package:celest_cli/src/codegen/client/client_generator.dart';
import 'package:celest_cli/src/codegen/code_generator.dart';
import 'package:celest_cli/src/codegen/code_outputs.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/pub/project_dependency.dart';
import 'package:celest_cli/src/pub/pub_action.dart';
import 'package:celest_cli/src/pub/pubspec.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

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

  static final Logger _logger = Logger('CodegenDependencies');

  Future<bool> save() async {
    var (pubspec, pubspecYaml) = p.equals(rootDir, projectPaths.projectRoot)
        ? (celestProject.pubspec, celestProject.pubspecYaml)
        : (celestProject.clientPubspec, celestProject.clientPubspecYaml);
    final pubspecFile = fileSystem.directory(rootDir).childFile('pubspec.yaml');
    final currentDependencies = Set.of(pubspec.dependencies.keys);
    final missingDependencies = difference(currentDependencies);
    final needsUpdate = missingDependencies.isNotEmpty;
    if (needsUpdate) {
      _logger.fine(
        'Adding dependencies to ${pubspecFile.path}: '
        '${missingDependencies.toList()}',
      );
      pubspec = pubspec.addDeps(
        dependencies: {
          for (final dependency in this)
            dependency:
                ProjectDependency.all[dependency]?.pubDependency ??
                HostedDependency(version: VersionConstraint.any),
        },
      );
      if (pubspecFile.existsSync()) {
        await pubspecFile.writeAsString(pubspec.toYaml(source: pubspecYaml));
        await runPub(
          action: PubAction.get,
          workingDirectory: pubspecFile.parent.path,
        );
      } else {
        _logger.fine(
          'Skipping dependency update',
          'Pubspec not found: ${pubspecFile.path}',
          StackTrace.current,
        );
      }
    }
    return needsUpdate;
  }
}
