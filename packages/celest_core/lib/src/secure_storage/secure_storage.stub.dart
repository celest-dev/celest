import 'package:celest_core/src/secure_storage/secure_storage_platform.web.dart';

/// An in-memory implementation of [SecureStoragePlatform] for platforms which
/// do not support secure storage.
final class SecureStoragePlatformStub extends SecureStoragePlatform {
  SecureStoragePlatformStub({
    required this.scope,
  }) : super.base();

  final _storage = <String, String>{};
  final String scope;

  @override
  void clear() => _storage.removeWhere((key, _) => key.startsWith('$scope:'));

  @override
  String? delete(String key) => _storage.remove('$scope:$key');

  @override
  String? read(String key) => _storage['$scope:$key'];

  @override
  String write(String key, String value) => _storage['$scope:$key'] = value;
}
