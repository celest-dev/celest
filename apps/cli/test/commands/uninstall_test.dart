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
      initTests(
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

        init(
          projectRoot: ctx.fileSystem.systemTempDirectory.path,
        );
        const appxOutput = r'''


Name              : Celest.CLI
Publisher         : CN=Celest, O=Teo Inc., C=US
Architecture      : Neutral
ResourceId        :
Version           : 0.1.0.0
PackageFullName   : Celest.CLI_0.1.0.0_neutral__ydcjh9khvjrm2                          
InstallLocation   : C:\Program                                                                             
                    Files\WindowsApps\Celest.CLI_0.1.0.0_neutral__ydcjh9khvjrm2        
IsFramework       : False                                                              
PackageFamilyName : Celest.CLI_ydcjh9khvjrm2
PublisherId       : ydcjh9khvjrm2
IsResourcePackage : False
IsBundle          : False
IsDevelopmentMode : False
NonRemovable      : False
IsPartiallyStaged : False
SignatureKind     : Developer
Status            : Ok

Name              : Celest.CLI
Publisher         : E=contact@celest.dev, CN="Teo, Inc.", O="Teo, Inc.", STREET=2261
                    Market Street Ste 5675, L=San Francisco, S=California, C=US,
                    OID.1.3.6.1.4.1.311.60.2.1.2=Delaware,
                    OID.1.3.6.1.4.1.311.60.2.1.3=US, SERIALNUMBER=2570417,
                    OID.2.5.4.15=Private Organization
Architecture      : Arm64
ResourceId        :
Version           : 0.1.0.0
PackageFullName   : Celest.CLI_0.1.0.0_arm64__6580ymbmddxye
InstallLocation   : C:\Program
                    Files\WindowsApps\Celest.CLI_0.1.0.0_arm64__6580ymbmddxye
IsFramework       : False
PackageFamilyName : Celest.CLI_6580ymbmddxye
PublisherId       : 6580ymbmddxye
IsResourcePackage : False
IsBundle          : False
IsDevelopmentMode : False
NonRemovable      : False
IsPartiallyStaged : False
SignatureKind     : Developer
Status            : Ok



''';
        when(
          () => ctx.processManager.run(
            [
              'powershell',
              '-Command',
              'Get-AppxPackage -Name "${CelestUninstaller.windowsPackageName}"',
            ],
            stdoutEncoding: any(named: 'stdoutEncoding'),
            stderrEncoding: any(named: 'stderrEncoding'),
          ),
        ).thenAnswer((_) async => ProcessResult(0, 0, appxOutput, ''));
        when(
          () => ctx.processManager.run(
            [
              'powershell',
              '-Command',
              'Remove-AppxPackage -Package "Celest.CLI_0.1.0.0_neutral__ydcjh9khvjrm2"',
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
              'Get-AppxPackage -Name "${CelestUninstaller.windowsPackageName}"',
            ],
            stdoutEncoding: any(named: 'stdoutEncoding'),
            stderrEncoding: any(named: 'stderrEncoding'),
          ),
        ).called(1);
        verify(
          () => ctx.processManager.run(
            [
              'powershell',
              '-Command',
              'Remove-AppxPackage -Package "Celest.CLI_0.1.0.0_neutral__ydcjh9khvjrm2"',
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

        init(
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

        init(
          projectRoot: ctx.fileSystem.systemTempDirectory.path,
        );

        expect(configDir.existsSync(), isTrue);

        await const CelestUninstaller().uninstall();

        expect(configDir.existsSync(), isFalse);
      });
    });
  });
}
