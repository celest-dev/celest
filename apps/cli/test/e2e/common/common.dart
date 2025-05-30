import 'dart:io' show Process, Platform, ProcessException;
import 'dart:math';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/process.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:process/src/interface/common.dart';

import 'command.dart';

export 'command.dart';

/// The default environment to use when running CLI processes.
final defaultCliEnvironment = {...platform.environment, 'NO_COLOR': 'true'};

abstract base class TestTarget with TestHelpers {
  @override
  TestTarget get target => this;

  List<String> get tags => const [];

  @override
  File? get logFile => null;

  String get name;
  List<String> get executable;
  @override
  Map<String, String> get environment => const {};
  Future<void> setUpAll() async {}
  Future<void> tearDownAll() async {}
}

abstract base class E2ETest with TestHelpers {
  E2ETest(this.target);

  @override
  final TestTarget target;

  @override
  late final File logFile = tempDir.childFile('${name.snakeCase}.log')
    ..createSync();

  @override
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
  bool get skip => false;
  File? get logFile;

  Map<String, String> get environment => const {};

  void log(Object? object) => print(object);

  bool get hasFlutter {
    return getExecutablePath('flutter', null) != null;
  }

  Future<void> runCommand(
    List<String> command, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool? runInShell,
  }) async {
    log(
      'Running command: "${command.join(' ')}" in '
      '"${workingDirectory ?? fileSystem.currentDirectory.path}"',
    );
    final process = await Process.start(
      command.first,
      command.skip(1).toList(),
      workingDirectory: workingDirectory,
      environment: {
        ...platform.environment,
        ...defaultCliEnvironment,
        ...?environment,
      },
      runInShell: runInShell ?? platform.isWindows,
    );
    process.captureStdout(sink: log);
    process.captureStderr(sink: log);
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
  }) => runCommand(
    [...target.executable, command, '--json', ...args],
    workingDirectory: workingDirectory,
    environment: {
      if (logFile case final logFile?) 'CELEST_LOG_FILE': logFile.path,
      ...defaultCliEnvironment,
      ...target.environment,
      ...this.environment,
      ...?environment,
    },
  );

  Command celestCommand(
    String command, [
    String? arg0,
    String? arg1,
    String? arg2,
    String? arg3,
    String? arg4,
    String? arg5,
    String? arg6,
    String? arg7,
    String? arg8,
  ]) =>
      Command([
        ...target.executable,
        command,
        '--json',
        if (arg0 != null) arg0,
        if (arg1 != null) arg1,
        if (arg2 != null) arg2,
        if (arg3 != null) arg3,
        if (arg4 != null) arg4,
        if (arg5 != null) arg5,
        if (arg6 != null) arg6,
        if (arg7 != null) arg7,
        if (arg8 != null) arg8,
      ]).environment({
        if (logFile case final logFile?) 'CELEST_LOG_FILE': logFile.path,
        ...defaultCliEnvironment,
        ...target.environment,
        ...environment,
      }).runInShell();

  Future<String> findGitRoot() async {
    if (celestLocalPath case final localPath?) {
      return localPath;
    }
    final gitRootRes = await processManager.run([
      'git',
      'rev-parse',
      '--show-toplevel',
    ]);
    if (gitRootRes.exitCode != 0) {
      throw Exception('Failed to get git root directory: ${gitRootRes.stderr}');
    }
    return (gitRootRes.stdout as String).trim();
  }
}
