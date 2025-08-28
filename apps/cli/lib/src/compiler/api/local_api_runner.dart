import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/compiler/frontend_server_client.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/process/port_finder.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/json.dart';
import 'package:celest_cli/src/utils/process.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:vm_service/vm_service.dart';

final Logger _logger = Logger('LocalApiRunner');

/// Like [EntrypointCompiler], this class runs Celest API functions as a local
/// server, watching for changes and hot-reloading when functions are changed.
final class LocalApiRunner {
  LocalApiRunner._({
    required this.path,
    required this.verbose,
    required this.port,
    required FrontendServerClient client,
    required Process localApiProcess,
  }) : _client = client,
       _localApiProcess = localApiProcess;

  final bool verbose;
  final String path;

  /// The port that the local API is running on.
  final int port;

  final FrontendServerClient _client;
  final Process _localApiProcess;
  VmService? _vmService;
  late final String _vmIsolateId;

  /// The WebSocket URI of the running Celest server.
  String get wsUri => _vmService!.wsUri!;

  late final StreamSubscription<String> _stdoutSub;
  late final StreamSubscription<String> _stderrSub;

  static Future<LocalApiRunner> start({
    required ast.ResolvedProject resolvedProject,
    required String path,
    required String environmentId,
    required Map<String, String> configValues,
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
    final (target, platformDill, sdkRoot) = switch (resolvedProject
        .sdkConfig
        .targetSdk) {
      SdkType.flutter => (
        'flutter',
        Sdk.current.flutterPlatformDill!,
        Sdk.current.flutterPatchedSdk!,
      ),
      SdkType.dart => (
        'vm',
        Sdk.current.vmPlatformDill,
        p.join(Sdk.current.sdkPath, 'lib', '_internal'),
      ),
      final unknown => unreachable('Unknown SDK type: $unknown'),
    };

    // Create initial kernel file so that it links the platform
    //
    // Incremental compilations do not the need the platform since it will be
    // loaded into memory already.
    var outputDill = p.setExtension(path, '.dill');

    var outputDillFile = fileSystem.file(outputDill);
    var index = 0;
    while (outputDillFile.existsSync()) {
      try {
        await outputDillFile.delete();
      } on Object {
        // Windows gets fussy about deleting files sometimes.
        // Just use a different name.
        outputDill = p.setExtension('$path.${index++}', '.dill');
        outputDillFile = fileSystem.file(outputDill);
      }
    }

    // // Copy SQLite3 to the output directory on Windows.
    // if (platform.isWindows) {
    //   final sqlite3Out = fileSystem
    //       .directory(p.dirname(path))
    //       .childFile('sqlite3.dll');
    //   if (!sqlite3Out.existsSync()) {
    //     final cachedSqlite3 = celestProject.config.configDir.childFile(
    //       'sqlite3.dll',
    //     );
    //     await cachedSqlite3.copy(sqlite3Out.path);
    //   }
    // }

    // NOTE: FE server requires file: URIs for *some* paths on Windows.
    final genKernelRes = await processManager.start(<String>[
      Sdk.current.dartAotRuntime,
      Sdk.current.frontendServerAotSnapshot,
      '--sdk-root',
      sdkRoot, // Must be path
      '--platform',
      Uri.file(platformDill).toString(), // Must be URI
      '--link-platform',
      '--target',
      target,
      '--packages',
      Uri.file(projectPaths.packagesConfig).toString(),
      '--filesystem-root=${projectPaths.projectRoot}',
      '--filesystem-scheme=celest',
      '--output-dill',
      outputDill, // Must be path
      _projectFsUri(path).toString(),
    ], workingDirectory: projectPaths.outputsDir);
    final genKernelLogs = StringBuffer();
    genKernelRes.captureStdout(
      sink: genKernelLogs.writeln,
      prefix: '[stdout] ',
    );
    genKernelRes.captureStderr(
      sink: genKernelLogs.writeln,
      prefix: '[stderr] ',
    );
    if (await genKernelRes.exitCode != 0) {
      _logger.finer('Error generating initial kernel file:\n$genKernelLogs');
      throw CompilationException('Error generating initial kernel file');
    }

    // This is so confusing but it seems to work.
    //
    // To enable incremental compilation, we need to pass the output dill file
    // as the incremental output dill file. If we set it the other way around
    // Windows will complain about the file being in use.
    final incrementalOutputDill = p.setExtension(
      outputDill,
      '.incremental.dill',
    ); // Must be path
    final client = await FrontendServerClient.start(
      entrypoint: _projectFsUri(path).toString(), // must be URI
      outputDillPath: incrementalOutputDill, // must be path
      platformKernel: Uri.file(platformDill).toString(), // must be URI
      incrementalOutputDill: outputDill,
      fileSystemRoots: [projectPaths.projectRoot],
      fileSystemScheme: 'celest',
      workingDirectory: projectPaths.projectRoot,
      target: target,
      verbose: verbose,
      sdkRoot: sdkRoot,
      enabledExperiments: celestProject.analysisOptions.enabledExperiments,
      frontendServerPath: Sdk.current.frontendServerAotSnapshot,
      // additionalSources: additionalSources,
      additionalArgs: [
        '--no-support-mirrors', // Since it won't be supported in the cloud.
        '--incremental-serialization', // Faster hot reload.
      ],
    );
    _logger.fine('Compiling local API...');

    final flutterCacheDir = await fileSystem.systemTempDirectory.createTemp(
      'celest_',
    );

    // Give the VM service a deterministic port, since allowing it to find one
    // can lead to a race condition with our random port finder picking the same
    // port.
    //
    // When we check the port below, it's valid because the VM service is not
    // started yet, but later the API fails because it picked the same port.
    final vmServicePort = await const RandomPortFinder()
    // If we've specified a port, though, that must be reserved for us to
    // use, so start the search from the next port.
    .findOpenPort(port == null ? null : port + 1);
    final command = switch (resolvedProject.sdkConfig.targetSdk) {
      SdkType.dart => <String>[
        Sdk.current.dart,
        'run',
        '--enable-vm-service=$vmServicePort', // Start VM service
        '--no-dds', // We want to talk directly to VM service.
        '--enable-asserts',
        // TODO(dnys1): VM service reports error with this flag
        // '--packages',
        // projectPaths.packagesConfig,
        outputDill,
      ],
      SdkType.flutter => <String>[
        Sdk.current.flutterTester,
        '--non-interactive',
        '--vm-service-port=$vmServicePort',
        '--run-forever',
        '--icu-data-file-path='
            '${p.join(Sdk.current.flutterOsArtifacts, 'icudtl.dat')}',
        '--packages=${projectPaths.packagesConfig}',
        '--log-tag=_CELEST',
        if (verbose) '--verbose-logging',
        '--enable-platform-isolates',
        '--force-multithreading',
        '--cache-dir-path=${flutterCacheDir.absolute.path}',
        // '--enable-impeller',
        outputDill,
      ],
      final unknown => unreachable('Unknown SDK type: $unknown'),
    };

    port = await portFinder.checkOrUpdatePort(port, excluding: [vmServicePort]);
    _logger.finer('Starting local API on port $port...');
    final celestConfig = prettyPrintJson(
      resolvedProject.toProto().toProto3Json(),
    );
    await fileSystem
        .directory(projectPaths.outputsDir)
        .childFile('celest.json')
        .writeAsString(celestConfig);
    final localApiProcess = await processManager.start(
      command,
      workingDirectory: projectPaths.outputsDir,
      environment: {
        ...configValues,
        // The HTTP port to serve Celest on.
        'PORT': platform.environment['PORT'] ?? '$port',
        'CELEST_ENVIRONMENT': environmentId,
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

  /// The virtual FS URI for the project [path].
  static Uri _projectFsUri(String path) {
    final relativePath = p.relative(path, from: projectPaths.projectRoot);
    final rootPrefix = platform.isWindows ? r'\' : '/';
    return Uri(scheme: 'celest', path: '$rootPrefix$relativePath');
  }

  static final _vmServicePattern = RegExp(
    r'The Dart VM service is listening on ([^\s]+)',
  );

  static final _warnOnNoDebuggerPattern = RegExp(
    r'Connect to the Dart VM service at ([^\s]+) to debug.',
  );

  /// Waits for the main Isolate to be available, resume it, then return its ID.
  static Future<String> _waitForIsolatesAndResume(VmService vmService) async {
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
    _logger.finest(
      'VM started in ${stopwatch.elapsedMilliseconds}ms. '
      'Isolates: $isolates',
    );
    var isolateRef = isolates.firstWhereOrNull(
      (isolate) => isolate.isSystemIsolate ?? false,
    );
    isolateRef ??= isolates.firstOrNull;
    if (isolateRef == null) {
      throw StateError('Could not determine main isolate ID.');
    }
    return isolateRef.id!;
  }

  // Doesn't seem that we need pause-on-start anymore, but keeping code around
  // if needed later.
  // ignore: unused_element
  static Future<void> _resumeIsolate(
    VmService vmService,
    String isolateId,
  ) async {
    _logger.finest('[Isolate $isolateId] Waiting for pause on start event...');
    var isolate = await vmService.getIsolate(isolateId);
    final stopwatch = Stopwatch()..start();
    const timeout = Duration(seconds: 5);
    while (isolate.pauseEvent?.kind != EventKind.kPauseStart) {
      if (stopwatch.elapsed > timeout) {
        throw TimeoutException(
          'Timed out waiting for isolate to report PauseStart event.',
        );
      }
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
      vmServiceCompleter.complete(_vmServiceConnectUri(observatoryUri));
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
          if (line.startsWith('The Dart') ||
              line.startsWith('vm-service') ||
              line.contains('_CELEST')) {
            // Ignore
          } else if (line.startsWith('Serving on')) {
            if (!serverStartedCompleter.isCompleted) {
              serverStartedCompleter.complete();
            }
          } else if (line.startsWith('/')) {
            analytics.capture('local_api_call', properties: {'route': line});
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
            final vmServiceInfo = _warnOnNoDebuggerPattern
                .firstMatch(line)
                ?.group(1);
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

      // Pipe logs to output
      _vmService!.onLoggingEvent.listen((event) {
        assert(event.kind == EventKind.kLogging);
        final record = event.logRecord!;
        // TODO(dnys1): Should this be the project name or something to help
        // distinguish logs?
        const defaultLoggerName = '';
        final loggerName =
            record.loggerName?.valueAsString ?? defaultLoggerName;
        final logger = Logger(loggerName);
        final level =
            record.level?.let(
              (level) => Level.LEVELS.firstWhere((l) => l.value == level),
            ) ??
            Level.FINE;
        if (!logger.isLoggable(level)) {
          return;
        }
        logger.log(
          level,
          record.message?.valueAsString ?? '<no message>',
          switch (record.error?.valueAsString) {
            null || 'null' || '' => null,
            final error => error,
          },
          switch (record.stackTrace?.valueAsString) {
            null || 'null' || '' => null,
            final stackTrace => StackTrace.fromString(stackTrace),
          },
        );
      });
      await _vmService!.streamListen(EventStreams.kLogging);

      _vmIsolateId = await _waitForIsolatesAndResume(_vmService!);

      await Future.any([
        serverStartedCompleter.future,
        _localApiProcess.exitCode.then((exitCode) {
          throw StateError(
            'Local API process exited before serving (exitCode=$exitCode)',
          );
        }),
      ]).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw TimeoutException('Local API did not start in time.');
        },
      );
      _logger.fine('Connected to local API.');
    } on Object catch (e, st) {
      _logger.finer('Failure starting local API runner', e, st);
      rethrow;
    }
  }

  Future<void> hotReload(List<String> pathsToInvalidate) async {
    _logger.fine('Recompiling local API...');
    final result = await _client.compile([
      for (final path in pathsToInvalidate)
        if (p.isWithin(projectPaths.projectRoot, path))
          _projectFsUri(path)
        else
          p.toUri(path),
    ]);
    final dillOutput = _client.expectOutput(result);
    _logger.fine('Hot reloading local API with entrypoint: $dillOutput');
    await _vmService!.reloadSources(_vmIsolateId, rootLibUri: dillOutput);
  }

  // Copied from `package:flutter_tools/src/run_hot.dart`
  // ignore: unused_element
  Future<void> _killIsolates() async {
    if (_vmService case final vmService?) {
      final isolateOperations = <Future<void>>[];
      final isolateRefs = await vmService.getVM().then((vm) => vm.isolates!);
      final isolateIds = isolateRefs.map((r) => r.id!).toList();
      _logger.finest('Killing isolates: ${isolateIds.join(', ')}');
      for (final isolateId in isolateIds) {
        isolateOperations.add(
          _vmService!
              .kill(isolateId)
              .then(
                (Success success) =>
                    _logger.finest('Killed isolate $isolateId'),
                onError: (Object error, StackTrace st) {
                  if (error is SentinelException ||
                      (error is RPCError &&
                          error.code ==
                              RPCErrorKind.kIsolateMustBeRunnable.code)) {
                    // Do nothing on a SentinelException since it means the isolate
                    // has already been killed.
                    // Error code 105 indicates the isolate is not yet runnable, and might
                    // be triggered if the tool is attempting to kill the asset parsing
                    // isolate before it has finished starting up.
                    return null;
                  }
                  _logger.finer('Error killing isolate $isolateId', error, st);
                  return Future<Never>.error(error, st);
                },
              ),
        );
      }
      await Future.wait(isolateOperations);
    }
  }

  Future<void> close() async {
    _logger.finer('Shutting down local API...');
    if (!await Future(() => _client.closed)) {
      _client.kill();
    }
    _logger.finest('Killing local process');
    // flutter_tester requires a gentle nudge when using `--run-forever`.
    _localApiProcess.kill(ProcessSignal.sigkill);

    _logger.finest('Closing VM service...');
    await _vmService?.dispose();
    await Future.wait([
      _stdoutSub.cancel().then((_) => _logger.finest('Stdout closed')),
      _stderrSub.cancel().then((_) => _logger.finest('Stderr closed')),
      _localApiProcess.exitCode.then(
        (exitCode) => _logger.finest('Exit code: $exitCode'),
      ),
      Future.value(
        _vmService?.onDone,
      ).then((_) => _logger.finest('VM service done')),
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
    _logger.finest(
      'Compile result: dillOutput=${result.dillOutput} '
      'errors=${result.errorCount}',
    );
    switch (result) {
      case CompileResult(errorCount: > 0):
        _logger.finest('Error compiling local API', result.debugResult);
        throw CompilationException(
          'Error compiling local API: ${result.debugResult}',
        );
      case CompileResult(:final dillOutput?):
        accept();
        return dillOutput;
      default:
        _logger.finest('Compile result:\n${result.debugResult}');
        // `dillOutput` should never be null (see its docs).
        unreachable('An unknown error occurred compiling local API.');
    }
  }
}

extension on CompileResult {
  String get debugResult {
    final buffer =
        StringBuffer()
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
      if (verbose) {
        _logger.finest('VM service WS data: $data');
      }
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
