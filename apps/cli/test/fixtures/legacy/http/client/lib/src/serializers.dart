// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest_backend/exceptions/http_errors.dart';
import 'package:celest_backend/models/http_errors.dart';
import 'package:celest_backend/models/http_header_query.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;

void initSerializers() {
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      AnotherNotFoundException, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return AnotherNotFoundException();
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<BadGatewayError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return BadGatewayError(($serialized[r'message'] as String?));
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      CustomBadRequestException, Map<String, Object?>>(
    serialize: ($value) => {
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
      r'message': $value.message,
    },
    deserialize: ($serialized) {
      return CustomBadRequestException(($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<ForbiddenException, Map<String, Object?>>(
    serialize: ($value) => {
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
      r'message': $value.message,
    },
    deserialize: ($serialized) {
      return ForbiddenException(($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<NotFoundException, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return NotFoundException();
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<ExceptionType, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return ExceptionType.values.byName($serialized);
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<HttpHeaderParams, Map<String, Object?>>(
    serialize: ($value) => {
      r'aString': $value.aString,
      r'anInt': $value.anInt,
      r'aDouble': $value.aDouble,
      r'aNum': $value.aNum,
      r'aBool': $value.aBool,
      r'aDateTime':
          _$celest.Serializers.instance.serialize<DateTime>($value.aDateTime),
      r'aNullableString': $value.aNullableString,
      r'aNullableInt': $value.aNullableInt,
      r'aNullableDouble': $value.aNullableDouble,
      r'aNullableNum': $value.aNullableNum,
      r'aNullableBool': $value.aNullableBool,
      r'aNullableDateTime': _$celest.Serializers.instance
          .serialize<DateTime?>($value.aNullableDateTime),
    },
    deserialize: ($serialized) {
      return HttpHeaderParams(
        aString: ($serialized[r'aString'] as String),
        anInt: ($serialized[r'anInt'] as num).toInt(),
        aDouble: ($serialized[r'aDouble'] as num).toDouble(),
        aNum: ($serialized[r'aNum'] as num),
        aBool: ($serialized[r'aBool'] as bool),
        aDateTime: _$celest.Serializers.instance
            .deserialize<DateTime>($serialized[r'aDateTime']),
        aNullableString: ($serialized[r'aNullableString'] as String?),
        aNullableInt: ($serialized[r'aNullableInt'] as num?)?.toInt(),
        aNullableDouble: ($serialized[r'aNullableDouble'] as num?)?.toDouble(),
        aNullableNum: ($serialized[r'aNullableNum'] as num?),
        aNullableBool: ($serialized[r'aNullableBool'] as bool?),
        aNullableDateTime: _$celest.Serializers.instance
            .deserialize<DateTime?>($serialized[r'aNullableDateTime']),
      );
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<HttpQueryParams, Map<String, Object?>>(
    serialize: ($value) => {
      r'aString': $value.aString,
      r'anInt': $value.anInt,
      r'aDouble': $value.aDouble,
      r'aNum': $value.aNum,
      r'aBool': $value.aBool,
      r'aDateTime':
          _$celest.Serializers.instance.serialize<DateTime>($value.aDateTime),
      r'aNullableString': $value.aNullableString,
      r'aNullableInt': $value.aNullableInt,
      r'aNullableDouble': $value.aNullableDouble,
      r'aNullableNum': $value.aNullableNum,
      r'aNullableBool': $value.aNullableBool,
      r'aNullableDateTime': _$celest.Serializers.instance
          .serialize<DateTime?>($value.aNullableDateTime),
      r'aListOfString': $value.aListOfString,
      r'aListOfInt': $value.aListOfInt,
      r'aListOfDouble': $value.aListOfDouble,
      r'aListOfNum': $value.aListOfNum,
      r'aListOfBool': $value.aListOfBool,
      r'aListOfDateTime': $value.aListOfDateTime
          .map((el) => _$celest.Serializers.instance.serialize<DateTime>(el))
          .toList(),
      r'aNullableListOfString': $value.aNullableListOfString,
      r'aNullableListOfInt': $value.aNullableListOfInt,
      r'aNullableListOfDouble': $value.aNullableListOfDouble,
      r'aNullableListOfNum': $value.aNullableListOfNum,
      r'aNullableListOfBool': $value.aNullableListOfBool,
      r'aNullableListOfDateTime': $value.aNullableListOfDateTime
          ?.map((el) => _$celest.Serializers.instance.serialize<DateTime>(el))
          .toList(),
    },
    deserialize: ($serialized) {
      return HttpQueryParams(
        aString: ($serialized[r'aString'] as String),
        anInt: ($serialized[r'anInt'] as num).toInt(),
        aDouble: ($serialized[r'aDouble'] as num).toDouble(),
        aNum: ($serialized[r'aNum'] as num),
        aBool: ($serialized[r'aBool'] as bool),
        aDateTime: _$celest.Serializers.instance
            .deserialize<DateTime>($serialized[r'aDateTime']),
        aNullableString: ($serialized[r'aNullableString'] as String?),
        aNullableInt: ($serialized[r'aNullableInt'] as num?)?.toInt(),
        aNullableDouble: ($serialized[r'aNullableDouble'] as num?)?.toDouble(),
        aNullableNum: ($serialized[r'aNullableNum'] as num?),
        aNullableBool: ($serialized[r'aNullableBool'] as bool?),
        aNullableDateTime: _$celest.Serializers.instance
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
            .map(
                (el) => _$celest.Serializers.instance.deserialize<DateTime>(el))
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
        aNullableListOfDateTime: ($serialized[r'aNullableListOfDateTime']
                as Iterable<Object?>?)
            ?.map(
                (el) => _$celest.Serializers.instance.deserialize<DateTime>(el))
            .toList(),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.AbortedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.AbortedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.AlreadyExistsException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.AlreadyExistsException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.BadRequestException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.BadRequestException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.CancelledException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.CancelledException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.CloudException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.CloudException.fromJson($serialized);
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.DataLossError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.DataLossError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.DeadlineExceededError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.DeadlineExceededError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.FailedPreconditionException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.FailedPreconditionException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.InternalServerError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.InternalServerError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.NotFoundException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.NotFoundException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.OutOfRangeException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.OutOfRangeException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.PermissionDeniedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.PermissionDeniedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.ResourceExhaustedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.ResourceExhaustedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.UnauthorizedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnauthorizedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.UnavailableError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnavailableError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.UnimplementedError, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnimplementedError(($serialized?[r'message'] as String?));
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.UnknownError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnknownError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.SerializationException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'offset': $value.offset,
      r'source': $value.source,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.SerializationException(
          ($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance.put(
    _$celest.Serializer.define<_$celest.JsonValue, Object>(
      serialize: ($value) => $value.value,
      deserialize: ($serialized) {
        return _$celest.JsonValue($serialized);
      },
    ),
    const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
  );
}
