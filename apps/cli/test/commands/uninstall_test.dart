import 'dart:io';

import 'package:celest_cli/commands/uninstall/celest_uninstaller.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/src/context.dart' as ctx;
import 'package:file/memory.dart';
import 'package:mocktail/mocktail.dart';
import 'package:platform/platform.dart';
import 'package:process/process.dart';
import 'package:test/test.dart';

import '../common.dart';

final class MockProcessManager extends Mock implements ProcessManager {}

final class MockPlatform extends Mock implements Platform {}

void main() {
  group('CelestUninstaller', () {
    setUp(() {
      return initTests(
        processManager: MockProcessManager(),
        platform: MockPlatform(),
      );
    });

    group('uninstall AOT', () {
      test('windows', () async {
        ctx.fileSystem = MemoryFileSystem.test(
          style: FileSystemStyle.windows,
        );
        ctx.platform = FakePlatform(
          operatingSystem: 'windows',
          executable: 'celest.exe',
          script: Uri.file(
            r'C:\Program Files\WindowsApps\celest.exe',
            windows: true,
          ),
          resolvedExecutable: r'C:\Program Files\WindowsApps\celest.exe',
          environment: {
            'APPDATA': ctx.fileSystem.systemTempDirectory.path,
          },
        );

        final configDir =
            ctx.fileSystem.systemTempDirectory.childDirectory('Celest');
        configDir.createSync(recursive: true);

        await init(
          projectRoot: ctx.fileSystem.systemTempDirectory.path,
        );
        when(
          () => ctx.processManager.run(
            [
              'powershell',
              '-Command',
              r'{ Get-AppxPackage -Name "Celest.CLI" | Remove-AppxPackage -Confirm:$false }',
            ],
            stdoutEncoding: any(named: 'stdoutEncoding'),
            stderrEncoding: any(named: 'stderrEncoding'),
          ),
        ).thenAnswer((_) async => ProcessResult(0, 0, '', ''));

        expect(configDir.existsSync(), isTrue);

        await const CelestUninstaller().uninstall();

        expect(configDir.existsSync(), isFalse);

        verify(
          () => ctx.processManager.run(
            [
              'powershell',
              '-Command',
              r'{ Get-AppxPackage -Name "Celest.CLI" | Remove-AppxPackage -Confirm:$false }',
            ],
            stdoutEncoding: any(named: 'stdoutEncoding'),
            stderrEncoding: any(named: 'stderrEncoding'),
          ),
        ).called(1);
      });

      test('macos', () async {
        ctx.fileSystem = MemoryFileSystem.test(
          style: FileSystemStyle.posix,
        );
        final configDir = ctx.fileSystem.systemTempDirectory
            .childDirectory('Library')
            .childDirectory('Application Support')
            .childDirectory('Celest');
        configDir.createSync(recursive: true);
        ctx.fileSystem
            .file('/opt/celest/celest.app/Contents/MacOS/celest')
            .createSync(recursive: true);
        ctx.fileSystem.link(CelestUninstaller.macosSymlink).createSync(
              '/opt/celest/celest.app/Contents/MacOS/celest',
              recursive: true,
            );
        ctx.platform = FakePlatform(
          operatingSystem: 'macos',
          executable: 'celest',
          script: Uri.file(
            '/opt/celest/celest.app/Contents/MacOS/celest',
            windows: false,
          ),
          resolvedExecutable: '/opt/celest/celest.app/Contents/MacOS/celest',
          environment: {
            'HOME': ctx.fileSystem.systemTempDirectory.path,
          },
        );

        await init(
          projectRoot: ctx.fileSystem.systemTempDirectory.path,
        );

        expect(configDir.existsSync(), isTrue);
        expect(
          ctx.fileSystem.directory('/opt/celest').existsSync(),
          isTrue,
        );
        expect(
          ctx.fileSystem.link(CelestUninstaller.macosSymlink).existsSync(),
          isTrue,
        );

        await const CelestUninstaller().uninstall();

        expect(configDir.existsSync(), isFalse);
        expect(
          ctx.fileSystem.directory('/opt/celest').existsSync(),
          isFalse,
        );
        expect(
          ctx.fileSystem.link(CelestUninstaller.macosSymlink).existsSync(),
          isFalse,
        );
      });

      test('linux', () async {
        ctx.fileSystem = MemoryFileSystem.test(
          style: FileSystemStyle.posix,
        );
        final configDir = ctx.fileSystem.systemTempDirectory
            .childDirectory('.config')
            .childDirectory('Celest');
        configDir.createSync(recursive: true);
        ctx.platform = FakePlatform(
          operatingSystem: 'linux',
          executable: 'celest',
          script: Uri.file(
            '/opt/celest/celest',
            windows: false,
          ),
          resolvedExecutable: '/opt/celest/celest',
          environment: {
            'HOME': ctx.fileSystem.systemTempDirectory.path,
          },
        );

        await init(
          projectRoot: ctx.fileSystem.systemTempDirectory.path,
        );

        expect(configDir.existsSync(), isTrue);

        await const CelestUninstaller().uninstall();

        expect(configDir.existsSync(), isFalse);
      });
    });
  });
}
