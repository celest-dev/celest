import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:http/http.dart' as http;
import 'package:process/process.dart';
import 'package:test/test.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

const processManager = LocalProcessManager();

void main() {
  final testTargets = <TestTarget>[
    LocalTarget(),
  ];

  for (final testTarget in testTargets) {
    group(testTarget.name, () {
      setUpAll(() async {
        await testTarget.beforeAll();
      });

      tearDownAll(() async {
        await testTarget.afterAll();
      });

      test('start (new project)', () async {
        final dir = d.dir('hello');
        await dir.create();
        await _runCommand(
          ['flutter', 'create', '.'],
          workingDirectory: dir.io.path,
        );
        final start = await processManager.start(
          [...testTarget.executable, 'start'],
          workingDirectory: dir.io.path,
        );
        addTearDown(start.kill);
        final logs = StreamQueue(
          StreamGroup.merge([start.stdout, start.stderr])
              .transform(utf8.decoder),
        );
        addTearDown(() => logs.cancel(immediate: true));
        await expectLater(
          await logs.next,
          startsWith('Enter a name for your project'),
        );
        start.stdin.writeln('hello');
        await logs.next; // Skip echo'd project name
        await expectLater(
          await logs.next,
          contains('Project generated successfully'),
        );
      });
    });
  }
}

abstract class TestTarget {
  const TestTarget();

  String get name;
  List<String> get executable;
  Future<void> beforeAll() async {}
  Future<void> afterAll() async {}
}

class LocalTarget extends TestTarget {
  @override
  String get name => 'Local';

  @override
  List<String> get executable =>
      ['dart', Platform.script.resolve('../bin/celest.dart').toFilePath()];
}

class InstalledTarget extends TestTarget {
  @override
  String get name => 'Installed';

  @override
  List<String> get executable => const ['celest'];

  final tempDir = Directory.systemTemp.createTempSync('celest_cli_');

  @override
  Future<void> beforeAll() async {
    final abi = Abi.current();
    final ext = switch (Platform.operatingSystem) {
      'linux' => 'zip',
      'macos' => 'pkg',
      'windows' => 'appx',
      _ => unreachable(),
    };
    final downloadUrl = Uri.parse(
      'https://releases.celest.dev/latest/celest-latest-$abi.$ext',
    );
    print('Downloading Celest CLI from $downloadUrl');
    final downloadRes = await http.get(downloadUrl);
    if (downloadRes.statusCode != 200) {
      throw Exception('Failed to download Celest CLI');
    }
    final downloadFile = File('${tempDir.path}/celest.$ext');
    await downloadFile.writeAsBytes(downloadRes.bodyBytes);
    print('Downloaded Celest CLI to ${downloadFile.path}');
    print('Installing Celest CLI');
    switch (Platform.operatingSystem) {
      case 'macos':
        await _runCommand([
          'installer',
          '-pkg',
          downloadFile.path,
          '-target',
          '/',
        ]);
      case 'windows':
        await _runCommand([
          'powershell',
          '-Command',
          'Add-AppxPackage',
          '-Path',
          downloadFile.path,
        ]);
      case 'linux':
        await _runCommand([
          'unzip',
          downloadFile.path,
          '-d',
          '/opt',
        ]);
        await _runCommand([
          'ln',
          '-sf',
          '/opt/celest/celest',
          '/usr/local/bin/celest',
        ]);
      default:
        unreachable();
    }
  }

  @override
  Future<void> afterAll() async {
    // TODO: Use `celest uninstall` when implemented
    switch (Platform.operatingSystem) {
      case 'macos':
      case 'linux':
        final entities = [
          Directory('/opt/celest'),
          Link('/usr/local/bin/celest'),
        ];
        for (final entity in entities) {
          if (entity.existsSync()) {
            await entity.delete(recursive: true);
          }
        }
      case 'windows':
        await _runCommand([
          'powershell',
          '-Command',
          'Remove-AppxPackage',
          '-Package',
          'Celest.CLI',
        ]);
      default:
        unreachable();
    }
    tempDir.deleteSync(recursive: true);
  }
}

Future<void> _runCommand(
  List<String> command, {
  String? workingDirectory,
}) async {
  print('Running command: ${command.join(' ')}');
  final process = await processManager.start(
    command,
    workingDirectory: workingDirectory,
    mode: ProcessStartMode.inheritStdio,
  );
  if (await process.exitCode case final exitCode && != 0) {
    throw ProcessException(
      command.first,
      command.skip(1).toList(),
      'Command failed',
      exitCode,
    );
  }
}
