import 'package:celest_core/src/native/android/jni_bindings.ffi.dart';
import 'package:celest_core/src/storage/secure/secure_storage_platform.vm.dart';
import 'package:jni/jni.dart';

final class SecureStoragePlatformAndroid extends SecureStoragePlatform {
  SecureStoragePlatformAndroid({
    required this.scope,
  }) : super.base() {
    Jni.initDLApi();
  }

  final String scope;
  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());
  late final CelestSecureStorage _secureStorage =
      CelestSecureStorage(_mainActivity, scope.toJString());

  @override
  void clear() => _secureStorage.clear();

  @override
  String? delete(String key) {
    final value = _secureStorage.delete(key.toJString());
    if (value.isNull) {
      return null;
    }
    return value.toDartString();
  }

  @override
  String? read(String key) {
    final value = _secureStorage.read(key.toJString());
    if (value.isNull) {
      return null;
    }
    return value.toDartString();
  }

  @override
  String write(String key, String value) {
    _secureStorage.write(key.toJString(), value.toJString());
    return value;
  }
}
