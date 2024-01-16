import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/commands/project_command.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pub_server/pub_server.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

final class StartCommand extends ProjectCommand {
  StartCommand();

  @override
  String get description => 'Starts the Celest development process.';

  @override
  String get name => 'start';

  Future<void> _createProject(Uri pubServer) async {
    if (!pubspec.dependencies.containsKey('flutter')) {
      throw const CelestException(
        'Only Flutter projects are supported at this time.',
      );
    }

    final appName = pubspec.name;
    final projectName = cliLogger
        .prompt(
          'Enter a name for your project',
          defaultValue: appName,
        )
        .snakeCase;

    logger.finest(
      'Generating project for "$projectName" at '
      '"${projectPaths.projectRoot}"...',
    );
    await ProjectGenerator(
      projectName: projectName,
      appRoot: Directory.current.path,
      projectRoot: projectPaths.projectRoot,
    ).generate(pubServer);
    logger.finest('Inserting project into DB...');
    await celestProject.database.createProject(
      ProjectsCompanion.insert(
        name: projectName,
        path: projectPaths.projectRoot,
      ),
    );
    cliLogger.success('Project generated successfully.');
  }

  @override
  Future<int> run() async {
    await super.run();

    logger.fine('Starting local pub server...');
    final pubServer = await shelf_io.serve(
      PubServer.test().handler,
      'localhost',
      8888,
    );
    defer(() => pubServer.close(force: true));
    final pubServerUri = Uri.parse('http://localhost:${pubServer.port}');

    const gitUrl = 'https://github.com/celest-dev/cloud';
    logger.fine('Launching pub server with $gitUrl...');
    final launcher = await PubLauncher.git(
      pubServer: pubServerUri,
      gitUrl: gitUrl,
    );
    await launcher.run();

    if (!isExistingProject) {
      await _createProject(pubServerUri);
    }

    // Start the Celest Frontend Loop
    return CelestFrontend().run();
  }
}
