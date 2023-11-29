import 'package:celest_cli/commands/deploy.dart';
import 'package:celest_cli/commands/start.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

void main(List<String> args) async {
  final cli = Cli('celest', 'Celest cloud services')
    ..addCommand(StartCommand())
    ..addCommand(DeployCommand());
  await cli.run(args);
}
