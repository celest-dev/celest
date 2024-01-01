import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';

final class ResidentCompiler {
  ResidentCompiler._(this.infoFile);

  static final Logger logger = Logger('ResidentCompiler');

  static final _infoFilePath = p.join(
    projectPaths.celestConfig,
    'resident-compiler-info',
  );
  final File infoFile;

  static ResidentCompiler? start() {
    final infoFile = fileSystem.file(_infoFilePath);
    if (infoFile.existsSync()) {
      logger.finer('Resident compiler server already running.');
      return ResidentCompiler._(infoFile);
    }
    logger.fine('Starting resident compiler server...');
    final startResult = processManager.runSync([
      Sdk.current.dart,
      'compilation-server',
      'start',
      '--resident-server-info-file=${infoFile.path}',
    ]);
    if (startResult.exitCode != 0) {
      logger.fine(
        'Failed to start resident compiler server.',
        startResult.stderr.toString(),
        StackTrace.current,
      );
      return null;
    }
    return ResidentCompiler._(infoFile);
  }

  void stop() {
    logger.fine('Stopping resident compiler server...');
    try {
      final stopResult = processManager.runSync([
        Sdk.current.dart,
        'compilation-server',
        'shutdown',
        '--resident-server-info-file=${infoFile.path}',
      ]);
      if (stopResult.exitCode != 0) {
        logger.fine(
          'Failed to stop resident compiler server.',
          stopResult.stderr.toString(),
          StackTrace.current,
        );
      }
    } finally {
      final infoFileExists = infoFile.existsSync();
      logger.finest('Deleting info file. Exists: $infoFileExists');
      if (infoFileExists) {
        infoFile.deleteSync();
      }
    }
  }
}
