import 'dart:math';

import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/native_storage_extended.dart';
import 'package:test/test.dart';

void sharedTests(String name, NativeStorageExtendedFactory factory) {
  group(name, () {
    const allowedNamespaces = [null, 'com.domain.myapp'];
    const allowedScopes = [null, 'scope', 'scope1/scope2'];
    for (final namespace in allowedNamespaces) {
      for (final scope in allowedScopes) {
        group('namespace=$namespace', () {
          group('scope=$scope', () {
            late String key;
            late final storage = factory(namespace: namespace, scope: scope);

            setUp(() {
              storage.clear();
              // Add some randomness to prevent overlap between concurrent tests.
              key = _randomString(10);
            });

            tearDownAll(() {
              storage.clear();
              storage.close();
            });

            group('write', () {
              test('writes a new key-value pair to storage', () {
                storage.write(key, 'value');
                expect(storage.read(key), 'value');

                expect(storage.allKeys, equals([key]));
              });

              test('updates the value for an existing key', () {
                storage.write(key, 'write');
                expect(storage.read(key), 'write', reason: 'Value was written');

                storage.write(key, 'update');
                expect(storage.read(key), 'update',
                    reason: 'Value was updated');

                expect(storage.allKeys, equals([key]));
              });
            });

            group('read', () {
              test('can read a non-existent key', () {
                expect(storage.read(key), isNull);
                expect(storage.allKeys, isEmpty);
              });
            });

            group('delete', () {
              test('removes the key if it exists', () {
                storage.write(key, 'delete');
                expect(storage.read(key), 'delete',
                    reason: 'Value was written');
                expect(storage.allKeys, equals([key]));

                storage.delete(key);
                expect(storage.read(key), isNull, reason: 'Value was deleted');
                expect(storage.allKeys, isEmpty);
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
                expect(storage.allKeys, unorderedEquals([key1, key2]));

                storage.clear();

                expect(
                  storage.read(key1),
                  isNull,
                  reason: 'Storage was cleared',
                );
                expect(
                  storage.read(key2),
                  isNull,
                  reason: 'Storage was cleared',
                );
                expect(storage.allKeys, isEmpty);
              });

              test('does not throw when no items present', () {
                expect(storage.clear, returnsNormally);
              });
            });

            group('large values', () {
              for (final (length, s) in _largeKeyValuePairs) {
                test('can store key/value with length $length', () {
                  storage.write('large', s);
                  expect(storage.read('large'), s, reason: 'Value was written');

                  storage.delete('large');
                  expect(storage.read('large'), isNull,
                      reason: 'Value was deleted');
                });
              }
            });

            group('isolated', () {
              late String key;
              late final isolated = storage.isolated;

              setUp(() async {
                await isolated.clear();
                // Add some randomness to prevent overlap between concurrent tests.
                key = _randomString(10);
              });

              tearDownAll(() async {
                await isolated.clear();
                await isolated.close();
              });

              test(
                'shares with non-isolated storage',
                // The NativeMemoryStorage does not share.
                skip: storage is NativeMemoryStorage,
                () async {
                  storage.write(key, 'value');
                  expect(await isolated.read(key), 'value');

                  await isolated.write(key, 'isolated');
                  expect(storage.read(key), 'isolated');

                  await isolated.clear();
                  expect(storage.read(key), isNull);
                },
              );

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
                    final key = 'large-$length';
                    await isolated.write(key, s);
                    expect(await isolated.read(key), s,
                        reason: 'Value was written');

                    await isolated.delete(key);
                    expect(await isolated.read(key), isNull,
                        reason: 'Value was deleted');
                  });
                }
              });
            });
          });
        });
      }
    }

    test('parent clears child', () {
      final parent = factory(namespace: 'com.domain', scope: 'scope');
      final child = parent.scoped('child');

      parent.write('key', 'parentValue');
      child.write('key', 'childValue');

      expect(parent.read('key'), 'parentValue');
      expect(child.read('key'), 'childValue');

      expect(parent.allKeys, unorderedEquals(['key', 'child/key']));
      expect((child as NativeStorageExtended).allKeys, ['key']);

      parent.clear();

      expect(parent.read('key'), isNull);
      expect(child.read('key'), isNull);

      expect(parent.allKeys, isEmpty);
      expect(child.allKeys, isEmpty);
    });

    test('child does not clear parent', () {
      final parent = factory(namespace: 'com.domain', scope: 'scope');
      final child = parent.scoped('child');

      parent.write('key', 'parentValue');
      child.write('key', 'childValue');

      expect(parent.read('key'), 'parentValue');
      expect(child.read('key'), 'childValue');

      expect(parent.allKeys, unorderedEquals(['key', 'child/key']));
      expect((child as NativeStorageExtended).allKeys, ['key']);

      child.clear();

      expect(parent.read('key'), 'parentValue');
      expect(child.read('key'), isNull);

      expect(parent.allKeys, ['key']);
      expect(child.allKeys, isEmpty);

      parent.clear();
    });
  });
}

final _random = Random();

String _randomString(int length) {
  const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final buf = StringBuffer();
  for (var i = 0; i < length; i++) {
    buf.write(charset[_random.nextInt(charset.length)]);
  }
  return buf.toString();
}

Iterable<(int, String)> get _largeKeyValuePairs sync* {
  for (final length in const [100, 1000]) {
    final string = _randomString(length);
    yield (length, string);
  }
}
