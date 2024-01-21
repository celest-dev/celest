import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/commands/project_command.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/process/process_info.dart';
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

  Future<void> _pubGet() async {
    final projectRoot = projectPaths.projectRoot;
    logger.fine('Running pub get in "$projectRoot"...');
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

  @override
  Future<int> run() async {
    await super.run();

    final processes = await Processes.load();
    if (processes.byPort[8888] case final runningProcess?) {
      logger.finest('Found running process on port 8888: $runningProcess');
      if (!runningProcess.isCelest) {
        throw StateError(
          'Process already running on port 8888: $runningProcess',
        );
      }
      logger.finest('Killing PID ${runningProcess.pid}...');
      processManager.killPid(runningProcess.pid);
      await Future.doWhile(() async {
        final processes = await Processes.load();
        return processes.byPort[8888] != null;
      });
    }

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
    final launcher = await switch (platform.environment['GITHUB_WORKSPACE']) {
      // Running in CI - don't try to clone, just use the local repo.
      final workspace? => PubLauncher.local(
          pubServer: pubServerUri,
          path: workspace,
        ),
      _ => PubLauncher.git(
          pubServer: pubServerUri,
          gitUrl: gitUrl,
        ),
    };
    await launcher.run();

    if (!isExistingProject) {
      await _createProject(pubServerUri);
    }

    if (!await fileSystem
        .directory(projectPaths.projectDart)
        .childDirectory('.dart_tool')
        .childFile('package_config.json')
        .exists()) {
      await _pubGet();
    }

    // Start the Celest Frontend Loop
    return CelestFrontend().run();
  }
}
