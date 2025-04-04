import '../../common/common.dart';
import '../../common/test_projects.dart';

final class CreateProjectInFlutterAppTest extends E2ETest
    with TestFlutterProject {
  CreateProjectInFlutterAppTest(super.target);

  @override
  String get name => 'start (w/ Flutter parent)';

  @override
  Future<void> run() async {
    await celestCommand('init')
        .workingDirectory(projectDir.path)
        .start()
        .expectLater('Generating project')
        .expectLater('Project generated successfully')
        .expectLater('To start a local development server')
        .run();
    await celestCommand('start')
        .workingDirectory(projectDir.path)
        .start()
        .expectLater('Starting local environment')
        .expectNext('Celest is running')
        .run();
  }
}
