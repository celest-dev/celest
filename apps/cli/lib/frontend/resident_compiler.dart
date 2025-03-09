import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/utils/cli.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';

final class ResidentCompiler {
  ResidentCompiler._(this.infoFile);

  static final Logger logger = Logger('ResidentCompiler');

  static String get infoFilePath {
    final infoFileDir = fileSystem.directory(projectPaths.projectCacheDir);
    infoFileDir.createSync(recursive: true);
    return infoFileDir.childFile('resident-compiler-info').path;
  }

  final File infoFile;

  static Future<ResidentCompiler?> ensureRunning() async {
    final infoFile = fileSystem.file(infoFilePath);
    Socket? socket;
    if (infoFile.existsSync()) {
      try {
        // Try to connect to the resident compiler server.
        final info = await infoFile.readAsString();
        final {'address': address, 'port': port} = Map.fromEntries(
          info.trim().split(' ').map((part) {
            final [key, value] = part.split(':');
            return MapEntry(key, value);
          }),
        );
        logger.finest(
          'Connecting to resident compiler server at $address:$port',
        );
        socket = await Socket.connect(address, int.parse(port));
        logger.finer('Resident compiler server already running.');
        return ResidentCompiler._(infoFile);
      } catch (e) {
        logger.finest('Unable to connect to resident compiler server.', e);
        // The resident compiler server is not running but an info files exist.
        // Ensure the info files are deleted before restarting.
        try {
          await infoFile.delete();
        } catch (_) {}
      } finally {
        await socket?.close();
      }
    }
    logger.fine('Starting resident compiler server...');
    final frontendServerProcess = await processManager.start([
      Sdk.current.dart,
      'compilation-server',
      'start',
      '--resident-compiler-info-file=${infoFile.path}',
    ]);
    frontendServerProcess.captureStdout(
      sink: logger.finest,
      prefix: '[stdout] ',
    );
    frontendServerProcess.captureStderr(
      sink: logger.finest,
      prefix: '[stderr] ',
    );
    if (await frontendServerProcess.exitCode != 0) {
      logger.finest('Failed to start resident compiler server.');
      return null;
    }
    return ResidentCompiler._(infoFile);
  }
}
