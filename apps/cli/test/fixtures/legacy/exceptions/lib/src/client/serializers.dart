// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _$_common;
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/exceptions.dart' as _$exceptions;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';

void initSerializers() {
  Serializers.instance
      .put(Serializer.define<_$_common.CommonException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$_common.CommonException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$_common.CustomException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$_common.CustomException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$_common.OverriddenException, String>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$_common.OverriddenException.fromJson($serialized);
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
      .put(Serializer.define<_$exceptions.BaseException, Map<String, Object?>>(
    serialize: ($value) => {r'fault': $value.fault},
    deserialize: ($serialized) {
      return _$exceptions.BaseException(($serialized[r'fault'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.CustomError, Map<String, Object?>>(
    serialize: ($value) => {r'fault': $value.fault},
    deserialize: ($serialized) {
      return _$exceptions.CustomError(($serialized[r'fault'] as String));
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
      .put(Serializer.define<BadRequestException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return BadRequestException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<InternalServerException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return InternalServerException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnauthorizedException, Map<String, Object?>?>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return UnauthorizedException(
          (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
    },
  ));
  Serializers.instance
      .put(Serializer.define<SerializationException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'offset': $value.offset,
      r'source': $value.source,
    },
    deserialize: ($serialized) {
      return SerializationException(($serialized[r'message'] as String));
    },
  ));
}
