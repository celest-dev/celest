import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/compiler/frontend_server_client.dart';
import 'package:celest_cli/src/context.dart';
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
    required FrontendServerClient client,
    required VmService vmService,
    required Process localApiProcess,
  })  : _client = client,
        _vmService = vmService,
        _localApiProcess = localApiProcess;

  final Logger logger;
  final bool verbose;
  final List<String> enabledExperiments;
  final String path;

  /// The port that the local API is running on.
  static late final int port;
  static final Future<int> _port =
      _findOpenPort().timeout(const Duration(seconds: 1));

  static Future<int> _findOpenPort() async {
    var port = defaultCelestPort;
    while (true) {
      try {
        await ServerSocket.bind(InternetAddress.loopbackIPv4, port);
        return port;
      } on SocketException {
        port++;
      }
    }
  }

  final FrontendServerClient _client;
  final VmService _vmService;
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
      p.join(
        Sdk.current.sdkPath,
        'lib',
        '_internal',
        'vm_platform_strong.dill',
      ),
      target: 'vm',
      verbose: verbose,
      fileSystemRoots: ['/'],
      fileSystemScheme: 'org-dartlang-root',
      enabledExperiments: enabledExperiments,
      frontendServerPath: Sdk.current.frontendServerSnapshot,
      additionalSources: additionalSources,
    );
    logger.detail('Compiling local API...');

    final result = await client.compile();
    final dillOutput = client.expectOutput(result);

    port = await _port;
    logger.detail('Starting local API...');
    final localApiProcess = await Process.start(
      Sdk.current.dart,
      ['--enable-vm-service', dillOutput],
      environment: {
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

    // logger.detail('Waiting for isolate.');
    // final isolate = await _waitForIsolatesAndResume(vmService);
    logger.detail('Connected to local API.');

    return LocalApiRunner._(
      path: path,
      logger: logger,
      verbose: verbose,
      enabledExperiments: enabledExperiments,
      client: client,
      vmService: vmService,
      localApiProcess: localApiProcess,
    );
  }

  static Future<Isolate> _waitForIsolatesAndResume(VmService vmService) async {
    var vm = await vmService.getVM();
    var isolates = vm.isolates;
    while (isolates == null || isolates.isEmpty) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
      vm = await vmService.getVM();
      isolates = vm.isolates;
    }
    final isolateRef = isolates.first;
    var isolate = await vmService.getIsolate(isolateRef.id!);
    while (isolate.pauseEvent?.kind != EventKind.kPauseStart) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
      isolate = await vmService.getIsolate(isolateRef.id!);
    }
    await vmService.resume(isolate.id!);
    return isolate;
  }

  Future<void> recompile(List<String> pathsToInvalidate) async {
    final result = await _client.compile([
      for (final path in pathsToInvalidate)
        Uri.parse('org-dartlang-root://$path'),
    ]);
    final dillOutput = _client.expectOutput(result);
    final vm = await _vmService.getVM();
    final isolateId = vm.isolates?.first.id;
    if (isolateId == null) {
      unreachable('No isolate found.');
    }
    await _vmService.reloadSources(
      isolateId,
      // force: true,
      rootLibUri: dillOutput,
    );
  }

  @override
  Future<void> close() async {
    await _client.shutdown().timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        _client.kill();
        return 1;
      },
    );
    await _vmService.dispose();
    _localApiProcess.kill();
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
        throw StateError('An unknown error occurred compiling local API.');
    }
  }
}
