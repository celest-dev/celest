import 'dart:async';
import 'dart:io';

import 'package:celest_cli/src/exceptions.dart';

/// {@template celest.cli.stop_signal}
/// Signals that a `SIGINT` or `SIGTERM` event has fired and the CLI needs to
/// shutdown.
/// {@endtemplate}
extension type StopSignal._(Completer<ProcessSignal> _it) {
  factory StopSignal() => StopSignal._(Completer<ProcessSignal>.sync());

  Future<ProcessSignal> get future => _it.future;

  void complete(ProcessSignal signal) => _it.complete(signal);

  /// Whether a SIGINT or SIGTERM signal has been received and the frontend
  /// is no longer operational.
  bool get isStopped => _it.isCompleted;

  /// Checks if the signal has been received and throws a [CancellationException]
  /// if it has.
  void check() {
    if (isStopped) {
      throw const CancellationException('Celest was interrupted');
    }
  }
}
