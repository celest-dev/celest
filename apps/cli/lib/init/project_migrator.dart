import 'package:celest_cli/init/project_items/add_generated_folder.dart';
import 'package:celest_cli/init/project_items/macos_entitlements.dart';
import 'package:celest_cli/init/project_items/pubspec_updater.dart';

/// Manages the migration of a Celest project to the latest version.
class ProjectMigrator {
  ProjectMigrator({
    required this.appRoot,
    required this.projectRoot,
    required this.projectName,
  });

  /// The root directory of the enclosing Flutter project.
  ///
  /// This will become the parent directory of the initialized
  /// Celest project and the project which receives the generated
  /// Flutter code.
  final String appRoot;

  /// The root directory of the initialized Celest project.
  final String projectRoot;

  /// The name of the project, as defined by the user.
  final String? projectName;

  /// Generates a new Celest project.
  ///
  /// Returns `true` if the project needs further migration by the analyzer.
  Future<bool> migrate() async {
    final [_, _, needsMigration] = await Future.wait([
      MacOsEntitlements(appRoot).create(projectRoot).then((_) => false),
      GeneratedFolder().create(projectRoot).then((_) => false),
      PubspecUpdater(appRoot, projectName).create(projectRoot),
    ]);
    return needsMigration;
  }
}
