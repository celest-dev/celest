// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:built_value/built_value.dart' as _$built_value_built_value;
import 'package:cedar/src/authorization/authorization_response.dart'
    as _$cedar_authorization_response;
import 'package:cedar/src/model/errors.dart' as _$cedar_errors;
import 'package:cedar/src/model/value.dart' as _$cedar_value;
import 'package:celest_backend/src/database/task_database.dart';
import 'package:celest_backend/src/database/task_database.drift.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;
import 'package:chunked_stream/src/read_chunked_stream.dart'
    as _$chunked_stream_read_chunked_stream;
import 'package:corks_cedar/src/exceptions.dart' as _$corks_cedar_exceptions;
import 'package:drift/src/remote/communication.dart' as _$drift_communication;
import 'package:drift/src/runtime/cancellation_zone.dart'
    as _$drift_cancellation_zone;
import 'package:drift/src/runtime/exceptions.dart' as _$drift_exceptions;
import 'package:hrana/src/exception.dart' as _$hrana_exception;
import 'package:http/src/abortable.dart' as _$http_abortable;
import 'package:http/src/exception.dart' as _$http_exception;
import 'package:mustache_template/src/template_exception.dart'
    as _$mustache_template_template_exception;
import 'package:petitparser/src/core/exception.dart' as _$petitparser_exception;
import 'package:petitparser/src/core/result.dart' as _$petitparser_result;
import 'package:shelf/src/hijack_exception.dart' as _$shelf_hijack_exception;
import 'package:source_span/src/location.dart' as _$source_span_location;
import 'package:source_span/src/span.dart' as _$source_span_span;
import 'package:source_span/src/span_exception.dart'
    as _$source_span_span_exception;
import 'package:sqlite3/src/exception.dart' as _$sqlite3_exception;
import 'package:sqlite3/src/vfs.dart' as _$sqlite3_vfs;
import 'package:string_scanner/src/exception.dart'
    as _$string_scanner_exception;

void initSerializers({_$celest.Serializers? serializers}) {
  return runZoned(() {
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<AsyncError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'error': $value.error,
          r'stackTrace': _$celest.Serializers.instance.serialize<StackTrace>(
            $value.stackTrace,
          ),
        },
        deserialize: ($serialized) {
          return AsyncError(
            $serialized[r'error']!,
            _$celest.Serializers.instance.deserialize<StackTrace?>(
              $serialized[r'stackTrace'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<TimeoutException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
          if (_$celest.Serializers.instance.serialize<Duration?>(
                $value.duration,
              )
              case final duration?)
            r'duration': duration,
        },
        deserialize: ($serialized) {
          return TimeoutException(
            ($serialized[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<Duration?>(
              $serialized[r'duration'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest
          .Serializer.define<JsonUnsupportedObjectError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.unsupportedObject case final unsupportedObject?)
            r'unsupportedObject': unsupportedObject,
          if ($value.cause case final cause?) r'cause': cause,
          if ($value.partialResult case final partialResult?)
            r'partialResult': partialResult,
        },
        deserialize: ($serialized) {
          return JsonUnsupportedObjectError(
            $serialized[r'unsupportedObject'],
            cause: $serialized[r'cause'],
            partialResult: ($serialized[r'partialResult'] as String?),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<ArgumentError, Map<String, Object?>?>(
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
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<AssertionError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
        },
        deserialize: ($serialized) {
          return AssertionError($serialized?[r'message']);
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        ConcurrentModificationError,
        Map<String, Object?>?
      >(
        serialize: ($value) => <String, Object?>{
          if ($value.modifiedObject case final modifiedObject?)
            r'modifiedObject': modifiedObject,
        },
        deserialize: ($serialized) {
          return ConcurrentModificationError($serialized?[r'modifiedObject']);
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<Error, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if (_$celest.Serializers.instance.serialize<StackTrace?>(
                $value.stackTrace,
              )
              case final stackTrace?)
            r'stackTrace': stackTrace,
        },
        deserialize: ($serialized) {
          return Error();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<Exception, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return Exception($serialized?[r'message']);
        },
      ),
    );
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
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<IndexError, Map<String, Object?>>(
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
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        IntegerDivisionByZeroException,
        Map<String, Object?>?
      >(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
        },
        deserialize: ($serialized) {
          return IntegerDivisionByZeroException();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return OutOfMemoryError();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<RangeError, Map<String, Object?>>(
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
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<StackOverflowError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return StackOverflowError();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<StateError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return StateError(($serialized[r'message'] as String));
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<TypeError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return TypeError();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<UnimplementedError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
        },
        deserialize: ($serialized) {
          return UnimplementedError(($serialized?[r'message'] as String?));
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<UnsupportedError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
        },
        deserialize: ($serialized) {
          return UnsupportedError(($serialized[r'message'] as String));
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<CertificateException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return CertificateException(
            (($serialized?[r'message'] as String?)) ?? '',
            _$celest.Serializers.instance.deserialize<OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<FileSystemException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return FileSystemException(
            (($serialized?[r'message'] as String?)) ?? '',
            (($serialized?[r'path'] as String?)) ?? '',
            _$celest.Serializers.instance.deserialize<OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<HandshakeException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return HandshakeException(
            (($serialized?[r'message'] as String?)) ?? '',
            _$celest.Serializers.instance.deserialize<OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<HttpException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<Uri?>($value.uri)
              case final uri?)
            r'uri': uri,
        },
        deserialize: ($serialized) {
          return HttpException(
            ($serialized[r'message'] as String),
            uri: _$celest.Serializers.instance.deserialize<Uri?>(
              $serialized[r'uri'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<OSError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'errorCode': $value.errorCode,
        },
        deserialize: ($serialized) {
          return OSError(
            (($serialized?[r'message'] as String?)) ?? '',
            (($serialized?[r'errorCode'] as num?)?.toInt()) ??
                OSError.noErrorCode,
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<PathAccessException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return PathAccessException(
            ($serialized[r'path'] as String),
            _$celest.Serializers.instance.deserialize<OSError>(
              $serialized[r'osError'],
            ),
            (($serialized[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<PathExistsException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return PathExistsException(
            ($serialized[r'path'] as String),
            _$celest.Serializers.instance.deserialize<OSError>(
              $serialized[r'osError'],
            ),
            (($serialized[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<PathNotFoundException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return PathNotFoundException(
            ($serialized[r'path'] as String),
            _$celest.Serializers.instance.deserialize<OSError>(
              $serialized[r'osError'],
            ),
            (($serialized[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<ProcessException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'executable': $value.executable,
          r'arguments': $value.arguments,
          r'message': $value.message,
          r'errorCode': $value.errorCode,
        },
        deserialize: ($serialized) {
          return ProcessException(
            ($serialized[r'executable'] as String),
            ($serialized[r'arguments'] as Iterable<Object?>)
                .map((el) => (el as String))
                .toList(),
            (($serialized[r'message'] as String?)) ?? '',
            (($serialized[r'errorCode'] as num?)?.toInt()) ?? 0,
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<SignalException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'osError': $value.osError,
        },
        deserialize: ($serialized) {
          return SignalException(
            ($serialized[r'message'] as String),
            $serialized[r'osError'],
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<StdinException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return StdinException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance.deserialize<OSError?>(
              $serialized[r'osError'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<StdoutException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return StdoutException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance.deserialize<OSError?>(
              $serialized[r'osError'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<TlsException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return TlsException(
            (($serialized?[r'message'] as String?)) ?? '',
            _$celest.Serializers.instance.deserialize<OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<WebSocketException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.httpStatusCode case final httpStatusCode?)
            r'httpStatusCode': httpStatusCode,
        },
        deserialize: ($serialized) {
          return WebSocketException(
            (($serialized?[r'message'] as String?)) ?? '',
            ($serialized?[r'httpStatusCode'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<IsolateSpawnException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return IsolateSpawnException(($serialized[r'message'] as String));
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$built_value_built_value.BuiltValueMissingGenericsError,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'parameter': $value.parameter,
        },
        deserialize: ($serialized) {
          return _$built_value_built_value.BuiltValueMissingGenericsError(
            ($serialized[r'type'] as String),
            ($serialized[r'parameter'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$built_value_built_value.BuiltValueNestedFieldError,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'field': $value.field,
          r'error': $value.error,
        },
        deserialize: ($serialized) {
          return _$built_value_built_value.BuiltValueNestedFieldError(
            ($serialized[r'type'] as String),
            ($serialized[r'field'] as String),
            ($serialized[r'error'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$built_value_built_value.BuiltValueNullFieldError,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'field': $value.field,
        },
        deserialize: ($serialized) {
          return _$built_value_built_value.BuiltValueNullFieldError(
            ($serialized[r'type'] as String),
            ($serialized[r'field'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_authorization_response.AuthorizationException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          if ($value.policyId case final policyId?) r'policyId': policyId,
          r'message': $value.message,
        },
        deserialize: ($serialized) {
          return _$cedar_authorization_response.AuthorizationException.fromJson(
            $serialized,
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_errors.ArityException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'name': $value.name,
          r'expected': $value.expected,
          r'actual': $value.actual,
        },
        deserialize: ($serialized) {
          return _$cedar_errors.ArityException(
            ($serialized[r'name'] as String),
            ($serialized[r'expected'] as num).toInt(),
            ($serialized[r'actual'] as num).toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_errors.AttributeAccessException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'attribute': $value.attribute,
        },
        deserialize: ($serialized) {
          return _$cedar_errors.AttributeAccessException(
            ($serialized[r'type'] as String),
            ($serialized[r'attribute'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_errors.EntityNotFoundException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'entityId': _$celest.Serializers.instance
              .serialize<_$cedar_value.EntityUid>($value.entityId),
        },
        deserialize: ($serialized) {
          return _$cedar_errors.EntityNotFoundException(
            _$celest.Serializers.instance.deserialize<_$cedar_value.EntityUid>(
              $serialized[r'entityId'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_errors.OverflowException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _$cedar_errors.OverflowException(
            ($serialized[r'message'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_errors.TypeException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _$cedar_errors.TypeException(
            ($serialized[r'message'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_errors.UnknownExtensionException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{r'name': $value.name},
        deserialize: ($serialized) {
          return _$cedar_errors.UnknownExtensionException(
            ($serialized[r'name'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$cedar_errors.UnspecifiedEntityException,
        Map<String, Object?>?
      >(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _$cedar_errors.UnspecifiedEntityException();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$cedar_value.EntityUid, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return _$cedar_value.EntityUid.fromJson($serialized);
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<Priority, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Priority.values.byName($serialized);
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<Task, Map<String, dynamic>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return Task.fromJson($serialized);
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest
          .Serializer.define<_$celest.AbortedException, Map<String, Object?>?>(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.AlreadyExistsException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.BadRequestException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.CancelledException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.CloudException, Map<String, Object?>>(
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
          return _$celest.CloudException.fromJson($serialized);
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.DataLossError, Map<String, Object?>?>(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.DeadlineExceededError,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.FailedPreconditionException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.InternalServerError,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest
          .Serializer.define<_$celest.NotFoundException, Map<String, Object?>?>(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.OutOfRangeException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.PermissionDeniedException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.ResourceExhaustedException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.UnauthorizedException,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest
          .Serializer.define<_$celest.UnavailableError, Map<String, Object?>?>(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.UnimplementedError,
        Map<String, Object?>?
      >(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.UnknownError, Map<String, Object?>?>(
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
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$celest.SerializationException,
        Map<String, Object?>
      >(
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
            ($serialized[r'message'] as String?),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _$celest.JsonValue($serialized);
        },
      ),
      const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$chunked_stream_read_chunked_stream.MaximumSizeExceeded,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{r'maxSize': $value.maxSize},
        deserialize: ($serialized) {
          return _$chunked_stream_read_chunked_stream.MaximumSizeExceeded(
            ($serialized[r'maxSize'] as num).toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$corks_cedar_exceptions.InvalidCorkException,
        Map<String, Object?>?
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'source': $value.source,
          if ($value.offset case final offset?) r'offset': offset,
        },
        deserialize: ($serialized) {
          return _$corks_cedar_exceptions.InvalidCorkException(
            (($serialized?[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$corks_cedar_exceptions.MissingSignatureError,
        Map<String, Object?>?
      >(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _$corks_cedar_exceptions.MissingSignatureError();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$drift_communication.ConnectionClosedException,
        Map<String, Object?>?
      >(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _$drift_communication.ConnectionClosedException();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$drift_cancellation_zone.CancellationException,
        Map<String, Object?>?
      >(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _$drift_cancellation_zone.CancellationException();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$drift_exceptions.CouldNotRollBackException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'cause': $value.cause,
          r'originalStackTrace': _$celest.Serializers.instance
              .serialize<StackTrace>($value.originalStackTrace),
          r'exception': $value.exception,
        },
        deserialize: ($serialized) {
          return _$drift_exceptions.CouldNotRollBackException(
            $serialized[r'cause']!,
            _$celest.Serializers.instance.deserialize<StackTrace>(
              $serialized[r'originalStackTrace'],
            ),
            $serialized[r'exception']!,
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$drift_exceptions.DriftWrappedException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.cause case final cause?) r'cause': cause,
          if (_$celest.Serializers.instance.serialize<StackTrace?>($value.trace)
              case final trace?)
            r'trace': trace,
        },
        deserialize: ($serialized) {
          return _$drift_exceptions.DriftWrappedException(
            message: ($serialized[r'message'] as String),
            cause: $serialized[r'cause'],
            trace: _$celest.Serializers.instance.deserialize<StackTrace?>(
              $serialized[r'trace'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$hrana_exception.ConnectionClosed,
        Map<String, Object?>?
      >(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _$hrana_exception.ConnectionClosed();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$http_abortable.RequestAbortedException,
        Map<String, Object?>?
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<Uri?>($value.uri)
              case final uri?)
            r'uri': uri,
        },
        deserialize: ($serialized) {
          return _$http_abortable.RequestAbortedException(
            _$celest.Serializers.instance.deserialize<Uri?>(
              $serialized?[r'uri'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$http_exception.ClientException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<Uri?>($value.uri)
              case final uri?)
            r'uri': uri,
        },
        deserialize: ($serialized) {
          return _$http_exception.ClientException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance.deserialize<Uri?>(
              $serialized[r'uri'],
            ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$mustache_template_template_exception.TemplateException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.templateName case final templateName?)
            r'templateName': templateName,
          if ($value.source case final source?) r'source': source,
          if ($value.offset case final offset?) r'offset': offset,
          r'line': $value.line,
          r'column': $value.column,
          r'context': $value.context,
        },
        deserialize: ($serialized) {
          return _$mustache_template_template_exception.TemplateException(
            ($serialized[r'message'] as String),
            ($serialized[r'templateName'] as String?),
            ($serialized[r'source'] as String?),
            ($serialized[r'offset'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$petitparser_exception.ParserException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'failure': _$celest.Serializers.instance
              .serialize<_$petitparser_result.Failure>($value.failure),
          r'message': $value.message,
          r'offset': $value.offset,
          r'source': $value.source,
        },
        deserialize: ($serialized) {
          return _$petitparser_exception.ParserException(
            _$celest.Serializers.instance
                .deserialize<_$petitparser_result.Failure>(
                  $serialized[r'failure'],
                ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$petitparser_result.Failure,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'buffer': $value.buffer,
          r'position': $value.position,
          r'isSuccess': $value.isSuccess,
          r'isFailure': $value.isFailure,
          r'message': $value.message,
        },
        deserialize: ($serialized) {
          return _$petitparser_result.Failure(
            ($serialized[r'buffer'] as String),
            ($serialized[r'position'] as num).toInt(),
            ($serialized[r'message'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$shelf_hijack_exception.HijackException,
        Map<String, Object?>?
      >(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _$shelf_hijack_exception.HijackException();
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$source_span_location.SourceLocation,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          if (_$celest.Serializers.instance.serialize<Uri?>($value.sourceUrl)
              case final sourceUrl?)
            r'sourceUrl': sourceUrl,
          r'offset': $value.offset,
          r'line': $value.line,
          r'column': $value.column,
          r'toolString': $value.toolString,
        },
        deserialize: ($serialized) {
          return _$source_span_location.SourceLocation(
            ($serialized[r'offset'] as num).toInt(),
            sourceUrl: $serialized[r'sourceUrl'],
            line: ($serialized[r'line'] as num?)?.toInt(),
            column: ($serialized[r'column'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$source_span_span.SourceSpan,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'start': _$celest.Serializers.instance
              .serialize<_$source_span_location.SourceLocation>($value.start),
          r'end': _$celest.Serializers.instance
              .serialize<_$source_span_location.SourceLocation>($value.end),
          r'text': $value.text,
          if (_$celest.Serializers.instance.serialize<Uri?>($value.sourceUrl)
              case final sourceUrl?)
            r'sourceUrl': sourceUrl,
          r'length': $value.length,
        },
        deserialize: ($serialized) {
          return _$source_span_span.SourceSpan(
            _$celest.Serializers.instance
                .deserialize<_$source_span_location.SourceLocation>(
                  $serialized[r'start'],
                ),
            _$celest.Serializers.instance
                .deserialize<_$source_span_location.SourceLocation>(
                  $serialized[r'end'],
                ),
            ($serialized[r'text'] as String),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$source_span_span_exception.SourceSpanException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$source_span_span.SourceSpan?>($value.span)
              case final span?)
            r'span': span,
        },
        deserialize: ($serialized) {
          return _$source_span_span_exception.SourceSpanException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance
                .deserialize<_$source_span_span.SourceSpan?>(
                  $serialized[r'span'],
                ),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$source_span_span_exception.SourceSpanFormatException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$source_span_span.SourceSpan?>($value.span)
              case final span?)
            r'span': span,
          r'source': $value.source,
          if ($value.offset case final offset?) r'offset': offset,
        },
        deserialize: ($serialized) {
          return _$source_span_span_exception.SourceSpanFormatException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance
                .deserialize<_$source_span_span.SourceSpan?>(
                  $serialized[r'span'],
                ),
            $serialized[r'source'],
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$sqlite3_exception.SqliteException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.explanation case final explanation?)
            r'explanation': explanation,
          r'extendedResultCode': $value.extendedResultCode,
          r'resultCode': $value.resultCode,
          if ($value.offset case final offset?) r'offset': offset,
          if ($value.operation case final operation?) r'operation': operation,
          if ($value.causingStatement case final causingStatement?)
            r'causingStatement': causingStatement,
          if ($value.parametersToStatement case final parametersToStatement?)
            r'parametersToStatement': parametersToStatement,
        },
        deserialize: ($serialized) {
          return _$sqlite3_exception.SqliteException(
            ($serialized[r'extendedResultCode'] as num).toInt(),
            ($serialized[r'message'] as String),
            ($serialized[r'explanation'] as String?),
            ($serialized[r'causingStatement'] as String?),
            ($serialized[r'parametersToStatement'] as Iterable<Object?>?)
                ?.toList(),
            ($serialized[r'operation'] as String?),
            ($serialized[r'offset'] as num?)?.toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest
          .Serializer.define<_$sqlite3_vfs.VfsException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'returnCode': $value.returnCode,
        },
        deserialize: ($serialized) {
          return _$sqlite3_vfs.VfsException(
            ($serialized[r'returnCode'] as num).toInt(),
          );
        },
      ),
    );
    _$celest.Serializers.instance.put(
      _$celest.Serializer.define<
        _$string_scanner_exception.StringScannerException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_$celest.Serializers.instance
                  .serialize<_$source_span_span.SourceSpan?>($value.span)
              case final span?)
            r'span': span,
          if ($value.offset case final offset?) r'offset': offset,
          r'source': $value.source,
          if (_$celest.Serializers.instance.serialize<Uri?>($value.sourceUrl)
              case final sourceUrl?)
            r'sourceUrl': sourceUrl,
        },
        deserialize: ($serialized) {
          return _$string_scanner_exception.StringScannerException(
            ($serialized[r'message'] as String),
            _$celest.Serializers.instance
                .deserialize<_$source_span_span.SourceSpan>(
                  $serialized[r'span'],
                ),
            ($serialized[r'source'] as String),
          );
        },
      ),
    );
  }, zoneValues: {_$celest.Serializers: serializers});
}
