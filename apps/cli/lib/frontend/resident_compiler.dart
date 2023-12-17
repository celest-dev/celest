import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:process/process.dart';

final class ResidentCompiler {
  ResidentCompiler._(
    this.infoFile, {
    required Logger logger,
    required ProcessManager processManager,
  })  : _logger = logger,
        _processManager = processManager;

  final ProcessManager _processManager;
  final Logger _logger;

  static final _infoFilePath = p.join(
    projectPaths.celestConfig,
    'resident-compiler-info',
  );
  final File infoFile;

  static ResidentCompiler? start({
    ProcessManager processManager = const LocalProcessManager(),
    FileSystem fileSystem = const LocalFileSystem(),
    required Logger logger,
  }) {
    final infoFile = fileSystem.file(_infoFilePath);
    if (infoFile.existsSync()) {
      logger.detail('Resident compiler server already running.');
      return ResidentCompiler._(
        infoFile,
        logger: logger,
        processManager: processManager,
      );
    }
    logger.detail('Starting resident compiler server...');
    final startResult = processManager.runSync([
      Sdk.current.dart,
      'compilation-server',
      'start',
      '--resident-server-info-file=${infoFile.path}',
    ]);
    if (startResult.exitCode != 0) {
      logger.err('Failed to start resident compiler server.');
      logger.err(startResult.stderr.toString());
      return null;
    }
    return ResidentCompiler._(
      infoFile,
      logger: logger,
      processManager: processManager,
    );
  }

  Future<void> stop() async {
    _logger.detail('Stopping resident compiler server...');
    try {
      final stopResult = await _processManager.run([
        Sdk.current.dart,
        'compilation-server',
        'shutdown',
        '--resident-server-info-file=${infoFile.path}',
      ]);
      if (stopResult.exitCode != 0) {
        _logger.err('Failed to stop resident compiler server.');
        _logger.err(stopResult.stderr.toString());
      }
    } finally {
      if (infoFile.existsSync()) {
        infoFile.deleteSync();
      }
    }
  }
}
