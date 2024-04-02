import 'package:jni/jni.dart';
import 'package:platform_storage/src/native/android/android.dart';
import 'package:platform_storage/src/secure/secure_storage_platform.vm.dart';

final class SecureStoragePlatformAndroid extends SecureStoragePlatform {
  SecureStoragePlatformAndroid({
    String? namespace,
    super.scope,
  })  : _namespace = namespace,
        super.base();

  final String? _namespace;

  @override
  String get namespace => _namespace ?? android.packageName;

  late final _storage = android.secureStorage(namespace, scope);

  @override
  void clear() => _storage.clear();

  @override
  String? delete(String key) {
    final value = _storage.delete(key.toJString());
    if (value.isNull) {
      return null;
    }
    return value.toDartString();
  }

  @override
  String? read(String key) {
    final value = _storage.read(key.toJString());
    if (value.isNull) {
      return null;
    }
    return value.toDartString();
  }

  @override
  String write(String key, String value) {
    _storage.write(key.toJString(), value.toJString());
    return value;
  }
}
