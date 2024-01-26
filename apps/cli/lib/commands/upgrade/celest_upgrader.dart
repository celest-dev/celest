import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:celest_cli/releases/celest_release_info.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' as mason_logger;

final class CelestUpgrader {
  CelestUpgrader({
    required this.cliLogger,
  });

  static final _logger = Logger('CelestUpgrader');

  final mason_logger.Logger cliLogger;
  final _tempDir = fileSystem.systemTempDirectory.childDirectory('celest_cli_');

  Future<File> downloadRelease(CelestReleaseInfo release) async {
    final downloadUri =
        CelestReleasesInfo.baseUri.resolve((release.zip ?? release.installer)!);
    final downloadResp = await httpClient.get(downloadUri);
    if (downloadResp.statusCode != 200) {
      throw CelestException(
        'Failed to download Celest. Please check your internet '
        'connection and try again.',
        additionalContext: {
          'statusCode': downloadResp.statusCode.toString(),
          'body': downloadResp.body,
        },
      );
    }

    final downloadFile = _tempDir.childFile(p.url.basename(downloadUri.path));
    await downloadFile.create(recursive: true);
    await downloadFile.writeAsBytes(downloadResp.bodyBytes);
    return downloadFile;
  }

  Future<void> installRelease(File releasePackage) async {
    mason_logger.Progress? progress;
    try {
      // Skip on macOS since the permissions prompt will count towards the
      // progress timer.
      if (platform.operatingSystem case 'windows' || 'linux') {
        progress = cliLogger.progress('Updating Celest');
      } else {
        cliLogger.detail(
          'Please enter your password in the dialog that appears.',
        );
      }
      switch (platform.operatingSystem) {
        case 'macos':
          await _installMacOS(releasePackage.path);
        case 'linux':
          await _installLinux(releasePackage);
        case 'windows':
          await _installWindows(releasePackage);
        default:
          unreachable();
      }
      const successMessage = 'Celest has been updated to the latest version!';
      if (progress != null) {
        progress.complete(successMessage);
      } else {
        cliLogger.success(successMessage);
      }
    } on Object {
      progress?.cancel();
      rethrow;
    }
  }

  Future<void> _installWindows(File installerAppx) async {
    final installOutput = await processManager.run(
      <String>[
        'powershell',
        '-Command',
        'Add-AppxPackage -Path "${installerAppx.path}" -DeferRegistrationWhenPackagesAreInUse',
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (installOutput.exitCode != 0) {
      throw CelestException(
        'Failed to upgrade Celest. Please try again later.',
        additionalContext: {
          'exitCode': installOutput.exitCode.toString(),
          'stdout': installOutput.stdout.toString(),
          'stderr': installOutput.stderr.toString(),
        },
      );
    }
  }

  Future<void> _installLinux(File installerZip) async {
    _logger.finest('Installing Celest from ${installerZip.path}');
    if (p.extension(installerZip.path) != '.zip') {
      throw StateError('Expected zip file but got: $installerZip');
    }
    final zipStream = InputFileStream(installerZip.path);
    final archive = ZipDecoder().decodeBuffer(zipStream);
    final resolvedExe = platform.resolvedExecutable;
    if (p.basename(resolvedExe) != 'celest') {
      throw StateError('Expected `celest` exe but got: $resolvedExe');
    }
    final currentExeDir = fileSystem.directory(p.dirname(resolvedExe));
    _logger.finest('Unzipping to ${currentExeDir.path}');
    try {
      for (final zippedFile in archive.files) {
        // Replace current executable
        final file = currentExeDir.childFile(p.basename(zippedFile.name));
        final exists = await file.exists();
        _logger.finest('Updating ${file.path}. Exists: $exists');
        if (exists) {
          // Need to rm (unlink) before replacing
          // https://stackoverflow.com/questions/1712033/replacing-a-running-executable-in-linux
          final rmOutput = await processManager.run(
            <String>['rm', file.path],
            stdoutEncoding: utf8,
            stderrEncoding: utf8,
          );
          if (rmOutput.exitCode != 0) {
            throw ProcessException(
              'rm',
              [file.path],
              'Failed to rm ${file.path}: '
                  '${rmOutput.stdout}\n${rmOutput.stderr}',
              rmOutput.exitCode,
            );
          }
        }
        final output = OutputFileStream(file.path);
        zippedFile.writeContent(output);
        output.flush();
        await output.close();
      }
      // Make files executable
      for (final file in [
        currentExeDir.childFile('celest'),
        currentExeDir.childFile('launcher.sh'),
      ]) {
        if (!await file.exists()) continue;
        _logger.finest('Making ${file.path} executable');
        final chmodOutput = await processManager.run(
          <String>['chmod', '+x', file.path],
          stdoutEncoding: utf8,
          stderrEncoding: utf8,
        );
        if (chmodOutput.exitCode != 0) {
          throw ProcessException(
            'chmod',
            ['+x', file.path],
            'Failed to chmod +x ${file.path}: '
                '${chmodOutput.stdout}\n${chmodOutput.stderr}',
            chmodOutput.exitCode,
          );
        }
      }
    } finally {
      await zipStream.close();
    }
  }

  Future<void> _installMacOS(String installerFile) async {
    final volumeInfo = await processManager.run(
      <String>[
        'installer',
        '-pkg',
        installerFile,
        '-volinfo',
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    _logger.finest(
      'Found volumes for installation:\n'
      '${volumeInfo.exitCode}\n'
      '${volumeInfo.stdout}\n'
      '${volumeInfo.stderr}',
    );
    final installerCommand =
        'installer -pkg $installerFile -target / -verbose -dumplog';
    final installOutput = await processManager.run(
      <String>[
        'osascript',
        '-e',
        'do shell script "$installerCommand" '
            'with prompt "Celest needs your permission to upgrade" '
            'with administrator privileges',
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    _logger.finest(
      'Installer output:\n'
      '${installOutput.exitCode}\n'
      '${installOutput.stdout}\n'
      '${installOutput.stderr}',
    );
    if (installOutput.exitCode != 0) {
      throw CelestException(
        'Failed to upgrade Celest. Please try again later.',
        additionalContext: {
          'exitCode': installOutput.exitCode.toString(),
          'stdout': installOutput.stdout.toString(),
          'stderr': installOutput.stderr.toString(),
        },
      );
    }
  }
}
