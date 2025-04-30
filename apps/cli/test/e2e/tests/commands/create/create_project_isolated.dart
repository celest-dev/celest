import 'package:checks/checks.dart';

import '../../../common/common.dart';

final class CreateProjectIsolatedTest extends E2ETest {
  CreateProjectIsolatedTest(super.target);

  @override
  String get name => 'start (w/ no parent)';

  @override
  Future<void> run() async {
    // Non-empty directory
    {
      final celest = celestCommand('start')
          .workingDirectory(tempDir.path)
          .start()
          .expectLater('Generating project')
          .expectLater('Project generated successfully')
          .expectLater('Starting local environment')
          .expectNext('Celest is running');
      await celest.run();

      check(
        because: 'The project should be created in the sub-directory '
            'with the name of the project (defaults to `my_project`)',
        tempDir
            .childDirectory('my_project')
            .childFile('pubspec.yaml')
            .existsSync(),
      ).isTrue();
    }

    // Empty directory
    {
      final emptyDir = await tempDir.createTemp('empty');
      final celest = celestCommand('start')
          .workingDirectory(emptyDir.path)
          .start()
          .expectLater('Generating project')
          .expectLater('Project generated successfully')
          .expectLater('Starting local environment')
          .expectNext('Celest is running');
      await celest.run();

      check(
        because: 'The project should be created in the current directory',
        emptyDir.childFile('pubspec.yaml').existsSync(),
      ).isTrue();
    }
  }
}
