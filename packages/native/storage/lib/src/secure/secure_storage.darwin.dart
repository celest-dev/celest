import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/native/darwin/core_foundation.ffi.dart';
import 'package:native_storage/src/native/darwin/darwin.dart';
import 'package:native_storage/src/native/darwin/darwin_ffi_helpers.dart';
import 'package:native_storage/src/native/darwin/security.ffi.dart';
import 'package:native_storage/src/secure/secure_storage_exception.dart';
import 'package:native_storage/src/secure/secure_storage_platform.vm.dart';
import 'package:native_storage/src/util/functional.dart';
import 'package:native_storage/src/util/globals.dart';
import 'package:path/path.dart' as p;

final class SecureStorageDarwin extends NativeSecureStoragePlatform {
  SecureStorageDarwin({
    String? namespace,
    super.scope,
  })  : _namespace = namespace,
        super.base();

  final String? _namespace;
  late final String _prefix = scope == null ? '' : '$scope/';
  String _scoped(String key) => '$_prefix$key';

  @override
  late final String namespace = lazy(() {
    return _namespace ??
        darwin.bundleIdentifier ??
        p.basenameWithoutExtension(Platform.resolvedExecutable);
  });

  Map<CFStringRef, Pointer> _baseQuery(Arena arena) {
    return {
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: namespace.toCFString(arena),
      if (darwin.useDataProtection)
        kSecUseDataProtectionKeychain: kCFBooleanTrue,
    };
  }

  @override
  void clear() => using((arena) => _clear(arena: arena));

  @override
  String? delete(String key) => using((arena) {
        final current = _read(_scoped(key), arena: arena);
        _delete(_scoped(key), arena: arena);
        return current;
      });

  @override
  String? read(String key) =>
      using((arena) => _read(_scoped(key), arena: arena));

  @override
  String write(String key, String value) => using((arena) {
        _write(_scoped(key), value, arena: arena);
        return value;
      });

  String? _read(String key, {required Arena arena}) {
    final attributes = _baseQuery(arena);
    final query = {
      ...attributes,
      kSecAttrAccount: key.toCFString(arena),
      kSecReturnData: kCFBooleanTrue,
      kSecMatchLimit: kSecMatchLimitOne,
    };
    try {
      final result = arena<CFTypeRef>();
      _check(
        () => SecItemCopyMatching(query.toCFDictionary(arena), result),
        key: key,
      );
      final data = result.value.cast<CFData>();
      if (data == nullptr) {
        return null;
      }
      arena.onReleaseAll(() => CFRelease(data.cast()));
      return data.toDartString();
    } on SecureStorageItemNotFoundException {
      return null;
    } on Exception catch (e, st) {
      // May happen if the data is not UTF-8 encoded or corrupted.
      Error.throwWithStackTrace(
        SecureStorageUnknownException(e.toString()),
        st,
      );
    }
  }

  void _write(String key, String value, {required Arena arena}) {
    final query = {
      ..._baseQuery(arena),
      kSecAttrAccount: key.toCFString(arena),
    };
    final gets = SecItemCopyMatching(query.toCFDictionary(arena), nullptr);
    if (gets != errSecSuccess && gets != errSecItemNotFound) {
      throw SecurityFrameworkException.fromStatus(gets, key: key);
    }
    final itemExists = gets == errSecSuccess;
    if (itemExists) {
      // Update the item.
      final attributes = {
        kSecValueData: value.toCFData(arena),
      };
      return _check(
        () => SecItemUpdate(
          query.toCFDictionary(arena),
          attributes.toCFDictionary(arena),
        ),
        key: key,
      );
    }
    // Else, add the item.
    final attributes = {
      ...query,
      kSecValueData: value.toCFData(arena),
    };
    _check(
      () => SecItemAdd(attributes.toCFDictionary(arena), nullptr),
      key: key,
    );
  }

  void _delete(String key, {required Arena arena}) {
    final query = {
      ..._baseQuery(arena),
      kSecAttrAccount: key.toCFString(arena),
    };
    try {
      _check(
        () => SecItemDelete(query.toCFDictionary(arena)),
        key: key,
      );
    } on SecureStorageItemNotFoundException {
      // OK. Keychain will throw this error if the item is not found.
    }
  }

  void _clear({required Arena arena}) {
    final query = {
      ..._baseQuery(arena),
      kSecReturnAttributes: kCFBooleanTrue,
      // Required when `useDataProtection` is disabled.
      if (!darwin.useDataProtection) kSecMatchLimit: kSecMatchLimitAll,
    };

    final result = arena<CFArrayRef>();
    try {
      // Find all keys for the namespace.
      _check(
        () => SecItemCopyMatching(query.toCFDictionary(arena), result.cast()),
      );
    } on SecureStorageItemNotFoundException {
      // OK. Keychain will throw this error if there are no items.
      return;
    }

    final items = result.value;
    assert(items != nullptr, 'items should not be null');
    for (var i = 0; i < CFArrayGetCount(items); i++) {
      final item = CFArrayGetValueAtIndex(items, i).cast<CFDictionary>();
      final itemKey = CFDictionaryGetValue(
        item,
        kSecAttrAccount.cast(),
      ).cast<CFString>().toDartString()!;
      if (scope == null || itemKey.startsWith(_prefix)) {
        // Use the item's primary key to avoid a bad lookup.
        final primaryKey = {
          kSecClass: kSecClassGenericPassword,
          kSecAttrService: namespace.toCFString(arena),
          kSecAttrAccount: itemKey.toCFString(arena),
        }.toCFDictionary(arena);
        _check(() => SecItemDelete(primaryKey), key: itemKey);
      }
    }
  }

  void _check(
    int Function() action, {
    String? key,
  }) {
    final status = action();
    if (status != errSecSuccess) {
      throw SecurityFrameworkException.fromStatus(status, key: key);
    }
  }
}

extension type SecurityFrameworkException(NativeStorageException exception)
    implements NativeStorageException {
  factory SecurityFrameworkException.fromStatus(int status, {String? key}) {
    if (kReleaseMode) {
      key = null;
    }
    final cfMessage = SecCopyErrorMessageString(status, nullptr);
    try {
      final message = cfMessage.toDartString();
      final exception = switch (status) {
        errSecItemNotFound =>
          SecureStorageItemNotFoundException(message: message),
        errSecDuplicateItem =>
          SecureStorageDuplicateItemException(message: message),
        errSecUserCanceled ||
        errSecAuthFailed ||
        errSecInteractionRequired =>
          SecureStorageAccessDeniedException(message: message),
        errSecMissingEntitlement => const SecureStorageAccessDeniedException(
            message: 'The app is missing the required entitlements',
          ),
        _ => SecureStorageUnknownException(message),
      };
      return SecurityFrameworkException(exception);
    } on Exception {
      return SecurityFrameworkException(
        SecureStorageUnknownException(
          'Unknown error occurred in Security.framework. Status: $status',
        ),
      );
    } finally {
      CFRelease(cfMessage.cast());
    }
  }
}
