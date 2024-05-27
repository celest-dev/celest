import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';

final class ResidentCompiler {
  ResidentCompiler._(this.infoFile);

  static final Logger logger = Logger('ResidentCompiler');

  static String get infoFilePath {
    final infoFileDir = fileSystem.directory(
      p.join(
        projectPaths.celestConfig,
        Sdk.current.version.canonicalizedVersion,
      ),
    );
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
        final [address, port] =
            info.trim().split(' ').map((part) => part.split(':')[1]).toList();
        logger
            .finest('Connecting to resident compiler server at $address:$port');
        socket = await Socket.connect(address, int.parse(port));
        logger.finer('Resident compiler server already running.');
        return ResidentCompiler._(infoFile);
      } catch (_) {
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
    return ResidentCompiler._(infoFile);
  }
}
