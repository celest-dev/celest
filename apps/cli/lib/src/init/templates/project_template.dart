import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/migrations/add_generated_folder.dart';
import 'package:celest_cli/src/init/project_migration.dart';
import 'package:celest_cli/src/pub/project_dependency.dart';
import 'package:celest_cli/src/utils/recase.dart';

part 'data_project.dart';
part 'hello_project.dart';

sealed class ProjectTemplate extends ProjectMigration {
  const ProjectTemplate(super.projectRoot);

  factory ProjectTemplate.hello(
    String projectRoot,
    String projectName,
    String projectDisplayName,
  ) = HelloProject;

  List<ProjectDependency> get additionalDependencies => const [];
}
