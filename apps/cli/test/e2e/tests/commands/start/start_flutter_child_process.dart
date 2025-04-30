import 'package:celest_cli/src/context.dart';

import '../../../common/common.dart';
import '../../../common/test_projects.dart';

/// Tests that running `celest start` with a Flutter child process (`flutter test`)
/// works as expected as passes the required environment variables for using
/// `package:celest_test` in the child process.
final class StartFlutterChildProcessTest extends E2ETest
    with TestFlutterProject {
  StartFlutterChildProcessTest(super.target);

  // TODO(dnys1): Flaky in CI
  @override
  bool get skip => super.skip || platform.isLinux;

  @override
  String get name => 'start (w/ Flutter child process)';

  /// Test using `package:flutter_test`
  Future<void> _testFlutterTest() async {
    final celestTestFile = fileSystem.file(
      p.join(projectDir.path, 'test', 'celest_test.dart'),
    );
    await celestTestFile.create(recursive: true);
    await celestTestFile.writeAsString('''
import 'package:celest_test/celest_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('can connect', () async {
    await CelestTester.connect();
    print('Connected');
  });
}
''');

    await celestCommand(
      'start',
      '--',
      'flutter',
      'test',
      'test/celest_test.dart',
    )
        .workingDirectory(projectDir.path)
        .start()
        .expectLater('Generating project')
        .expectLater('Starting local environment')
        .expectNext('Celest is running')
        .expectLater('Connected')
        .run();
  }

  /// Test using `package:integration_test`
  Future<void> _testIntegrationTest() async {
    final integrationTestFile = fileSystem.file(
      p.join(projectDir.path, 'integration_test', 'integration_test.dart'),
    );
    await integrationTestFile.create(recursive: true);
    await integrationTestFile.writeAsString('''
import 'package:celest_test/celest_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('can connect', (_) async {
    await CelestTester.connect();
    print('Connected');
  });
}
''');

    // Update podfile
    if (platform.isMacOS) {
      final podfile = fileSystem.file(
        p.join(projectDir.path, 'macos', 'Podfile'),
      );
      final podfileContent = await podfile.readAsString();
      await podfile.writeAsString(podfileContent.replaceAll(
        "platform :osx, '10.14'",
        "platform :osx, '10.15'",
      ));
    }

    await celestCommand(
      'start',
      '--',
      'flutter',
      'test',
      '-d',
      platform.operatingSystem,
      'integration_test/integration_test.dart',
    )
        .workingDirectory(projectDir.path)
        .start()
        .expectLater('Starting local environment')
        .expectNext('Celest is running')
        .expectLater('Connected')
        .run();
  }

  @override
  Future<void> run() async {
    final gitRoot = await findGitRoot();

    await runCommand([
      'flutter',
      'pub',
      'add',
      // https://dart.dev/tools/pub/cmd/pub-add#source-descriptor
      'dev:celest_test:{path: $gitRoot/packages/celest_test}',
      'dev:integration_test:{sdk: flutter}',
    ], workingDirectory: projectDir.path);

    await _testFlutterTest();
    await _testIntegrationTest();
  }
}
