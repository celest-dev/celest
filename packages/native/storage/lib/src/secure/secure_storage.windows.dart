import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/native/windows/windows.dart';
import 'package:native_storage/src/secure/secure_storage_platform.vm.dart';
import 'package:win32/win32.dart';
import 'package:win32_registry/win32_registry.dart';

final class SecureStorageWindows extends NativeSecureStoragePlatform
    with NativeStorageWindows {
  SecureStorageWindows({
    String? namespace,
    super.scope,
  })  : namespaceOverride = namespace,
        super.base();

  @override
  final String? namespaceOverride;

  WindowsException _windowsException(int hr) =>
      WindowsException(HRESULT_FROM_WIN32(hr));

  @override
  String? read(String key) {
    return using((arena) {
      final value = registry.getValueAsString(key);
      if (value == null) {
        return null;
      }
      return _decrypt(base64Decode(value), arena);
    });
  }

  @override
  String write(String key, String value) {
    return using((arena) {
      final encrypted = _encrypt(value, arena);
      registry.createValue(
        RegistryValue(key, RegistryValueType.string, encrypted),
      );
      return value;
    });
  }

  /// A wrapper around [CryptProtectData] for encrypting [Uint8List].
  String _encrypt(String value, Arena arena) {
    final bytes = utf8.encode(value);
    final blob = bytes.allocatePointerInArena(arena);
    final dataPtr = arena<CRYPT_INTEGER_BLOB>()
      ..ref.cbData = bytes.length
      ..ref.pbData = blob;
    final encryptedPtr = arena<CRYPT_INTEGER_BLOB>();
    CryptProtectData(
      dataPtr,
      nullptr, // no label
      nullptr, // no added entropy
      nullptr, // reserved
      nullptr, // no prompt
      0, // default flag
      encryptedPtr,
    );
    if (GetLastError() case final hr && != WIN32_ERROR.ERROR_SUCCESS) {
      throw NativeStorageException(_windowsException(hr).toString());
    }
    final encryptedBlob = encryptedPtr.ref;
    final encryptedBytes =
        encryptedBlob.pbData.asTypedList(encryptedBlob.cbData);
    arena.onReleaseAll(() => LocalFree(encryptedBlob.pbData));
    return base64Encode(encryptedBytes);
  }

  /// A wrapper around [CryptUnprotectData] for decrypting a blob.
  String _decrypt(Uint8List data, Arena arena) {
    final blob = data.allocatePointerInArena(arena);
    final dataPtr = arena<CRYPT_INTEGER_BLOB>()
      ..ref.cbData = data.length
      ..ref.pbData = blob;
    final unencryptedPtr = arena<CRYPT_INTEGER_BLOB>();
    CryptUnprotectData(
      dataPtr,
      nullptr, // no label
      nullptr, // no added entropy
      nullptr, // reserved
      nullptr, // no prompt
      0, // default flag
      unencryptedPtr,
    );
    if (GetLastError() case final hr && != WIN32_ERROR.ERROR_SUCCESS) {
      throw NativeStorageException(_windowsException(hr).toString());
    }
    final unencryptedDataBlob = unencryptedPtr.ref;
    final unencryptedBlob = unencryptedDataBlob.pbData.asTypedList(
      unencryptedDataBlob.cbData,
    );
    arena.onReleaseAll(() => LocalFree(unencryptedDataBlob.pbData));
    return utf8.decode(unencryptedBlob);
  }
}

extension on Uint8List {
  /// Alternative to [allocatePointer] from win32, which uses an [Arena].
  Pointer<Uint8> allocatePointerInArena(Arena arena) {
    final ptr = arena<Uint8>(length);
    ptr.asTypedList(length).setRange(0, length, this);
    return ptr;
  }
}
