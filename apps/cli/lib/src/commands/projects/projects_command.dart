import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/project_environments/project_environments_command.dart';
import 'package:celest_cli/src/commands/projects/create_project_command.dart';
import 'package:celest_cli/src/commands/projects/delete_project_command.dart';
import 'package:celest_cli/src/commands/projects/get_project_command.dart';
import 'package:celest_cli/src/commands/projects/list_projects_command.dart';
import 'package:celest_cli/src/commands/projects/update_project_command.dart';

final class ProjectsCommand extends CelestCommand {
  ProjectsCommand() {
    addSubcommand(CreateProjectCommand());
    addSubcommand(UpdateProjectCommand());
    addSubcommand(GetProjectCommand());
    addSubcommand(ListProjectsCommand());
    addSubcommand(DeleteProjectCommand());
    addSubcommand(ProjectEnvironmentsCommand());
  }

  @override
  String get description => 'Create and manage Celest Cloud projects.';

  @override
  String get name => 'projects';

  @override
  String get category => 'Cloud';

  @override
  bool get hidden => true;
}
