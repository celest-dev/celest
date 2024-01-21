import 'dart:io';

import '../common/common.dart';

final class HelloProjectTest extends Test {
  HelloProjectTest(super.target);

  @override
  String get name => 'start (hello project)';

  @override
  Future<void> run() async {
    final helloExample =
        Directory.current.uri.resolve('../../examples/hello').toFilePath();
    await celestCommand('start')
        .workingDirectory(helloExample)
        .start()
        .expectNext('Starting Celest')
        .expectNext('Celest is running')
        .run();
  }
}
