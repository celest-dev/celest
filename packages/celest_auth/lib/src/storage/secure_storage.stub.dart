import 'dart:collection';

import 'package:celest_auth/src/storage/secure_storage.dart';

/// An in-memory implementation of [SecureStoragePlatform] for platforms which
/// do not support secure storage.
final class SecureStoragePlatformStub extends SecureStoragePlatform {
  SecureStoragePlatformStub() : super.base();

  final _storage = <String, String>{};

  @override
  void clear() => _storage.clear();

  @override
  String? delete(String key) => _storage.remove(key);

  @override
  String? read(String key) => _storage[key];

  @override
  Map<String, String> readAll() => UnmodifiableMapView(_storage);

  @override
  String write(String key, String value) => _storage[key] = value;
}
