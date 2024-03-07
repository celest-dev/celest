import 'package:celest_core/src/secure_storage/secure_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/secure_storage/secure_storage_platform.web.dart';

abstract interface class SecureStorage {
  factory SecureStorage({String? scope}) = SecureStoragePlatform;

  String? read(String key);
  String write(String key, String value);
  String? delete(String key);
  void clear();
}

/// An in-memory implementation of [SecureStorage].
final class MemorySecureStorage implements SecureStorage {
  MemorySecureStorage({
    required this.scope,
  });

  final _storage = <String, String>{};
  final String scope;

  @override
  void clear() => _storage.removeWhere((key, _) => key.startsWith('$scope/'));

  @override
  String? delete(String key) => _storage.remove('$scope/$key');

  @override
  String? read(String key) => _storage['$scope/$key'];

  @override
  String write(String key, String value) => _storage['$scope/$key'] = value;
}
