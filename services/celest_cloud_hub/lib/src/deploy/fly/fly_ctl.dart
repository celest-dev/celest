import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/utils/process.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_caveat.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:process/process.dart';

/// A wrapper over the `flyctl` command line tool.
final class FlyCtl {
  FlyCtl({String? flyAuthToken})
    : _flyAuthToken = flyAuthToken ?? context.flyAuthToken!;

  final String _flyAuthToken;

  static const ProcessManager _processManager = LocalProcessManager();
  static const FileSystem _fileSystem = LocalFileSystem();
  static final Logger _logger = Logger('FlyCtl');

  Future<String> run(
    List<String> args, {
    String? workingDirectory,
    bool log = true,
  }) async {
    final process = await _processManager.start(
      <String>['flyctl', ...args],
      workingDirectory: workingDirectory,
      environment: {'NO_COLOR': '1', 'FLY_API_TOKEN': _flyAuthToken},
    );
    final stdout = StringBuffer();
    final stderr = StringBuffer();
    if (log) {
      process
        ..captureStdout(sink: _logger.finer)
        ..captureStderr(sink: _logger.finer);
    }
    process
      ..captureStdout(sink: stdout.writeln)
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
      '--ha=false',
    ], workingDirectory: p.dirname(flyConfigJsonPath));
  }

  Future<({String bearerScheme, String token})> attenuateToken({
    required List<FlyCaveat> caveats,
  }) async {
    return _withTempDirectory((tempDir) async {
      final caveatsFile = tempDir.childFile('caveats.json');
      final caveatsJson = caveats.map((caveat) => caveat.toJson()).toList();
      await caveatsFile.writeAsString(jsonEncode(caveatsJson));
      final token = await run(
        ['tokens', 'attenuate', '--file', 'caveats.json'],
        workingDirectory: tempDir.path,
        log: false,
      );

      // Output is `FlyV1 <token>`
      return switch (token.split(' ')) {
        [final scheme, final token] => (
          bearerScheme: scheme,
          token: token.trim(),
        ),
        _ => () {
          _logger.severe('Failed to parse token: $token');
          throw GrpcError.internal('Failed to attenuate token');
        }(),
      };
    });
  }

  Future<List<Map<String, Object?>>> debugToken(String token) async {
    final output = await run(['tokens', 'debug', '-t', token], log: false);
    final caveats = jsonDecode(output.trim()) as List;
    return [
      for (final caveat in caveats.cast<Map<Object?, Object?>>())
        caveat.cast<String, Object?>(),
    ];
  }

  Future<R> _withTempDirectory<R>(Future<R> Function(Directory) action) async {
    final tempDir = _fileSystem.systemTempDirectory.createTempSync('hub_');
    try {
      return await action(tempDir);
    } finally {
      tempDir.delete(recursive: true).ignore();
    }
  }
}
