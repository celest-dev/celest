import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/native/windows/winrt/passwordcredential.dart';
import 'package:platform_storage/src/native/windows/winrt/passwordvault.dart';
import 'package:platform_storage/src/secure/secure_storage_platform.vm.dart';
import 'package:win32/win32.dart';

final class SecureStoragePlatformWindows extends SecureStoragePlatform {
  SecureStoragePlatformWindows({
    required super.namespace,
    super.scope,
  }) : super.base();

  // https://github.com/microsoft/Windows-universal-samples/blob/bb470280e493a888d98ac367edf3b85f8c053c4f/Samples/PasswordVault/cs/Scenario2_Manage.xaml.cs#L25
  static const int _elementNotFound = 0x80070490;

  late final _vault = PasswordVault();
  late final _resource = scope == null ? namespace : '$namespace.$scope';

  @override
  String? read(String key) {
    try {
      final credential = _vault.retrieve(_resource, key);
      if (credential == null) {
        return null;
      }
      credential.retrievePassword();
      return credential.password;
    } on WindowsException catch (e, st) {
      if (e.hr == _elementNotFound) {
        return null;
      }
      Error.throwWithStackTrace(
        PlatformStorageUnknownException(e.toString()),
        st,
      );
    }
  }

  @override
  String write(String key, String value) {
    try {
      final credential = PasswordCredential.createPasswordCredential(
        _resource,
        key,
        value,
      );
      _vault.add(credential);
      return value;
    } on WindowsException catch (e, st) {
      Error.throwWithStackTrace(
        PlatformStorageUnknownException(e.toString()),
        st,
      );
    }
  }

  @override
  String? delete(String key) {
    try {
      final credential = _vault.retrieve(_resource, key);
      if (credential == null) {
        return null;
      }
      final password = credential.password;
      _vault.remove(credential);
      return password;
    } on WindowsException catch (e, st) {
      if (e.hr == _elementNotFound) {
        return null;
      }
      Error.throwWithStackTrace(
        PlatformStorageUnknownException(e.toString()),
        st,
      );
    }
  }

  @override
  void clear() {
    try {
      final credentials = _vault.findAllByResource(_resource);
      for (final credential in credentials) {
        _vault.remove(credential);
      }
    } on WindowsException catch (e, st) {
      Error.throwWithStackTrace(
        PlatformStorageUnknownException(e.toString()),
        st,
      );
    }
  }
}
