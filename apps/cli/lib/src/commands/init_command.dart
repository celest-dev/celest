import 'dart:io';

import 'package:celest_cli/src/cli/cli_runtime.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:mason_logger/mason_logger.dart';

final class InitCommand extends CelestCommand with Configure, ProjectCreator {
  InitCommand() {
    argParser.addFlag(
      'precache',
      help: 'Precache assets and warm up analyzer in the background.',
      negatable: true,
      hide: true,
      defaultsTo: true,
    );
  }

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
    final command = switch (CliRuntime.current) {
      CliRuntime.pubGlobal => <String>[
          platform.resolvedExecutable,
          'pub',
          'global',
          'run',
          'celest_cli:celest',
          'precache',
          projectPaths.projectRoot,
          if (verbose) '--verbose',
        ],
      CliRuntime.local => <String>[
          platform.resolvedExecutable,
          platform.script.toFilePath(),
          'precache',
          projectPaths.projectRoot,
          if (verbose) '--verbose',
        ],
      CliRuntime.aot => <String>[
          platform.resolvedExecutable,
          'precache',
          projectPaths.projectRoot,
          if (verbose) '--verbose',
        ],
    };
    try {
      logger.fine('Precaching assets in background...');
      await processManager.start(
        command,
        mode: ProcessStartMode.detached,
        workingDirectory: projectPaths.projectRoot,
      );
    } on Object catch (e, st) {
      logger.fine('Failed to precache assets', e, st);
      performance.captureError(e, stackTrace: st, extra: {'command': command});
    }
  }

  bool get precache => argResults!.flag('precache');

  @override
  Future<int> run() async {
    await super.run();

    await checkForLatestVersion();
    await configure();
    if (precache) {
      await _precacheInBackground();
    }

    final projectRoot = projectPaths.projectRoot;

    // `celest start` can be run from either the project root, the attached
    // Flutter app's root if there is one, or any subdirectory therof.
    //
    // If we're in none of those, then add a `cd` command to the start messsage.
    var command = 'celest start';
    final currentDir = fileSystem.currentDirectory.path;
    final appRoot = celestProject.parentProject?.path ?? projectRoot;
    if (!p.equals(appRoot, currentDir) && !p.isWithin(appRoot, currentDir)) {
      final relativePath = p.relative(appRoot, from: currentDir);
      command = 'cd $relativePath && $command';
    }
    stdout.writeln();
    cliLogger.success('🚀 To start a local development server, run:');
    cliLogger
      ..write(Platform.lineTerminator)
      ..write('      $command${Platform.lineTerminator}')
      ..write(Platform.lineTerminator);

    return 0;
  }
}
