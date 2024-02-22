// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/errors_and_exceptions.dart'
    as _$errors_and_exceptions;
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/overrides.dart' as _$overrides;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';

void initSerializers() {
  Serializers.instance.put(Serializer.define<
      _$errors_and_exceptions.ValidateError, Map<String, Object?>>(
    serialize: ($value) => {r'msg': $value.msg},
    deserialize: ($serialized) {
      return _$errors_and_exceptions.ValidateError(
          ($serialized[r'msg'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.AppError, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$overrides.AppError.fromJson($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.UserException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'msg': $value.msg,
      r'code': $value.code,
      r'cause': Serializers.instance.serialize<JsonValue?>(
        $value.cause,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$overrides.UserException(
        msg: (($serialized?[r'msg'] as String?)) ?? null,
        cause: (Serializers.instance.deserialize<JsonValue?>(
              $serialized?[r'cause'],
              const TypeToken<JsonValue?>('JsonValue'),
            )) ??
            null,
      );
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
  Serializers.instance.put(
    Serializer.define<JsonValue, Object>(
      serialize: ($value) => $value.value,
      deserialize: ($serialized) {
        return JsonValue($serialized);
      },
    ),
    const TypeToken<JsonValue?>('JsonValue'),
  );
}
