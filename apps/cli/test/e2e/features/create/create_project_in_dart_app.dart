import '../../common/common.dart';
import '../../common/test_projects.dart';

final class CreateProjectInDartAppTest extends E2ETest with TestDartProject {
  CreateProjectInDartAppTest(super.target);

  @override
  String get name => 'start (w/ Dart parent)';
  @override
  Future<void> run() async {
    await celestCommand('start')
        .workingDirectory(dartProjectDir.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine(projectName)
        .expectLater('Generating project')
        .expectLater('Project generated successfully')
        .expectLater('Starting Celest')
        .expectNext('Celest is running')
        .run();
  }
}
