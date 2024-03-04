import 'package:jni/jni.dart';

extension JObjectHelpers on JObject {
  bool instanceOf(JObjType type) {
    return Jni.env.IsInstanceOf(reference, type.getClass().reference);
  }

  T as<T extends JObject>(JObjType<T> type) {
    if (!instanceOf(type)) {
      throw StateError(
        'Invalid type. Expected ${type.signature}, got ${$type.signature}',
      );
    }
    return type.fromRef(reference);
  }
}
