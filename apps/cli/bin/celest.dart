import 'package:celest_cli/commands/deploy_command.dart';
import 'package:celest_cli/commands/start_command.dart';
import 'package:celest_cli/src/version.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

void main(List<String> args) async {
  final cli = Cli(
    'celest',
    'Celest cloud services',
    version: packageVersion,
  )
    ..addCommand(StartCommand())
    ..addCommand(DeployCommand());
  await cli.run(args);
}
