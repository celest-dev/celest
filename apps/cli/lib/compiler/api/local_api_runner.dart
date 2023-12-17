import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/compiler/frontend_server_client.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_runtime_cloud/celest_runtime_cloud.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:vm_service/vm_service.dart';
import 'package:vm_service/vm_service_io.dart';

/// Like [EntrypointCompiler], this class runs Celest API functions as a local
/// server, watching for changes and hot-reloading when functions are changed.
final class LocalApiRunner implements Closeable {
  LocalApiRunner._({
    required this.path,
    required this.logger,
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

  final Logger logger;
  final bool verbose;
  final List<String> enabledExperiments;
  final String path;

  /// The port that the local API is running on.
  final int port;

  static Future<int> _findOpenPort() async {
    var port = defaultCelestPort;
    while (true) {
      try {
        final socket = await ServerSocket.bind(
          InternetAddress.anyIPv4,
          port,
        );
        await socket.close();
        return port;
      } on SocketException {
        port++;
      }
    }
  }

  final FrontendServerClient _client;
  final VmService _vmService;
  final String _vmIsolateId;
  final Process _localApiProcess;

  static Future<LocalApiRunner> start({
    required String path,
    required Logger logger,
    required bool verbose,
    required List<String> enabledExperiments,
    List<String> additionalSources = const [],
  }) async {
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
    logger.detail('Compiling local API...');

    final result = await client.compile();
    final dillOutput = client.expectOutput(result);

    final port = await _findOpenPort().timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        throw TimeoutException('Could not find an open port to run Celest.');
      },
    );
    logger.detail('Starting local API...');
    final localApiProcess = await Process.start(
      Sdk.current.dart,
      [
        // Start VM service on a random port.
        '--enable-vm-service=0',
        dillOutput,
      ],
      environment: {
        // The HTTP port to serve Celest on.
        'PORT': Platform.environment['PORT'] ?? '$port',
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
        logger.detail('Connecting to local API at: $observatoryUri');
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

    logger.detail('Waiting for local API to report VM URI...');
    final vmService = await vmServiceCompleter.future;

    final isolateId = await _waitForIsolate(vmService, logger);
    logger.detail('Connected to local API.');

    return LocalApiRunner._(
      path: path,
      logger: logger,
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
    logger.detail('VM started in ${stopwatch.elapsedMilliseconds}ms.');
    return isolates.single.id!;
  }

  Future<void> recompile(List<String> pathsToInvalidate) async {
    logger.detail('Recompiling local API...');
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
    logger.detail('Shutting down local API...');
    _client.kill();
    await _vmService.dispose();
    _localApiProcess.kill();
    logger.detail('Shut down local API.');
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
