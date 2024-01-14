import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/commands/uninstall/celest_uninstaller.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class UninstallCommand extends CelestCommand with Configure {
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

    await configure();

    final areYouSure = cliLogger.confirm(
      'Are you sure you want to uninstall Celest and all associated data?',
    );
    if (!areYouSure) {
      cliLogger.info('Aborted uninstall');
      return 0;
    }

    await const CelestUninstaller().uninstall();

    cliLogger.success('Successfully uninstalled Celest.');
    return 0;
  }
}
