import 'dart:io';

import 'package:celest_cli/commands/celest_command.dart';
import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/src/context.dart';
import 'package:mason_logger/mason_logger.dart';

final class InitCommand extends CelestCommand with Configure, ProjectCreator {
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
      performance.captureError(e, stackTrace: st, extra: {'command': command});
    }
  }

  @override
  Future<int> run() async {
    await super.run();

    await checkForLatestVersion();
    await configure();
    await _precacheInBackground();

    final projectRoot = projectPaths.projectRoot;

    var command = 'celest start';
    // `celest start` can be run from either the project root, the attached
    // Flutter app's root if there is one, or any subdirectory therof.
    //
    // If we're in none of those, then add a `cd` command to the start messsage.
    final currentDir = fileSystem.currentDirectory.path;
    final appRoot = celestProject.parentProject?.path ?? projectRoot;
    if (!p.equals(appRoot, currentDir) && !p.isWithin(appRoot, currentDir)) {
      final relativePath = p.relative(appRoot, from: currentDir);
      command = 'cd $relativePath && $command';
    }
    stdout.writeln();
    cliLogger.success('🚀 To start a local development server, run:');
    stdout
      ..writeln()
      ..writeln('      $command')
      ..writeln();

    return 0;
  }
}
