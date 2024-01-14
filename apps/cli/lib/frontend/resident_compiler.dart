import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';

final class ResidentCompiler {
  ResidentCompiler._(this.infoFile);

  static final Logger logger = Logger('ResidentCompiler');

  static String get _infoFilePath => p.join(
        projectPaths.celestConfig,
        'resident-compiler-info',
      );
  static String get _versionFilePath => p.join(
        projectPaths.celestConfig,
        'resident-compiler-version',
      );

  final File infoFile;

  static Future<ResidentCompiler?> ensureRunning() async {
    final infoFile = fileSystem.file(_infoFilePath);
    final versionFile = fileSystem.file(_versionFilePath);
    var running = false;
    Socket? socket;
    try {
      // Try to connect to the resident compiler server.
      final info = await infoFile.readAsString();
      final version = await versionFile.readAsString();
      final [address, port] =
          info.trim().split(' ').map((part) => part.split(':')[1]).toList();
      logger.finest('Connecting to resident compiler server at $address:$port');
      socket = await Socket.connect(address, int.parse(port));
      if (Version.parse(version) == Version.parse(Runtime.current.version)) {
        running = true;
      } else {
        logger.fine(
          'Resident compiler server version mismatch '
          '($version != ${Runtime.current.version}). '
          'Restarting resident compiler server...',
        );
        socket.writeln(jsonEncode({'command': 'shutdown'}));
        final response = jsonDecode(utf8.decode(await socket.first));
        switch (response) {
          case {'shutdown': true}:
            logger.finest('Resident compiler server shutdown.');
          case final unknownResponse:
            logger.finest(
              'Unknown response from resident compiler server: '
              '$unknownResponse',
            );
        }
      }
    } catch (_) {
      // The resident compiler server is not running but an info files exist.
      // Ensure the info files are deleted before restarting.
      try {
        await Future.wait([
          infoFile.delete(),
          versionFile.delete(),
        ]);
      } catch (_) {}
    } finally {
      await socket?.close();
    }
    if (running) {
      logger.finer('Resident compiler server already running.');
      return ResidentCompiler._(infoFile);
    }
    logger.fine('Starting resident compiler server...');
    final frontendServerProcess = await processManager.start(
      [
        Sdk.current.dartAotRuntime,
        Sdk.current.frontendServerAotSnapshot,
        '--resident-server-info-file=${infoFile.path}',
      ],
      mode: ProcessStartMode.detachedWithStdio,
    );
    // See: https://github.com/dart-lang/sdk/blob/f9ba7a91c6c3972f157b5916a8d09a3b0f3444f1/pkg/frontend_server/lib/src/resident_frontend_server.dart#L456-L476
    final serverOutput =
        String.fromCharCodes(await frontendServerProcess.stdout.first).trim();
    if (serverOutput.startsWith('Error')) {
      logger.fine(
        'Failed to start resident compiler server.',
        serverOutput,
      );
      return null;
    }
    await fileSystem
        .file(_versionFilePath)
        .writeAsString(Runtime.current.version.toString());
    return ResidentCompiler._(infoFile);
  }
}
