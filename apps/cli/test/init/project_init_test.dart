import 'dart:io';

import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:file/chroot.dart';
import 'package:mason_logger/src/mason_logger.dart';
import 'package:test/test.dart';

import '../common.dart';

final class TestCommand extends CelestCommand with Configure {
  @override
  String get name => 'test';

  @override
  String get description => 'test';

  @override
  Progress? currentProgress;

  @override
  // ignore: must_call_super
  Future<int> run() async {
    await configure();
    return 0;
  }
}

void main() {
  group('init', () {
    setUpAll(initTests);

    test('throws when no project found', skip: Platform.isWindows, () async {
      final projectRoot = await fileSystem.systemTempDirectory.createTemp(
        'test_project_',
      );
      fileSystem = ChrootFileSystem(
        fileSystem,
        p.canonicalize(projectRoot.absolute.path),
      );

      addTearDown(() async {
        try {
          await projectRoot.delete(recursive: true);
        } on Object {
          // OK
        }
      });

      await expectLater(
        () => TestCommand().run(),
        throwsA(
          isA<CliException>().having(
            (e) => e.message,
            'message',
            contains('No Celest project found in the current directory'),
          ),
        ),
      );
    });
  });
}
