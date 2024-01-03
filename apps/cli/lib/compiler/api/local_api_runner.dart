import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/compiler/frontend_server_client.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/port.dart';
import 'package:logging/logging.dart';
import 'package:vm_service/vm_service.dart';
import 'package:vm_service/vm_service_io.dart';

/// Like [EntrypointCompiler], this class runs Celest API functions as a local
/// server, watching for changes and hot-reloading when functions are changed.
final class LocalApiRunner implements Closeable {
  LocalApiRunner._({
    required this.path,
    required this.verbose,
    required this.enabledExperiments,
    required this.port,
    required FrontendServerClient client,
    required VmService vmService,
    required String vmIsolateId,
    required Process localApiProcess,
  })  : _client = client,
        _vmService = vmService,
        _vmIsolateId = vmIsolateId,
        _localApiProcess = localApiProcess;

  static final Logger logger = Logger('LocalApiRunner');
  final bool verbose;
  final List<String> enabledExperiments;
  final String path;

  /// The port that the local API is running on.
  final int port;

  final FrontendServerClient _client;
  final VmService _vmService;
  final String _vmIsolateId;
  final Process _localApiProcess;

  static Future<LocalApiRunner> start({
    required String path,
    required Iterable<String> envVars,
    required bool verbose,
    required List<String> enabledExperiments,
    List<String> additionalSources = const [],
  }) async {
    final env = <String, String>{};
    for (final envVar in envVars) {
      final value =
          Platform.environment[envVar] ?? projectPaths.envManager.get(envVar);
      if (value == null) {
        throw StateError('Missing value for environment variable: $envVar');
      }
      env[envVar] = value;
    }
    final client = await FrontendServerClient.start(
      'org-dartlang-root://$path', // entrypoint
      path.replaceFirst(RegExp(r'.dart$'), '.dill'), // dill
      Sdk.current.vmPlatformDill,
      target: 'vm',
      verbose: verbose,
      fileSystemRoots: ['/'],
      fileSystemScheme: 'org-dartlang-root',
      enabledExperiments: enabledExperiments,
      frontendServerPath: Sdk.current.frontendServerAotSnapshot,
      additionalSources: additionalSources,
      additionalArgs: [
        '--no-support-mirrors', // Since it won't be supported in the cloud.
      ],
    );
    logger.fine('Compiling local API...');

    final result = await client.compile();
    final dillOutput = client.expectOutput(result);

    final port = await findOpenPort();
    logger.finer('Starting local API...');
    final localApiProcess = await Process.start(
      Sdk.current.dart,
      [
        // Start VM service on a random port.
        '--enable-vm-service=0',
        dillOutput,
      ],
      workingDirectory: projectPaths.projectRoot,
      environment: {
        // The HTTP port to serve Celest on.
        'PORT': Platform.environment['PORT'] ?? '$port',
        ...env,
      },
    );

    final vmServiceCompleter = Completer<VmService>();
    localApiProcess.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      if (line.startsWith(
        'The Dart DevTools debugger and profiler is available at:',
      )) {
        final observatoryUri =
            '${line.split(' ').last.replaceFirst('http', 'ws')}ws';
        logger.finer('Connecting to local API at: $observatoryUri');
        vmServiceCompleter.complete(vmServiceConnectUri(observatoryUri));
      } else if (line.startsWith('The Dart VM service is listening on')) {
        // Ignore
      } else {
        // TODO: Make API/function specific.
        stdout.writeln('APP -> $line');
      }
    });
    localApiProcess.stderr
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      // TODO: Make API/function specific.
      stderr.writeln('APP -> $line');
    });

    logger.finer('Waiting for local API to report VM URI...');
    final vmService = await vmServiceCompleter.future;

    final isolateId = await _waitForIsolate(vmService, logger);
    logger.fine('Connected to local API.');

    return LocalApiRunner._(
      path: path,
      verbose: verbose,
      enabledExperiments: enabledExperiments,
      port: port,
      client: client,
      vmService: vmService,
      vmIsolateId: isolateId,
      localApiProcess: localApiProcess,
    );
  }

  /// Waits for the main Isolate to be available then returns its ID.
  static Future<String> _waitForIsolate(
    VmService vmService,
    Logger logger,
  ) async {
    var vm = await vmService.getVM();
    var isolates = vm.isolates;
    final stopwatch = Stopwatch()..start();
    const timeout = Duration(seconds: 5);
    while (isolates == null || isolates.isEmpty) {
      if (stopwatch.elapsed > timeout) {
        throw TimeoutException('Timed out waiting for VM to start.');
      }
      await Future<void>.delayed(const Duration(milliseconds: 100));
      vm = await vmService.getVM();
      isolates = vm.isolates;
    }
    stopwatch.stop();
    logger.finest('VM started in ${stopwatch.elapsedMilliseconds}ms.');
    return isolates.single.id!;
  }

  Future<void> hotReload(List<String> pathsToInvalidate) async {
    logger.fine('Hot reloading local API...');
    final result = await _client.compile([
      for (final path in pathsToInvalidate)
        Uri.parse('org-dartlang-root://$path'),
    ]);
    final dillOutput = _client.expectOutput(result);
    await _vmService.reloadSources(
      _vmIsolateId,
      rootLibUri: dillOutput,
    );
  }

  @override
  Future<void> close() async {
    logger.finer('Shutting down local API...');
    _client.kill();
    await _vmService.dispose();
    _localApiProcess.kill();
    logger.finer('Shut down local API.');
  }
}

extension on FrontendServerClient {
  String expectOutput(CompileResult result) {
    switch (result) {
      case CompileResult(errorCount: > 0, :final compilerOutputLines):
        throw StateError(
          'Error compiling local API: ${compilerOutputLines.join('\n')}',
        );
      case CompileResult(:final dillOutput?):
        accept();
        return dillOutput;
      default:
        // `dillOutput` should never be null (see its docs).
        unreachable('An unknown error occurred compiling local API.');
    }
  }
}
