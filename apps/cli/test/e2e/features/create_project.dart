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
        .expectLater('Generating project')
        .expectLater('Project generated successfully')
        .run();
  }
}
