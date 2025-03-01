import 'package:checks/checks.dart';

import '../../common/common.dart';

final class CreateProjectIsolatedTest extends E2ETest {
  CreateProjectIsolatedTest(super.target);

  @override
  String get name => 'start (w/ no parent)';

  @override
  Future<void> run() async {
    {
      final celest = celestCommand('start')
          .workingDirectory(tempDir.path)
          .start()
          .expectNext('Would you like to create one?')
          .writeLine('y')
          .expectNext('Enter a name for your project')
          .writeLine(projectName)
          .expectLater('Generating project')
          .expectLater('Project generated successfully')
          .expectLater('Starting Celest')
          .expectNext('Celest is running');
      await celest.run();

      check(
        tempDir
            .childDirectory(projectName)
            .childFile('pubspec.yaml')
            .existsSync(),
      ).isTrue();
    }

    {
      final emptyDir = await tempDir.createTemp('empty');
      final celest = celestCommand('start')
          .workingDirectory(emptyDir.path)
          .start()
          .expectNext('Would you like to create one?')
          .writeLine('y')
          .expectNext('Enter a name for your project')
          .writeLine(projectName)
          .expectLater('Generating project')
          .expectLater('Project generated successfully')
          .expectLater('Starting Celest')
          .expectNext('Celest is running');
      await celest.run();

      check(emptyDir.childFile('pubspec.yaml').existsSync()).isTrue();
    }
  }
}
