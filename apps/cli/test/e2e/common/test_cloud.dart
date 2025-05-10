import 'dart:async';
import 'dart:convert';
import 'dart:io' show Process, ProcessSignal;

import 'package:celest_cli/src/commands/auth/cli_auth.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/process/port_finder.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/utils/process.dart';
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_test/celest_test.dart';
import 'package:logging/logging.dart';

import 'common.dart';

base mixin TestCloud on E2ETest {
  Process? _cloudHubProcess;
  late final Uri cloudHubUri;
  late final CelestCloud cloud;
  late final CelestTester tester;

  static final _vmServicePattern = RegExp(
    r'The Dart VM service is listening on ([^\s]+)',
  );

  // TODO(dnys1): Get cloud hub running on Windows
  @override
  bool get skip => platform.isWindows;

  @override
  Map<String, String> get environment => {
    'CELEST_API_URI': cloudHubUri.toString(),
  };

  @override
  Future<void> setUp() async {
    await super.setUp();

    // Build and run the Cloud Hub.
    final gitRoot = await findGitRoot();
    final cloudHubRoot = p.join(gitRoot, 'services', 'celest_cloud_hub');

    print('Running Cloud Hub...');
    final port = await RandomPortFinder().findOpenPort();
    _cloudHubProcess = await processManager.start(
      [
        Sdk.current.dart,
        'run',
        '--observe',
        p.join(cloudHubRoot, 'bin', 'cloud_hub.dart'),
      ],
      environment: {
        'PORT': port.toString(),
        'LOG_LEVEL': 'ALL',
        'CLOUD_HUB_DATABASE_HOST': 'file::memory:',
      },
      includeParentEnvironment: true,
      workingDirectory: tempDir.path,
    );
    _cloudHubProcess!
      ..captureStdout(sink: log, prefix: '[CloudHub] ')
      ..captureStderr(sink: log, prefix: '[CloudHub] ');

    final line = await ProcessUtil(_cloudHubProcess!).stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .firstWhere(
          (line) => line.startsWith('The Dart VM service is listening on'),
        );
    final vmServiceInfo = _vmServicePattern.firstMatch(line)?.group(1);
    final observatoryUri = '${vmServiceInfo!.replaceFirst('http', 'ws')}ws';

    tester = await CelestTester.connect(wsUri: observatoryUri);

    // Wait for server to tart
    await ProcessUtil(_cloudHubProcess!).stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .firstWhere((line) => line.startsWith('Serving on'));

    cloudHubUri = Uri.parse('http://localhost:$port');
    cloud = CelestCloud.http(
      cloudHubUri,
      authenticator: authenticator,
      httpClient: httpClient,
      logger: Logger.detached('')
        ..onRecord.listen((record) {
          log(record.message);
        }),
    );
  }

  @override
  Future<void> tearDown() async {
    await super.tearDown();
    if (_cloudHubProcess case final cloudHubProcess?) {
      print('Shutting down Cloud Hub...');
      cloudHubProcess.kill();
      await cloudHubProcess.exitCode.timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          cloudHubProcess.kill(ProcessSignal.sigkill);
          return Future.value(0);
        },
      );
      await tester.close();
    }
  }
}
