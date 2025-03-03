import 'dart:isolate';

import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/commands/celest_command.dart';
import 'package:celest_cli/init/sqlite3.dart';
import 'package:celest_cli/pub/pub_cache.dart';
import 'package:celest_cli/src/context.dart';

final class PrecacheCommand extends CelestCommand {
  @override
  String get name => 'precache';

  @override
  String get description => 'Precaches assets for a Celest Cloud project.';

  @override
  bool get hidden => true;

  @override
  String get category => 'Tools';

  static Future<void> _warmUp() async {
    final projectRoot = projectPaths.projectRoot;
    await Isolate.run(() => CelestAnalyzer.warmUp(projectRoot));
  }

  @override
  Future<int> run() async {
    await super.run();

    final projectRoot =
        argResults!.rest.firstOrNull ?? fileSystem.currentDirectory.path;

    await init(projectRoot: projectRoot);

    logger.fine('Precaching assets for project: $projectRoot');
    final operations = <Future<void>>[];

    operations.add(
      performance.trace('CelestAnalyzer', 'warmUp', () async {
        logger.fine('Warming up Dart Analyzer');
        await _warmUp();
        logger.fine('Dart Analyzer warmed up');
      }),
    );

    operations.add(
      performance.trace('Celest', 'fixPubCache', () async {
        logger.finest('Hydrating pub cache...');
        await pubCache.hydrate();
        logger.finest('Fixing pub cache...');
        await pubCache.fix();
        logger.finest('Pub cache fixed.');
      }),
    );

    operations.add(
      performance.trace('Celest', 'loadSqlite3', () async {
        logger.fine('Precaching sqlite3');
        await loadSqlite3(logger: logger);
      }),
    );

    try {
      await Future.wait(operations);
    } on Object catch (e, st) {
      logger.fine('Failed to precache assets', e, st);
      performance.captureError(e, stackTrace: st);
    }

    return 0;
  }
}
