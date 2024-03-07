import 'package:celest_core/src/secure_storage/secure_storage.dart';

final class SecureStoragePlatform implements SecureStorage {
  SecureStoragePlatform({
    String? scope,
  }) : _impl = MemorySecureStorage(scope: scope ?? _defaultScope);

  final SecureStorage _impl;

  static const _defaultScope = 'dev.celest.celest';

  @override
  void clear() => _impl.clear();

  @override
  String? delete(String key) => _impl.delete(key);

  @override
  String? read(String key) => _impl.read(key);

  @override
  String write(String key, String value) => _impl.write(key, value);
}
