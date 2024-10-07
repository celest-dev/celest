// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i7;

import 'package:_common/src/models/errors_and_exceptions.dart' as _i9;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i4;
import 'package:celest_backend/src/functions/exceptions.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i5;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i3;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i8;
import 'package:celest_core/src/serialization/json_value.dart' as _i10;

final class ThrowsAppExceptionTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'throwsAppException';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      _i2.throwsAppException();
      return (statusCode: 200, body: {'response': null});
    } on _i3.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.AppError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.v1.AppError',
        'details': _i5.Serializers.instance.serialize<_i4.AppError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.AppException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.v1.AppException',
        'details': _i5.Serializers.instance.serialize<_i4.AppException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AsyncError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.AsyncError',
        'details': _i5.Serializers.instance.serialize<_i6.AsyncError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on ConcurrentModificationError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ConcurrentModificationError',
        'details':
            _i5.Serializers.instance.serialize<ConcurrentModificationError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on IndexError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IndexError',
        'details': _i5.Serializers.instance.serialize<IndexError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on IntegerDivisionByZeroException catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'details': _i5.Serializers.instance
            .serialize<IntegerDivisionByZeroException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.JsonUnsupportedObjectError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'details': _i5.Serializers.instance
            .serialize<_i7.JsonUnsupportedObjectError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.NotYetImplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.v1.NotYetImplementedError',
        'details':
            _i5.Serializers.instance.serialize<_i4.NotYetImplementedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on AssertionError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.AssertionError',
        'details': _i5.Serializers.instance.serialize<AssertionError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on OutOfMemoryError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.OutOfMemoryError',
        'details': _i5.Serializers.instance.serialize<OutOfMemoryError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on RangeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.RangeError',
        'details': _i5.Serializers.instance.serialize<RangeError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on ArgumentError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ArgumentError',
        'details': _i5.Serializers.instance.serialize<ArgumentError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on FormatException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.FormatException',
        'details': _i5.Serializers.instance.serialize<FormatException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StackOverflowError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StackOverflowError',
        'details': _i5.Serializers.instance.serialize<StackOverflowError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StateError',
        'details': _i5.Serializers.instance.serialize<StateError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.TimeoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.TimeoutException',
        'details': _i5.Serializers.instance.serialize<_i6.TimeoutException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on UnimplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnimplementedError',
        'details': _i5.Serializers.instance.serialize<UnimplementedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on UnsupportedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnsupportedError',
        'details': _i5.Serializers.instance.serialize<UnsupportedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UserException_ShowInConsole catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.v1.UserException_ShowInConsole',
        'details': _i5.Serializers.instance
            .serialize<_i4.UserException_ShowInConsole>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.UserException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': '_common.UserException',
        'details': _i5.Serializers.instance.serialize<_i9.UserException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.ValidateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': '_common.ValidateError',
        'details': _i5.Serializers.instance.serialize<_i9.ValidateError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on TypeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.TypeError',
        'details': _i5.Serializers.instance.serialize<TypeError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on Error catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.Error',
        'details': _i5.Serializers.instance.serialize<Error>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i6.AsyncError, Map<String, Object?>>(
      serialize: ($value) => {
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
      serialize: ($value) => {
        r'message': $value.message,
        r'duration':
            _i5.Serializers.instance.serialize<Duration?>($value.duration),
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
      serialize: ($value) => {
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
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
    _i5.Serializers.instance
        .put(_i5.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => {r'modifiedObject': $value.modifiedObject},
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i5.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<FormatException, Map<String, Object?>?>(
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
    _i5.Serializers.instance
        .put(_i5.Serializer.define<IndexError, Map<String, Object?>>(
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
    _i5.Serializers.instance.put(_i5.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<RangeError, Map<String, Object?>>(
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
    _i5.Serializers.instance
        .put(_i5.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i9.UserException, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i9.UserException.fromJson($serialized);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i9.ValidateError, Map<String, Object?>>(
      serialize: ($value) => {r'msg': $value.msg},
      deserialize: ($serialized) {
        return _i9.ValidateError(($serialized[r'msg'] as String));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.AppError, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.AppError.fromJson($serialized);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.AppException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'error': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.error,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
        r'msg': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.msg,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return (_i9.AppException(
          $serialized?[r'msg'],
          $serialized?[r'error'],
        ) as _i4.AppException);
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.NotYetImplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'message': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.message,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.NotYetImplementedError(
            _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
          $serialized?[r'message'],
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ));
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.UserException_ShowInConsole, Map<String, Object?>>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.cause,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UserException_ShowInConsole(
          msg: ($serialized[r'msg'] as String),
          cause: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'cause'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.CloudException.fromJson($serialized);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i3.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i3.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i3.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i3.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i8.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i5.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i10.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i10.JsonValue($serialized);
        },
      ),
      const _i5.TypeToken<_i10.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': ThrowsAppExceptionTarget()});
}
