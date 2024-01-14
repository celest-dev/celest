import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class UninstallCommand extends CelestCommand {
  UninstallCommand();

  @override
  String get description => 'Uninstalls the Celest CLI.';

  @override
  String get name => 'uninstall';

  @override
  String get category => 'Tools';

  @override
  Future<int> run() async {
    await super.run();

    // TODO(dnys1): Undo the installation process.

    TODO();
  }
}
