import 'package:native_storage/src/memory_storage.dart';
import 'package:native_storage/src/secure/secure_storage.dart';

extension type NativeSecureStoragePlatform._(NativeSecureStorage _impl)
    implements NativeSecureStorage {
  NativeSecureStoragePlatform({String? namespace, String? scope})
      : _impl = NativeMemoryStorage(namespace: namespace, scope: scope);
}
