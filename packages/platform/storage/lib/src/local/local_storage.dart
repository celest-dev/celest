import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/local/local_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:native_storage/src/local/local_storage_platform.web.dart';

/// {@template native_storage.native_local_storage}
/// Provides app-local storage of key-value pairs.
///
/// The values written to this storage are persisted across app reloads for
/// the lifetime of the app on the end user's device. Unlike
/// [NativeSecureStorage], which may persist values after an app is
/// uninstalled, values written to this storage are guaranteed to be removed
/// when the app is no longer present on the device.
/// {@endtemplate}
abstract interface class NativeLocalStorage implements NativeStorage {
  /// {@macro native_storage.native_local_storage}
  factory NativeLocalStorage({
    String? namespace,
    String? scope,
  }) = NativeLocalStoragePlatform;

  @override
  NativeLocalStorage scoped(String scope);
}
