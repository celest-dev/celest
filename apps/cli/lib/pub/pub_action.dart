import 'dart:async';

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
  exe ??= Sdk.current.dart;
  final process = await processManager.start(
    <String>[exe, 'pub', action.name],
    workingDirectory: workingDirectory,
  );
  final completer = Completer<void>();
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
  } finally {
    unawaited(stdout.cancel());
    unawaited(stderr.cancel());
  }
}
