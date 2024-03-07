import 'package:celest_core/src/storage/memory_storage.dart';
import 'package:celest_core/src/storage/secure/secure_storage.dart';

extension type SecureStoragePlatform._(SecureStorage _impl)
    implements SecureStorage {
  SecureStoragePlatform({String? scope})
      : _impl = MemoryStorage(scope: scope ?? _defaultScope);

  static const _defaultScope = 'dev.celest.celest';
}
