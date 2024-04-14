import 'package:celest_cli/init/project_item.dart';

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
  Future<void> migrate() async {
    await Future.wait(
      [
        MacOsEntitlements(appRoot),
        PubspecUpdater(appRoot, projectName),
      ].map((item) => item.create(projectRoot)),
    );
  }
}
