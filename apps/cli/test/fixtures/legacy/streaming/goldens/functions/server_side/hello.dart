// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i7;

import 'package:celest/src/core/context.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/server_side.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i5;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i3;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i8;
import 'package:celest_core/src/serialization/json_value.dart' as _i9;

final class HelloTarget extends _i1.CloudEventSourceTarget {
  @override
  String get name => 'hello';

  @override
  bool get hasBody => true;

  @override
  Stream<Object?> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async* {
    try {
      await for (final response in _i2.hello(
          (request[r'names'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList())) {
        yield response;
      }
    } on _i3.AbortedException catch (e, st) {
      const statusCode = 409;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.AbortedException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<_i3.AbortedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.AlreadyExistsException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.AlreadyExistsException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on AssertionError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.AssertionError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<AssertionError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i6.AsyncError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.AsyncError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<_i6.AsyncError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.CancelledException catch (e, st) {
      const statusCode = 499;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.CancelledException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.CancelledException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on ConcurrentModificationError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ConcurrentModificationError',
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<ConcurrentModificationError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.DataLossError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.DataLossError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<_i3.DataLossError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.DeadlineExceededError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.DeadlineExceededError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.FailedPreconditionException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance
          .serialize<_i3.FailedPreconditionException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on IndexError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.IndexError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<IndexError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on IntegerDivisionByZeroException catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<IntegerDivisionByZeroException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.InternalServerError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.InternalServerError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i7.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i7.JsonUnsupportedObjectError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.NotFoundException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.NotFoundException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on OutOfMemoryError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.OutOfMemoryError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<OutOfMemoryError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.OutOfRangeException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.OutOfRangeException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.PermissionDeniedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.PermissionDeniedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on RangeError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.RangeError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<RangeError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on ArgumentError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ArgumentError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<ArgumentError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.ResourceExhaustedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.ResourceExhaustedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i8.SerializationException catch (e, st) {
      const statusCode = 400;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.SerializationException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i8.SerializationException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.BadRequestException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.BadRequestException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on FormatException catch (e, st) {
      const statusCode = 400;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.FormatException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<FormatException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on StackOverflowError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StackOverflowError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<StackOverflowError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on StateError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StateError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<StateError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i6.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.TimeoutException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<_i6.TimeoutException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on TypeError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.TypeError',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<TypeError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnauthorizedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.UnauthorizedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnavailableError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<_i3.UnavailableError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnimplementedError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i5.Serializers.instance.serialize<_i3.UnimplementedError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on UnimplementedError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnimplementedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<UnimplementedError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.UnknownError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnknownError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<_i3.UnknownError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i3.CloudException catch (e, st) {
      const statusCode = 400;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.CloudException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<_i3.CloudException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on UnsupportedError catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnsupportedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<UnsupportedError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on Error catch (e, st) {
      const statusCode = 500;
      _i4.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.Error',
        'status': statusCode,
      };
      final error = _i5.Serializers.instance.serialize<Error>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    }
  }

  @override
  void init() {
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i6.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i5.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i6.AsyncError(
          $serialized[r'error']!,
          _i5.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i6.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message,
        if (_i5.Serializers.instance.serialize<Duration?>($value.duration)
            case final duration?)
          r'duration': duration,
      },
      deserialize: ($serialized) {
        return _i6.TimeoutException(
          ($serialized[r'message'] as String?),
          _i5.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i7.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.unsupportedObject case final unsupportedObject?)
          r'unsupportedObject': unsupportedObject,
        if ($value.cause case final cause?) r'cause': cause,
        if ($value.partialResult case final partialResult?)
          r'partialResult': partialResult,
      },
      deserialize: ($serialized) {
        return _i7.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<ArgumentError, Map<String, Object?>?>(
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
    _i5.Serializers.instance
        .put(_i5.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.modifiedObject case final modifiedObject?)
          r'modifiedObject': modifiedObject
      },
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if (_i5.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
            case final stackTrace?)
          r'stackTrace': stackTrace
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<FormatException, Map<String, Object?>?>(
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
    _i5.Serializers.instance
        .put(_i5.Serializer.define<IndexError, Map<String, Object?>>(
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
    _i5.Serializers.instance.put(_i5.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<RangeError, Map<String, Object?>>(
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
    _i5.Serializers.instance
        .put(_i5.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.CloudException.fromJson($serialized);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i3.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i3.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i3.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i3.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i8.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i8.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i9.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i9.JsonValue($serialized);
        },
      ),
      const _i5.TypeToken<_i9.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': HelloTarget()});
}
