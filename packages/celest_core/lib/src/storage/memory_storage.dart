import 'package:celest_core/src/storage/secure/secure_storage.dart';
import 'package:celest_core/src/storage/storage.dart';

/// An in-memory implementation of [Storage] and [SecureStorage].
final class MemoryStorage implements Storage, SecureStorage {
  MemoryStorage({
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
