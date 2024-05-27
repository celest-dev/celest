import 'dart:async';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:cli_script/cli_script.dart';

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

Future<void> runPub({
  String? exe,
  required PubAction action,
  required String workingDirectory,
}) async {
  exe ??= (await celestProject.determineProjectType()).name;
  final process = await processManager.start(
    <String>[exe, 'pub', action.name],
    environment: {
      if (Sdk.current.flutterSdkRoot case final flutterSdkRoot?)
        'FLUTTER_ROOT': flutterSdkRoot,
    },
    workingDirectory: workingDirectory,
  );
  // TODO(dnys1): Remove when fixed in pub https://github.com/dart-lang/sdk/issues/55289
  // and we can rely on the exit code taking a reasonable amount of time.

  // Must be sync so that completer only completes once before `finally` block
  // cancels subscription.
  final completer = Completer<void>.sync();
  final stdout = process.stdout.lines.listen((line) {
    if (action.matcher.hasMatch(line)) {
      completer.complete();
    }
  });
  final stderr = process.stderr.lines.listen((line) {
    completer.completeError(
      CelestException(
        'Failed to run `pub ${action.name}`. Please run `$exe pub ${action.name}` '
        'manually in $workingDirectory and try again.',
        additionalContext: {
          'error': line,
        },
      ),
    );
  });
  try {
    await Future.any([
      process.exitCode.then((exitCode) {
        if (exitCode != 0) {
          throw CelestException(
            'Failed to run `pub get`. Please run `$exe pub get` manually in '
            '$workingDirectory and try again.',
          );
        }
      }),
      completer.future,
    ]);
    final packageConfig = fileSystem
        .directory(workingDirectory)
        .childDirectory('.dart_tool')
        .childFile('package_config.json');
    while (!await packageConfig.exists()) {
      await Future<void>.delayed(Duration.zero);
    }
  } finally {
    unawaited(stdout.cancel());
    unawaited(stderr.cancel());
  }
}
