@TestOn('vm')
library;

import 'dart:async';
import 'dart:io';

import 'package:celest/src/runtime/serve.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

final config = ResolvedProject(
  projectId: 'test',
  environmentId: 'local',
  sdkConfig: SdkConfiguration(
    celest: Version.parse('1.0.0'),
    dart: Sdk(
      type: SdkType.dart,
      version: Version.parse(Platform.version.split(' ').first),
    ),
  ),
);

void main() {
  group('serve', () {
    test('calls setup', () async {
      final setupCompleter = Completer<void>();
      final CelestService service = await serve(
        config: config,
        targets: {},
        setup: setupCompleter.complete,
      );
      addTearDown(service.close);
      expect(
        setupCompleter.future.timeout(const Duration(seconds: 1)),
        completes,
      );
    });

    test('fails to start server if setup fails', () async {
      final Future<CelestService> service = serve(
        config: config,
        targets: {},
        setup: (_) => throw StateError('Failed to setup'),
      );
      await expectLater(
        service,
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            'Failed to setup',
          ),
        ),
      );
    });
  });
}
