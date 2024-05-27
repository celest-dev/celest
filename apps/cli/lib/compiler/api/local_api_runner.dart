import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/compiler/frontend_server_client.dart';
import 'package:celest_cli/compiler/package_config_transform.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/port_finder.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:vm_service/vm_service.dart';

final Logger _logger = Logger('LocalApiRunner');

/// Like [EntrypointCompiler], this class runs Celest API functions as a local
/// server, watching for changes and hot-reloading when functions are changed.
final class LocalApiRunner implements Closeable {
  LocalApiRunner._({
    required this.path,
    required this.verbose,
    required this.port,
    required FrontendServerClient client,
    required Process localApiProcess,
  })  : _client = client,
        _localApiProcess = localApiProcess;

  final bool verbose;
  final String path;

  /// The port that the local API is running on.
  final int port;

  final FrontendServerClient _client;
  final Process _localApiProcess;
  VmService? _vmService;
  late final String _vmIsolateId;

  late final StreamSubscription<String> _stdoutSub;
  late final StreamSubscription<String> _stderrSub;

  static Future<LocalApiRunner> start({
    required String path,
    required Iterable<String> envVars,
    required bool verbose,
    List<String> additionalSources = const [],
    int? port,
    @visibleForTesting Duration? vmServiceTimeout,
    @visibleForTesting StringSink? stdoutPipe,
    @visibleForTesting StringSink? stderrPipe,
    // Local API should use random port since it's being proxied by the user
    // hub and is never exposed to the user.
    @visibleForTesting PortFinder portFinder = const RandomPortFinder(),
  }) async {
    final env = <String, String>{};
    for (final envVar in envVars) {
      final value = Platform.environment[envVar] ??
          await celestProject.envManager.valueFor(envVar);
      if (value == null) {
        throw StateError('Missing value for environment variable: $envVar');
      }
      env[envVar] = value;
    }
    final packageConfigPath = await transformPackageConfig(
      packageConfigPath: projectPaths.packagesConfig,
      fromRoot: projectPaths.projectRoot,
      toRoot: projectPaths.outputsDir,
    );
    final (target, platformDill, sdkRoot) = switch (Sdk.current.sdkType) {
      SdkType.flutter => (
          'flutter',
          Sdk.current.flutterPlatformDill!,
          Sdk.current.flutterPatchedSdk!
        ),
      SdkType.dart => ('vm', Sdk.current.vmPlatformDill, Sdk.current.sdkPath),
    };

    // Create initial kernel file so that it links the platform
    //
    // FE server doesn't want to link the platform ever, but we need it for
    // the initial compilation so that `dart run` can work.
    //
    // Incremental compilations do not the need the platform since it will be
    // loaded into memory already.
    final outputDill = p.setExtension(path, '.dill');
    final genKernelRes = await processManager.run(
      <String>[
        Sdk.current.dartAotRuntime,
        Sdk.current.genKernelAotSnapshot,
        '--no-aot',
        '--no-support-mirrors',
        '--target',
        target,
        '--link-platform',
        '--platform',
        platformDill,
        '--output',
        outputDill,
        '--packages',
        packageConfigPath,
        path,
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
      workingDirectory: projectPaths.outputsDir,
    );
    if (genKernelRes.exitCode != 0) {
      throw CompilationException(
        'Error generating initial kernel file: '
        '${genKernelRes.stdout}\n'
        '${genKernelRes.stderr}',
      );
    }

    final client = await FrontendServerClient.start(
      path, // entrypoint
      outputDill, // outputDillPath
      platformDill, // platformKernel
      workingDirectory: projectPaths.outputsDir,
      target: target,
      verbose: verbose,
      sdkRoot: sdkRoot,
      enabledExperiments: celestProject.analysisOptions.enabledExperiments,
      frontendServerPath: Sdk.current.frontendServerAotSnapshot,
      // additionalSources: additionalSources,
      additionalArgs: [
        '--no-support-mirrors', // Since it won't be supported in the cloud.
        // TODO(dnys1): Would this help? It wants exclusive control over the info file...
        // '--resident-info-file-name=${residentCompiler.infoFile.path}',
        // TODO(dnys1): Re-enable with tests
        // '--incremental-serialization', // Faster hot reload.
      ],
    );
    _logger.fine('Compiling local API...');

    port = await portFinder.checkOrUpdatePort(port);
    _logger.finer('Starting local API on port $port...');
    final localApiProcess = await processManager.start(
      [
        Sdk.current.dart,
        'run',
        '--enable-vm-service=0', // Start VM service on a random port.
        '--no-dds', // We want to talk directly to VM service.
        '--pause-isolates-on-start',
        '--warn-on-pause-with-no-debugger',
        '--enable-asserts',
        '--packages',
        packageConfigPath,
        outputDill,
      ],
      workingDirectory: projectPaths.outputsDir,
      environment: {
        // The HTTP port to serve Celest on.
        'PORT': platform.environment['PORT'] ?? '$port',
        ...env,
      },
    );

    final runner = LocalApiRunner._(
      path: path,
      verbose: verbose,
      port: port,
      client: client,
      localApiProcess: localApiProcess,
    );
    await runner._init(
      stdoutPipe: stdoutPipe,
      stderrPipe: stderrPipe,
      vmServiceTimeout: vmServiceTimeout,
    );
    return runner;
  }

  static final _vmServicePattern =
      RegExp(r'The Dart VM service is listening on ([^\s]+)');

  static final _warnOnNoDebuggerPattern =
      RegExp(r'Connect to the Dart VM service at ([^\s]+) to debug.');

  /// Waits for the main Isolate to be available, resume it, then return its ID.
  static Future<String> _waitForIsolatesAndResume(
    VmService vmService,
    Logger logger,
  ) async {
    var vm = await vmService.getVM();
    var isolates = vm.isolates;
    final stopwatch = Stopwatch()..start();
    const timeout = Duration(seconds: 10);
    _logger.finest('Waiting for VM service to report isolates...');
    while (isolates == null || isolates.isEmpty) {
      if (stopwatch.elapsed > timeout) {
        throw TimeoutException('Timed out waiting for VM to start.');
      }
      await Future<void>.delayed(const Duration(milliseconds: 50));
      vm = await vmService.getVM();
      isolates = vm.isolates;
    }
    stopwatch.stop();
    logger.finest(
      'VM started in ${stopwatch.elapsedMilliseconds}ms. '
      'Isolates: $isolates',
    );
    var isolateRef = isolates
        .firstWhereOrNull((isolate) => isolate.isSystemIsolate ?? false);
    isolateRef ??= isolates.singleOrNull;
    if (isolateRef == null) {
      throw StateError('Could not determine main isolate ID.');
    }
    _logger.finest('Resuming isolates...');
    // TODO(dnys1): Test resuming multiple isolates.
    await Future.wait([
      for (final isolate in isolates) _resumeIsolate(vmService, isolate.id!),
    ]);
    _logger.finest('All isolates resumed');
    return isolateRef.id!;
  }

  static Future<void> _resumeIsolate(
    VmService vmService,
    String isolateId,
  ) async {
    _logger.finest('[Isolate $isolateId] Waiting for pause on start event...');
    var isolate = await vmService.getIsolate(isolateId);
    while (isolate.pauseEvent?.kind != EventKind.kPauseStart) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      isolate = await vmService.getIsolate(isolateId);
    }

    // Only needed if `--observe` is used.
    // Disable pause-on-exit and pause-on-unhandled-exceptions.
    //
    // This must be done here instead of as a flag since the VM service just
    // exits immediately for some reason.
    // _logger.finest('[Isolate $isolateId] Disabling pause on exit/exception...');
    // await vmService.setIsolatePauseMode(
    //   isolateId,
    //   exceptionPauseMode: 'None',
    //   shouldPauseOnExit: false,
    // );

    _logger.finest('[Isolate $isolateId] Resuming isolate...');
    await vmService.resume(isolateId);
  }

  Future<void> _init({
    StringSink? stdoutPipe,
    StringSink? stderrPipe,
    Duration? vmServiceTimeout,
  }) async {
    stdoutPipe ??= stdout;
    stderrPipe ??= stderr;

    final vmServiceCompleter = Completer<VmService>();
    void completeVmService(String rawObservatoryUrl) {
      final observatoryUri =
          '${rawObservatoryUrl.replaceFirst('http', 'ws')}ws';
      _logger.finer('Connecting to local API at: $observatoryUri');
      vmServiceCompleter.complete(
        _vmServiceConnectUri(observatoryUri),
      );
    }

    final serverStartedCompleter = Completer<void>();
    _stdoutSub = _localApiProcess.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      _logger.finest('[stdout] $line');
      if (!vmServiceCompleter.isCompleted) {
        final vmServiceInfo = _vmServicePattern.firstMatch(line)?.group(1);
        if (vmServiceInfo != null) {
          return completeVmService(vmServiceInfo);
        }
      }
      if (line.startsWith('The Dart') || line.startsWith('vm-service')) {
        // Ignore
      } else if (line.startsWith('Serving on')) {
        if (!serverStartedCompleter.isCompleted) {
          serverStartedCompleter.complete();
        }
      } else if (line.startsWith('/')) {
        analytics.capture(
          'local_api_call',
          properties: {
            'route': line,
          },
        );
      } else {
        stdoutPipe!.writeln(line);
      }
    });
    _stderrSub = _localApiProcess.stderr
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      _logger.finest('[stderr] $line');
      if (!vmServiceCompleter.isCompleted) {
        final vmServiceInfo =
            _warnOnNoDebuggerPattern.firstMatch(line)?.group(1);
        if (vmServiceInfo != null) {
          return completeVmService(vmServiceInfo);
        }
      }
      if (line.startsWith('vm-service')) {
        // Ignore
      } else {
        stderrPipe!.writeln(line);
      }
    });

    try {
      vmServiceTimeout ??= const Duration(seconds: 10);
      _logger.finer('Waiting for local API to report VM URI...');
      var vmService = vmServiceCompleter.future;
      if (vmServiceTimeout > Duration.zero) {
        vmService = vmService.timeout(
          vmServiceTimeout,
          onTimeout: () {
            throw TimeoutException(
              'Could not connect to local API VM service.',
              vmServiceTimeout,
            );
          },
        );
      }
      _vmService = await vmService;
      _vmIsolateId = await _waitForIsolatesAndResume(_vmService!, _logger);

      await serverStartedCompleter.future;
      _logger.fine('Connected to local API.');
    } on Object catch (e, st) {
      _logger.finer('Failure starting local API runner', e, st);
      rethrow;
    }
  }

  Future<void> hotReload(List<String> pathsToInvalidate) async {
    _logger.fine('Hot reloading local API...');
    final result = await _client.compile([
      for (final path in pathsToInvalidate) p.toUri(path),
    ]);
    final dillOutput = _client.expectOutput(result);
    await _vmService!.reloadSources(
      _vmIsolateId,
      rootLibUri: dillOutput,
    );
  }

  @override
  Future<void> close() async {
    _logger.finer('Shutting down local API...');
    if (!await Future(() => _client.closed)) {
      _client.kill();
    }
    _logger.finest('Killing local process');
    _localApiProcess.kill();
    await Future.wait([
      _stdoutSub.cancel().then((_) => _logger.finest('Stdout closed')),
      _stderrSub.cancel().then((_) => _logger.finest('Stderr closed')),
      _localApiProcess.exitCode
          .then((exitCode) => _logger.finest('Exit code: $exitCode')),
      Future.value(_vmService?.onDone)
          .then((_) => _logger.finest('VM service done')),
    ]);
    _logger.finer('Shut down local API.');
  }
}

final class CompilationException implements Exception {
  CompilationException(this.message);

  final String message;

  @override
  String toString() => message;
}

extension on FrontendServerClient {
  String expectOutput(CompileResult result) {
    _logger.finest('Compile result:\n${result.debugResult}');
    switch (result) {
      case CompileResult(errorCount: > 0, :final compilerOutputLines):
        throw CompilationException(
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

extension on CompileResult {
  String get debugResult {
    final buffer = StringBuffer()
      ..writeln('dillOutput: $dillOutput')
      ..writeln('Error count: $errorCount')
      ..writeln('Compiler output:');
    for (final line in compilerOutputLines) {
      buffer.writeln('  $line');
    }
    buffer.writeln('New sources:');
    for (final source in newSources) {
      buffer.writeln('  $source');
    }
    buffer.writeln('Removed sources:');
    for (final source in removedSources) {
      buffer.writeln('  $source');
    }
    return buffer.toString();
  }
}

/// Copied from `package:vm_service/vm_service_io.dart` to provide better
/// logging and debugging support.
Future<VmService> _vmServiceConnectUri(String wsUri) async {
  final socket = await WebSocket.connect(wsUri);
  final controller = StreamController<dynamic>();
  final streamClosedCompleter = Completer<void>();

  socket.listen(
    (data) {
      controller.add(data);
      _logger.finest('VM service WS data: $data');
    },
    onError: (Object error, StackTrace stackTrace) {
      _logger.finest('VM service WS error', error, stackTrace);
    },
    cancelOnError: true,
    onDone: () {
      _logger.finest('VM service WS closed');
      streamClosedCompleter.complete();
      controller.close();
    },
  );

  return VmService.defaultFactory(
    inStream: controller.stream,
    writeMessage: socket.add,
    log: VmServiceLogs(),
    disposeHandler: socket.close,
    streamClosed: streamClosedCompleter.future,
    wsUri: wsUri,
  );
}

final class VmServiceLogs implements Log {
  @override
  void severe(String message) {
    _logger.finest('[vm-service] SEVERE: $message');
  }

  @override
  void warning(String message) {
    _logger.finest('[vm-service] WARNING: $message');
  }
}
