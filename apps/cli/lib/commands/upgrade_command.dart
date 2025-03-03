import 'package:celest_cli/commands/celest_command.dart';
import 'package:celest_cli/commands/upgrade/celest_upgrader.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/logging/with_progress.dart';
import 'package:celest_cli/src/releases/latest_release.dart';
import 'package:celest_cli/src/version.dart';
import 'package:pub_semver/pub_semver.dart';

final class UpgradeCommand extends CelestCommand {
  UpgradeCommand() {
    argParser.addFlag(
      'dev',
      help: 'Include dev versions',
      defaultsTo: false,
      hide: true,
    );
  }

  @override
  String get description => 'Upgrades the Celest CLI to the latest version.';

  @override
  String get name => 'upgrade';

  @override
  String get category => 'Tools';

  @override
  List<String> get aliases => ['update'];

  late final bool includeDev = argResults!.flag('dev');

  @override
  Future<int> run() async {
    await super.run();

    final upgrader = CelestUpgrader(cliLogger: cliLogger);

    try {
      final latest = await retrieveLatestRelease(
        packageVersion,
        includeDev: includeDev,
      );
      logger.fine('Latest published release: ${latest.version}');
      if (latest.version <= Version.parse(version)) {
        cliLogger.success('Celest is already up to date!');
        return 0;
      }

      final installerFile = await withProgress(
        'Downloading Celest ${latest.version}',
        (progres) => upgrader.downloadRelease(latest),
      );

      await upgrader.installRelease(installerFile);
    } on Object catch (e, st) {
      Error.throwWithStackTrace(
        CliException(
          'Failed to upgrade Celest. Please visit https://celest.dev/download '
          'to upgrade manually.',
          additionalContext: {'error': '$e'},
        ),
        st,
      );
    }

    return 0;
  }
}
