import 'dart:isolate';

import 'package:celest_cli/src/analyzer/celest_analyzer.dart';
import 'package:celest_cli/src/cli/cli.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/pub/pub_cache.dart';

final class PrecacheCommand extends CelestCommand {
  @override
  String get name => 'precache';

  @override
  String get description =>
      'Precaches assets and warms up the analyzer for a Celest project.';

  @override
  bool get hidden => true;

  @override
  String get category => 'Tools';

  static Future<void> _warmUp() async {
    final projectRoot = projectPaths.projectRoot;
    final verbose = ctx.verbose;
    await Isolate.run(() async {
      await Cli.configure(verbose: verbose);
      await init(projectRoot: projectRoot);
      await CelestAnalyzer.warmUp(projectRoot);
    });
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

    try {
      await Future.wait(operations);
    } on Object catch (e, st) {
      logger.fine('Failed to precache assets', e, st);
      performance.captureError(e, stackTrace: st);
    }

    return 0;
  }
}
