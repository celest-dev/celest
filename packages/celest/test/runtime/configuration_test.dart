@TestOn('vm')
library;

import 'dart:async';
import 'dart:convert';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/core/environment.dart';
import 'package:celest/src/runtime/configuration.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:file/memory.dart';
import 'package:file/src/interface/file.dart';
import 'package:platform/platform.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

final testProject = ResolvedProject(
  projectId: 'test',
  environmentId: 'local',
  sdkConfig: SdkConfiguration(
    celest: Version.parse('1.0.0'),
    dart: Sdk(
      type: SdkType.dart,
      version: Version.parse('3.5.0'),
      enabledExperiments: ['native-assets'],
    ),
    targetSdk: SdkType.dart,
    featureFlags: [],
  ),
  apis: {
    'greeting': ResolvedApi(
      apiId: 'greeting',
      functions: {
        'hello-world': ResolvedCloudFunction(
          apiId: 'greeting',
          functionId: 'hello-world',
          variables: ['HELLO_WORLD'],
          secrets: ['HELLO_WORLD_SECRET'],
          streamConfig: null,
          httpConfig: ResolvedHttpConfig(
            route: ResolvedHttpRoute(
              method: 'POST',
              path: '/greeting/hello-world',
            ),
            status: 200,
            statusMappings: {},
          ),
        ),
      },
    ),
  },
  variables: [ResolvedVariable(name: 'HELLO_WORLD', value: 'hello')],
  secrets: [ResolvedSecret(name: 'HELLO_WORLD_SECRET', value: 'world')],
);

void main() {
  Future<void> withConfiguredRoot({
    required Map<ContextKey<Object?>, Object?> overrides,
    required Future<void> Function(Context root) body,
  }) async {
    await Context.withCurrentZoneAsRoot<void>(
      overrides: overrides,
      body: (root) async {
        final ContextOverrides configurationOverrides = await configure();
        configurationOverrides.forEach(root.setLocal);
        await body(root);
      },
    );
  }

  group('configure', () {
    test('loads ./celest.json', () async {
      final platform = FakePlatform(
        environment: {},
        script: Uri.parse('file:///app/test.aot'),
      );
      final fileSystem = MemoryFileSystem.test();
      final File configFile = fileSystem.file('/app/celest.json');
      configFile.parent.createSync();
      configFile.writeAsStringSync(
        jsonEncode(testProject.toProto().toProto3Json()),
      );

      await withConfiguredRoot(
        overrides: {
          ContextKey.platform: platform,
          ContextKey.fileSystem: fileSystem,
        },
        body: (root) async {
          expect(root.project, equals(testProject));
          expect(
            root.environment,
            equals(Environment(testProject.environmentId)),
          );
          expect(root.googleProjectId, equals(testProject.projectId));
          expect(root.get(const env('HELLO_WORLD')), equals('hello'));
          expect(root.get(const secret('HELLO_WORLD_SECRET')), equals('world'));
        },
      );
    });

    test('loads CELEST_CONFIG', () async {
      final platform = FakePlatform(
        environment: {'CELEST_CONFIG': '/config/celest.json'},
        script: Uri.parse('file:///app/test.aot'),
      );
      final fileSystem = MemoryFileSystem.test();
      final File configFile = fileSystem.file('/config/celest.json');
      configFile.parent.createSync();
      configFile.writeAsStringSync(
        jsonEncode(testProject.toProto().toProto3Json()),
      );

      await withConfiguredRoot(
        overrides: {
          ContextKey.platform: platform,
          ContextKey.fileSystem: fileSystem,
        },
        body: (root) async {
          expect(root.project, equals(testProject));
          expect(
            root.environment,
            equals(Environment(testProject.environmentId)),
          );
          expect(root.googleProjectId, equals(testProject.projectId));
          expect(root.get(const env('HELLO_WORLD')), equals('hello'));
          expect(root.get(const secret('HELLO_WORLD_SECRET')), equals('world'));
        },
      );
    });

    test('loads CELEST_CONFIG_JSON', () async {
      final platform = FakePlatform(
        environment: {
          'CELEST_CONFIG_JSON': jsonEncode(
            testProject.toProto().toProto3Json(),
          ),
        },
        script: Uri.parse('file:///app/test.aot'),
      );

      await withConfiguredRoot(
        overrides: {ContextKey.platform: platform},
        body: (root) async {
          expect(root.project, equals(testProject));
          expect(
            root.environment,
            equals(Environment(testProject.environmentId)),
          );
          expect(root.googleProjectId, equals(testProject.projectId));
          expect(root.get(const env('HELLO_WORLD')), equals('hello'));
          expect(root.get(const secret('HELLO_WORLD_SECRET')), equals('world'));
        },
      );
    });

    test('fails hard when missing', () async {
      final platform = FakePlatform(
        environment: {},
        script: Uri.parse('file:///app/test.aot'),
      );
      final fileSystem = MemoryFileSystem.test();

      await Context.withCurrentZoneAsRoot(
        overrides: {
          ContextKey.platform: platform,
          ContextKey.fileSystem: fileSystem,
        },
        body: (_) async {
          await expectLater(configure(), throwsStateError);
        },
      );
    });
  });
}
