import 'package:celest_cli/src/context.dart';

import '../../../common/common.dart';

final class StartChildProcessTest extends E2ETest {
  StartChildProcessTest(super.target);

  @override
  String get name => 'start (w/ child process)';

  @override
  Future<void> run() async {
    // The child process succeeds
    {
      final command =
          platform.isWindows
              ? celestCommand(
                'start',
                '--',
                'powershell.exe',
                '-c',
                "Write-Output 'hello'",
              )
              : celestCommand('start', '--', 'echo', 'hello');
      await command
          .workingDirectory(tempDir.path)
          .start()
          .expectLater('Generating project')
          .expectLater('Starting local environment')
          .expectNext('Celest is running')
          .expectLater('hello')
          // Expect the CLI exits after the child process exits
          .expectSuccess();
    }

    // The child process fails
    {
      final command =
          platform.isWindows
              ? celestCommand('start', '--', 'powershell.exe', '-c', 'exit 123')
              : celestCommand('start', '--', 'sh', '-c', 'exit 123');
      await command
          // Use the already created project
          .workingDirectory(p.join(tempDir.path, 'my_project'))
          .start()
          .expectLater('Starting local environment')
          .expectNext('Celest is running')
          // Expect the CLI exits with the child process exit code
          .expectError(123);
    }
  }
}
