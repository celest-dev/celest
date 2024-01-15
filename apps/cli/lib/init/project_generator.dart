import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/init/project_item.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:logging/logging.dart';

/// Manages the generation of a new Celest project.
class ProjectGenerator {
  ProjectGenerator({
    required this.projectName,
    required this.appRoot,
    required this.projectRoot,
  });

  /// The name of the project to initialize, as chosen by the user
  /// when running `celest start` for the first time.
  final String projectName;

  /// The root directory of the enclosing Flutter project.
  ///
  /// This will become the parent directory of the initialized
  /// Celest project and the project which receives the generated
  /// Flutter code.
  final String appRoot;

  /// The root directory of the initialized Celest project.
  final String projectRoot;

  static final Logger _logger = Logger('ProjectGenerator');

  /// Generates a new Celest project.
  Future<void> generate(Uri pubServer) async {
    await Future.wait(
      [
        const ProjectFile.gitIgnore(),
        const ProjectFile.analysisOptions(),
        ProjectFile.pubspec(projectName, pubServer),
        const ProjectTemplate.hello(),
      ].map((item) => item.create(projectRoot)),
    );
    _logger.fine('Running pub get in "$projectRoot"...');
    final result = await processManager.run(
      [Sdk.current.dart, 'pub', 'get'],
      workingDirectory: projectRoot,
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (result.exitCode != 0) {
      throw ProcessException(
        Sdk.current.dart,
        ['pub', 'get'],
        '${result.stdout}\n${result.stderr}',
        result.exitCode,
      );
    }
  }
}
