import 'package:jni/jni.dart';
import 'package:platform_storage/src/local/local_storage_platform.vm.dart';
import 'package:platform_storage/src/native/android/jni_bindings.ffi.dart';

final class LocalStoragePlatformAndroid extends LocalStoragePlatform {
  LocalStoragePlatformAndroid({
    required super.namespace,
    super.scope,
  }) : super.base() {
    Jni.initDLApi();
  }

  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());
  late final PlatformLocalStorage _secureStorage = PlatformLocalStorage.new1(
    _mainActivity,
    namespace.toJString(),
    scope?.toJString() ?? JString.fromRef(nullptr),
  );

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

  @override
  void close() {
    _mainActivity.release();
    _secureStorage.release();
    super.close();
  }
}
