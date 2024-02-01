import 'dart:io' show ProcessStartMode, ProcessException;

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:checks/checks.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

import 'command.dart';

export 'command.dart';

/// The default environment to use when running CLI processes.
const defaultCliEnvironment = {
  'NO_COLOR': 'true',
};

abstract base class TestTarget with TestHelpers {
  @override
  TestTarget get target => this;

  List<String> get tags => const [];

  @override
  File? get logFile => null;

  String get name;
  List<String> get executable;
  Future<void> setUpAll() async {}
  Future<void> tearDownAll() async {}
}

abstract base class Test with TestHelpers {
  Test(this.target);

  @override
  final TestTarget target;

  @override
  File get logFile => tempDir.childFile('${name.snakeCase}.log')..createSync();

  List<String> get tags => const [];

  late final Directory flutterProjectDir;
  Directory get celestDir => flutterProjectDir.childDirectory('celest');

  @mustCallSuper
  Future<void> setUp() async {
    final flutterProject = d.dir('hello_project', [
      d.file('pubspec.yaml', '''
name: hello_project

environment:
  sdk: ^3.2.0

dependencies:
  flutter:
    sdk: flutter
'''),
    ]);
    await flutterProject.create();
    flutterProjectDir = fileSystem.directory(flutterProject.io.path);
    await check(
      processManager.run(
        ['flutter', 'pub', 'get'],
        workingDirectory: flutterProjectDir.path,
      ),
    ).completes((it) => it.has((it) => it.exitCode, 'exitCode').equals(0));
    print('Running test in ${flutterProjectDir.path}');
  }

  @mustCallSuper
  Future<void> tearDown() async {}

  String get name;
  Future<void> run();
}

mixin TestHelpers {
  final tempDir = fileSystem.systemTempDirectory.createTempSync('celest_cli_');

  TestTarget get target;
  File? get logFile;

  Future<void> runCommand(
    List<String> command, {
    String? workingDirectory,
    Map<String, String>? environment,
  }) async {
    print('Running command: ${command.join(' ')}');
    final process = await processManager.start(
      command,
      workingDirectory: workingDirectory,
      mode: ProcessStartMode.inheritStdio,
      environment: environment,
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

  Future<void> celest(
    String command, {
    List<String> args = const [],
    String? workingDirectory,
    Map<String, String>? environment,
  }) =>
      runCommand(
        [
          ...target.executable,
          command,
          ...args,
        ],
        workingDirectory: workingDirectory,
        environment: {
          ...defaultCliEnvironment,
          ...?environment,
        },
      );

  Command command(
    String command, [
    List<String> args = const [],
  ]) =>
      Command([command, ...args]);

  Command celestCommand(
    String command, [
    List<String> args = const [],
  ]) =>
      Command([
        ...target.executable,
        command,
        ...args,
      ]).environment({
        if (logFile case final logFile?) 'CELEST_LOG_FILE': logFile.path,
      });
}
