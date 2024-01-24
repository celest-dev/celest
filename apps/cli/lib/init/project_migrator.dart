import 'package:celest_cli/init/project_item.dart';

/// Manages the migration of a Celest project to the latest version.
class ProjectMigrator {
  ProjectMigrator({
    required this.appRoot,
    required this.projectRoot,
  });

  /// The root directory of the enclosing Flutter project.
  ///
  /// This will become the parent directory of the initialized
  /// Celest project and the project which receives the generated
  /// Flutter code.
  final String appRoot;

  /// The root directory of the initialized Celest project.
  final String projectRoot;

  /// Generates a new Celest project.
  Future<void> migrate() async {
    await Future.wait(
      [
        MacOsEntitlements(appRoot),
      ].map((item) => item.create(projectRoot)),
    );
  }
}
