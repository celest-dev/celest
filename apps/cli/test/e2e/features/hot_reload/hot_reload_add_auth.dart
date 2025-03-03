import 'package:celest_cli/src/context.dart';

import '../../common/common.dart';
import '../../common/test_projects.dart';

final class HotReloadAddAuthTest extends E2ETest with TestDartProject {
  HotReloadAddAuthTest(super.target);

  @override
  String get name => 'hot reload (add auth)';

  // TODO(dnys1): Get watcher working on Windows so that SIGUSR1 is not
  // needed.
  @override
  bool get skip => platform.isWindows;

  @override
  Future<void> run() async {
    final celest = celestCommand('start')
        .workingDirectory(projectDir.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine(projectName)
        .expectLater('Celest is running');
    await celest.flush();

    log('Adding auth');
    await celestDir.childFile('auth.dart').writeAsString('''
import 'package:celest/celest.dart';

const auth = Auth(
  providers: [
    AuthProvider.email(),
  ],
);
''');

    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectLater('Celest is running')
        .run();
  }
}
