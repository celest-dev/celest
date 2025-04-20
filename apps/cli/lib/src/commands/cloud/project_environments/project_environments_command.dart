import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/cloud/project_environments/create_project_environment_command.dart';
import 'package:celest_cli/src/commands/cloud/project_environments/delete_project_environment_command.dart';
import 'package:celest_cli/src/commands/cloud/project_environments/deploy_project_environment_command.dart';
import 'package:celest_cli/src/commands/cloud/project_environments/get_project_environment_command.dart';
import 'package:celest_cli/src/commands/cloud/project_environments/list_project_environments_command.dart';
import 'package:celest_cli/src/commands/cloud/project_environments/update_project_environment_command.dart';

final class ProjectEnvironmentsCommand extends CelestCommand {
  ProjectEnvironmentsCommand() {
    addSubcommand(CreateProjectEnvironmentCommand());
    addSubcommand(DeployProjectEnvironmentCommand());
    addSubcommand(GetProjectEnvironmentCommand());
    addSubcommand(ListProjectEnvironmentsCommand());
    addSubcommand(UpdateProjectEnvironmentCommand());
    addSubcommand(DeleteProjectEnvironmentCommand());
  }

  @override
  String get description => 'Create and manage project environments.';

  @override
  String get name => 'environments';

  @override
  bool get hidden => true;
}
