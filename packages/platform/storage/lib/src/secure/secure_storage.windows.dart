// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/native/windows/windows.dart';
import 'package:platform_storage/src/secure/secure_storage_platform.vm.dart';
import 'package:platform_storage/src/util/json.dart';
import 'package:win32/win32.dart';

final class SecureStoragePlatformWindows extends SecureStoragePlatform {
  SecureStoragePlatformWindows({
    String? namespace,
    super.scope,
  }) : super.base();

  @override
  String get namespace => windows.applicationId ?? '';

  WindowsException get _lastException =>
      WindowsException(HRESULT_FROM_WIN32(GetLastError()));

  late final _prefix = scope == null ? '$namespace/' : '$namespace$scope/';
  String _scopedKey(String key) => '$_prefix$key';

  @override
  String? read(String key) => using((arena) {
        final targetName = TEXT(_scopedKey(key));
        final credential = arena<Pointer<CREDENTIAL>>();
        final status = CredRead(
          targetName,
          CRED_TYPE.CRED_TYPE_GENERIC,
          0, // Currently reserved and must be zero.
          credential,
        );
        arena.onReleaseAll(() => CredFree(credential.value));
        if (status == WIN32_ERROR.ERROR_NOT_FOUND) {
          return null;
        }
        if (FAILED(status)) {
          throw PlatformStorageException(_lastException.toString());
        }
        final size = credential.value.ref.CredentialBlobSize;
        final blob = credential.value.ref.CredentialBlob;
        final bytes = Uint8List(size);
        for (var i = 0; i < size; i++) {
          bytes[i] = blob[i];
        }
        return utf8.decode(bytes);
      });

  @override
  String write(String key, String value) => using((arena) {
        final targetName = TEXT(_scopedKey(key));
        final blob = utf8.encode(value);
        final credential = arena<CREDENTIAL>();
        credential.ref
          ..TargetName = targetName
          ..Type = CRED_TYPE.CRED_TYPE_GENERIC
          ..Persist = CRED_PERSIST.CRED_PERSIST_LOCAL_MACHINE
          ..CredentialBlobSize = blob.length
          ..CredentialBlob = blob.allocatePointer();
        arena.onReleaseAll(() => CredFree(credential));
        final status = CredWrite(
          credential,
          0, // Currently reserved and must be zero.
        );
        if (FAILED(status)) {
          throw PlatformStorageException(_lastException.toString());
        }
        return value;
      });

  @override
  String? delete(String key) => using((arena) {
        final current = read(key);
        if (current == null) {
          return null;
        }
        final targetName = TEXT(_scopedKey(key));
        final status = CredDelete(
          targetName,
          CRED_TYPE.CRED_TYPE_GENERIC,
          0, // Currently reserved and must be zero.
        );
        if (FAILED(status)) {
          throw PlatformStorageException(_lastException.toString());
        }
        return current;
      });

  @override
  void clear() => using((arena) {
        final filter = TEXT(_prefix);
        final count = arena<Uint32>();
        final credentials = arena<Pointer<CREDENTIAL>>();
        final status = CredEnumerate(
          filter,
          0, // Currently reserved and must be zero.
          count,
          credentials,
        );
        if (status == WIN32_ERROR.ERROR_NOT_FOUND) {
          // No credentials found for the filter.
          return;
        }
        if (FAILED(status)) {
          throw PlatformStorageException(_lastException.toString());
        }
        final failures = <String, String>{};
        for (var i = 0; i < count.value; i++) {
          final credential = credentials.value[i];
          final status = CredDelete(
            credential.TargetName,
            CRED_TYPE.CRED_TYPE_GENERIC,
            0, // Currently reserved and must be zero.
          );
          if (FAILED(status)) {
            failures[credential.TargetAlias.toDartString()] =
                _lastException.toString();
          }
        }
        if (failures.isNotEmpty) {
          throw PlatformStorageException(
            'Failed to delete some credentials: ${prettyJson(failures)}',
          );
        }
      });
}

/// The CredDelete function deletes a credential from the user's credential
/// set. The credential set used is the one associated with the logon
/// session of the current token. The token must not have the user's SID
/// disabled.
///
/// ```c
/// BOOL CredDeleteW(
///   LPCWSTR TargetName,
///   DWORD   Type,
///   DWORD   Flags
/// );
/// ```
/// {@category advapi32}
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
        Pointer<Pointer<CREDENTIAL>> Credential)>('CredDeleteW');

final _advapi32 = DynamicLibrary.open('advapi32.dll');
