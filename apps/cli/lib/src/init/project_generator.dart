import 'package:celest_cli/src/init/migrations/add_analyzer_plugin.dart';
import 'package:celest_cli/src/init/migrations/macos_entitlements.dart';
import 'package:celest_cli/src/init/project_migration.dart';
import 'package:celest_cli/src/init/templates/project_template.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';

typedef ProjectTemplateFactory = ProjectTemplate Function(
  String projectRoot,
  String projectName,
  String projectDisplayName,
);

/// Manages the generation of a new Celest project.
class ProjectGenerator {
  ProjectGenerator({
    required this.projectName,
    required this.projectDisplayName,
    required this.parentProject,
    this.projectTemplate = HelloProject.new,
    required this.projectRoot,
  });

  /// The sanitized name of the project.
  final String projectName;

  /// The name of the project to initialize, as chosen by the user
  /// when running `celest start` for the first time.
  final String projectDisplayName;

  /// The root directory of the enclosing Flutter project.
  ///
  /// This will become the parent directory of the initialized
  /// Celest project and the project which receives the generated
  /// Flutter code.
  final ParentProject? parentProject;

  /// The project template to use for the migration.
  final ProjectTemplateFactory projectTemplate;

  /// The root directory of the initialized Celest project.
  final String projectRoot;

  /// Generates a new Celest project.
  Future<void> generate() async {
    final template = projectTemplate(
      projectRoot,
      projectName,
      projectDisplayName,
    );
    await Future.wait(
      [
        ProjectFile.gitIgnore(projectRoot),
        ProjectFile.analysisOptions(projectRoot),
        ProjectFile.pubspec(
          projectRoot,
          projectName: projectName,
          projectDisplayName: projectDisplayName,
          parentProject: parentProject,
          additionalDependencies: template.additionalDependencies,
        ),
        ProjectFile.client(projectRoot, projectName),
        template,
        if (parentProject
            case ParentProject(
              path: final appRoot,
              :final type,
            )) ...[
          AddAnalyzerPlugin(projectRoot, appRoot),
          if (type == SdkType.flutter) MacOsEntitlements(projectRoot, appRoot),
        ],
      ].map((item) => item.create()),
    );
  }
}
