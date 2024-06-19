import '../../common/common.dart';
import '../../common/test_projects.dart';

// Regression: https://github.com/celest-dev/celest/issues/151
final class SupportsSupabase extends E2ETest with TestDartProject {
  SupportsSupabase(super.target);

  @override
  String get name => 'supports supabase';

  @override
  Future<void> run() async {
    // Create project
    await celestCommand('start')
        .withPublishedRuntime()
        .workingDirectory(projectDir.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine(projectName)
        .expectLater('Celest is running')
        .run();

    // Add dependency on supabase
    await runCommand(
      [
        'dart',
        'pub',
        'add',
        'supabase',
      ],
      runInShell: true,
      workingDirectory: celestDir.path,
    );

    // Ensure supabase compiles
    await celestCommand('start')
        .withPublishedRuntime()
        .workingDirectory(projectDir.path)
        .start()
        .expectLater('Celest is running')
        .run();
  }
}
