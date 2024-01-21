import 'dart:ffi';
import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:http/http.dart' as http;

import '../common/common.dart';

// TODO(dnys1): Add test that builds the installer locally before installing.
final class InstallerTarget extends TestTarget {
  @override
  String get name => 'Installer';

  @override
  List<String> get tags => const ['e2e-installer'];

  @override
  final List<String> executable = [
    switch (platform.operatingSystem) {
      'windows' => p.join(
          platform.environment['LOCALAPPDATA']!,
          'Microsoft',
          'WindowsApps',
          'celest.exe',
        ),
      'linux' || 'macos' => 'celest',
      _ => unreachable(),
    },
  ];

  @override
  Future<void> setUpAll() async {
    final abi = Abi.current();
    final ext = switch (Platform.operatingSystem) {
      'linux' => 'zip',
      'macos' => 'pkg',
      'windows' => 'appx',
      _ => unreachable(),
    };
    final downloadUrl = Uri.parse(
      'https://storage.googleapis.com/celest-release-artifacts/$abi/latest/celest-latest-$abi.$ext',
    );
    print('Downloading Celest CLI from $downloadUrl');
    final downloadRes = await http.get(downloadUrl);
    if (downloadRes.statusCode != 200) {
      throw Exception('Failed to download Celest CLI');
    }
    final downloadFile = File(p.join(tempDir.path, 'celest.$ext'));
    await downloadFile.writeAsBytes(downloadRes.bodyBytes, flush: true);
    print('Downloaded Celest CLI to ${downloadFile.path}');
    print('Installing Celest CLI');
    switch (Platform.operatingSystem) {
      case 'macos':
        await runCommand([
          'sudo',
          'installer',
          '-pkg',
          downloadFile.path,
          '-target',
          '/',
          '-verbose',
        ]);
      case 'windows':
        await runCommand([
          'powershell',
          '-Command',
          '{Add-AppxPackage -Path "${downloadFile.path}"}',
        ]);
        await runCommand([
          'powershell',
          '-Command',
          '{Get-AppxPackage -Name "Celest.CLI"}',
        ]);
      case 'linux':
        await runCommand([
          'unzip',
          downloadFile.path,
          '-d',
          '/opt',
        ]);
        await runCommand([
          'chmod',
          '+x',
          '/opt/celest/celest',
        ]);
        await runCommand([
          'ln',
          '-sf',
          '/opt/celest/celest',
          '/usr/local/bin/celest',
        ]);
      default:
        unreachable();
    }
    await celest('--help');
  }

  @override
  Future<void> tearDownAll() async {
    final uninstall = celestCommand('uninstall')
        .start()
        .expectNext('Are you sure')
        .writeLine('y');
    if (platform.isLinux) {
      uninstall.expectNext('Celest configuration has been removed');
    }
    await uninstall
        .expectNext('Successfully uninstalled Celest')
        .expectSuccess();
    tempDir.deleteSync(recursive: true);
  }
}
