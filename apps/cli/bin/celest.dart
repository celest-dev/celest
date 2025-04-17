import 'package:celest_cli/celest_cli.dart';
import 'package:celest_cli/src/commands/auth_command.dart';
import 'package:celest_cli/src/commands/deploy_command.dart';
import 'package:celest_cli/src/commands/organizations/organizations_command.dart';
import 'package:celest_cli/src/commands/project_environments/project_environments_command.dart';
import 'package:celest_cli/src/commands/projects/projects_command.dart';
import 'package:celest_cli/src/commands/status_command.dart';

void main(List<String> args) async {
  final cli = Cli(
    'celest',
    'A command-line interface for Celest, the Flutter cloud platform.',
    version: packageVersion,
  )
    ..addCommand(InitCommand())
    ..addCommand(StartCommand())
    ..addCommand(BuildCommand())
    ..addCommand(AnalysisServerCommand())
    ..addCommand(UpgradeCommand())
    ..addCommand(UninstallCommand())
    ..addCommand(PrecacheCommand())
    ..addCommand(DeployCommand())
    ..addCommand(AuthCommand())
    ..addCommand(StatusCommand());

  // Cloud API commands
  cli
    ..addCommand(OrganizationsCommand())
    ..addCommand(ProjectsCommand())
    ..addCommand(ProjectEnvironmentsCommand());

  await cli.run(args);
}
