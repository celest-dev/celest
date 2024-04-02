import 'package:platform_storage/src/memory_storage.dart';
import 'package:platform_storage/src/secure/secure_storage.dart';

extension type SecureStoragePlatform._(PlatformSecureStorage _impl)
    implements PlatformSecureStorage {
  SecureStoragePlatform({String? namespace, String? scope})
      : _impl = PlatformMemoryStorage(namespace: namespace, scope: scope);
}
