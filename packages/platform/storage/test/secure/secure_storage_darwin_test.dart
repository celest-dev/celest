@TestOn('mac-os')

import 'package:native_storage/src/native/darwin/security.ffi.dart';
import 'package:native_storage/src/secure/secure_storage.darwin.dart';
import 'package:test/test.dart';

void main() {
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
