import 'package:celest_cli/src/context.dart';

import '../../../../common/common.dart';

final class DataProjectTest extends E2ETest {
  DataProjectTest(super.target);

  @override
  String get name => 'init (data template)';

  @override
  Future<void> run() async {
    await celestCommand('init', '-t', 'data')
        .workingDirectory(tempDir.path)
        .start()
        .expectLater('🚀 To start a local development server')
        .run();
    await celestCommand('start')
        .workingDirectory(p.join(tempDir.path, 'my_project'))
        .start()
        .expectLater('Starting local environment')
        .expectLater('Celest is running')
        .run();
  }
}
