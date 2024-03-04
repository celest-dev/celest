import 'dart:ffi';

import 'package:celest_auth/src/native/darwin/core_foundation.ffi.dart';
import 'package:celest_auth/src/native/darwin/darwin_ffi_helpers.dart';
import 'package:celest_auth/src/native/darwin/security.ffi.dart';
import 'package:celest_auth/src/storage/secure_storage.dart';
import 'package:celest_auth/src/storage/secure_storage_exception_impl.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:ffi/ffi.dart';
import 'package:os_detect/os_detect.dart' as os;

final class SecureStoragePlatformDarwin extends SecureStoragePlatform {
  SecureStoragePlatformDarwin() : super.base();

  static const _serviceName = 'dev.celest.celest_auth';
  static final _useDataProtection = os.isMacOS && kReleaseMode;

  Map<Pointer, Pointer> _baseAttributes(Arena arena) {
    final service = _serviceName.toCFString(arena);
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
  Map<String, String> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  String write(String key, String value) => using((arena) {
        _write(key, value, arena: arena);
        return value;
      });

  String? _read(String key, {required Arena arena}) {
    final attributes = _baseAttributes(arena);
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
      arena.onReleaseAll(() => CFRelease(data.cast()));
      return data.toDartString();
    } on SecureStorageItemNotFoundException {
      return null;
    } on Exception {
      // May happen if the data is not UTF-8 encoded or corrupted.
      throw const SecureStorageUnknownException();
    }
  }

  void _write(String key, String value, {required Arena arena}) {
    final query = {
      ..._baseAttributes(arena),
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
    return _check(
      () => SecItemAdd(attributes.toCFDictionary(arena), nullptr),
      key: key,
    );
  }

  void _delete(String key, {required Arena arena}) {
    final query = {
      ..._baseAttributes(arena),
      kSecAttrAccount: key.toCFString(arena),
    };
    _check(
      () => SecItemDelete(query.toCFDictionary(arena)),
      key: key,
    );
  }

  void _clear({required Arena arena}) {
    final query = {
      ..._baseAttributes(arena),
      // Required when `useDataProtection` is disabled, however can only be
      // passed on macOS. Passing it on iOS will result in a crash.
      if (os.isMacOS && !_useDataProtection) kSecMatchLimit: kSecMatchLimitAll,
    };
    _check(() => SecItemDelete(query.toCFDictionary(arena)));
  }
}

extension type SecurityFrameworkException(SecureStorageExceptionImpl exception)
    implements SecureStorageExceptionImpl {
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

void _check(
  int Function() action, {
  String? key,
}) {
  final status = action();
  if (status != errSecSuccess) {
    throw SecurityFrameworkException.fromStatus(status, key: key);
  }
}
