import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/secure/secure_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:native_storage/src/secure/secure_storage_platform.web.dart';

/// {@template native_storage.native_secure_storage}
/// Provides platform-specific secure storage, typically using the OS's secure
/// keychain or keystore.
///
/// On Web, this returns a [NativeMemoryStorage] instance. No written values
/// will be persisted across page reloads.
/// {@endtemplate}
abstract interface class NativeSecureStorage implements NativeStorage {
  /// {@macro native_storage.native_secure_storage}
  factory NativeSecureStorage({
    String? namespace,
    String? scope,
  }) = NativeSecureStoragePlatform;

  @override
  NativeSecureStorage scoped(String scope);
}
