import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/local/local_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:platform_storage/src/local/local_storage_platform.web.dart';

/// {@template platform_storage.platform_local_storage}
/// Provides app-local storage of key-value pairs.
///
/// The values written to this storage are persisted across app reloads for
/// the lifetime of the app on the end user's device. Unlike
/// [PlatformSecureStorage], which may persist values after an app is
/// uninstalled, values written to this storage are guaranteed to be removed
/// when the app is no longer present on the device.
/// {@endtemplate}
abstract interface class PlatformLocalStorage implements PlatformStorage {
  /// {@macro platform_storage.platform_local_storage}
  factory PlatformLocalStorage({
    required String namespace,
    String? scope,
  }) {
    if (namespace.contains('/')) {
      throw ArgumentError.value(
        namespace,
        'namespace',
        'must not contain a path separator character (`/`)',
      );
    }
    if (scope != null && scope.contains('/')) {
      throw ArgumentError.value(
        scope,
        'scope',
        'must not contain a path separator character (`/`)',
      );
    }
    return LocalStoragePlatform(namespace: namespace, scope: scope);
  }

  @override
  PlatformLocalStorage scoped(String scope);
}
