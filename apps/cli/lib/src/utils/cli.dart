import 'dart:convert';
import 'dart:io' as io;

import 'package:async/async.dart';

typedef ProcessSink = void Function(String);

/// Allows storing forwarding streams so we can listen to process outputs
/// multiple times.
final _stdoutStreams = Expando<StreamSplitter<List<int>>>();
final _stderrStreams = Expando<StreamSplitter<List<int>>>();

/// Helpers on [Process].
extension ProcessUtil on io.Process {
  static void _printToStdout(String message) => io.stdout.writeln(message);
  static void _printToStderr(String message) => io.stderr.writeln(message);

  /// Returns a [Stream] of the `stdout` of this process, which can be listened
  /// to multiple times.
  Stream<List<int>> get stdout =>
      (_stdoutStreams[this] ??= StreamSplitter(this.stdout)).split();

  /// Returns a [Stream] of the `stderr` of this process, which can be listened
  /// to multiple times.
  Stream<List<int>> get stderr =>
      (_stderrStreams[this] ??= StreamSplitter(this.stderr)).split();

  /// Captures `stdout` to the provided sink, the global [stdout] by default.
  void captureStdout({ProcessSink sink = _printToStdout, String prefix = ''}) {
    stdout
        .transform(const Utf8Decoder())
        .transform(const LineSplitter())
        .listen((line) => sink('$prefix$line'));
  }

  /// Captures `stderr` to the provided sink, the global [stderr] by default.
  void captureStderr({ProcessSink sink = _printToStderr, String prefix = ''}) {
    stderr
        .transform(const Utf8Decoder())
        .transform(const LineSplitter())
        .listen((line) => sink('$prefix$line'));
  }
}
