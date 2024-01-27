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

final class MockProcess extends Mock implements Process {}

final class MockPlatform extends Mock implements Platform {}

void main() {
  group('CelestUninstaller', () {
    setUpAll(() {
      registerFallbackValue(ProcessStartMode.normal);
    });

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

        const appData = r'C:\Users\test\AppData\Local\Microsoft\WindowsApps';
        final installFolder =
            p.windows.join(appData, 'Celest.CLI_6580ymbmddxye');
        ctx.platform = FakePlatform(
          operatingSystem: 'windows',
          executable: p.windows.join(appData, 'celest.exe'),
          script: Uri.file(
            p.windows.join(appData, 'celest.exe'),
            windows: true,
          ),
          resolvedExecutable: p.windows.join(installFolder, 'celest.exe'),
          environment: {
            'APPDATA': ctx.fileSystem.systemTempDirectory.path,
          },
        );

        final configDir =
            ctx.fileSystem.systemTempDirectory.childDirectory('Celest');
        configDir.createSync(recursive: true);

        final installDir = ctx.fileSystem
            .directory(r'C:\')
            .childDirectory('Users')
            .childDirectory('test')
            .childDirectory('AppData')
            .childDirectory('Local')
            .childDirectory('Microsoft')
            .childDirectory('WindowsApps')
          ..createSync(recursive: true);
        final sqliteLink = installDir.childLink('dart_sqlite3.dll')
          ..createSync(
            p.windows.join(installFolder, 'dart_sqlite3.dll'),
          );

        await init(
          projectRoot: ctx.fileSystem.systemTempDirectory.path,
        );

        when(
          () => ctx.processManager.run(
            [
              'powershell',
              '-Command',
              r'Get-AppxPackage -Name "Celest.CLI" | Remove-AppxPackage -Confirm:$false',
            ],
            stdoutEncoding: any(named: 'stdoutEncoding'),
            stderrEncoding: any(named: 'stderrEncoding'),
          ),
        ).thenAnswer((_) async => ProcessResult(0, 0, '', ''));

        expect(configDir.existsSync(), isTrue);

        await const CelestUninstaller().uninstall();

        expect(configDir.existsSync(), isFalse);
        expect(sqliteLink.existsSync(), isFalse);

        verify(
          () => ctx.processManager.run(
            [
              'powershell',
              '-Command',
              r'Get-AppxPackage -Name "Celest.CLI" | Remove-AppxPackage -Confirm:$false',
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

        const uninstallScript = "[ -d '/opt/celest' ] && rm -r '/opt/celest'; "
            "[ -h '/usr/local/bin/celest' ] && rm '/usr/local/bin/celest'";
        when(
          () => ctx.processManager.run(
            [
              'osascript',
              '-e',
              'do shell script "$uninstallScript" '
                  'with prompt "Celest needs your permission to uninstall" '
                  'with administrator privileges',
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
              'osascript',
              '-e',
              'do shell script "$uninstallScript" '
                  'with prompt "Celest needs your permission to uninstall" '
                  'with administrator privileges',
            ],
            stdoutEncoding: any(named: 'stdoutEncoding'),
            stderrEncoding: any(named: 'stderrEncoding'),
          ),
        ).called(1);
      });

      group('linux', () {
        test('deb installation', () async {
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

          when(
            () => ctx.processManager.run(
              [
                'dpkg',
                '-S',
                '/opt/celest/celest',
              ],
              stdoutEncoding: any(named: 'stdoutEncoding'),
              stderrEncoding: any(named: 'stderrEncoding'),
            ),
          ).thenAnswer(
            (_) async => ProcessResult(0, 0, 'celest: /opt/celest/celest', ''),
          );

          final purgeProcess = MockProcess();
          when(
            () => ctx.processManager.start(
              [
                'sudo',
                'dpkg',
                '--purge',
                'celest',
              ],
              mode: any(named: 'mode'),
            ),
          ).thenAnswer((_) async => purgeProcess);
          when(
            () => purgeProcess.exitCode,
          ).thenAnswer((_) async => 0);

          expect(configDir.existsSync(), isTrue);

          await const CelestUninstaller().uninstall();

          expect(configDir.existsSync(), isFalse);

          verify(
            () => ctx.processManager.start(
              [
                'sudo',
                'dpkg',
                '--purge',
                'celest',
              ],
              mode: any(named: 'mode'),
            ),
          ).called(1);
          verify(() => purgeProcess.exitCode).called(1);
        });

        test('zip installation', () async {
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

          when(
            () => ctx.processManager.run(
              [
                'dpkg',
                '-S',
                '/opt/celest/celest',
              ],
              stdoutEncoding: any(named: 'stdoutEncoding'),
              stderrEncoding: any(named: 'stderrEncoding'),
            ),
          ).thenAnswer((_) async => ProcessResult(0, 1, '', ''));

          expect(configDir.existsSync(), isTrue);

          await const CelestUninstaller().uninstall();

          expect(configDir.existsSync(), isFalse);

          verifyNever(
            () => ctx.processManager.start(
              [
                'sudo',
                'dpkg',
                '--purge',
                'celest',
              ],
              mode: any(named: 'mode'),
            ),
          );
        });
      });
    });
  });
}
