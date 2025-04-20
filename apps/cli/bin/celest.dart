import 'package:celest_cli/celest_cli.dart';
import 'package:celest_cli/src/commands/auth/auth_command.dart';
import 'package:celest_cli/src/commands/cloud/organizations/organizations_command.dart';
import 'package:celest_cli/src/commands/cloud/project_environments/project_environments_command.dart';
import 'package:celest_cli/src/commands/cloud/projects/projects_command.dart';
import 'package:celest_cli/src/commands/project/deploy_command.dart';
import 'package:celest_cli/src/commands/project/status_command.dart';
import 'package:celest_cli/src/performance/sentry_perf.dart';

void main(List<String> args) async {
  final cli = Cli(
    'celest',
    'A command-line interface for Celest, the Flutter cloud platform.',
    version: packageVersion,
    sentryConfig: SentryConfig(
      dsn:
          'https://aa63419b83419820da1454809c0025db@o4506345201532928.ingest.us.sentry.io/4506496721158144',
    ),
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
