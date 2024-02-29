import '../common/common.dart';

final class CreateProjectTest extends Test {
  CreateProjectTest(super.target);

  @override
  String get name => 'start (new project)';

  @override
  Future<void> run() async {
    await celestCommand('start')
        .workingDirectory(flutterProjectDir.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine('hello')
        .expectNext('Generating project')
        .expectNext('Project generated successfully')
        .run();
  }
}
