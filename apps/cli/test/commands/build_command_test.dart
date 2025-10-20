import 'package:args/command_runner.dart';
import 'package:celest_cli/src/commands/project/build_command.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:test/test.dart';

import '../common.dart';

Future<void> _complete(Progress progress, [String message = 'done']) async {
  try {
    progress.complete(message);
  } on Object {
    // Ignore failures in tests; progress may already be completed.
  }
}

void main() {
  setUpAll(initTests);

  group('BuildCommand', () {
    test('defaults to production environment', () async {
      String? capturedEnvironment;
      bool? capturedMigrate;

      final command = BuildCommand(
        configureOverride: () async => false,
        buildInvoker:
            ({
              required bool migrateProject,
              required Progress currentProgress,
              required String environmentId,
            }) async {
              capturedMigrate = migrateProject;
              capturedEnvironment = environmentId;
              await _complete(currentProgress);
              return 0;
            },
      );
      command.version = '0.0.0-test';

      final runner = CommandRunner<int>('celest', 'Celest CLI test')
        ..addCommand(command);

      final result = await runner.run(['build']);

      expect(result, equals(0));
      expect(capturedMigrate, isFalse);
      expect(capturedEnvironment, equals('production'));
    });

    test('honors --environment flag', () async {
      String? capturedEnvironment;
      bool? capturedMigrate;

      final command = BuildCommand(
        configureOverride: () async => true,
        buildInvoker:
            ({
              required bool migrateProject,
              required Progress currentProgress,
              required String environmentId,
            }) async {
              capturedMigrate = migrateProject;
              capturedEnvironment = environmentId;
              await _complete(currentProgress);
              return 0;
            },
      );
      command.version = '0.0.0-test';

      final runner = CommandRunner<int>('celest', 'Celest CLI test')
        ..addCommand(command);

      final result = await runner.run(['build', '--environment', 'staging ']);

      expect(result, equals(0));
      expect(capturedMigrate, isTrue);
      expect(capturedEnvironment, equals('staging'));
    });
  });
}
