import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/secure/secure_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:platform_storage/src/secure/secure_storage_platform.web.dart';

/// {@template platform_storage.platform_secure_storage}
/// Provides platform-specific secure storage, typically using the OS's secure
/// keychain or keystore.
///
/// On Web, this returns a [PlatformMemoryStorage] instance. No written values
/// will be persisted across page reloads.
/// {@endtemplate}
abstract interface class PlatformSecureStorage implements PlatformStorage {
  /// {@macro platform_storage.platform_secure_storage}
  factory PlatformSecureStorage({
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
    return SecureStoragePlatform(namespace: namespace, scope: scope);
  }

  @override
  PlatformSecureStorage scoped(String scope);
}
