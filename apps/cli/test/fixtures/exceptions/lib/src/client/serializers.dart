// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _$_common;
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart' as _$exceptions;

void initSerializers() {
  Serializers.instance
      .put(Serializer.define<_$_common.CustomException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$_common.CustomException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$_common.CommonException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$_common.CommonException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.BaseException, Map<String, Object?>>(
    serialize: ($value) => {r'fault': $value.fault},
    deserialize: ($serialized) {
      return _$exceptions.BaseException(($serialized[r'fault'] as String));
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$exceptions.CustomException, Map<String, Object?>>(
    serialize: ($value) => {r'fault': $value.fault},
    deserialize: ($serialized) {
      return _$exceptions.CustomException(($serialized[r'fault'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.BaseError, Map<String, Object?>>(
    serialize: ($value) => {r'fault': $value.fault},
    deserialize: ($serialized) {
      return _$exceptions.BaseError(($serialized[r'fault'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.CustomError, Map<String, Object?>>(
    serialize: ($value) => {r'fault': $value.fault},
    deserialize: ($serialized) {
      return _$exceptions.CustomError(($serialized[r'fault'] as String));
    },
  ));
}
