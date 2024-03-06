import 'dart:math';

import 'package:celest_core/src/secure_storage/secure_storage.dart';
import 'package:test/test.dart';

void sharedTests() {
  group('SecureStorage', () {
    late String key;
    final storage = SecureStorage(scope: 'test');

    setUp(() {
      storage.clear();
      // Add some randomness to prevent overlap between concurrent tests.
      key = String.fromCharCodes(
        List.generate(10, (_) => _random.nextInt(255) + 1),
      );
    });

    tearDownAll(() {
      storage.clear();
    });

    group('write', () {
      test('writes a new key-value pair to storage', () {
        storage.write(key, 'value');
        expect(storage.read(key), 'value');
      });

      test('updates the value for an existing key', () {
        storage.write(key, 'write');
        expect(storage.read(key), 'write', reason: 'Value was written');

        storage.write(key, 'update');
        expect(storage.read(key), 'update', reason: 'Value was updated');
      });
    });

    group('read', () {
      test('can read a non-existent key', () {
        expect(storage.read(key), isNull);
      });
    });

    group('delete', () {
      test('removes the key if it exists', () {
        storage.write(key, 'delete');
        expect(storage.read(key), 'delete', reason: 'Value was written');

        storage.delete(key);
        expect(storage.read(key), isNull, reason: 'Value was deleted');
      });

      test('can delete a non-existent key', () {
        expect(() => storage.delete(key), returnsNormally);
        expect(() => storage.delete(key), returnsNormally);
        expect(() => storage.delete(key), returnsNormally);
      });
    });

    group('read/write/delete can handle key value pairs of varying length', () {
      for (final (length, s) in largeKeyValuePairs) {
        test('can store key/value with length $length', () {
          storage.write(s, s);
          expect(storage.read(s), s, reason: 'Value was written');

          storage.delete(s);
          expect(storage.read(s), isNull, reason: 'Value was deleted');
        });
      }
    });
  });
}

final _random = Random();
Iterable<(int, String)> get largeKeyValuePairs sync* {
  for (final length in const [100, 1000, 10000]) {
    final string = String.fromCharCodes(
      List.generate(length, (_) => _random.nextInt(255) + 1),
    );
    yield (length, string);
  }
}
