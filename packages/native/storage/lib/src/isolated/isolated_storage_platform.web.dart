import 'package:native_storage/native_storage.dart';

/// The browser implementation of [IsolatedNativeStorage].
final class IsolatedNativeStoragePlatform implements IsolatedNativeStorage {
  IsolatedNativeStoragePlatform({
    required NativeStorageFactory factory,
    String? namespace,
    String? scope,
  }) : _impl = factory(
          namespace: namespace,
          scope: scope,
        );

  IsolatedNativeStoragePlatform.from(this._impl);

  final NativeStorage _impl;

  @override
  Future<void> clear() async {
    return _impl.clear();
  }

  @override
  Future<String?> delete(String key) async {
    return _impl.delete(key);
  }

  @override
  Future<String?> read(String key) async {
    return _impl.read(key);
  }

  @override
  Future<String> write(String key, String value) async {
    return _impl.write(key, value);
  }

  @override
  Future<void> close({bool force = false}) async {
    return _impl.close();
  }
}
