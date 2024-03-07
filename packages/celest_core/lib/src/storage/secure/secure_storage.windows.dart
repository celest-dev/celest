import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:celest_core/src/native/windows/windows_paths.dart';
import 'package:celest_core/src/storage/secure/secure_storage_exception.dart';
import 'package:celest_core/src/storage/secure/secure_storage_platform.vm.dart';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as p;
import 'package:win32/win32.dart';

final class SecureStoragePlatformWindows extends SecureStoragePlatform {
  SecureStoragePlatformWindows({
    required this.scope,
  }) : super.base();

  final String scope;
  late final File _storage = File(
    p.join(PathProviderWindows.getApplicationSupportPath()!, '$scope.json'),
  );

  Map<String, String> _readData() {
    if (!_storage.existsSync()) {
      return {};
    }
    return (jsonDecode(_storage.readAsStringSync()) as Map).cast();
  }

  void _writeData(Map<String, String> data) {
    if (!_storage.existsSync()) {
      _storage.createSync(recursive: true);
    }
    _storage.writeAsStringSync(jsonEncode(data));
  }

  @override
  void clear() {
    if (_storage.existsSync()) {
      _storage.deleteSync();
    }
  }

  @override
  String? delete(String key) {
    final data = _readData();
    final value = data.remove(key);
    _writeData(data);
    return value;
  }

  @override
  String? read(String key) {
    final value = _readData()[key];
    if (value == null) {
      return null;
    }
    return _decrypt(value);
  }

  @override
  String write(String key, String value) {
    final encrypted = _encrypt(value);
    final data = _readData()..[key] = encrypted;
    _writeData(data);
    return value;
  }

  WindowsException get _lastException =>
      WindowsException(HRESULT_FROM_WIN32(GetLastError()));

  /// A wrapper around [CryptProtectData] for encrypting [Uint8List].
  String _encrypt(String value) {
    return using((Arena arena) {
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
      final err = GetLastError();
      if (err != ERROR_SUCCESS) {
        throw SecureStorageUnknownException(_lastException.toString());
      }
      final encryptedBlob = encryptedPtr.ref;
      final encryptedBytes =
          encryptedBlob.pbData.asTypedList(encryptedBlob.cbData);
      return base64Encode(encryptedBytes);
    });
  }

  /// A wrapper around [CryptUnprotectData] for decrypting a blob.
  String _decrypt(String value) {
    return using((Arena arena) {
      final data = base64Decode(value);
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
      final err = GetLastError();
      if (err != ERROR_SUCCESS) {
        throw SecureStorageUnknownException(_lastException.toString());
      }
      final unencryptedDataBlob = unencryptedPtr.ref;
      final unencryptedBlob = unencryptedDataBlob.pbData.asTypedList(
        unencryptedDataBlob.cbData,
      );
      return utf8.decode(unencryptedBlob);
    });
  }
}

extension on Uint8List {
  /// Alternative to [allocatePointer] from win32, which uses an [Arena].
  Pointer<Uint8> allocatePointerInArena(Arena arena) {
    final ptr = arena<Uint8>(length);
    ptr.asTypedList(length).setAll(0, this);
    return ptr;
  }
}
