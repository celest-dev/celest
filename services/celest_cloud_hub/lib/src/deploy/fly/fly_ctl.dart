import 'dart:async';
import 'dart:io';

import 'package:celest_cli/src/utils/process.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:process/process.dart';

/// A wrapper over the `flyctl` command line tool.
final class FlyCtl {
  FlyCtl({String? flyAuthToken})
    : _flyAuthToken = flyAuthToken ?? context.flyAuthToken;

  final String _flyAuthToken;

  static const ProcessManager _processManager = LocalProcessManager();
  static final Logger _logger = Logger('FlyCtl');

  Future<String> run(List<String> args, {String? workingDirectory}) async {
    final process = await _processManager.start(
      <String>['flyctl', ...args],
      workingDirectory: workingDirectory,
      environment: {'NO_COLOR': '1', 'FLY_API_TOKEN': _flyAuthToken},
    );
    final stdout = StringBuffer();
    final stderr = StringBuffer();
    process
      ..captureStdout(sink: _logger.finer)
      ..captureStdout(sink: stdout.writeln)
      ..captureStderr(sink: _logger.finer)
      ..captureStderr(sink: stderr.writeln);

    final exitCode = await process.exitCode;
    if (exitCode != 0) {
      final exception = ProcessException('flyctl', args, '$stderr', exitCode);
      _logger.severe('Failed to deploy', exception);
      throw GrpcError.internal('Failed to deploy app');
    }

    return stdout.toString();
  }

  Future<void> deploy({required String flyConfigJsonPath}) async {
    await run([
      'deploy',
      '--config',
      p.basename(flyConfigJsonPath),
      '--remote-only',
    ], workingDirectory: p.dirname(flyConfigJsonPath));
  }
}
