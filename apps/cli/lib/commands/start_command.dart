import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/init/pub/pub_action.dart';
import 'package:celest_cli/releases/latest_release.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/version.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:pub_semver/pub_semver.dart';

final class StartCommand extends CelestCommand with Configure, Migrate {
  StartCommand();

  @override
  String get description => 'Starts the Celest development process.';

  @override
  String get name => 'start';

  @override
  String get category => 'Project';

  Progress? _currentProgress;

  Future<String> _createProject() async {
    if (!pubspec.dependencies.containsKey('flutter')) {
      throw const CelestException(
        'Only Flutter projects are supported at this time.',
      );
    }

    final appName = pubspec.name.snakeCase;
    if (appName == 'celest') {
      throw const CelestException(
        'Your Flutter project name cannot be "celest". Please change it in '
        'pubspec.yaml and run `celest start` again.',
      );
    }

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
    _currentProgress = cliLogger.progress('Generating project');
    await performance.trace('StartCommand', 'createProject', () async {
      await ProjectGenerator(
        appRoot: projectPaths.appRoot,
        projectRoot: projectPaths.projectRoot,
        projectName: projectName,
      ).generate();
      logger.fine('Project generated successfully');
      await runPub(
        action: PubAction.get,
        workingDirectory: projectPaths.projectRoot,
      );
      logger.fine('Successfully ran `pub get` in ${projectPaths.projectRoot}');
    });
    return projectName;
  }

  @override
  Future<int> run() async {
    await super.run();

    try {
      final latestRelease = await performance.trace(
        'StartCommand',
        'retrieveLatestRelease',
        () => retrieveLatestRelease().timeout(const Duration(seconds: 3)),
      );
      if (latestRelease.version > Version.parse(packageVersion)) {
        cliLogger.warn(
          'A new version of Celest is available! Run `celest upgrade` '
          'to get the latest changes.',
        );
      }
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
    }

    await configure(
      createProject: _createProject,
      migrateProject: migrateProject,
    );

    _currentProgress?.complete('Project generated successfully');
    _currentProgress = cliLogger.progress('Starting Celest');

    // Start the Celest Frontend Loop
    return CelestFrontend().run(
      currentProgress: _currentProgress!,
    );
  }
}
