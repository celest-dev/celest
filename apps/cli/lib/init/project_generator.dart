import 'package:celest_cli/init/migrations/add_analyzer_plugin.dart';
import 'package:celest_cli/init/migrations/macos_entitlements.dart';
import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

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
        ProjectFile.gitIgnore(projectRoot),
        ProjectFile.analysisOptions(projectRoot),
        ProjectFile.pubspec(projectRoot, projectName, parentProject),
        ProjectTemplate.hello(projectRoot, projectName),
        if (parentProject
            case ParentProject(path: final appRoot, :final type)) ...[
          AddAnalyzerPlugin(projectRoot, appRoot),
          if (type == SdkType.flutter) MacOsEntitlements(projectRoot, appRoot),
        ],
      ].map((item) => item.create()),
    );
  }
}
