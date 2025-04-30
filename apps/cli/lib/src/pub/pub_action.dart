import 'dart:async';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_core/_internal.dart';
import 'package:cli_script/cli_script.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

enum PubAction {
  get,
  upgrade;

  /// Matcher for output of `pub <action>`.
  ///
  /// From: https://github.com/dart-lang/pub/blob/f8b23495666acb275016850f6fd4206a38ad0eb5/test/test_pub.dart#L96
  RegExp get matcher => switch (this) {
        get => RegExp(r'Got dependencies!|Changed \d+ dependenc(y|ies)!'),
        upgrade => RegExp(r'''
(No dependencies changed\.|Changed \d+ dependenc(y|ies)!)($|
\d+ packages? (has|have) newer versions incompatible with dependency constraints.
Try `dart pub outdated` for more information.$)'''),
      };
}

final Logger _logger = Logger('pub');

Future<void> dumpPackageConfig() async {
  try {
    final packageConfig =
        await fileSystem.file(projectPaths.packagesConfig).readAsString();
    _logger.finest('Package config:\n$packageConfig');
  } on Object catch (e, st) {
    _logger.finest('Failed to read package config.', e, st);
  }
  try {
    final pubspec =
        await fileSystem.file(projectPaths.pubspecYaml).readAsString();
    _logger.finest('Pubspec:\n$pubspec');
  } on Object catch (e, st) {
    _logger.finest('Failed to read pubspec.', e, st);
  }
}

Future<void> runPub({
  String? exe,
  required PubAction action,
  required String workingDirectory,
  @visibleForTesting bool verbose = false,
}) async {
  exe ??= kDebugMode
      ? Sdk.current.dart
      : (await celestProject.determineProjectType()).executable;

  final command = <String>[
    exe,
    'pub',
    action.name,
    if (verbose) '--verbose',
    if (!connectionMonitor.isConnected) '--offline',
  ];
  final logger = Logger(command.join(' '));
  logger.fine('Running `${command.join(' ')}` in "$workingDirectory"...');
  final process = await processManager.start(
    command,
    environment: {
      if (Sdk.current.flutterSdkRoot case final flutterSdkRoot?)
        'FLUTTER_ROOT': flutterSdkRoot,
    },
    workingDirectory: workingDirectory,
  );

  // TODO(dnys1): Remove when fixed in pub https://github.com/dart-lang/sdk/issues/55289
  // and we can rely on the exit code taking a reasonable amount of time.

  // TODO(dnys1): Add timeout which can happen when device is connected
  // to internet but not reachable.

  // Must be sync so that completer only completes once before `finally` block
  // cancels subscription.
  final completer = Completer<void>.sync();
  final stdout = process.stdout.lines.listen((line) {
    logger.finest('stdout: $line');
    if (action.matcher.hasMatch(line)) {
      if (completer.isCompleted) {
        logger.finest('Got matching line after completion: $line');
        return;
      }
      completer.complete();
    }
  });
  final stderr = process.stderr.lines.listen((line) {
    logger.finest('stderr: $line');
    if (line.trim().startsWith('Waiting for another flutter command')) {
      return;
    }
    if (verbose) {
      return;
    }
    if (!completer.isCompleted) {
      completer.completeError(
        CliException(
          'Failed to run `pub ${action.name}`. Please run `$exe pub ${action.name}` '
          'manually in $workingDirectory and try again.',
          additionalContext: {'error': line},
        ),
      );
    }
  });
  try {
    await Future.any([
      process.exitCode.then((exitCode) {
        if (exitCode != 0) {
          throw CliException(
            'Failed to run `pub get`. Please run `$exe pub get` manually in '
            '$workingDirectory and try again.',
          );
        }
        _logger.finer(
          '`$exe pub ${action.name}` completed successfully in '
          '"$workingDirectory"',
        );
      }),
      completer.future,
    ]);
    final packageConfig = fileSystem
        .directory(workingDirectory)
        .childDirectory('.dart_tool')
        .childFile('package_config.json');
    while (!await packageConfig.exists()) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
    }
  } on Object {
    // await dumpPackageConfig();
    rethrow;
  } finally {
    unawaited(stdout.cancel());
    unawaited(stderr.cancel());
  }
}
