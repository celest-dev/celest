import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:platform/platform.dart';
import 'package:test/test.dart';

void main() {
  group('ConfigurationValue', () {
    const key = env('ENV_VAR');

    test('from platform', () async {
      await Context.withCurrentZoneAsRoot<void>(
        overrides: {
          ContextKey.platform: FakePlatform(environment: {'ENV_VAR': 'value'}),
        },
        body: (root) {
          expect(key.read(root), 'value');
          expect(key.rawValue(root), 'value');
        },
      );
    });

    test('from runtime', () async {
      const value = 'Hello World';
      await Context.withCurrentZoneAsRoot<void>(
        overrides: const {},
        body: (root) {
          root.setLocal(key, value);
          expect(root.get(key), value);
          expect(key.read(root), value);
        },
      );
    });

    group('data URIs', () {
      test('plaintext', () async {
        await Context.withCurrentZoneAsRoot<void>(
          overrides: {
            ContextKey.platform: FakePlatform(
              environment: {'ENV_VAR': 'data:,Hello%20World'},
            ),
          },
          body: (root) {
            expect(key.read(root), 'Hello World');
            expect(
              key.rawValue(root),
              'data:,Hello%20World',
              reason: 'rawValue does not decode data URIs',
            );
          },
        );
      });

      test('base64', () async {
        await Context.withCurrentZoneAsRoot<void>(
          overrides: {
            ContextKey.platform: FakePlatform(
              environment: {
                'ENV_VAR': 'data:text/plain;base64,SGVsbG8gV29ybGQ=',
              },
            ),
          },
          body: (root) {
            expect(
              key.read(root),
              'SGVsbG8gV29ybGQ=',
              reason: 'base64-encoded values are not decoded',
            );
            expect(
              key.rawValue(root),
              'data:text/plain;base64,SGVsbG8gV29ybGQ=',
              reason: 'rawValue does not decode data URIs',
            );
          },
        );
      });

      test('can set at runtime', () async {
        final value = Uri.dataFromString('Hello World').toString();
        await Context.withCurrentZoneAsRoot<void>(
          overrides: const {},
          body: (root) {
            root.setLocal(key, value);
            expect(key.read(root), 'Hello World');
            expect(
              key.rawValue(root),
              value,
              reason: 'rawValue does not decode data URIs',
            );
          },
        );
      });
    });
  });
}
