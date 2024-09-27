import 'dart:io';

import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:mason_logger/mason_logger.dart';

final class InitCommand extends CelestCommand
    with Configure, Migrate, ProjectCreator {
  InitCommand();

  @override
  String get description => 'Creates a new Celest project.';

  @override
  String get name => 'init';

  @override
  String get category => 'Project';

  @override
  Progress? currentProgress;

  /// Precache assets in the background.
  Future<void> _precacheInBackground() async {
    final List<String> command;
    if (fileSystem.path.fromUri(platform.script).endsWith('.snapshot')) {
      command = <String>[
        platform.resolvedExecutable,
        'pub',
        'global',
        'run',
        'celest_cli:celest',
        'precache',
        projectPaths.projectRoot,
      ];
    } else if (platform.executable.contains('dart')) {
      command = <String>[
        platform.resolvedExecutable,
        'run',
        platform.script.toFilePath(),
        'precache',
        projectPaths.projectRoot,
      ];
    } else {
      command = <String>[
        platform.resolvedExecutable,
        'precache',
        projectPaths.projectRoot,
      ];
    }
    try {
      logger.fine('Precaching assets in background...');
      await processManager.start(
        command,
        mode: ProcessStartMode.detached,
        workingDirectory: projectPaths.projectRoot,
      );
    } on Object catch (e, st) {
      logger.fine('Failed to precache assets', e, st);
      performance.captureError(
        e,
        stackTrace: st,
        extra: {
          'command': command,
        },
      );
    }
  }

  @override
  Future<int> run() async {
    await super.run();

    await checkForLatestVersion();
    await configure();
    await _precacheInBackground();

    cliLogger.success(
      'Run `celest start` to start a local development server 🚀',
    );

    return 0;
  }
}
