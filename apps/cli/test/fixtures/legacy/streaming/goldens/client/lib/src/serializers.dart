// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _$async;
import 'dart:convert' as _$convert;

import 'package:_common/src/models/available_stock.dart' as _$available_stock;
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;

void initSerializers() {
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<_$async.AsyncError, Map<String, Object?>>(
    serialize: ($value) => {
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
    serialize: ($value) => {
      r'message': $value.message,
      r'duration':
          _$celest.Serializers.instance.serialize<Duration?>($value.duration),
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
    serialize: ($value) => {
      r'unsupportedObject': $value.unsupportedObject,
      r'cause': $value.cause,
      r'partialResult': $value.partialResult,
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
    serialize: ($value) => {
      r'invalidValue': $value.invalidValue,
      r'name': $value.name,
      r'message': $value.message,
    },
    deserialize: ($serialized) {
      return ArgumentError(
        $serialized?[r'message'],
        ($serialized?[r'name'] as String?),
      );
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<AssertionError, Map<String, Object?>?>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return AssertionError($serialized?[r'message']);
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      ConcurrentModificationError, Map<String, Object?>?>(
    serialize: ($value) => {r'modifiedObject': $value.modifiedObject},
    deserialize: ($serialized) {
      return ConcurrentModificationError($serialized?[r'modifiedObject']);
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<Error, Map<String, Object?>?>(
    serialize: ($value) => {
      r'stackTrace': _$celest.Serializers.instance
          .serialize<StackTrace?>($value.stackTrace)
    },
    deserialize: ($serialized) {
      return Error();
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<FormatException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'source': $value.source,
      r'offset': $value.offset,
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
    serialize: ($value) => {
      r'name': $value.name,
      r'message': $value.message,
      r'indexable': $value.indexable,
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
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return IntegerDivisionByZeroException();
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return OutOfMemoryError();
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<RangeError, Map<String, Object?>>(
    serialize: ($value) => {
      r'name': $value.name,
      r'message': $value.message,
      r'start': $value.start,
      r'end': $value.end,
      r'invalidValue': $value.invalidValue,
    },
    deserialize: ($serialized) {
      return RangeError($serialized[r'message']);
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<StackOverflowError, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return StackOverflowError();
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<StateError, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return StateError(($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<TypeError, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return TypeError();
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<UnimplementedError, Map<String, Object?>?>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return UnimplementedError(($serialized?[r'message'] as String?));
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<UnsupportedError, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return UnsupportedError(($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$available_stock.AvailableStock, Map<String, Object?>>(
    serialize: ($value) => {
      r'ticker': $value.ticker,
      r'name': $value.name,
      r'currentPrice': $value.currentPrice,
      r'currentPriceStr': $value.currentPriceStr,
    },
    deserialize: ($serialized) {
      return _$available_stock.AvailableStock(
        ($serialized[r'ticker'] as String),
        name: ($serialized[r'name'] as String),
        currentPrice: ($serialized[r'currentPrice'] as num).toDouble(),
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
