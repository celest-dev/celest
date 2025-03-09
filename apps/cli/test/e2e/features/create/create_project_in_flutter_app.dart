import '../../common/common.dart';
import '../../common/test_projects.dart';

final class CreateProjectInFlutterAppTest extends E2ETest
    with TestFlutterProject {
  CreateProjectInFlutterAppTest(super.target);

  @override
  String get name => 'start (w/ Flutter parent)';

  @override
  Future<void> run() async {
    await celestCommand('start')
        .workingDirectory(projectDir.path)
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
