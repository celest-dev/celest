import 'dart:io' show Platform, ProcessException, ProcessStartMode;
import 'dart:math';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';

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
  Map<String, String> get environment => const {};
  Future<void> setUpAll() async {}
  Future<void> tearDownAll() async {}
}

abstract base class E2ETest with TestHelpers {
  E2ETest(this.target);

  @override
  final TestTarget target;

  @override
  File get logFile => tempDir.childFile('${name.snakeCase}.log')..createSync();

  void log(Object? object) {
    final terminator = Platform.lineTerminator;
    print(object);
    logFile.writeAsStringSync(
      '$terminator$object$terminator',
      mode: FileMode.append,
    );
  }

  List<String> get tags => const [];

  static final Random _random = Random();
  final projectName = 'test_project_${_random.nextInt(1 << 20)}';

  @mustCallSuper
  Future<void> setUp() async {}

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
          '--json',
          ...args,
        ],
        workingDirectory: workingDirectory,
        environment: {
          if (logFile case final logFile?) 'CELEST_LOG_FILE': logFile.path,
          ...defaultCliEnvironment,
          ...target.environment,
          ...?environment,
        },
      );

  Command celestCommand(
    String command, [
    List<String> args = const [],
  ]) =>
      Command([
        ...target.executable,
        command,
        '--json',
        ...args,
      ]).environment({
        if (logFile case final logFile?) 'CELEST_LOG_FILE': logFile.path,
        ...defaultCliEnvironment,
        ...target.environment,
      });
}
