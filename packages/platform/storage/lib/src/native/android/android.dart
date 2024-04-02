import 'package:jni/jni.dart';
import 'package:platform_storage/src/native/android/jni_bindings.ffi.dart';

final android = AndroidCommon._();

final class AndroidCommon {
  AndroidCommon._() {
    Jni.initDLApi();
  }

  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());

  late final String packageName =
      Context.fromRef(_mainActivity.reference).getPackageName().toDartString();

  PlatformLocalStorage localStorage(String namespace, String? scope) =>
      PlatformLocalStorage.new1(
        _mainActivity,
        namespace.toJString(),
        scope?.toJString() ?? JString.fromRef(nullptr),
      );

  PlatformSecureStorage secureStorage(String namespace, String? scope) =>
      PlatformSecureStorage.new1(
        _mainActivity,
        namespace.toJString(),
        scope?.toJString() ?? JString.fromRef(nullptr),
      );
}
