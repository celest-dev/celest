import 'package:jni/jni.dart';
import 'package:platform_storage/src/native/android/jni_bindings.ffi.dart';

final android = AndroidCommon._();

final class AndroidCommon {
  AndroidCommon._();

  // Must be getters so that they are fresh for each JNI call
  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());
  late final Context _mainActivityContext =
      Context.fromRef(_mainActivity.reference);

  late final String packageName =
      _mainActivityContext.getPackageName().toDartString();

  PlatformLocalStorage localStorage(String namespace, String? scope) {
    scope ??= ''; // Can't pass `null`
    return PlatformLocalStorage.new1(
      _mainActivityContext,
      namespace.toJString(),
      scope.toJString(),
    );
  }

  PlatformSecureStorage secureStorage(String namespace, String? scope) {
    scope ??= ''; // Can't pass `null`
    return PlatformSecureStorage.new1(
      _mainActivityContext,
      namespace.toJString(),
      scope.toJString(),
    );
  }
}
