// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _$async;
import 'dart:convert' as _$convert;
import 'dart:io' as _$io;
import 'dart:isolate' as _$isolate;
import 'dart:ui' as _$ui;

import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;
import 'package:flutter/src/painting/image_provider.dart' as _$image_provider;

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
      _$io.CertificateException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'type': $value.type,
      r'message': $value.message,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.CertificateException(
        (($serialized?[r'message'] as String?)) ?? '',
        _$celest.Serializers.instance
            .deserialize<_$io.OSError?>($serialized?[r'osError']),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$io.FileSystemException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'path': $value.path,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.FileSystemException(
        (($serialized?[r'message'] as String?)) ?? '',
        (($serialized?[r'path'] as String?)) ?? '',
        _$celest.Serializers.instance
            .deserialize<_$io.OSError?>($serialized?[r'osError']),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$io.HandshakeException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'type': $value.type,
      r'message': $value.message,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.HandshakeException(
        (($serialized?[r'message'] as String?)) ?? '',
        _$celest.Serializers.instance
            .deserialize<_$io.OSError?>($serialized?[r'osError']),
      );
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<_$io.HttpException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'uri': _$celest.Serializers.instance.serialize<Uri?>($value.uri),
    },
    deserialize: ($serialized) {
      return _$io.HttpException(
        ($serialized[r'message'] as String),
        uri: _$celest.Serializers.instance
            .deserialize<Uri?>($serialized[r'uri']),
      );
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<_$io.OSError, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'errorCode': $value.errorCode,
    },
    deserialize: ($serialized) {
      return _$io.OSError(
        (($serialized?[r'message'] as String?)) ?? '',
        (($serialized?[r'errorCode'] as num?)?.toInt()) ??
            _$io.OSError.noErrorCode,
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$io.PathAccessException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'path': $value.path,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.PathAccessException(
        ($serialized[r'path'] as String),
        _$celest.Serializers.instance
            .deserialize<_$io.OSError>($serialized[r'osError']),
        (($serialized[r'message'] as String?)) ?? '',
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$io.PathExistsException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'path': $value.path,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.PathExistsException(
        ($serialized[r'path'] as String),
        _$celest.Serializers.instance
            .deserialize<_$io.OSError>($serialized[r'osError']),
        (($serialized[r'message'] as String?)) ?? '',
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$io.PathNotFoundException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'path': $value.path,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.PathNotFoundException(
        ($serialized[r'path'] as String),
        _$celest.Serializers.instance
            .deserialize<_$io.OSError>($serialized[r'osError']),
        (($serialized[r'message'] as String?)) ?? '',
      );
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$io.ProcessException, Map<String, Object?>>(
    serialize: ($value) => {
      r'executable': $value.executable,
      r'arguments': $value.arguments,
      r'message': $value.message,
      r'errorCode': $value.errorCode,
    },
    deserialize: ($serialized) {
      return _$io.ProcessException(
        ($serialized[r'executable'] as String),
        ($serialized[r'arguments'] as Iterable<Object?>)
            .map((el) => (el as String))
            .toList(),
        (($serialized[r'message'] as String?)) ?? '',
        (($serialized[r'errorCode'] as num?)?.toInt()) ?? 0,
      );
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$io.SignalException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'osError': $value.osError,
    },
    deserialize: ($serialized) {
      return _$io.SignalException(
        ($serialized[r'message'] as String),
        $serialized[r'osError'],
      );
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$io.StdinException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.StdinException(
        ($serialized[r'message'] as String),
        _$celest.Serializers.instance
            .deserialize<_$io.OSError?>($serialized[r'osError']),
      );
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$io.StdoutException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.StdoutException(
        ($serialized[r'message'] as String),
        _$celest.Serializers.instance
            .deserialize<_$io.OSError?>($serialized[r'osError']),
      );
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<_$io.TlsException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'type': $value.type,
      r'message': $value.message,
      r'osError': _$celest.Serializers.instance
          .serialize<_$io.OSError?>($value.osError),
    },
    deserialize: ($serialized) {
      return _$io.TlsException(
        (($serialized?[r'message'] as String?)) ?? '',
        _$celest.Serializers.instance
            .deserialize<_$io.OSError?>($serialized?[r'osError']),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$io.WebSocketException, Map<String, Object?>?>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$io.WebSocketException(
          (($serialized?[r'message'] as String?)) ?? '');
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$isolate.IsolateSpawnException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$isolate.IsolateSpawnException(
          ($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<_$ui.Color, Map<String, Object?>>(
    serialize: ($value) => {
      r'value': $value.value,
      r'alpha': $value.alpha,
      r'opacity': $value.opacity,
      r'red': $value.red,
      r'green': $value.green,
      r'blue': $value.blue,
    },
    deserialize: ($serialized) {
      return _$ui.Color(($serialized[r'value'] as num).toInt());
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<_$ui.Locale, Map<String, Object?>>(
    serialize: ($value) => {
      r'languageCode': $value.languageCode,
      r'scriptCode': $value.scriptCode,
      r'countryCode': $value.countryCode,
    },
    deserialize: ($serialized) {
      return _$ui.Locale(
        ($serialized[r'languageCode'] as String),
        ($serialized[r'countryCode'] as String?),
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
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$image_provider.NetworkImageLoadException, Map<String, Object?>>(
    serialize: ($value) => {
      r'statusCode': $value.statusCode,
      r'uri': _$celest.Serializers.instance.serialize<Uri>($value.uri),
    },
    deserialize: ($serialized) {
      return _$image_provider.NetworkImageLoadException(
        statusCode: ($serialized[r'statusCode'] as num).toInt(),
        uri:
            _$celest.Serializers.instance.deserialize<Uri>($serialized[r'uri']),
      );
    },
  ));
}
