// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _$async;
import 'dart:convert' as _$convert;
import 'dart:io' as _$io;
import 'dart:isolate' as _$isolate;
import 'dart:ui' as _$ui;

import 'package:celest_backend/src/functions/flutter.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;
import 'package:flutter/src/foundation/key.dart' as _$key;
import 'package:flutter/src/painting/image_provider.dart' as _$image_provider;

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
          _$io.CertificateException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
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
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
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
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _$io.HandshakeException(
            (($serialized?[r'message'] as String?)) ?? '',
            _$celest.Serializers.instance
                .deserialize<_$io.OSError?>($serialized?[r'osError']),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<_$io.HttpException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<Uri?>($value.uri)
              case final uri?)
            r'uri': uri,
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
        serialize: ($value) => <String, Object?>{
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
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
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
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
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
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
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
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$io.ProcessException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
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
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$io.SignalException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
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
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _$io.StdinException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance
                .deserialize<_$io.OSError?>($serialized[r'osError']),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$io.StdoutException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _$io.StdoutException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance
                .deserialize<_$io.OSError?>($serialized[r'osError']),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<_$io.TlsException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$io.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
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
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _$io.WebSocketException(
              (($serialized?[r'message'] as String?)) ?? '');
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$isolate.IsolateSpawnException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _$isolate.IsolateSpawnException(
              ($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<_$ui.Color, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
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
        serialize: ($value) => <String, Object?>{
          r'languageCode': $value.languageCode,
          if ($value.scriptCode case final scriptCode?)
            r'scriptCode': scriptCode,
          if ($value.countryCode case final countryCode?)
            r'countryCode': countryCode,
        },
        deserialize: ($serialized) {
          return _$ui.Locale(
            ($serialized[r'languageCode'] as String),
            ($serialized[r'countryCode'] as String?),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<HelloWorld, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if (_$celest.Serializers.instance.serialize<_$key.Key?>($value.key)
              case final key?)
            r'key': key
        },
        deserialize: ($serialized) {
          return HelloWorld(
              key: _$celest.Serializers.instance
                  .deserialize<_$key.Key?>($serialized?[r'key']));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.AbortedException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.DataLossError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnimplementedError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
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
            ($serialized[r'message'] as String?),
            code: ($serialized[r'code'] as num?)?.toInt(),
            details:
                _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnknownError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
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
            code: ($serialized[r'code'] as num?)?.toInt(),
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
          r'code': $value.code,
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
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<_$key.Key, Map<String, Object?>>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _$key.Key(($serialized[r'value'] as String));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$image_provider.NetworkImageLoadException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'statusCode': $value.statusCode,
          r'uri': _$celest.Serializers.instance.serialize<Uri>($value.uri),
        },
        deserialize: ($serialized) {
          return _$image_provider.NetworkImageLoadException(
            statusCode: ($serialized[r'statusCode'] as num).toInt(),
            uri: _$celest.Serializers.instance
                .deserialize<Uri>($serialized[r'uri']),
          );
        },
      ));
    },
    zoneValues: {_$celest.Serializers: serializers},
  );
}
