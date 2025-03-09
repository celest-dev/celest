import 'dart:io';

import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/src/context.dart';
import 'package:checks/checks.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

import '../../common/common.dart';

final class CreateProjectInDartAppNoDepsTest extends E2ETest {
  CreateProjectInDartAppNoDepsTest(super.target);

  @override
  String get name => 'start (w/ Dart parent)';
  @override
  Future<void> run() async {
    final dartProject = d.dir(projectName, [
      d.file('pubspec.yaml', '''
name: hello_project

environment:
  sdk: ${PubEnvironment.dartSdkConstraint}
'''),
    ]);
    await dartProject.create(tempDir.path);
    final projectDir = fileSystem.directory(p.join(tempDir.path, projectName));
    await check(
      Process.run(
        'dart',
        ['pub', 'get'],
        runInShell: platform.isWindows,
        workingDirectory: projectDir.path,
      ),
    ).completes((it) => it.has((it) => it.exitCode, 'exitCode').equals(0));
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
