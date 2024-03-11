import 'dart:ffi';
import 'dart:io';

import 'package:celest_core/src/native/darwin/core_foundation.ffi.dart';
import 'package:celest_core/src/native/darwin/darwin_ffi_helpers.dart';
import 'package:celest_core/src/native/darwin/security.ffi.dart';
import 'package:celest_core/src/storage/secure/secure_storage_exception.dart';
import 'package:celest_core/src/storage/secure/secure_storage_platform.vm.dart';
import 'package:celest_core/src/util/globals.dart';
import 'package:ffi/ffi.dart';

final class SecureStoragePlatformDarwin extends SecureStoragePlatform {
  SecureStoragePlatformDarwin({
    required this.scope,
  }) : super.base();

  final String scope;
  static final _useDataProtection = Platform.isMacOS && kReleaseMode;

  Map<CFStringRef, Pointer> _baseQuery(Arena arena) {
    final service = scope.toCFString(arena);
    return {
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: service,
      if (_useDataProtection) kSecUseDataProtectionKeychain: kCFBooleanTrue,
    };
  }

  @override
  void clear() => using((arena) => _clear(arena: arena));

  @override
  String? delete(String key) => using((arena) {
        final current = _read(key, arena: arena);
        _delete(key, arena: arena);
        return current;
      });

  @override
  String? read(String key) => using((arena) => _read(key, arena: arena));

  @override
  String write(String key, String value) => using((arena) {
        _write(key, value, arena: arena);
        return value;
      });

  String? _read(String key, {required Arena arena}) {
    final attributes = _baseQuery(arena);
    final query = {
      ...attributes,
      kSecAttrAccount: key.toCFString(arena),
      kSecReturnData: kCFBooleanTrue,
      kSecMatchLimit: kSecMatchLimitOne,
      kSecReturnData: kCFBooleanTrue,
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
      // Required when `useDataProtection` is disabled, however can only be
      // passed on macOS. Passing it on iOS will fail.
      if (Platform.isMacOS && !_useDataProtection)
        kSecMatchLimit: kSecMatchLimitAll,
    };
    try {
      _check(() => SecItemDelete(query.toCFDictionary(arena)));
    } on SecureStorageItemNotFoundException {
      // OK. Keychain will throw this error if there are no items.
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

extension type SecurityFrameworkException(SecureStorageException exception)
    implements SecureStorageException {
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
