import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/init_command.dart';
import 'package:celest_cli/src/commands/start_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/init/project_generator.dart';
import 'package:celest_cli/src/init/project_migrate.dart';
import 'package:celest_cli/src/init/templates/project_template.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/pub/pub_action.dart';
import 'package:celest_cli/src/pub/pub_cache.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:dcli/dcli.dart' as dcli;
import 'package:mason_logger/mason_logger.dart';

base mixin ProjectCreator on Configure {
  /// The project template to use when creating a project.
  String get template;

  Future<String> createProject({
    required String projectName,
    required String projectDisplayName,
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
        projectDisplayName: projectDisplayName,
        projectTemplate: switch (template) {
          'hello' => HelloProject.new,
          'data' => DataProject.new,
          _ => unreachable('Invalid project template: $template'),
        },
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
  const Initialized({required this.needsAnalyzerMigration});

  final bool needsAnalyzerMigration;
}

base mixin Configure on CelestCommand {
  abstract Progress? currentProgress;

  static Never _throwNoProject() => throw const CliException(
        'No Celest project found in the current directory. '
        'To create a new project, run `celest init`.',
      );

  ({
    String projectNameInput,
    String projectName,
  }) newProjectName({String? defaultName}) {
    if (defaultName != null && defaultName.startsWith('celest')) {
      defaultName = null;
    }
    defaultName ??= 'My Project';
    for (;;) {
      final input = dcli
          .ask('Enter a name for your project', defaultValue: defaultName)
          .trim();
      if (input.isEmpty) {
        cliLogger.err('Project name cannot be empty.');
        continue;
      }
      final words = input.groupIntoWords();
      for (final (index, word) in List.of(words).indexed) {
        if (word.toLowerCase() == 'celest') {
          words.removeAt(index);
        }
      }
      return (projectNameInput: input, projectName: words.snakeCase);
    }
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
          currentProgress?.complete('Project generated successfully');
          currentProgress = null;
        case MigratingProject():
          currentProgress?.complete();
          currentProgress = cliLogger.progress('Migrating project');
        case MigratedProject():
          currentProgress?.complete('Project migrated successfully');
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
    final (
      projectNameInput,
      projectName,
      projectRoot,
      isExistingProject,
      parentProject
    ) = await _locateProject();

    yield const Initializing();
    await init(projectRoot: projectRoot, parentProject: parentProject);
    await _fixPubCacheIfNeeded();
    logger.finest('Celest project initialized');

    var needsAnalyzerMigration = false;
    Future<void>? upgradePackages;
    if (!isExistingProject) {
      if (this case final ProjectCreator projectCreator) {
        yield const CreatingProject();
        await projectCreator.createProject(
          projectName: projectName!,
          projectDisplayName: projectNameInput!,
          parentProject: parentProject,
        );
        yield const CreatedProject();
      } else {
        _throwNoProject();
      }
    } else if (this case final Migrate projectMigrator) {
      yield const MigratingProject();
      final result = await projectMigrator.migrateProject(
        parentProject: parentProject,
        upgradeFromVersion: celestProject.cacheDb.upgradeFromVersion,
      );
      needsAnalyzerMigration = result.needsAnalyzerMigration;
      await (upgradePackages = _pubUpgrade());
      if (result.needsDartFix && parentProject != null) {
        await processManager.run(<String>[
          Sdk.current.dart,
          'fix',
          '--apply',
        ], workingDirectory: parentProject.path);
      }
      yield const MigratedProject();
    }
    await (upgradePackages ??= _pubUpgrade());

    yield Initialized(needsAnalyzerMigration: needsAnalyzerMigration);
  }

  Future<(String? nameInput, String? name, String root, bool, ParentProject?)>
      _locateProject() async {
    var currentDir = fileSystem.currentDirectory;
    final currentDirIsEmpty = await currentDir.list().isEmpty;

    var pubspecFile = currentDir.childFile('pubspec.yaml');
    if (this case (StartCommand() || InitCommand())) {
      // Do not search recursively for the pubspec file. Just search the current
      // directory.
    } else {
      // For other commands, search recursively for the Celest pubspec file.
      while (!pubspecFile.existsSync()) {
        if (currentDir == currentDir.parent) {
          _throwNoProject();
        }
        currentDir = currentDir.parent;
        pubspecFile = currentDir.childFile('pubspec.yaml');
      }
    }
    final projectFile = currentDir
        .childDirectory('lib')
        .childDirectory('src')
        .childFile('project.dart');

    final (celestDir, isExistingProject, parentProject) = switch ((
      projectFile.existsSync(),
      pubspecFile.existsSync(),
    )) {
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
    String? projectNameInput;
    if (isExistingProject) {
      if (this is InitCommand) {
        cliLogger.success(
          'A Celest project already exists in the current directory. '
          'Run `celest start` to start the project.',
        );
        await Future(() => exit(0));
      }
      projectRoot = celestDir!.path;
    } else {
      switch (this) {
        case StartCommand():
          cliLogger.warn('No Celest project found in the current directory.');
          final createNew = dcli.confirm(
            dcli.green('Would you like to create a new one?', bold: true),
            defaultValue: true,
          );
          if (!createNew) {
            cliLogger.info('Skipping project creation.');
            await Future(() => exit(0));
          }
        case InitCommand():
          break;
        default:
          _throwNoProject();
      }

      var defaultProjectName = parentProject?.name;
      if (currentDirIsEmpty) {
        defaultProjectName ??= p.basename(currentDir.path);
      }
      (:projectNameInput, :projectName) =
          newProjectName(defaultName: defaultProjectName);

      // Choose where to store the project based on the current directory.
      projectRoot = switch (celestDir) {
        final celestDir? => celestDir.path,

        // If the current directory is not empty, we should create a new folder
        // for the project which is unattached to any parent project, named
        // after the project.
        null when !currentDirIsEmpty => await run(() async {
            final directoryName = projectName!.snakeCase;
            final projectRoot = p.join(currentDir.path, directoryName);
            final projectDir = fileSystem.directory(projectRoot);
            if (projectDir.existsSync() && !await projectDir.list().isEmpty) {
              throw CliException(
                'A directory named "$directoryName" already exists. '
                'Please choose a different name, or run this command from a '
                'different directory.',
              );
            }
            return projectRoot;
          }),

        // Otherwise, we're in an empty directory, and can use it as the root.
        null => currentDir.path,
      };
    }

    return (
      projectNameInput,
      projectName,
      projectRoot,
      isExistingProject,
      parentProject
    );
  }

  /// Fixes the pub cache if needed.
  Future<void> _fixPubCacheIfNeeded() async {
    final pubCacheFixDigest = PubCache.packagesToFixDigest;
    final previousDigest = celestProject.config.settings.pubCacheFixDigest;
    if (pubCacheFixDigest != previousDigest) {
      logger.finest('Hydrating pub cache...');
      final result = await pubCache.hydrate();
      if (result case ErrorResult(:final error)) {
        logger.finest('Failed to hydrate pub cache', error);
        performance.captureError(error, stackTrace: StackTrace.current);
        return;
      }
      logger.finest('Fixing pub cache...');
      try {
        await pubCache.fix(throwOnError: true);
      } on Object catch (e, st) {
        logger.finest('Failed to fix pub cache', e, st);
        performance.captureError(e, stackTrace: st);
        return;
      }
      logger.finest('Pub cache fixed.');
      celestProject.config.settings.pubCacheFixDigest = pubCacheFixDigest;
    } else {
      logger.finest('Skipping pub cache fix, already up-to-date.');
    }
  }

  // TODO(dnys1): Improve logic here so that we don't run pub upgrade if
  // the dependencies in the lockfile are already up to date.
  Future<void> _pubUpgrade() async {
    await runPub(
      action: PubAction.upgrade,
      workingDirectory: projectPaths.projectRoot,
    );
    // Run serially to avoid `flutter pub` locks.
    if (celestProject.parentProject case final parentProject?) {
      await runPub(
        exe: parentProject.type.executable,
        action: PubAction.get,
        workingDirectory: parentProject.path,
      );
    }

    // Get dependencies in client so that the analyzer does not show red
    // everywhere, but ignore to avoid blocking the current command.
    runPub(
      action: PubAction.get,
      workingDirectory: projectPaths.clientRoot,
    ).ignore();
  }
}
