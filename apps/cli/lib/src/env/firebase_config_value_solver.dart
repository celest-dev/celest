import 'dart:collection';
import 'dart:convert';
import 'dart:io' show ProcessResult;

import 'package:celest_ast/src/ast.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/env/config_value_solver.dart';
import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
// ignore: implementation_imports
import 'package:process/src/interface/common.dart';

final class FirebaseConfigValueSolver extends PromptConfigValueSolver {
  const FirebaseConfigValueSolver({
    required super.projectName,
    required super.environmentId,
    @visibleForTesting super.projectDb,
  });

  static final Logger _logger = Logger('FirebaseConfigValueSolver');

  String? _pick(List<FirebaseProject> projects) {
    return cliLogger.chooseOne(
      'Choose a Firebase project to associate with environment "$environmentId"',
      choices: projects,
      defaultValue: projects.firstWhereOrNull((entry) => entry.active) ??
          projects.firstWhereOrNull(
            (project) => project.alias == 'default',
          ),
      display: (entry) {
        if (entry.alias case final alias?) {
          return '${entry.projectId} ($alias)';
        }
        return entry.projectId;
      },
    ).projectId;
  }

  Future<String?> _readFromGlobalConfig(Directory searchDir) async {
    final globalConfig = await FirebaseConfiguration.load();
    if (globalConfig == null) {
      _logger.finest('No Firebase projects found in global configuration');
      return null;
    }
    _logger.finest('Active Firebase projects: ${globalConfig.activeProjects}');
    return globalConfig.activeProjects[searchDir.path];
  }

  /// Reads all project IDs recorded in the `firebase.json` file.
  Future<Map<String, String?>> _readFromFirebaseJson(
    Directory searchDir,
  ) async {
    try {
      final firebaseJsonFile = searchDir.childFile('firebase.json');
      if (!firebaseJsonFile.existsSync()) {
        _logger.finest('No firebase.json found in $searchDir');
        return const {};
      }
      final firebaseJson = jsonDecode(await firebaseJsonFile.readAsString());
      if (firebaseJson
          case {
            'flutter': {
              'platforms': {
                // Structure is { <relative options path>: { ... } }
                'dart': final Map<String, Object?> dartConfiguration,
              },
            },
          }) {
        return {
          for (final entry in dartConfiguration.entries)
            if (entry.value case {'projectId': final String projectId})
              // This will only be the default project ID if there is a single
              // entry in the Dart configuration map.
              //
              // The Flutterfire CLI creates a separate entry for each project ID
              // but does not distinguish which environment/alias they map to.
              //
              // So this configuration is only useful to us if there is a single
              // entry.
              projectId: dartConfiguration.length == 1 ? 'default' : null,
        };
      }
      // The `platforms` map is useless for us since it only records a single
      // `default` entry even in a project using multiple environments/aliases.
      _logger.finest('No project IDs found in firebase.json');
      return const {};
    } on Object catch (e, st) {
      _logger.fine('Failed to read firebase.json', e, st);
      return const {};
    }
  }

  /// Reads any project aliases from the `.firebaserc` file.
  Future<Map<String, String>> _readFromFirebaseRc(Directory searchDir) async {
    try {
      final firebaseRcFile = searchDir.childFile('.firebaserc');
      if (!firebaseRcFile.existsSync()) {
        _logger.finest('No .firebaserc found in $searchDir');
        return const {};
      }
      final firebaseRc = jsonDecode(await firebaseRcFile.readAsString());
      return switch (firebaseRc) {
        {'projects': final Map<String, Object?> aliases} => {
            // Reverse the map so that we get projectID -> alias.
            for (final entry in aliases.entries)
              entry.value as String: entry.key,
          },
        _ => const {},
      };
    } on Object catch (e, st) {
      _logger.fine('Failed to read .firebaserc', e, st);
      return const {};
    }
  }

  /// Reads the list of all environments available to the user.
  Future<List<String>> _readFromFirebaseToolsCli() async {
    try {
      final firebaseToolsCli = getExecutablePath(
        'firebase',
        null,
        platform: platform,
        fs: fileSystem,
        throwOnFailure: false,
      );
      if (firebaseToolsCli == null) {
        _logger.finest('Firebase CLI not found');
        return const [];
      }
      final ProcessResult(
        :exitCode,
        :stdout as String,
        :stderr as String,
      ) = await processManager.run(<String>[
        firebaseToolsCli,
        'projects:list',
        '--json',
        '--non-interactive',
      ]);
      if (exitCode != 0) {
        _logger.finer(
          'Failed to list Firebase projects using firebase-tools CLI',
          '$stdout\n$stderr',
        );
        return const [];
      }
      final resultJsonStart = stdout.indexOf('{');
      if (resultJsonStart == -1) {
        _logger.finer(
          'Failed to parse Firebase projects list from firebase-tools CLI',
          stdout,
        );
        return const [];
      }
      final resultJson = stdout.substring(resultJsonStart).trimRight();
      return switch (jsonDecode(resultJson)) {
        {'results': final List<Object?> results} => results
            .map(
              (result) => switch (result) {
                {'projectId': final String projectId} => projectId,
                _ => null,
              },
            )
            .nonNulls
            .toList(),
        _ => const [],
      };
    } on Object catch (e, st) {
      _logger.fine(
        'Failed to list Firebase projects using firebase-tools CLI',
        e,
        st,
      );
      return const [];
    }
  }

  Future<List<FirebaseProject>?> searchLocalEnvironment() async {
    // We search in both the parent project (if there is one) and the Celest
    // project for Firebase configuration files.
    final searchDirs = [
      if (celestProject.parentProject?.path case final parentPath?)
        fileSystem.directory(parentPath),
      fileSystem.directory(projectPaths.projectRoot),
    ];

    for (final searchDir in searchDirs) {
      // A map of Firebase project IDs -> aliases.
      final aliasesByProjectId = <String, String?>{};

      // Read any aliases from the `.firebaserc` file.
      aliasesByProjectId.addAll(await _readFromFirebaseRc(searchDir));
      _logger.finest('Aliases found in .firebaserc: $aliasesByProjectId');

      // Read all project IDs from the `firebase.json` file.
      final flutterfireConfig = await _readFromFirebaseJson(searchDir);
      _logger.finest('Project IDs found in firebase.json: $flutterfireConfig');
      for (final MapEntry(key: projectId, value: alias)
          in flutterfireConfig.entries) {
        if (alias != null || !aliasesByProjectId.containsKey(projectId)) {
          aliasesByProjectId[projectId] = alias;
        }
      }

      // Check for `firebase-tools.json` in global config.
      //
      // The file stores the active projects as a map of project paths to
      // project IDs/aliases.
      final activeProject = await _readFromGlobalConfig(searchDir);
      _logger.finest('Active project found in global config: $activeProject');

      // When there is an alias matching the environment ID, we always use that.
      final matchingEnvironmentId = aliasesByProjectId.entries
          .firstWhereOrNull((entry) => entry.value == environmentId)
          ?.key;
      if (matchingEnvironmentId != null) {
        _logger.finest(
          'Found project matching environment ID: $matchingEnvironmentId',
        );
        return [
          (
            active: true,
            projectId: matchingEnvironmentId,
            alias: environmentId,
          ),
        ];
      }

      if (aliasesByProjectId.isNotEmpty) {
        return [
          for (final entry in aliasesByProjectId.entries)
            (
              // The `firebase-tools.json` file stores a mapping of project paths to
              // either project IDs or project aliases.
              //
              // We only know if it's a project ID if it's not an alias. Aliases
              // are stored separately per-project in the `.firebaserc` file.
              active: activeProject != null &&
                  (entry.key == activeProject || entry.value == activeProject),
              projectId: entry.key,
              alias: entry.value,
            ),
        ];
      } else if (activeProject != null) {
        // No aliases and no flutterfire config, so this is the only project.
        return [(active: true, projectId: activeProject, alias: null)];
      }
    }

    return null;
  }

  @override
  Future<String> solve(ConfigurationVariable configVar) async {
    // Search for Firebase projects in the local environment and FS.
    var projects = await searchLocalEnvironment();
    _logger.finest('Found Firebase projects: $projects');

    // A resolution to a single project indicates we are done searching.
    if (projects case [final singleProject]) {
      _logger.finest('Resolved to single project: ${singleProject.projectId}');
      return storeVariable(configVar.name, singleProject.projectId);
    }

    // Otherwise, we use the `firebase-tools` CLI to list projects, if
    // installed.
    if (projects == null) {
      projects = [
        for (final projectId in await _readFromFirebaseToolsCli())
          (active: false, projectId: projectId, alias: null),
      ];
      _logger.finest(
        'Found Firebase projects using firebase-tools CLI: $projects',
      );
    }

    // If multiple projects are available, prompt the user to choose one.
    if (projects.isNotEmpty) {
      if (_pick(projects) case final selected?) {
        return storeVariable(configVar.name, selected);
      }
    }

    // Otherwise, we must prompt them to enter the project ID manually.
    _logger.finest('No Firebase projects found in local environment');
    return super.solve(configVar);
  }
}

final class FirebaseConfiguration {
  FirebaseConfiguration._({required Map<String, String> activeProjects})
      : activeProjects = LinkedHashMap(
          equals: (a, b) => p.equals(a, b),
          hashCode: (a) => p.hash(a),
        )..addAll(activeProjects);

  static Future<FirebaseConfiguration?> load() async {
    final home = switch (platform.operatingSystem) {
      'windows' => platform.environment['USERPROFILE'],
      _ => platform.environment['HOME'],
    };
    if (home == null) {
      return null;
    }
    final path = p.join(home, '.config', 'configstore', 'firebase-tools.json');
    final firebaseToolsFile = fileSystem.file(path);
    if (!firebaseToolsFile.existsSync()) {
      return null;
    }
    try {
      final firebaseToolsJson = jsonDecode(
        await firebaseToolsFile.readAsString(),
      );
      return switch (firebaseToolsJson) {
        {'activeProjects': final Map<String, Object?> activeProjects} =>
          FirebaseConfiguration._(activeProjects: activeProjects.cast()),
        _ => null,
      };
    } on Object {
      return null;
    }
  }

  final Map<String, String> activeProjects;
}

typedef FirebaseProject = ({bool active, String projectId, String? alias});
