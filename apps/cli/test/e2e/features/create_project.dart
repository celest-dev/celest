import 'package:test_descriptor/test_descriptor.dart' as d;

import '../common/common.dart';

final class CreateProjectTest extends Test {
  CreateProjectTest(super.target);

  @override
  String get name => 'start (new project)';

  @override
  Future<void> run() async {
    final dir = d.dir('hello');
    await dir.create();
    await command('flutter', ['create', '.'])
        .workingDirectory(dir.io.path)
        .expectSuccess();
    await celestCommand('start')
        .workingDirectory(dir.io.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine('hello')
        .expectNext('Generating project')
        .expectNext('Project generated successfully')
        .run();
  }
}
