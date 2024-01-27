import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:logging/logging.dart';

class CelestUninstaller {
  const CelestUninstaller();

  static final logger = Logger('CelestUninstaller');

  static const windowsPackageName = 'Celest.CLI';
  static const macosSymlink = '/usr/local/bin/celest';

  Future<void> uninstall() async {
    await removeConfig();

    if (fileSystem.path.fromUri(platform.script).endsWith('.snapshot')) {
      await _uninstallPubGlobal();
    } else if (platform.executable.contains('dart')) {
      // Celest is running from source. Nothing to uninstall.
    } else {
      await _uninstallAot();
    }
  }

  Future<void> removeConfig() async {
    final configDir = fileSystem.directory(projectPaths.celestConfig);
    logger.fine('Removing Celest config dir: $configDir');
    if (await configDir.exists()) {
      await configDir.delete(recursive: true);
    }
  }

  Future<void> _uninstallPubGlobal() async {
    logger.fine('Removing Celest from pub global...');
    final result = await processManager.run(
      [
        platform.resolvedExecutable,
        'pub',
        'global',
        'deactivate',
        'celest_cli',
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (result.exitCode != 0) {
      logger.fine(
        'Failed to uninstall Celest from pub global.',
        '${result.stdout}\n${result.stderr}',
      );
      throw const CelestException(
        'Failed to uninstall Celest from pub global.',
      );
    }
  }

  Future<void> _uninstallAot() async {
    // Remove SQLite link if it exists.
    await CelestDatabase.removeSqliteLibrary();

    final exe = platform.resolvedExecutable;
    switch (platform.operatingSystem) {
      case 'linux':
        final dpkgOutput = await processManager.run(
          <String>['dpkg', '-S', exe],
          stdoutEncoding: utf8,
          stderrEncoding: utf8,
        );
        if (dpkgOutput.exitCode != 0) {
          return logger.warning(
            'Celest configuration has been removed. To uninstall the CLI, delete '
            'the downloaded executable and associated files from your computer.',
          );
        }
        final package = (dpkgOutput.stdout as String).split(':').first.trim();
        if (package != 'celest') {
          throw StateError('Unexpected package: $package');
        }
        final uninstallOutput = await processManager.start(
          <String>['sudo', 'dpkg', '--purge', package],
          mode: ProcessStartMode.inheritStdio,
        );
        if (await uninstallOutput.exitCode != 0) {
          throw const CelestException(
            'Celest was partially uninstalled. Please use dpkg to clean up '
            'remaining files.',
          );
        }
      case 'macos':
        if (p.basename(p.dirname(exe)) == 'MacOS') {
          // celest/celest.app/Contents/MacOS/celest
          final installPath = p.dirname(p.dirname(p.dirname(p.dirname(exe))));
          if (p.basename(installPath) != 'celest') {
            throw StateError('Unexpected install path: $installPath');
          }
          final uninstallScript =
              "[ -d '$installPath' ] && rm -r '$installPath'; [ -h '$macosSymlink' ] && rm '$macosSymlink'";
          final uninstallOutput = await processManager.run(
            <String>[
              'osascript',
              '-e',
              'do shell script "$uninstallScript" '
                  'with prompt "Celest needs your permission to uninstall" '
                  'with administrator privileges',
            ],
            stdoutEncoding: utf8,
            stderrEncoding: utf8,
          );
          logger.finest(
            'Uninstall output:\n'
            '${uninstallOutput.exitCode}\n'
            '${uninstallOutput.stdout}\n'
            '${uninstallOutput.stderr}',
          );
          if (uninstallOutput.exitCode != 0) {
            throw ProcessException(
              uninstallScript,
              [],
              'Failed to uninstall Celest: '
              '${uninstallOutput.stdout}\n${uninstallOutput.stderr}',
              uninstallOutput.exitCode,
            );
          }
        } else if (exe.contains(p.join('apps', 'cli')) ||
            exe.contains('apps/cli')) {
          // Local AOT compile. Remove parent directory.
          final localDir = fileSystem.directory(p.dirname(exe));
          logger.fine('Deleting directory: $localDir');
          await localDir.delete(recursive: true);
        } else {
          throw StateError('Unrecognized install location: $exe');
        }
      case 'windows':
        final appxPackageInfo = await processManager.run(
          [
            'powershell',
            '-Command',
            'Get-AppxPackage -Name "$windowsPackageName" | Remove-AppxPackage -Confirm:\$false',
          ],
          stdoutEncoding: utf8,
          stderrEncoding: utf8,
        );
        if (appxPackageInfo.exitCode != 0) {
          throw StateError(
            'Could not uninstall package "$windowsPackageName". '
            'Stdout: ${appxPackageInfo.stdout}\n'
            'Stderr: ${appxPackageInfo.stderr}',
          );
        }
      case final unsupported:
        unreachable('Unsupported OS: $unsupported');
    }
  }
}
