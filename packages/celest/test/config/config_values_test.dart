import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:platform/platform.dart';
import 'package:test/test.dart';

void main() {
  group('ConfigurationValue', () {
    const key = env('ENV_VAR');

    test('from platform', () {
      context.put(
        ContextKey.platform,
        FakePlatform(environment: {'ENV_VAR': 'value'}),
      );
      expect(context.get(key), 'value');
      expect(key.rawValue(context), 'value');
    });

    test('from runtime', () {
      const value = 'Hello World';
      context.put(key, value);
      expect(context.get(key), value);
    });

    group('data URIs', () {
      test('plaintext', () {
        context.put(
          ContextKey.platform,
          FakePlatform(environment: {'ENV_VAR': 'data:,Hello%20World'}),
        );
        expect(context.get(key), 'Hello World');
        expect(
          key.rawValue(context),
          'data:,Hello%20World',
          reason: 'rawValue does not decode data URIs',
        );
      });

      test('base64', () {
        context.put(
          ContextKey.platform,
          FakePlatform(
            environment: {'ENV_VAR': 'data:text/plain;base64,SGVsbG8gV29ybGQ='},
          ),
        );
        expect(
          context.get(key),
          'SGVsbG8gV29ybGQ=',
          reason: 'base64-encoded values are not decoded',
        );
        expect(
          key.rawValue(context),
          'data:text/plain;base64,SGVsbG8gV29ybGQ=',
          reason: 'rawValue does not decode data URIs',
        );
      });

      test('can set at runtime', () {
        final value = Uri.dataFromString('Hello World').toString();
        context.put(key, value);
        expect(context.get(key), 'Hello World');
        expect(
          key.rawValue(context),
          value,
          reason: 'rawValue does not decode data URIs',
        );
      });
    });
  });
}
