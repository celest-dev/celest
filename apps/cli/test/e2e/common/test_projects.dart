import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/src/context.dart';
import 'package:checks/checks.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:test_descriptor/test_descriptor.dart' as d;

import 'common.dart';

base mixin TestFlutterProject on E2ETest {
  late final Directory projectDir;
  Directory get celestDir => projectDir.childDirectory('celest');

  @override
  bool get skip => !hasFlutter;

  @override
  @mustCallSuper
  Future<void> setUp() async {
    await super.setUp();
    final flutterProject = d.dir(projectName, [
      d.file('pubspec.yaml', '''
name: hello_project

environment:
  sdk: ${PubEnvironment.dartSdkConstraint}

dependencies:
  flutter:
    sdk: flutter
'''),
    ]);
    await flutterProject.create(tempDir.path);
    projectDir = fileSystem.directory(
      p.join(tempDir.path, projectName),
    );
    await check(
      processManager.run(
        ['flutter', 'pub', 'get'],
        workingDirectory: projectDir.path,
      ),
    ).completes((it) => it.has((it) => it.exitCode, 'exitCode').equals(0));
    print('Running test in ${projectDir.path}');
  }
}

base mixin TestDartProject on E2ETest {
  late final Directory projectDir;
  Directory get celestDir => projectDir.childDirectory('celest');

  @override
  @mustCallSuper
  Future<void> setUp() async {
    await super.setUp();
    final dartProject = d.dir(projectName, [
      d.file('pubspec.yaml', '''
name: hello_project

environment:
  sdk: ${PubEnvironment.dartSdkConstraint}
'''),
    ]);
    await dartProject.create(tempDir.path);
    projectDir = fileSystem.directory(
      p.join(tempDir.path, projectName),
    );
    await check(
      processManager.run(
        ['dart', 'pub', 'get'],
        workingDirectory: projectDir.path,
      ),
    ).completes((it) => it.has((it) => it.exitCode, 'exitCode').equals(0));
    print('Running test in ${projectDir.path}');
  }
}
