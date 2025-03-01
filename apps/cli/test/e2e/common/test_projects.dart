import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';

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
    projectDir = fileSystem.directory(p.join(tempDir.path, projectName));
    await projectDir.create(recursive: true);
    await runCommand([
      'flutter',
      'create',
      '.',
    ], workingDirectory: projectDir.path);
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
    projectDir = fileSystem.directory(p.join(tempDir.path, projectName));
    await projectDir.create(recursive: true);
    await runCommand([
      'dart',
      'create',
      '--force',
      '.',
    ], workingDirectory: projectDir.path);
    print('Running test in ${projectDir.path}');
  }
}
