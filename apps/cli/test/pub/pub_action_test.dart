@OnPlatform({
  // Windows needs extra time in CI to run `pub get` and `pub upgrade`.
  'windows': Timeout.factor(4),
})
library;

import 'dart:io' show Platform;

import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:test/test.dart';

void main() {
  group('runPub', () {
    final matrix = [
      (PubAction.get, 'flutter'),
      (PubAction.get, Platform.resolvedExecutable),
      (PubAction.upgrade, 'flutter'),
      (PubAction.upgrade, Platform.resolvedExecutable),
    ];
    for (final (action, exe) in matrix) {
      group('${exe.split('/').last} pub ${action.name}', () {
        late Directory tempDir;

        setUp(() {
          tempDir =
              fileSystem.systemTempDirectory.createTempSync('celest_cli_test');
        });

        tearDown(() {
          try {
            tempDir.deleteSync(recursive: true);
          } catch (_) {}
        });

        test('resolves successfully', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk

dependencies:
  path: any
''');
          await expectLater(
            runPub(
              exe: exe,
              action: action,
              workingDirectory: tempDir.path,
            ),
            completes,
          );
        });

        test('proxies failures gracefully', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk

dependencies:
  # A non-existent version of Celest
  celest: 0.0.1
''');
          await expectLater(
            runPub(
              exe: exe,
              action: action,
              workingDirectory: tempDir.path,
            ),
            throwsA(
              isA<CelestException>().having(
                (e) => e.toString(),
                'message',
                contains(
                  'Because test_1234 depends on celest 0.0.1 which doesn\'t match '
                  'any versions, version solving failed.',
                ),
              ),
            ),
          );
        });

        // TODO(dnys1): Should we allow direct dependencies on Flutter?
        test('works when depending on flutter', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk

dependencies:
  flutter:
    sdk: flutter
''');
          await expectLater(
            runPub(
              exe: exe,
              action: action,
              workingDirectory: tempDir.path,
            ),
            completes,
          );
        });

        test('works with flutter environment constraint', () async {
          tempDir.childFile('pubspec.yaml').writeAsStringSync('''
name: test_1234

environment:
  sdk: ^$minSupportedDartSdk
  flutter: ">=3.19.0"

dependencies:
  path: any
''');
          await expectLater(
            runPub(
              exe: exe,
              action: action,
              workingDirectory: tempDir.path,
            ),
            completes,
          );
        });
      });
    }
  });
}
