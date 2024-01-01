import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/commands/deploy_command.dart';
import 'package:celest_cli/commands/env_command.dart';
import 'package:celest_cli/commands/start_command.dart';
import 'package:celest_cli/commands/uninstall_command.dart';
import 'package:celest_cli/commands/update_command.dart';
import 'package:celest_cli/src/version.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

void main(List<String> args) async {
  final cli = Cli(
    'celest',
    'A command-line interface for Celest, the Flutter cloud platform.',
    version: packageVersion,
    postHogConfig: (
      apiHost: 'https://eu.posthog.com',
      apiKey: 'phc_IzYKGpBnjbb4GM7JsfaIzIu34EVh4PqgbZLVuihCaSm',
    ),
    sentryDsn:
        'https://aa63419b83419820da1454809c0025db@o4506345201532928.ingest.sentry.io/4506496721158144',
  )..addCommand(StartCommand());
  if (!zReleaseMode) {
    cli.addCommand(DeployCommand());
  }
  cli
    ..addCommand(EnvCommand())
    ..addCommand(UpdateCommand())
    ..addCommand(UninstallCommand());
  await cli.run(args);
}
