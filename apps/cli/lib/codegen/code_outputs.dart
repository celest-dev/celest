import 'package:celest_cli/codegen/client_code_generator.dart';
import 'package:celest_cli/pub/project_dependency.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final class CodeOutputs extends DelegatingMap<String, String> {
  const CodeOutputs(
    super.base, {
    required this.clientDependencies,
  });

  final ClientDependencies clientDependencies;

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
    if (clientDependencies.isNotEmpty) {
      final currentDependencies =
          Set.of(celestProject.clientPubspec.dependencies.keys);
      final missingDependencies =
          clientDependencies.difference(currentDependencies);
      if (missingDependencies.isNotEmpty) {
        _logger.fine(
          'Adding dependencies to client: ${missingDependencies.toList()}',
        );
        final pubspec = celestProject.clientPubspec.addDeps(
          dependencies: {
            for (final dependency in clientDependencies)
              dependency: ProjectDependency.all[dependency]?.pubDependency ??
                  HostedDependency(),
          },
        );
        final clientPubspec = fileSystem
            .directory(projectPaths.clientRoot)
            .childFile('pubspec.yaml');
        if (clientPubspec.existsSync()) {
          final source = celestProject.clientPubspecYaml;
          outputFutures.add(
            clientPubspec
                .writeAsString(pubspec.toYaml(source: source))
                .then((_) {
              return runPub(
                action: PubAction.get,
                workingDirectory: clientPubspec.parent.path,
              );
            }),
          );
        } else {
          _logger.fine(
            'Skipping dependency update. Client pubspec not found: $clientPubspec',
          );
        }
      }
    }
    await Future.wait(outputFutures);
  }
}
