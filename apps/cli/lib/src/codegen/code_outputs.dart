import 'package:celest_cli/src/codegen/client_code_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/pub/project_dependency.dart';
import 'package:celest_cli/src/pub/pub_action.dart';
import 'package:celest_cli/src/pub/pubspec.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final class CodeOutputs extends DelegatingMap<String, String> {
  const CodeOutputs(super.base, {required this.codegenDependencies});

  /// Dependencies added as part of the code generation process.
  ///
  /// These must be added to the respective pubspec.yaml after generation
  /// to ensure referenced types are available.
  final CodegenDependencies codegenDependencies;

  static final Logger _logger = Logger('CodeOutputs');

  Future<void> write() async {
    final outputFutures = <Future<void>>[];
    forEach((path, library) {
      assert(p.isAbsolute(path), 'Path must be absolute: $path');
      outputFutures.add(
        Future<void>(() async {
          final file = fileSystem.file(path);
          await file.create(recursive: true);
          await file.writeAsString(library);
        }),
      );
    });
    if (codegenDependencies.isNotEmpty) {
      var (pubspec, pubspecYaml) =
          p.equals(codegenDependencies.rootDir, projectPaths.projectRoot)
              ? (celestProject.pubspec, celestProject.pubspecYaml)
              : (celestProject.clientPubspec, celestProject.clientPubspecYaml);
      final pubspecFile = fileSystem
          .directory(codegenDependencies.rootDir)
          .childFile('pubspec.yaml');
      final currentDependencies = Set.of(pubspec.dependencies.keys);
      final missingDependencies = codegenDependencies.difference(
        currentDependencies,
      );
      if (missingDependencies.isNotEmpty) {
        _logger.fine(
          'Adding dependencies to ${pubspecFile.path}: '
          '${missingDependencies.toList()}',
        );
        pubspec = pubspec.addDeps(
          dependencies: {
            for (final dependency in codegenDependencies)
              dependency: ProjectDependency.all[dependency]?.pubDependency ??
                  HostedDependency(version: VersionConstraint.any),
          },
        );
        if (pubspecFile.existsSync()) {
          outputFutures.add(
            pubspecFile.writeAsString(pubspec.toYaml(source: pubspecYaml)).then(
              (_) {
                return runPub(
                  action: PubAction.get,
                  workingDirectory: pubspecFile.parent.path,
                );
              },
            ),
          );
        } else {
          _logger.fine(
            'Skipping dependency update',
            'Pubspec not found: ${pubspecFile.path}',
            StackTrace.current,
          );
        }
      }
    }
    await Future.wait(outputFutures);
  }
}
