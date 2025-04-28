import 'package:celest_cli/src/context.dart';

import '../../common/common.dart';

final class InitProjectNameTest extends E2ETest {
  InitProjectNameTest(super.target);

  @override
  String get name => 'init (w/ project name)';

  @override
  Future<void> run() async {
    await celestCommand('init', '--name', 'my_project_123')
        .workingDirectory(tempDir.path)
        .start()
        .expectLater('🚀 To start a local development server')
        .run();
    await celestCommand('start')
        .workingDirectory(p.join(tempDir.path, 'my_project_123'))
        .start()
        .expectLater('Starting local environment')
        .expectNext('Celest is running')
        .run();
  }
}
