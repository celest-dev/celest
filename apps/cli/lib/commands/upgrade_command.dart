import 'package:celest_cli/commands/upgrade/celest_upgrader.dart';
import 'package:celest_cli/releases/latest_release.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pub_semver/pub_semver.dart';

final class UpgradeCommand extends CelestCommand {
  UpgradeCommand();

  @override
  String get description => 'Upgrades the Celest CLI to the latest version.';

  @override
  String get name => 'upgrade';

  @override
  String get category => 'Tools';

  @override
  Future<int> run() async {
    await super.run();

    final upgrader = CelestUpgrader();

    final latest = await retrieveLatestRelease();
    if (latest.version <= Version.parse(version)) {
      cliLogger.success('Celest is already up to date!');
      return 0;
    }

    final installerFile = await withProgress(
      'Downloading Celest ${latest.version}',
      (progres) => upgrader.downloadRelease(latest),
    );

    await withProgress(
      'Upgrading Celest',
      onSuccess: 'Celest has been updated to the latest version!',
      (progress) => upgrader.installRelease(installerFile),
    );

    return 0;
  }
}
