import 'package:celest_cli/init/migrations/add_analyzer_plugin.dart';
import 'package:celest_cli/init/migrations/macos_entitlements.dart';
import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/project/celest_project.dart';

/// Manages the generation of a new Celest project.
class ProjectGenerator {
  ProjectGenerator({
    required this.projectName,
    required this.parentProject,
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
  final ParentProject? parentProject;

  /// The root directory of the initialized Celest project.
  final String projectRoot;

  /// Generates a new Celest project.
  Future<void> generate() async {
    await Future.wait(
      [
        const ProjectFile.gitIgnore(),
        const ProjectFile.analysisOptions(),
        ProjectFile.pubspec(projectName, parentProject),
        ProjectTemplate.hello(projectName),
        if (parentProject
            case ParentProject(
              path: final appRoot,
              type: ParentProjectType.flutter
            ))
          MacOsEntitlements(appRoot),
        if (parentProject case final parentProject?)
          AddAnalyzerPlugin(parentProject),
      ].map((item) => item.create(projectRoot)),
    );
  }
}
