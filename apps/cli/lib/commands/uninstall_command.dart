import 'package:celest_cli/commands/uninstall/celest_uninstaller.dart';
import 'package:celest_cli/src/context.dart';
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

    final areYouSure = switch (platform.operatingSystem) {
      // Cannot use prompts on Windows
      // https://github.com/dart-lang/sdk/issues/54588
      // https://github.com/microsoft/terminal/issues/16223
      'windows' => true,
      _ => cliLogger.confirm(
          'Are you sure you want to uninstall Celest and all associated data?',
        ),
    };
    if (!areYouSure) {
      cliLogger.info('Aborted uninstall');
      return 0;
    }

    // Bare init so we can access the celest config.
    await init(projectRoot: fileSystem.currentDirectory.path);

    await const CelestUninstaller().uninstall();

    cliLogger.success('Successfully uninstalled Celest');
    return 0;
  }
}
