import 'dart:io';

import '../common/common.dart';

final class HelloProjectTest extends E2ETest {
  HelloProjectTest(super.target);

  @override
  String get name => 'start (hello project)';

  @override
  bool get skip => !hasFlutter;

  @override
  Future<void> run() async {
    final helloExample =
        Directory.current.uri
            .resolve('../../celest/packages/celest/example')
            .toFilePath();
    await celestCommand('start')
        .workingDirectory(helloExample)
        .start()
        .expectLater('Starting Celest')
        .expectNext('Celest is running')
        .run();
    print('Resetting git repo');
    await runCommand([
      'git',
      'reset',
      '--hard',
      'HEAD',
    ], workingDirectory: helloExample);
  }
}
