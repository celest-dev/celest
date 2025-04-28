import 'dart:io';

import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_creator.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/repositories/cloud_repository.dart';
import 'package:mason_logger/mason_logger.dart';

final class InitCommand extends CelestCommand
    with Configure, ProjectCreator, Authenticate, CloudRepository {
  InitCommand() {
    argParser.addOption(
      'template',
      abbr: 't',
      help: 'The project template to use.',
      allowed: ['hello', 'data'],
      allowedHelp: {
        'hello': 'A simple greeting API.',
        'data': 'A project with a database and cloud functions.',
      },
      defaultsTo: 'hello',
    );
    argParser.addOption(
      'name',
      help: 'The project name.',
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

  @override
  late final String template = argResults!.option('template')!;

  @override
  String? get projectName => argResults!.option('name');

  @override
  Future<int> run() async {
    await super.run();

    await checkForLatestVersion();
    await configure();

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
      ..info('')
      ..info('      $command')
      ..info('');

    return 0;
  }
}
