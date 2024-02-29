import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:checks/checks.dart';
import 'package:logging/logging.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:test/test.dart';

import 'common.dart';

final class Command {
  Command(this.command);

  final List<String> command;

  String? _workingDirectory;
  final Map<String, String> _environment = Map.of(defaultCliEnvironment);
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

  Never _fail(String method, Object e, StackTrace st) => fail('$e\n$st');

  late final Process _process;
  late final StreamQueue<String> _logs;

  Future<void>? _pendingTasks;
  Future<void> get _currentTasks => _pendingTasks ?? Future.value();
  Future<void> flush() {
    final pendingTasks = _currentTasks;
    _pendingTasks = null;
    return pendingTasks;
  }

  static const _defaultTimeout = Duration(seconds: 60);
  static final _logger = Logger('InteractiveCommand');

  InteractiveCommand writeLine(String line) {
    _pendingTasks = _currentTasks.then((_) {
      _logger.fine('writeLine writing: $line');
      return _process.stdin.writeln(line);
    }).onError<Object>((e, st) => _fail('writeLine', e, st));
    return this;
  }

  InteractiveCommand expectNext(
    String text, {
    Duration timeout = _defaultTimeout,
  }) {
    _pendingTasks = _currentTasks.then((_) {
      _logger.fine('expectNext expecting next: $text');
      return check(_logs.next)
          .completes((it) => it.contains(text))
          .then((_) => _logger.fine('expectNext Completed'))
          .timeout(
            timeout,
            onTimeout: () =>
                fail('expectNext Timed out waiting for $text to be printed'),
          );
    });
    return this;
  }

  InteractiveCommand expectLater(
    String text, {
    Duration timeout = _defaultTimeout,
  }) {
    skipWhere((line) {
      _logger.fine('Testing $line contains $text');
      return !line.contains(text);
    });
    _pendingTasks = _currentTasks.then((_) {
      _logger.fine('expectLater expecting next: $text');
      return check(_logs.next)
          .completes((it) => it.contains(text))
          .then((_) => _logger.fine('expectLater Completed'))
          .timeout(
            timeout,
            onTimeout: () =>
                fail('expectLater Timed out waiting for $text to be printed'),
          );
    });
    return this;
  }

  InteractiveCommand skip({
    int lines = 1,
    Duration timeout = _defaultTimeout,
  }) {
    _pendingTasks = _currentTasks.then((_) {
      _logger.fine('skip $lines lines');
      return _logs
          .take(lines)
          .then((_) => _logger.fine('skip Skipped $lines lines'))
          .onError<Object>((e, st) => _fail('skip', e, st))
          .timeout(
            timeout,
            onTimeout: () => fail(
              'Timed out waiting for $lines lines to be printed',
            ),
          );
    });
    return this;
  }

  InteractiveCommand skipWhere(
    bool Function(String) test, {
    Duration timeout = _defaultTimeout,
  }) {
    _pendingTasks = _currentTasks.then((_) {
      _logger.fine('skipWhere Starting', null, StackTrace.current);
      return _logs
          .withTransaction((logs) async {
            while (await logs.hasNext) {
              _logger.fine('skipWhere Waiting for next line');
              final line = await logs.peek;
              _logger.fine('skipWhere Got line: $line');
              if (test(line)) {
                _logger.fine('skipWhere Skipping line: $line');
                await logs.next;
                continue;
              }
              return true;
            }
            fail('skipWhere Process closed without matching');
          })
          .then((_) => _logger.fine('skipWhere Completed'))
          .onError<Object>((e, st) => _fail('skipWhere', e, st))
          .timeout(
            timeout,
            onTimeout: () => fail(
              'skipWhere Timed out waiting for matching line to be printed',
            ),
          );
    });
    return this;
  }

  InteractiveCommand hotReload() {
    // SIGUSR1 is not supported on Windows.
    if (platform.isWindows) {
      return this;
    }
    _pendingTasks = _currentTasks
        .then((_) {
          _logger.fine('hotReload triggering SIGUSR1');
          check(_process.kill(ProcessSignal.sigusr1)).isTrue();
        })
        .then((_) => _logger.fine('hotReload triggered'))
        .onError<Object>((e, st) => _fail('hotReload', e, st));
    return this;
  }

  Future<void> run() async {
    _logger.fine('Running to completion');
    await flush()
        .onError<Object>((e, st) => _fail('run', e, st))
        .whenComplete(() {
      _logger.fine('Killing process and draining logs');
      _process.kill();
      return _logs.rest.drain();
    });
    _logger.fine('Flushing test logs');
    await [stdout.flush(), stderr.flush()].wait;
  }

  Future<void> expectSuccess() async {
    try {
      await flush().onError<Object>((e, st) => _fail('expectSuccess', e, st));
      await check(_process.exitCode).completes((it) => it.equals(0));
    } finally {
      _process.kill();
      await _logs.cancel();
      await [stdout.flush(), stderr.flush()].wait;
    }
  }
}
