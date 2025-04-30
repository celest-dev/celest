import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/process.dart';

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
  ///
  /// If [environment] is not null, it is passed to [Process.start].
  ///
  /// If [dartDefines] are specified and the [command] is a `dart` or `flutter`
  /// command, then the given values are passed to the command via the respective
  /// flag.
  Future<void> start({
    Map<String, String>? environment,
    Map<String, String>? dartDefines,
  }) async {
    if (_process != null) {
      return;
    }

    var command = this.command;
    if (dartDefines != null) {
      switch (command.first) {
        case 'dart':
          command = [
            'dart',
            for (final MapEntry(:key, :value) in dartDefines.entries)
              '-D$key=$value',
            ...command.sublist(1),
          ];
        case 'flutter':
          command = [
            ...command,
            for (final MapEntry(:key, :value) in dartDefines.entries)
              '--dart-define=$key=$value'
          ];
      }
    }

    final process = _process = await processManager.start(
      command,
      environment: environment,
    );

    // Capture stdout/stderr
    final commandName = command.first;
    process.captureStdout(
      sink: cliLogger.writeln,
      prefix: '[$commandName] ',
    );
    process.captureStderr(
      sink: cliLogger.writeln,
      prefix: '[$commandName] ',
    );

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
