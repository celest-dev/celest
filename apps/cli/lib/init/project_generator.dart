import 'package:celest_cli/init/project_item.dart';
import 'package:celest_cli/init/project_items/macos_entitlements.dart';

/// Manages the generation of a new Celest project.
class ProjectGenerator {
  ProjectGenerator({
    required this.projectName,
    required this.appRoot,
    required this.projectRoot,
  });

  /// The name of the project to initialize, as chosen by the user
  /// when running `celest start` for the first time.
  final String projectName;

  /// The root directory of the enclosing Flutter project.
  ///
  /// This will become the parent directory of the initialized
  /// Celest project and the project which receives the generated
  /// Flutter code.
  final String appRoot;

  /// The root directory of the initialized Celest project.
  final String projectRoot;

  /// Generates a new Celest project.
  Future<void> generate() async {
    await Future.wait(
      [
        const ProjectFile.gitIgnore(),
        const ProjectFile.analysisOptions(),
        ProjectFile.pubspec(projectName, appRoot),
        ProjectTemplate.hello(projectName),
        MacOsEntitlements(appRoot),
      ].map((item) => item.create(projectRoot)),
    );
  }
}
