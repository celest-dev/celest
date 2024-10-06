import 'package:celest_cli/init/migrations/add_analyzer_plugin.dart';
import 'package:celest_cli/init/migrations/macos_entitlements.dart';
import 'package:celest_cli/init/migrations/pubspec_updater.dart';
import 'package:celest_cli/init/migrations/v1_folder_structure.dart';
import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:logging/logging.dart';

/// Manages the migration of a Celest project to the latest version.
class ProjectMigrator {
  ProjectMigrator({
    required this.projectRoot,
    required this.projectName,
    required this.parentProject,
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

  static final Logger _logger = Logger('ProjectMigrator');

  /// Generates a new Celest project.
  ///
  /// Returns `true` if the project needs further migration by the analyzer.
  Future<ProjectMigrationResult> migrate() async {
    final migrations = [
      PubspecUpdater(projectRoot, parentProject, projectName),
      V1FolderStructure(projectRoot, projectName, parentProject),
      if (parentProject
          case ParentProject(path: final appRoot, :final type)) ...[
        AddAnalyzerPlugin(projectRoot, appRoot),
        if (type == ParentProjectType.flutter)
          MacOsEntitlements(projectRoot, appRoot),
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
