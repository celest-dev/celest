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
  final stdout = process.stdout.lines;
  final stderr = process.stderr.lines;
  await Future.any([
    process.exitCode.then((exitCode) {
      if (exitCode != 0) {
        throw CelestException(
          'Failed to run `pub get`. Please run `$exe pub get` manually in '
          '$workingDirectory and try again.',
        );
      }
    }),
    stdout.firstWhere(action.matcher.hasMatch),
    stderr.first.then((err) {
      throw CelestException(
        'Failed to run `pub get`. Please run `$exe pub get` manually in '
        '$workingDirectory and try again.',
        additionalContext: {
          'error': err,
        },
      );
    }),
  ]);
}
