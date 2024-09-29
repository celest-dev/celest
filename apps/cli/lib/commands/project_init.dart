import 'dart:async';
import 'dart:io';

import 'package:celest_cli/commands/init_command.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli/commands/start_command.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/init/sqlite3.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:mason_logger/mason_logger.dart';

base mixin ProjectCreator on Configure {
  Future<String> createProject({
    required String projectName,
    required ParentProject? parentProject,
  }) async {
    logger.finest(
      'Generating project for "$projectName" at '
      '"${projectPaths.projectRoot}"...',
    );
    await performance.trace('ProjectCreator', 'createProject', () async {
      await ProjectGenerator(
        parentProject: parentProject,
        projectRoot: projectPaths.projectRoot,
        projectName: projectName,
      ).generate();
      logger.fine('Project generated successfully');
    });
    return projectName;
  }
}

sealed class ConfigureState {}

final class Initializing implements ConfigureState {
  const Initializing();
}

final class CreatingProject implements ConfigureState {
  const CreatingProject();
}

final class CreatedProject implements ConfigureState {
  const CreatedProject();
}

final class MigratingProject implements ConfigureState {
  const MigratingProject();
}

final class MigratedProject implements ConfigureState {
  const MigratedProject();
}

final class Initialized implements ConfigureState {
  const Initialized({
    required this.needsAnalyzerMigration,
  });

  final bool needsAnalyzerMigration;
}

base mixin Configure on CelestCommand {
  abstract Progress? currentProgress;

  static Never _throwNoProject() => throw const CelestException(
        'No Celest project found in the current directory. '
        'To create a new project, run `celest init`.',
      );

  String newProjectName({
    ParentProject? parentProject,
  }) {
    var baseName = parentProject?.name;
    if (baseName != null && baseName.startsWith('celest')) {
      baseName = null;
    }
    final defaultName = baseName ?? 'hello';
    String? projectName;
    while (projectName == null) {
      final input = cliLogger
          .prompt('Enter a name for your project', defaultValue: defaultName)
          .snakeCase;
      if (input.isEmpty) {
        cliLogger.err('Project name cannot be empty.');
        continue;
      }
      if (input.groupIntoWords().contains('celest')) {
        cliLogger.err('Project name cannot contain "celest".');
        continue;
      }
      projectName = input;
    }
    return projectName;
  }

  Future<bool> configure() async {
    await for (final state in _configure()) {
      switch (state) {
        case Initializing():
          currentProgress?.complete();
          currentProgress = cliLogger.progress('Initializing Celest');
        case CreatingProject():
          currentProgress?.complete();
          currentProgress = cliLogger.progress('Generating project');
        case CreatedProject():
          currentProgress?.complete('Project successfully generated');
          currentProgress = null;
        case MigratingProject():
          currentProgress?.complete();
          currentProgress = cliLogger.progress('Migrating project');
        case MigratedProject():
          currentProgress?.complete('Project successfully migrated');
          currentProgress = null;
        case Initialized(needsAnalyzerMigration: final needsMigration):
          currentProgress?.complete();
          currentProgress = null;
          return needsMigration;
      }
    }
    unreachable();
  }

  /// Returns true if the project needs to be migrated.
  Stream<ConfigureState> _configure() async* {
    final currentDir = fileSystem.currentDirectory;
    final pubspecFile = currentDir.childFile('pubspec.yaml');
    final projectFile = currentDir.childFile('project.dart');

    final (celestDir, isExistingProject, parentProject) =
        switch ((projectFile.existsSync(), pubspecFile.existsSync())) {
      // We're inside the `celest` directory.
      (true, _) => (
          currentDir,
          true,
          await ParentProject.load(currentDir.parent.path),
        ),

      // We're inside a parent project.
      (false, true) => await run(() async {
          final celestDir = fileSystem.directory(
            p.join(currentDir.path, 'celest'),
          );
          return (
            celestDir,
            celestDir.existsSync(),
            await ParentProject.load(currentDir.path),
          );
        }),

      // We're inside a folder which is neither a Dart/Flutter app nor a
      // Celest project.
      (false, false) => (null, false, null),
    };

    logger.finest(
      'Project state: dir=$celestDir, existing=$isExistingProject, '
      'parent=${parentProject?.type}',
    );

    String projectRoot;
    String? projectName;
    if (isExistingProject) {
      projectRoot = celestDir!.path;
    } else {
      switch (this) {
        case StartCommand():
          cliLogger.warn('No Celest project found in the current directory.');
          final createNew = cliLogger.confirm(
            'Would you like to create a new one?',
            defaultValue: true,
          );
          if (!createNew) {
            cliLogger.detail('Skipping project creation.');
            await Future(() => exit(0));
          }
        case InitCommand():
          break;
        default:
          _throwNoProject();
      }

      projectName = newProjectName(parentProject: parentProject);

      // Choose where to store the project based on the current directory.
      projectRoot = switch (celestDir) {
        final celestDir? => celestDir.path,

        // We should create a new folder for the project which is unattached
        // to any parent project, named after the project.
        null => await run(() async {
            final projectRoot = p.join(currentDir.path, projectName);
            final projectDir = fileSystem.directory(projectRoot);
            if (projectDir.existsSync() && !await projectDir.list().isEmpty) {
              throw CelestException(
                'A directory named "$projectName" already exists. '
                'Please choose a different name, or run this command from a '
                'different directory.',
              );
            }
            return projectRoot;
          }),
      };
    }

    await loadSqlite3(logger: logger);

    yield const Initializing();
    await init(
      projectRoot: projectRoot,
      parentProject: parentProject,
    );

    final needsMigration = celestProject.cacheDb.needsProjectUpgrade;
    var needsAnalyzerMigration = false;
    Future<void>? upgradePackages;
    if (!isExistingProject) {
      if (this case final ProjectCreator projectCreator) {
        yield const CreatingProject();
        await projectCreator.createProject(
          projectName: projectName!,
          parentProject: parentProject,
        );
        yield const CreatedProject();
      } else {
        _throwNoProject();
      }
    } else if (this case final Migrate projectMigrator when needsMigration) {
      yield const MigratingProject();
      needsAnalyzerMigration = await projectMigrator.migrateProject(
        parentProject: parentProject,
      );
      await (upgradePackages = _pubUpgrade());
      if (needsMigration && parentProject != null) {
        await processManager.run(
          <String>[
            Sdk.current.dart,
            'fix',
            '--apply',
          ],
          workingDirectory: parentProject.path,
        );
      }
      yield const MigratedProject();
    }
    await (upgradePackages ??= _pubUpgrade());

    yield Initialized(needsAnalyzerMigration: needsAnalyzerMigration);
  }

  // TODO(dnys1): Improve logic here so that we don't run pub upgrade if
  // the dependencies in the lockfile are already up to date.
  Future<void> _pubUpgrade() async {
    final projectRoot = projectPaths.projectRoot;
    await runPub(
      action: PubAction.upgrade,
      workingDirectory: projectRoot,
    );
    // Run serially to avoid `flutter pub` locks.
    if (celestProject.parentProject case final parentProject?) {
      await runPub(
        exe: parentProject.type.name,
        action: PubAction.get,
        workingDirectory: parentProject.path,
      );
    }
  }
}
