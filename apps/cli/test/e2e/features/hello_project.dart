import 'dart:io';

import 'package:celest_cli/src/context.dart';

import '../common/common.dart';

final class HelloProjectTest extends E2ETest {
  HelloProjectTest(super.target);

  @override
  String get name => 'start (hello project)';

  @override
  bool get skip => !hasFlutter || !platform.environment.containsKey('CI');

  @override
  Future<void> run() async {
    final helloExample = Directory.current.uri
        .resolve('../../packages/celest/example')
        .toFilePath();
    await celestCommand('start')
        .workingDirectory(helloExample)
        .start()
        .expectLater('Starting local environment')
        .expectNext('Celest is running')
        .run();
  }
}
