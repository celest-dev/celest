// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/native/windows/windows.dart';
import 'package:platform_storage/src/secure/secure_storage_platform.vm.dart';
import 'package:platform_storage/src/util/functional.dart';
import 'package:win32/win32.dart';
import 'package:win32_registry/win32_registry.dart';

final class SecureStoragePlatformWindows extends SecureStoragePlatform {
  SecureStoragePlatformWindows({
    String? namespace,
    super.scope,
  })  : _namespace = namespace,
        super.base();

  final String? _namespace;

  @override
  String get namespace => _namespace ?? windows.applicationId;

  WindowsException _windowsException(int hr) =>
      WindowsException(HRESULT_FROM_WIN32(hr));

  late final _registry = lazy(() {
    final hkcu = Registry.currentUser;
    final rootKey = hkcu
        .createKey('SOFTWARE\\Classes\\Local Settings\\Software\\$namespace');
    if (scope case final scope?) {
      return rootKey.createKey(scope);
    }
    return rootKey;
  });

  @override
  String? read(String key) {
    return using((arena) {
      final value = _registry.getValueAsString(key);
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
      _registry.createValue(
        RegistryValue(key, RegistryValueType.string, encrypted),
      );
      return value;
    });
  }

  @override
  String? delete(String key) {
    final current = read(key);
    if (current == null) {
      return null;
    }
    _registry.deleteValue(key);
    return current;
  }

  @override
  void clear() {
    for (final value in List.of(_registry.values)) {
      _registry.deleteValue(value.name);
    }
    for (final subkey in List.of(_registry.subkeyNames)) {
      _registry.deleteKey(subkey, recursive: true);
    }
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
      throw PlatformStorageException(_windowsException(hr).toString());
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
      throw PlatformStorageException(_windowsException(hr).toString());
    }
    final unencryptedDataBlob = unencryptedPtr.ref;
    final unencryptedBlob = unencryptedDataBlob.pbData.asTypedList(
      unencryptedDataBlob.cbData,
    );
    arena.onReleaseAll(() => LocalFree(unencryptedDataBlob.pbData));
    return utf8.decode(unencryptedBlob);
  }
}

/// https://learn.microsoft.com/en-us/windows/win32/api/wincred/ns-wincred-credentialw
const CRED_MAX_CREDENTIAL_BLOB_SIZE = 5 * 512;

/// https://learn.microsoft.com/en-us/windows/win32/api/wincred/nf-wincred-credenumeratew
int CredEnumerate(
  Pointer<Utf16> TargetName,
  int Flags,
  Pointer<Uint32> Count,
  Pointer<Pointer<CREDENTIAL>> Credential,
) =>
    _CredEnumerate(TargetName, Flags, Count, Credential);

final _CredEnumerate = _advapi32.lookupFunction<
    Int32 Function(Pointer<Utf16> TargetName, Uint32 Flags,
        Pointer<Uint32> Count, Pointer<Pointer<CREDENTIAL>> Credential),
    int Function(Pointer<Utf16> TargetName, int Flags, Pointer<Uint32> Count,
        Pointer<Pointer<CREDENTIAL>> Credential)>('CredEnumerateW');

final _advapi32 = DynamicLibrary.open('advapi32.dll');

extension on Uint8List {
  /// Alternative to [allocatePointer] from win32, which uses an [Arena].
  Pointer<Uint8> allocatePointerInArena(Arena arena) {
    final ptr = arena<Uint8>(length);
    ptr.asTypedList(length).setRange(0, length, this);
    return ptr;
  }
}
