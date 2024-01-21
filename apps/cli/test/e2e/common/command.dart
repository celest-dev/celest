import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:test/test.dart' as test show expectLater;
import 'package:test/test.dart' hide expectLater;

import 'common.dart';

final class Command {
  Command(this.command);

  final List<String> command;

  String? _workingDirectory;
  final Map<String, String> _environment = defaultCliEnvironment;
  Matcher? _expectedExitCode;
  Matcher? _expectedError;

  Future<void> run() async {
    final result = await processManager.run(
      command,
      workingDirectory: _workingDirectory,
      environment: _environment,
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (_expectedExitCode != null) {
      expect(result.exitCode, _expectedExitCode);
    }
    if (_expectedError != null) {
      expect(result.stderr, _expectedError);
    }
  }

  InteractiveCommand start() {
    final process = processManager.start(
      command,
      workingDirectory: _workingDirectory,
      environment: _environment,
    );
    return InteractiveCommand._(process);
  }

  Command workingDirectory(String path) {
    _workingDirectory = path;
    return this;
  }

  Command environment(Map<String, String> env) {
    _environment.addAll(env);
    return this;
  }

  Future<void> expectSuccess() {
    if (_expectedExitCode != null) {
      throw Exception('Cannot expect both success and failure');
    }
    _expectedExitCode = equals(0);
    return run();
  }

  Future<void> expectFailure([String? error]) {
    if (_expectedExitCode != null) {
      throw Exception('Cannot expect both success and failure');
    }
    _expectedExitCode = greaterThanOrEqualTo(1);
    if (error != null) {
      _expectedError = contains(error);
    }
    return run();
  }
}

final class InteractiveCommand {
  InteractiveCommand._(Future<Process> process) {
    process.then((process) => _process = process);
    _logs = StreamQueue(
      Stream.fromFuture(process).asyncExpand(
        (process) => StreamGroup.merge([process.stdout, process.stderr])
            .transform(utf8.decoder)
            // Transforming with line splitter would mean values are only
            // emitted after a line break, but prompts for example, are
            // printed without a line break. This allows values to be
            // emitted correctly in both cases.
            .expand(LineSplitter.split)
            .where((line) => line.isNotEmpty)
            .tap(print),
      ),
    );
  }

  Never _fail(Object e, StackTrace st) => fail('$e\n$st');

  late final Process _process;
  late final StreamQueue<String> _logs;

  Future<void>? _pendingTasks;
  Future<void> get wait => _pendingTasks ?? Future.value();

  // TODO(dnys1): Lower once we remove PubLauncher
  // static const _defaultTimeout = Duration(seconds: 30);
  static const _defaultTimeout = Duration(hours: 1);

  InteractiveCommand writeLine(String line) {
    _pendingTasks =
        wait.then((_) => _process.stdin.writeln(line)).onError(_fail);
    return this;
  }

  InteractiveCommand expectNext(
    String text, {
    Duration timeout = _defaultTimeout,
  }) {
    _pendingTasks = wait.then((_) {
      return test.expectLater(_logs.next, completion(contains(text))).timeout(
            timeout,
            onTimeout: () => fail('Timed out waiting for $text to be printed'),
          );
    });
    return this;
  }

  InteractiveCommand expectLater(
    String text, {
    Duration timeout = _defaultTimeout,
  }) {
    skipWhere((line) => !line.contains(text));
    _pendingTasks = wait.then((_) {
      return test.expectLater(_logs.next, completion(contains(text))).timeout(
            timeout,
            onTimeout: () => fail('Timed out waiting for $text to be printed'),
          );
    });
    return this;
  }

  InteractiveCommand skip({
    int lines = 1,
    Duration timeout = _defaultTimeout,
  }) {
    _pendingTasks = wait.then((_) {
      return _logs
          .take(lines)
          .then((_) => null)
          .timeout(
            timeout,
            onTimeout: () => fail(
              'Timed out waiting for $lines lines to be printed',
            ),
          )
          .onError(_fail);
    });
    return this;
  }

  InteractiveCommand skipWhere(bool Function(String) test) {
    _pendingTasks = wait.then((_) {
      return _logs
          .withTransaction((logs) async {
            while (await logs.hasNext) {
              if (test(await logs.next)) {
                return true;
              }
            }
            return false;
          })
          .then((_) => null)
          .onError(_fail);
    });
    return this;
  }

  Future<void> run() async {
    await wait.onError(_fail).whenComplete(() {
      _process.kill();
      return _logs.rest.drain();
    });
    await [stdout.flush(), stderr.flush()].wait;
  }

  Future<void> expectSuccess() async {
    try {
      await wait.onError(_fail);
      await test.expectLater(_process.exitCode, completion(0));
    } finally {
      _process.kill();
      await _logs.cancel();
      await [stdout.flush(), stderr.flush()].wait;
    }
  }
}
