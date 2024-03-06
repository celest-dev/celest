@TestOn('mac-os')

import 'package:celest_core/src/native/darwin/security.ffi.dart';
import 'package:celest_core/src/secure_storage/secure_storage.dart';
import 'package:celest_core/src/secure_storage/secure_storage.darwin.dart';
import 'package:test/test.dart';

const key1 = 'key1';
const key2 = 'key2';
const value1 = 'value1';
const value2 = 'value2';

void main() {
  group('SecureStorage', () {
    group('macos', () {
      group('clear', () {
        final storage = SecureStorage(scope: 'clear');

        setUp(() {
          storage.clear();
        });

        tearDown(() {
          storage.clear();
        });

        test('removes all keys from storage', () {
          // seed storage and confirm values are present
          storage
            ..write(key1, value1)
            ..write(key2, value2);
          expect(storage.read(key1), value1);
          expect(storage.read(key2), value2);

          // remove all
          storage.clear();

          // assert all data was removed
          expect(storage.read(key1), isNull);
          expect(storage.read(key2), isNull);
        });

        test('does not throw when no items present', () {
          expect(storage.clear, returnsNormally);
        });
      });
    });
  });

  group('SecurityFrameworkException', () {
    test('errSecInvalidOwnerEdit', () {
      final error = SecurityFrameworkException.fromStatus(
        errSecInvalidOwnerEdit,
      );
      expect(
        error.message,
        'Invalid attempt to change the owner of this item.',
      );
    });

    test('no error', () {
      final error = SecurityFrameworkException.fromStatus(errSecSuccess);
      expect(error.message, 'No error.');
    });

    test('invalid code', () {
      const invalidCode = 1 << 20;
      final error = SecurityFrameworkException.fromStatus(invalidCode);
      expect(error.message, 'OSStatus $invalidCode');
    });
  });
}
