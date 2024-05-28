import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:checks/checks.dart';
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' show red;
import 'package:stack_trace/stack_trace.dart';
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
      runInShell: platform.isWindows,
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

extension FlatMap<T> on Stream<T> {
  Stream<S> flatMap<S>(S? Function(T) mapper) => transform(
        StreamTransformer.fromHandlers(
          handleData: (value, sink) {
            if (mapper(value) case final value?) {
              sink.add(value);
            }
          },
        ),
      );
}

final _logger = Logger('InteractiveCommand');
Never _fail(String method, Object e, StackTrace st) => fail('$e\n$st');
void _error(String message) {
  final output = ansiColorsEnabled ? red.wrap(message) ?? message : message;
  stderr.writeln(output);
}

extension<T> on Future<T> {
  Future<void> trace(String methodName, [Duration? timeout]) {
    final fut = Chain.capture(() => this, errorZone: false)
        .then((_) => _logger.fine('$methodName completed'))
        .onError<Object>(
          (e, st) => _fail(
            methodName,
            e,
            Chain([Trace.from(st), Trace.current()]),
          ),
        );
    if (timeout != null) {
      return fut.timeout(
        timeout,
        onTimeout: () => _fail(
          '$methodName Timed out',
          TimeoutException(null, timeout),
          Chain.current(),
        ),
      );
    }
    return fut;
  }
}

extension on Subject<Future<LogMessage>> {
  Future<void> contains(String text) => this.completes(
        (it) => it.has((log) => log.message, 'message').contains(text),
      );
}

final class InteractiveCommand {
  InteractiveCommand._(Future<Process> process) {
    process = process.then((process) {
      _process = process;
      process.stderr
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .forEach(_error);
      process.exitCode.then((exitCode) {
        if (_pendingTasks != null) {
          _fail(
            'start',
            'Command exited with code $exitCode while tasks were pending',
            StackTrace.current,
          );
        }
      });
      return process;
    }).onError<Object>((e, st) => _fail('start', e, st));
    _logs = StreamQueue(
      Stream.fromFuture(process).asyncExpand(
        (process) => process.stdout
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .where((line) => line.isNotEmpty)
            .map((line) {
              print(line);
              try {
                return jsonDecode(line) as Map<String, dynamic>;
              } on FormatException {
                _error('Failed to parse log message: $line');
                rethrow;
              }
            })
            .map(LogMessage.fromJson)
            .where(
              (log) => switch (log) {
                LogMessageProgress(:final progress) =>
                  // Ignore cancel messages since they will double count
                  // expectLater/expectNext
                  progress != ProgressAction.cancel,
                _ => true,
              },
            ),
      ),
    );
  }

  late final Process _process;
  late final StreamQueue<LogMessage> _logs;

  Future<void>? _pendingTasks;
  Future<void> get _currentTasks => _pendingTasks ?? Future.value();
  Future<void> flush() {
    final pendingTasks = _currentTasks;
    _pendingTasks = null;
    return pendingTasks;
  }

  InteractiveCommand _addTask(
    String methodName,
    FutureOr<void> Function() task, {
    Duration? timeout,
  }) {
    _pendingTasks = _currentTasks.then((_) {
      _logger.fine('$methodName started');
      return Future.value(task()).trace(methodName, timeout);
    });
    return this;
  }

  static const _defaultTimeout = Duration(seconds: 60);

  InteractiveCommand writeLine(String line) {
    return _addTask(
      'writeLine($line)',
      () => _process.stdin.writeln(line),
    );
  }

  InteractiveCommand expectNext(
    String text, {
    Duration timeout = _defaultTimeout,
  }) {
    return _addTask(
      'expectNext($text)',
      timeout: timeout,
      () => check(_logs.next).contains(text),
    );
  }

  InteractiveCommand expectLater(
    String text, {
    Duration timeout = _defaultTimeout,
  }) {
    skipWhere(
      'not contains($text)',
      (line) {
        _logger.fine('Testing "$line" does not contain "$text"');
        return !line.contains(text);
      },
      timeout: timeout,
    );
    return expectNext(text, timeout: timeout);
  }

  InteractiveCommand skip({
    int lines = 1,
    Duration timeout = _defaultTimeout,
  }) {
    return _addTask('skip', timeout: timeout, () => _logs.take(lines));
  }

  InteractiveCommand skipWhere(
    String description,
    bool Function(String) test, {
    Duration timeout = _defaultTimeout,
  }) {
    final label = 'skipWhere $description';
    return _addTask(label, timeout: timeout, () async {
      await _logs.withTransaction((logs) async {
        while (await logs.hasNext) {
          _logger.fine('$label: Waiting for next line');
          final log = await logs.peek;
          final message = log.message;
          _logger.fine('$label: Got message: $message');
          if (test(message)) {
            _logger.fine('$label: Skipping line: "$log"');
            await logs.next;
            continue;
          }
          _logger.fine('$label: Found matching line: "$log"');
          return true;
        }
        fail('$label: Process closed without matching');
      });
    });
  }

  InteractiveCommand hotReload() {
    // SIGUSR1 is not supported on Windows.
    if (platform.isWindows) {
      return this;
    }
    return _addTask(
      'hotReload',
      () => check(_process.kill(ProcessSignal.sigusr1)).isTrue(),
    );
  }

  Future<void> run() async {
    _logger.fine('Running to completion');
    await flush().trace('run').whenComplete(() {
      _logger.fine('Killing process and draining logs');
      _process.kill();
      return _logs.rest.drain();
    });
    await _process.exitCode;
    _logger.fine('Flushing test logs');
    await [stdout.flush(), stderr.flush()].wait;
  }

  Future<void> expectSuccess() async {
    try {
      await flush().trace('expectSuccess');
      await check(_process.exitCode).completes((it) => it.equals(0));
    } finally {
      _process.kill();
      await _logs.cancel();
      await [stdout.flush(), stderr.flush()].wait;
    }
  }
}
