import 'package:celest_auth/src/native/android/jni_bindings.ffi.dart';
import 'package:celest_auth/src/storage/secure_storage.dart';
import 'package:jni/jni.dart';

final class SecureStoragePlatformAndroid extends SecureStoragePlatform {
  SecureStoragePlatformAndroid() : super.base() {
    Jni.initDLApi();
  }

  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());
  late final CelestSecureStorage _secureStorage =
      CelestSecureStorage(_mainActivity);

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
  String? read(String key) =>
      _secureStorage.read(key.toJString()).toDartString();

  @override
  Map<String, String> readAll() => _secureStorage.readAll().map(
        (key, value) => MapEntry(key.toDartString(), value.toDartString()),
      );

  @override
  String write(String key, String value) {
    _secureStorage.write(key.toJString(), value.toJString());
    return value;
  }
}
