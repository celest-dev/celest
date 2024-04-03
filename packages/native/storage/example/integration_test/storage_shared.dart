import 'dart:math';

import 'package:native_storage/native_storage.dart';
import 'package:test/test.dart';

void sharedTests(String name, NativeStorageFactory factory) {
  group(name, () {
    const allowedNamespaces = ['com.domain.scope'];
    for (final namespace in allowedNamespaces) {
      late String key;
      final storage = factory(namespace: namespace);

      setUp(() {
        storage.clear();
        // Add some randomness to prevent overlap between concurrent tests.
        key = String.fromCharCodes(
          List.generate(10, (_) => _random.nextInt(255) + 1),
        );
      });

      tearDownAll(() {
        storage.clear();
        storage.close();
      });

      group('namespace=$namespace', () {
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
            expect(storage.read(key), isNull);
            expect(() => storage.delete(key), returnsNormally);
          });
        });

        group('clear', () {
          const key1 = 'key1';
          const key2 = 'key2';
          const value1 = 'value1';
          const value2 = 'value2';

          test('removes all keys from storage', () {
            storage.write(key1, value1);
            storage.write(key2, value2);
            expect(storage.read(key1), value1);
            expect(storage.read(key2), value2);

            storage.clear();

            expect(storage.read(key1), isNull, reason: 'Storage was cleared');
            expect(storage.read(key2), isNull, reason: 'Storage was cleared');
          });

          test('does not throw when no items present', () {
            expect(storage.clear, returnsNormally);
          });
        });

        group('large values', () {
          for (final (length, s) in _largeKeyValuePairs) {
            test('can store key/value with length $length', () {
              storage.write(s, s);
              expect(storage.read(s), s, reason: 'Value was written');

              storage.delete(s);
              expect(storage.read(s), isNull, reason: 'Value was deleted');
            });
          }
        });

        group('isolated', () {
          late String key;
          final isolated = storage.isolated;

          setUp(() async {
            await isolated.clear();
            // Add some randomness to prevent overlap between concurrent tests.
            key = String.fromCharCodes(
              List.generate(10, (_) => _random.nextInt(255) + 1),
            );
          });

          tearDownAll(() async {
            await isolated.clear();
            await isolated.close();
          });

          group('write', () {
            test('writes a new key-value pair to storage', () async {
              await isolated.write(key, 'value');
              expect(await isolated.read(key), 'value');
            });

            test('updates the value for an existing key', () async {
              await isolated.write(key, 'write');
              expect(await isolated.read(key), 'write',
                  reason: 'Value was written');

              await isolated.write(key, 'update');
              expect(await isolated.read(key), 'update',
                  reason: 'Value was updated');
            });
          });

          group('read', () {
            test('can read a non-existent key', () async {
              expect(await isolated.read(key), isNull);
            });
          });

          group('delete', () {
            test('removes the key if it exists', () async {
              await isolated.write(key, 'delete');
              expect(await isolated.read(key), 'delete',
                  reason: 'Value was written');

              await isolated.delete(key);
              expect(await isolated.read(key), isNull,
                  reason: 'Value was deleted');
            });

            test('can delete a non-existent key', () async {
              expect(await isolated.read(key), isNull);
              await expectLater(isolated.delete(key), completes);
            });
          });

          group('clear', () {
            const key1 = 'key1';
            const key2 = 'key2';
            const value1 = 'value1';
            const value2 = 'value2';

            test('removes all keys from storage', () async {
              await isolated.write(key1, value1);
              await isolated.write(key2, value2);
              expect(await isolated.read(key1), value1);
              expect(await isolated.read(key2), value2);

              await isolated.clear();

              expect(await isolated.read(key1), isNull,
                  reason: 'Storage was cleared');
              expect(await isolated.read(key2), isNull,
                  reason: 'Storage was cleared');
            });

            test('does not throw when no items present', () async {
              await expectLater(isolated.clear(), completes);
            });
          });

          group('large values', () {
            for (final (length, s) in _largeKeyValuePairs) {
              test('can store key/value with length $length', () async {
                await isolated.write(s, s);
                expect(await isolated.read(s), s, reason: 'Value was written');

                await isolated.delete(s);
                expect(await isolated.read(s), isNull,
                    reason: 'Value was deleted');
              });
            }
          });
        });
      });
    }
  });
}

final _random = Random();
Iterable<(int, String)> get _largeKeyValuePairs sync* {
  for (final length in const [100, 1000]) {
    final string = String.fromCharCodes(
      List.generate(length, (_) => _random.nextInt(94) + 33),
    );
    yield (length, string);
  }
}
