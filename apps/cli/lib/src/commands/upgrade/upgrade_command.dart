import 'dart:io';

import 'package:celest_cli/src/cli/cli_runtime.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/upgrade/celest_upgrader.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/logging/with_progress.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/version.dart';
import 'package:pub_semver/pub_semver.dart';

final class UpgradeCommand extends CelestCommand {
  UpgradeCommand() {
    argParser.addFlag(
      'dev',
      help: 'Include dev versions',
      defaultsTo: Version.parse(packageVersion).isPreRelease,
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

    final (latestVersion, latestRelease) = await getLatestVersion(
      includeDev: includeDev,
    );
    logger.fine('Latest published release: $latestVersion');
    if (latestVersion <= Version.parse(version)) {
      cliLogger.success('Celest is already up to date!');
      return 0;
    }

    final failureMessage = switch (CliRuntime.current) {
      CliRuntime.aot =>
        'Please visit https://celest.dev/download '
            'to upgrade manually.',
      CliRuntime.local || CliRuntime.pubGlobal =>
        'Please run `dart pub global activate celest_cli $latestVersion`.',
    };

    try {
      switch (CliRuntime.current) {
        case CliRuntime.local:
          unreachable('Should always be the latest version');
        case CliRuntime.aot:
          final installerFile = await withProgress(
            'Downloading Celest $latestVersion',
            (progres) => upgrader.downloadRelease(latestRelease!),
          );

          await upgrader.installRelease(installerFile);
        case CliRuntime.pubGlobal:
          final progress = cliLogger.progress(
            'Upgrading Celest to $latestVersion',
          );
          final command = <String>[
            platform.resolvedExecutable,
            'pub',
            'global',
            'activate',
            'celest_cli',
            latestVersion.toString(),
          ];
          final ProcessResult(
            :exitCode,
            :stdout,
            :stderr,
          ) = await processManager.run(command);
          if (exitCode == 0) {
            progress.complete('Celest has been updated to the latest version!');
          } else {
            progress.cancel();
            throw ProcessException(
              command.first,
              command.sublist(1),
              'Failed to upgrade Celest:\n$stdout\n$stderr',
              exitCode,
            );
          }
      }
    } on Object catch (e, st) {
      Error.throwWithStackTrace(
        CliException(failureMessage, additionalContext: {'error': '$e'}),
        st,
      );
    }

    return 0;
  }
}
