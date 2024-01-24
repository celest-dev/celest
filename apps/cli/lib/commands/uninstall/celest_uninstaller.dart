import 'dart:convert';

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
    final exe = platform.resolvedExecutable;
    switch (platform.operatingSystem) {
      case 'linux':
        return logger.warning(
          'Celest configuration has been removed. To uninstall the CLI, delete '
          'the downloaded executable and associated files from your computer.',
        );
      case 'macos':
        if (p.basename(p.dirname(exe)) == 'MacOS') {
          // celest/celest.app/Contents/MacOS/celest
          final installPath = p.dirname(p.dirname(p.dirname(p.dirname(exe))));
          if (p.basename(installPath) != 'celest') {
            throw StateError('Unexpected install path: $installPath');
          }
          final installDir = fileSystem.directory(installPath);
          logger.fine('Deleting directory: $installDir');
          await installDir.delete(recursive: true);
          final installLink = fileSystem.link(macosSymlink);
          logger.fine('Deleting symlink: $installLink');
          if (await installLink.exists()) {
            await installLink.delete();
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
