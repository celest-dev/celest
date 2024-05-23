// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/http_errors.dart' as _$http_errors;
import 'package:celest_backend/models/http_errors.dart' as _$http_errors;
import 'package:celest_backend/models/http_header_query.dart'
    as _$http_header_query;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';

void initSerializers() {
  Serializers.instance.put(Serializer.define<
      _$http_errors.AnotherNotFoundException, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return _$http_errors.AnotherNotFoundException();
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$http_errors.BadGatewayError, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$http_errors.BadGatewayError(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$http_errors.CustomBadRequestException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$http_errors.CustomBadRequestException(
          ($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$http_errors.ForbiddenException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$http_errors.ForbiddenException(
          ($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$http_errors.NotFoundException, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return _$http_errors.NotFoundException();
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$http_errors.ExceptionType, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return _$http_errors.ExceptionType.values.byName($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$http_header_query.HttpHeaderParams, Map<String, Object?>>(
    serialize: ($value) => {
      r'aString': $value.aString,
      r'anInt': $value.anInt,
      r'aDouble': $value.aDouble,
      r'aNum': $value.aNum,
      r'aBool': $value.aBool,
      r'aDateTime': Serializers.instance.serialize<DateTime>($value.aDateTime),
      r'aNullableString': $value.aNullableString,
      r'aNullableInt': $value.aNullableInt,
      r'aNullableDouble': $value.aNullableDouble,
      r'aNullableNum': $value.aNullableNum,
      r'aNullableBool': $value.aNullableBool,
      r'aNullableDateTime':
          Serializers.instance.serialize<DateTime?>($value.aNullableDateTime),
    },
    deserialize: ($serialized) {
      return _$http_header_query.HttpHeaderParams(
        aString: ($serialized[r'aString'] as String),
        anInt: ($serialized[r'anInt'] as num).toInt(),
        aDouble: ($serialized[r'aDouble'] as num).toDouble(),
        aNum: ($serialized[r'aNum'] as num),
        aBool: ($serialized[r'aBool'] as bool),
        aDateTime: Serializers.instance
            .deserialize<DateTime>($serialized[r'aDateTime']),
        aNullableString: ($serialized[r'aNullableString'] as String?),
        aNullableInt: ($serialized[r'aNullableInt'] as num?)?.toInt(),
        aNullableDouble: ($serialized[r'aNullableDouble'] as num?)?.toDouble(),
        aNullableNum: ($serialized[r'aNullableNum'] as num?),
        aNullableBool: ($serialized[r'aNullableBool'] as bool?),
        aNullableDateTime: Serializers.instance
            .deserialize<DateTime?>($serialized[r'aNullableDateTime']),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$http_header_query.HttpQueryParams, Map<String, Object?>>(
    serialize: ($value) => {
      r'aString': $value.aString,
      r'anInt': $value.anInt,
      r'aDouble': $value.aDouble,
      r'aNum': $value.aNum,
      r'aBool': $value.aBool,
      r'aDateTime': Serializers.instance.serialize<DateTime>($value.aDateTime),
      r'aNullableString': $value.aNullableString,
      r'aNullableInt': $value.aNullableInt,
      r'aNullableDouble': $value.aNullableDouble,
      r'aNullableNum': $value.aNullableNum,
      r'aNullableBool': $value.aNullableBool,
      r'aNullableDateTime':
          Serializers.instance.serialize<DateTime?>($value.aNullableDateTime),
      r'aListOfString': $value.aListOfString,
      r'aListOfInt': $value.aListOfInt,
      r'aListOfDouble': $value.aListOfDouble,
      r'aListOfNum': $value.aListOfNum,
      r'aListOfBool': $value.aListOfBool,
      r'aListOfDateTime': $value.aListOfDateTime
          .map((el) => Serializers.instance.serialize<DateTime>(el))
          .toList(),
      r'aNullableListOfString': $value.aNullableListOfString,
      r'aNullableListOfInt': $value.aNullableListOfInt,
      r'aNullableListOfDouble': $value.aNullableListOfDouble,
      r'aNullableListOfNum': $value.aNullableListOfNum,
      r'aNullableListOfBool': $value.aNullableListOfBool,
      r'aNullableListOfDateTime': $value.aNullableListOfDateTime
          ?.map((el) => Serializers.instance.serialize<DateTime>(el))
          .toList(),
    },
    deserialize: ($serialized) {
      return _$http_header_query.HttpQueryParams(
        aString: ($serialized[r'aString'] as String),
        anInt: ($serialized[r'anInt'] as num).toInt(),
        aDouble: ($serialized[r'aDouble'] as num).toDouble(),
        aNum: ($serialized[r'aNum'] as num),
        aBool: ($serialized[r'aBool'] as bool),
        aDateTime: Serializers.instance
            .deserialize<DateTime>($serialized[r'aDateTime']),
        aNullableString: ($serialized[r'aNullableString'] as String?),
        aNullableInt: ($serialized[r'aNullableInt'] as num?)?.toInt(),
        aNullableDouble: ($serialized[r'aNullableDouble'] as num?)?.toDouble(),
        aNullableNum: ($serialized[r'aNullableNum'] as num?),
        aNullableBool: ($serialized[r'aNullableBool'] as bool?),
        aNullableDateTime: Serializers.instance
            .deserialize<DateTime?>($serialized[r'aNullableDateTime']),
        aListOfString: ($serialized[r'aListOfString'] as Iterable<Object?>)
            .map((el) => (el as String))
            .toList(),
        aListOfInt: ($serialized[r'aListOfInt'] as Iterable<Object?>)
            .map((el) => (el as num).toInt())
            .toList(),
        aListOfDouble: ($serialized[r'aListOfDouble'] as Iterable<Object?>)
            .map((el) => (el as num).toDouble())
            .toList(),
        aListOfNum: ($serialized[r'aListOfNum'] as Iterable<Object?>)
            .map((el) => (el as num))
            .toList(),
        aListOfBool: ($serialized[r'aListOfBool'] as Iterable<Object?>)
            .map((el) => (el as bool))
            .toList(),
        aListOfDateTime: ($serialized[r'aListOfDateTime'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<DateTime>(el))
            .toList(),
        aNullableListOfString:
            ($serialized[r'aNullableListOfString'] as Iterable<Object?>?)
                ?.map((el) => (el as String))
                .toList(),
        aNullableListOfInt:
            ($serialized[r'aNullableListOfInt'] as Iterable<Object?>?)
                ?.map((el) => (el as num).toInt())
                .toList(),
        aNullableListOfDouble:
            ($serialized[r'aNullableListOfDouble'] as Iterable<Object?>?)
                ?.map((el) => (el as num).toDouble())
                .toList(),
        aNullableListOfNum:
            ($serialized[r'aNullableListOfNum'] as Iterable<Object?>?)
                ?.map((el) => (el as num))
                .toList(),
        aNullableListOfBool:
            ($serialized[r'aNullableListOfBool'] as Iterable<Object?>?)
                ?.map((el) => (el as bool))
                .toList(),
        aNullableListOfDateTime:
            ($serialized[r'aNullableListOfDateTime'] as Iterable<Object?>?)
                ?.map((el) => Serializers.instance.deserialize<DateTime>(el))
                .toList(),
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
      .put(Serializer.define<InternalServerError, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return InternalServerError(($serialized[r'message'] as String));
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
