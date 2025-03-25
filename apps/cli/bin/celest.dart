import 'package:celest_cli/celest_cli.dart';

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
    // TODO(dnys1): Re-implement the upgrade command
    // ..addCommand(UpgradeCommand())
    ..addCommand(UninstallCommand())
    ..addCommand(PrecacheCommand());

  await cli.run(args);
}
