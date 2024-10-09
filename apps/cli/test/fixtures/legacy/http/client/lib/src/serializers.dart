// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _$async;
import 'dart:convert' as _$convert;

import 'package:celest_backend/exceptions/http_errors.dart';
import 'package:celest_backend/models/http_errors.dart';
import 'package:celest_backend/models/http_header_query.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;

void initSerializers({_$celest.Serializers? serializers}) {
  return _$async.runZoned(
    () {
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<_$async.AsyncError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'error': $value.error,
          r'stackTrace': _$celest.Serializers.instance
              .serialize<StackTrace>($value.stackTrace),
        },
        deserialize: ($serialized) {
          return _$async.AsyncError(
            $serialized[r'error']!,
            _$celest.Serializers.instance
                .deserialize<StackTrace?>($serialized[r'stackTrace']),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$async.TimeoutException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
          if (_$celest.Serializers.instance
                  .serialize<Duration?>($value.duration)
              case final duration?)
            r'duration': duration,
        },
        deserialize: ($serialized) {
          return _$async.TimeoutException(
            ($serialized[r'message'] as String?),
            _$celest.Serializers.instance
                .deserialize<Duration?>($serialized[r'duration']),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$convert.JsonUnsupportedObjectError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.unsupportedObject case final unsupportedObject?)
            r'unsupportedObject': unsupportedObject,
          if ($value.cause case final cause?) r'cause': cause,
          if ($value.partialResult case final partialResult?)
            r'partialResult': partialResult,
        },
        deserialize: ($serialized) {
          return _$convert.JsonUnsupportedObjectError(
            $serialized[r'unsupportedObject'],
            cause: $serialized[r'cause'],
            partialResult: ($serialized[r'partialResult'] as String?),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<ArgumentError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'invalidValue': $value.invalidValue,
          if ($value.name case final name?) r'name': name,
          r'message': $value.message,
        },
        deserialize: ($serialized) {
          return ArgumentError(
            $serialized?[r'message'],
            ($serialized?[r'name'] as String?),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<AssertionError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return AssertionError($serialized?[r'message']);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          ConcurrentModificationError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.modifiedObject case final modifiedObject?)
            r'modifiedObject': modifiedObject
        },
        deserialize: ($serialized) {
          return ConcurrentModificationError($serialized?[r'modifiedObject']);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Error, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if (_$celest.Serializers.instance
                  .serialize<StackTrace?>($value.stackTrace)
              case final stackTrace?)
            r'stackTrace': stackTrace
        },
        deserialize: ($serialized) {
          return Error();
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<FormatException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'source': $value.source,
          if ($value.offset case final offset?) r'offset': offset,
        },
        deserialize: ($serialized) {
          return FormatException(
            (($serialized?[r'message'] as String?)) ?? '',
            $serialized?[r'source'],
            ($serialized?[r'offset'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<IndexError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.name case final name?) r'name': name,
          r'message': $value.message,
          if ($value.indexable case final indexable?) r'indexable': indexable,
          r'length': $value.length,
          r'invalidValue': $value.invalidValue,
          r'start': $value.start,
          r'end': $value.end,
        },
        deserialize: ($serialized) {
          return IndexError(
            ($serialized[r'invalidValue'] as num).toInt(),
            $serialized[r'indexable'],
            ($serialized[r'name'] as String?),
            ($serialized[r'message'] as String?),
            ($serialized[r'length'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          IntegerDivisionByZeroException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return IntegerDivisionByZeroException();
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return OutOfMemoryError();
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<RangeError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.name case final name?) r'name': name,
          r'message': $value.message,
          if ($value.start case final start?) r'start': start,
          if ($value.end case final end?) r'end': end,
          if ($value.invalidValue case final invalidValue?)
            r'invalidValue': invalidValue,
        },
        deserialize: ($serialized) {
          return RangeError($serialized[r'message']);
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<StackOverflowError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return StackOverflowError();
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<StateError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return StateError(($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<TypeError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return TypeError();
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<UnimplementedError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return UnimplementedError(($serialized?[r'message'] as String?));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<UnsupportedError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return UnsupportedError(($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          AnotherNotFoundException, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return AnotherNotFoundException();
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<BadGatewayError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return BadGatewayError(($serialized[r'message'] as String?));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          CustomBadRequestException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return CustomBadRequestException(($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<ForbiddenException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return ForbiddenException(($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<NotFoundException, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
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
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<HttpHeaderParams, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'aString': $value.aString,
          r'anInt': $value.anInt,
          r'aDouble': $value.aDouble,
          r'aNum': $value.aNum,
          r'aBool': $value.aBool,
          r'aDateTime': _$celest.Serializers.instance
              .serialize<DateTime>($value.aDateTime),
          if ($value.aNullableString case final aNullableString?)
            r'aNullableString': aNullableString,
          if ($value.aNullableInt case final aNullableInt?)
            r'aNullableInt': aNullableInt,
          if ($value.aNullableDouble case final aNullableDouble?)
            r'aNullableDouble': aNullableDouble,
          if ($value.aNullableNum case final aNullableNum?)
            r'aNullableNum': aNullableNum,
          if ($value.aNullableBool case final aNullableBool?)
            r'aNullableBool': aNullableBool,
          if (_$celest.Serializers.instance
                  .serialize<DateTime?>($value.aNullableDateTime)
              case final aNullableDateTime?)
            r'aNullableDateTime': aNullableDateTime,
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
            aNullableDouble:
                ($serialized[r'aNullableDouble'] as num?)?.toDouble(),
            aNullableNum: ($serialized[r'aNullableNum'] as num?),
            aNullableBool: ($serialized[r'aNullableBool'] as bool?),
            aNullableDateTime: _$celest.Serializers.instance
                .deserialize<DateTime?>($serialized[r'aNullableDateTime']),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<HttpQueryParams, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'aString': $value.aString,
          r'anInt': $value.anInt,
          r'aDouble': $value.aDouble,
          r'aNum': $value.aNum,
          r'aBool': $value.aBool,
          r'aDateTime': _$celest.Serializers.instance
              .serialize<DateTime>($value.aDateTime),
          if ($value.aNullableString case final aNullableString?)
            r'aNullableString': aNullableString,
          if ($value.aNullableInt case final aNullableInt?)
            r'aNullableInt': aNullableInt,
          if ($value.aNullableDouble case final aNullableDouble?)
            r'aNullableDouble': aNullableDouble,
          if ($value.aNullableNum case final aNullableNum?)
            r'aNullableNum': aNullableNum,
          if ($value.aNullableBool case final aNullableBool?)
            r'aNullableBool': aNullableBool,
          if (_$celest.Serializers.instance
                  .serialize<DateTime?>($value.aNullableDateTime)
              case final aNullableDateTime?)
            r'aNullableDateTime': aNullableDateTime,
          r'aListOfString': $value.aListOfString,
          r'aListOfInt': $value.aListOfInt,
          r'aListOfDouble': $value.aListOfDouble,
          r'aListOfNum': $value.aListOfNum,
          r'aListOfBool': $value.aListOfBool,
          r'aListOfDateTime': $value.aListOfDateTime
              .map(
                  (el) => _$celest.Serializers.instance.serialize<DateTime>(el))
              .toList(),
          if ($value.aNullableListOfString case final aNullableListOfString?)
            r'aNullableListOfString': aNullableListOfString,
          if ($value.aNullableListOfInt case final aNullableListOfInt?)
            r'aNullableListOfInt': aNullableListOfInt,
          if ($value.aNullableListOfDouble case final aNullableListOfDouble?)
            r'aNullableListOfDouble': aNullableListOfDouble,
          if ($value.aNullableListOfNum case final aNullableListOfNum?)
            r'aNullableListOfNum': aNullableListOfNum,
          if ($value.aNullableListOfBool case final aNullableListOfBool?)
            r'aNullableListOfBool': aNullableListOfBool,
          if ($value.aNullableListOfDateTime
                  ?.map((el) =>
                      _$celest.Serializers.instance.serialize<DateTime>(el))
                  .toList()
              case final aNullableListOfDateTime?)
            r'aNullableListOfDateTime': aNullableListOfDateTime,
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
            aNullableDouble:
                ($serialized[r'aNullableDouble'] as num?)?.toDouble(),
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
            aListOfDateTime:
                ($serialized[r'aListOfDateTime'] as Iterable<Object?>)
                    .map((el) =>
                        _$celest.Serializers.instance.deserialize<DateTime>(el))
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
                    ?.map((el) =>
                        _$celest.Serializers.instance.deserialize<DateTime>(el))
                    .toList(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.AbortedException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.AbortedException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.AlreadyExistsException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.AlreadyExistsException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.BadRequestException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.BadRequestException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.CancelledException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.CancelledException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.CloudException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.CloudException.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.DataLossError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.DataLossError(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.DeadlineExceededError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.DeadlineExceededError(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.FailedPreconditionException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.FailedPreconditionException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.InternalServerError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.InternalServerError(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.NotFoundException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.NotFoundException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.OutOfRangeException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.OutOfRangeException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.PermissionDeniedException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.PermissionDeniedException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.ResourceExhaustedException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.ResourceExhaustedException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnauthorizedException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnauthorizedException(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnavailableError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnavailableError(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnimplementedError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnimplementedError(
              ($serialized?[r'message'] as String?));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnknownError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnknownError(
            ($serialized[r'message'] as String?),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.SerializationException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
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
    },
    zoneValues: {_$celest.Serializers: serializers},
  );
}
