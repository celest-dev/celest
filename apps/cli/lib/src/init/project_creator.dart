import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_generator.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/init/templates/project_template.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/utils/error.dart';

base mixin ProjectCreator on Configure {
  /// The project template to use when creating a project.
  String get template;

  /// The project name to use when creating a project.
  String? get projectName => null;

  Future<String> createProject({
    required String projectName,
    required String projectDisplayName,
    required ParentProject? parentProject,
  }) async {
    logger.finest(
      'Generating project for "$projectName" at '
      '"${projectPaths.projectRoot}"...',
    );
    await performance.trace('ProjectCreator', 'createProject', () async {
      await ProjectGenerator(
        parentProject: parentProject,
        projectRoot: projectPaths.projectRoot,
        projectName: projectName,
        projectDisplayName: projectDisplayName,
        projectTemplate: switch (template) {
          'hello' => HelloProject.new,
          'data' => DataProject.new,
          _ => unreachable('Invalid project template: $template'),
        },
      ).generate();
      logger.fine('Project generated successfully');
    });
    return projectName;
  }
}
