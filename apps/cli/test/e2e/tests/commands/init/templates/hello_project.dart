import 'package:celest_cli/src/context.dart';

import '../../../../common/common.dart';

final class HelloProjectTest extends E2ETest {
  HelloProjectTest(super.target);

  @override
  String get name => 'init (hello template)';

  @override
  Future<void> run() async {
    await celestCommand('init', '-t', 'hello')
        .workingDirectory(tempDir.path)
        .start()
        .expectLater('🚀 To start a local development server')
        .run();
    await celestCommand('start')
        .workingDirectory(p.join(tempDir.path, 'my_project'))
        .start()
        .expectLater('Starting local environment')
        .expectNext('Celest is running')
        .run();
  }
}
