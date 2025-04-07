import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/init/migrations/add_analyzer_plugin.dart';
import 'package:celest_cli/src/init/migrations/macos_entitlements.dart';
import 'package:celest_cli/src/init/migrations/pubspec_updater.dart';
import 'package:celest_cli/src/init/project_migration.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';

/// Manages the migration of a Celest project to the latest version.
class ProjectMigrator {
  ProjectMigrator({
    required this.projectRoot,
    required this.projectName,
    required this.parentProject,
    required this.upgradeFromVersion,
  });

  /// The root directory of the enclosing Flutter project.
  ///
  /// This will become the parent directory of the initialized
  /// Celest project and the project which receives the generated
  /// Flutter code.
  final ParentProject? parentProject;

  /// The root directory of the initialized Celest project.
  final String projectRoot;

  /// The name of the project, as defined by the user.
  final String projectName;

  /// The version of the Celest SDK that the project is being upgraded from.
  ///
  /// This is used to determine if certain migrations need to be performed.
  final Version? upgradeFromVersion;

  static final Logger _logger = Logger('ProjectMigrator');

  /// Generates a new Celest project.
  ///
  /// Returns `true` if the project needs further migration by the analyzer.
  Future<ProjectMigrationResult> migrate() async {
    final migrations = [
      PubspecUpdater(
        projectRoot,
        parentProject,
        projectName,
        upgradeFromVersion: upgradeFromVersion,
      ),
      if (parentProject
          case ParentProject(
            path: final appRoot,
            :final type,
          )) ...[
        AddAnalyzerPlugin(projectRoot, appRoot),
        if (type == SdkType.flutter) MacOsEntitlements(projectRoot, appRoot),
      ],
    ];
    final report = ProjectMigrationReport();
    final needsMigration = <Future<ProjectMigrationResult>>[];
    for (final migration in migrations) {
      if (!migration.needsMigration) {
        report.migrations[migration.name] = const ProjectMigrationSkipped();
        continue;
      }
      needsMigration.add(
        migration.create().then((result) {
          report.migrations[migration.name] = result;
          return result;
        }),
      );
    }
    if (needsMigration.isEmpty) {
      return const ProjectMigrationSkipped();
    }
    await Future.wait(needsMigration);
    _logger.fine('Project migration report: $report');
    return report.result;
  }
}
