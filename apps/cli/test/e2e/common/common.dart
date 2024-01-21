import 'dart:io';

import 'package:celest_cli_common/celest_cli_common.dart';

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

  String get name;
  List<String> get executable;
  Future<void> setUpAll() async {}
  Future<void> tearDownAll() async {}
}

abstract base class Test with TestHelpers {
  Test(this.target);

  @override
  final TestTarget target;

  List<String> get tags => const [];

  Future<void> setUp() async {}
  Future<void> tearDown() async {}

  String get name;
  Future<void> run();
}

mixin TestHelpers {
  final tempDir = Directory.systemTemp.createTempSync('celest_cli_');

  TestTarget get target;

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
      ]);
}
