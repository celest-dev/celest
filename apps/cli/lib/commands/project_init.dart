import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli/commands/start_command.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/pub/pub_cache.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

base mixin Configure on CelestCommand {
  // TODO(dnys1): Move to ProjectPaths. Rename to CelestProject.
  late final Pubspec pubspec;
  late final bool isExistingProject;

  static Never _throwNoProject() => throw const CelestException(
        'No Celest project found in the current directory. '
        'To create a new project, run `celest start`.',
      );

  String newProjectName({
    ParentProject? parentProject,
  }) {
    if (parentProject != null && parentProject.name.startsWith('celest')) {
      final parentType = parentProject.type.name.capitalized;
      throw CelestException(
        'Your $parentType project cannot be named "celest" or start with "celest". '
        'Please change it in pubspec.yaml and run `celest start` again.',
      );
    }

    final defaultName = parentProject?.name ?? 'hello';
    return cliLogger
        .prompt(
          'Enter a name for your project',
          defaultValue: defaultName,
        )
        .snakeCase;
  }

  /// Returns true if the project needs to be migrated.
  Future<bool> configure() async {
    final currentDir = Directory.current;
    final pubspecFile = fileSystem.file(
      p.join(currentDir.path, 'pubspec.yaml'),
    );

    final String projectRoot;
    String? projectName;
    ParentProject? parentProject;

    if (!pubspecFile.existsSync()) {
      if (this is! StartCommand) {
        _throwNoProject();
      }
      final createNew = cliLogger.confirm(
        'No Celest project found in the current directory. '
        'Would you like to create one?',
      );
      if (!createNew) {
        cliLogger.detail('Skipping project creation.');
        await Future(() => exit(0));
      }
      projectName = newProjectName(parentProject: null);
      isExistingProject = false;

      // Choose where to store the project based on the current directory.
      if (await currentDir.list().isEmpty) {
        projectRoot = currentDir.path;
      } else {
        projectRoot = p.join(currentDir.path, projectName);
        final projectDir = fileSystem.directory(projectRoot);
        if (projectDir.existsSync() && !await projectDir.list().isEmpty) {
          throw CelestException(
            'A directory named "$projectName" already exists. '
            'Please choose a different name, or run this command from a '
            'different directory.',
          );
        }
      }
    } else {
      final pubspecYaml = await pubspecFile.readAsString();
      pubspec = Pubspec.parse(pubspecYaml);

      final (celestDir, isExistingProject) =
          switch (pubspec.dependencies.containsKey('celest')) {
        true => (currentDir, true),
        false => run(() {
            final dir = Directory(p.join(currentDir.path, 'celest'));
            return (dir, dir.existsSync());
          }),
      };
      projectRoot = celestDir.path;
      parentProject = await ParentProject.load(p.dirname(projectRoot));
      this.isExistingProject = isExistingProject;
    }

    if (zReleaseMode && platform.isWindows) {
      final process = DynamicLibrary.process();
      if (!process.providesSymbol('cedar_init')) {
        _loadLibrary('cedar_ffi');
      }
    }

    await init(
      projectRoot: projectRoot,
      parentProject: parentProject,
    );
    try {
      logger.finest('Hydrating pub cache...');
      await pubCache.hydrate();
      logger.finest('Fixing pub cache...');
      await pubCache.fix();
      logger.finest('Pub cache fixed.');
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
    }

    var needsMigration = false;
    if (!isExistingProject) {
      if (this case final StartCommand projectCreator) {
        projectName ??= newProjectName(parentProject: parentProject);
        await projectCreator.createProject(
          projectName: projectName,
          parentProject: parentProject,
        );
      } else {
        _throwNoProject();
      }
    } else if (this case final Migrate projectMigrator) {
      needsMigration = await projectMigrator.migrateProject(
        parentProject: parentProject,
      );
    }

    await _pubUpgrade();

    return needsMigration;
  }

  void _loadLibrary(String name) {
    final prefix = platform.isWindows ? '' : 'lib';
    final suffix = platform.isWindows
        ? '.dll'
        : platform.isMacOS
            ? '.dylib'
            : '.so';
    final library = p.join(
      p.dirname(platform.resolvedExecutable),
      '$prefix$name$suffix',
    );
    DynamicLibrary.open(library);
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
        // TODO(dnys1): Use `pub get` in 0.5.0
        action: PubAction.upgrade,
        workingDirectory: parentProject.path,
      );
    }
  }
}
