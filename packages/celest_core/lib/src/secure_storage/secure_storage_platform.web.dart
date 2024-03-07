import 'package:celest_core/src/secure_storage/secure_storage.dart';

extension type SecureStoragePlatform._(SecureStorage _impl)
    implements SecureStorage {
  SecureStoragePlatform({String? scope})
      : _impl = MemorySecureStorage(scope: scope ?? _defaultScope);

  static const _defaultScope = 'dev.celest.celest';
}
