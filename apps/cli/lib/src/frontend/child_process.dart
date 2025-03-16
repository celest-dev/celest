import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/cli.dart';

/// A process which is a child of a command like `celest start`.
///
/// The parent command is responsible for managing the lifecycle of the child
/// process via this class.
final class ChildProcess {
  ChildProcess(this.command);

  /// The command to run as a child process.
  final List<String> command;
  Process? _process;

  /// Whether [start] has been called.
  bool get isStarted => _process != null;

  /// The process's exit code.
  Future<int> get exitCode {
    if (_process case final process?) {
      return process.exitCode;
    }
    throw StateError('Must call start first');
  }

  /// Starts the process and streams stdout/stderr to the console.
  Future<void> start({
    Map<String, String>? environment,
  }) async {
    if (_process != null) {
      return;
    }
    final process = _process = await processManager.start(
      command,
      environment: environment,
    );

    // Capture stdout/stderr
    final commandName = command.first;
    process.captureStdout(prefix: '[$commandName] ');
    process.captureStderr(prefix: '[$commandName] ');

    // TODO(dnys1): Handle stdin?
  }

  /// Kills the process with the given [signal] and waits for the process to
  /// exit.
  Future<void> stop([ProcessSignal signal = ProcessSignal.sigterm]) async {
    if (_process case final process?) {
      process.kill(signal);
      await process.exitCode;
    }
    _process = null;
  }
}
