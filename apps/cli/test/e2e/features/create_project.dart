import 'package:celest_cli_common/celest_cli_common.dart';
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
    final celest = celestCommand('start').workingDirectory(dir.io.path).start();
    if (!platform.isWindows) {
      celest.expectNext('Enter a name for your project').writeLine('hello');
    }
    await celest
        .expectNext('Generating project')
        .expectNext('Project generated successfully')
        .run();
  }
}
