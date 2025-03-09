import 'package:celest_cli/commands/analysis_server_command.dart';
import 'package:celest_cli/commands/build_command.dart';
import 'package:celest_cli/commands/init_command.dart';
import 'package:celest_cli/commands/precache_command.dart';
import 'package:celest_cli/commands/start_command.dart';
import 'package:celest_cli/commands/uninstall_command.dart';
import 'package:celest_cli/commands/upgrade_command.dart';
import 'package:celest_cli/src/cli.dart';
import 'package:celest_cli/src/version.dart';

void main(List<String> args) async {
  final cli =
      Cli(
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
        ..addCommand(PrecacheCommand());

  await cli.run(args);
}
