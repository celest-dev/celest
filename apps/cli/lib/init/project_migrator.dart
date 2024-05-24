import 'package:celest_cli/init/project_items/add_generated_folder.dart';
import 'package:celest_cli/init/project_items/macos_entitlements.dart';
import 'package:celest_cli/init/project_items/pubspec_updater.dart';
import 'package:celest_cli/project/celest_project.dart';

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
  final String? projectName;

  /// Generates a new Celest project.
  ///
  /// Returns `true` if the project needs further migration by the analyzer.
  Future<bool> migrate() async {
    final results = await Future.wait<bool>([
      if (parentProject
          case ParentProject(
            path: final appRoot,
            type: ParentProjectType.flutter
          ))
        MacOsEntitlements(appRoot).create(projectRoot).then((_) => false),
      GeneratedFolder().create(projectRoot).then((_) => false),
      PubspecUpdater(parentProject, projectName).create(projectRoot),
    ]);
    return results.any((needsMigration) => needsMigration);
  }
}
