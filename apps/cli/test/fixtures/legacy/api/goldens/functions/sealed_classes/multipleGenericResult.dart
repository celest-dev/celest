// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i8;

import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/exceptions.dart' as _i3;
import 'package:celest_backend/models/sealed_classes.dart' as _i2;
import 'package:celest_backend/src/functions/sealed_classes.dart' as _i5;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i9;
import 'package:celest_core/src/serialization/json_value.dart' as _i10;

final class MultipleGenericResultTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'multipleGenericResult';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) {
    final $T = (request[r'$T'] as String?);
    final $E = (request[r'$E'] as String?);
    final $types = ($T, $E);
    return switch ($types) {
      (r'Shape' || null, r'ShapeException' || null) =>
        innerHandle<_i2.Shape, _i3.ShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Shape' || null, r'BadShapeException') =>
        innerHandle<_i2.Shape, _i3.BadShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Circle', r'ShapeException' || null) =>
        innerHandle<_i2.Circle, _i3.ShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Circle', r'BadShapeException') =>
        innerHandle<_i2.Circle, _i3.BadShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Rectangle', r'ShapeException' || null) =>
        innerHandle<_i2.Rectangle, _i3.ShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Rectangle', r'BadShapeException') =>
        innerHandle<_i2.Rectangle, _i3.BadShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      _ =>
        throw _i4.SerializationException('Invalid type parameters: ${$types}'),
    };
  }

  Future<_i1.CelestResponse>
      innerHandle<T extends _i2.Shape, E extends _i3.ShapeException>(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i5.multipleGenericResult<T, E>(
        _i4.Serializers.instance.deserialize<T>(request[r'data']),
        _i4.Serializers.instance.deserialize<E>(request[r'error']),
      );
      return (
        statusCode: 200,
        body: {
          'response': response
              .map((el) =>
                  _i4.Serializers.instance.serialize<_i2.Result<T, E>>(el))
              .toList()
        }
      );
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on AssertionError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.AssertionError',
        'details': _i4.Serializers.instance.serialize<AssertionError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AsyncError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.AsyncError',
        'details': _i4.Serializers.instance.serialize<_i7.AsyncError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CancelledException catch (e) {
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
            _i4.Serializers.instance.serialize<ConcurrentModificationError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomErrorToFromJson',
        'details':
            _i4.Serializers.instance.serialize<_i3.CustomErrorToFromJson>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomError',
        'details': _i4.Serializers.instance.serialize<_i3.CustomError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomErrorWithStackTrace',
        'details': _i4.Serializers.instance
            .serialize<_i3.CustomErrorWithStackTrace>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomExceptionToFromJson',
        'details': _i4.Serializers.instance
            .serialize<_i3.CustomExceptionToFromJson>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i3.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomException',
        'details': _i4.Serializers.instance.serialize<_i3.CustomException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.FailedPreconditionException catch (e) {
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
        'details': _i4.Serializers.instance.serialize<IndexError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on IntegerDivisionByZeroException catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'details': _i4.Serializers.instance
            .serialize<IntegerDivisionByZeroException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.JsonUnsupportedObjectError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'details': _i4.Serializers.instance
            .serialize<_i8.JsonUnsupportedObjectError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on OutOfMemoryError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.OutOfMemoryError',
        'details': _i4.Serializers.instance.serialize<OutOfMemoryError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.PermissionDeniedException catch (e) {
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
        'details': _i4.Serializers.instance.serialize<RangeError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on ArgumentError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ArgumentError',
        'details': _i4.Serializers.instance.serialize<ArgumentError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.BadRequestException catch (e) {
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
        'details': _i4.Serializers.instance.serialize<FormatException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StackOverflowError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StackOverflowError',
        'details': _i4.Serializers.instance.serialize<StackOverflowError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StateError',
        'details': _i4.Serializers.instance.serialize<StateError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.TimeoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.TimeoutException',
        'details': _i4.Serializers.instance.serialize<_i7.TimeoutException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on TypeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.TypeError',
        'details': _i4.Serializers.instance.serialize<TypeError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnimplementedError catch (e) {
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
        'details': _i4.Serializers.instance.serialize<UnimplementedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CloudException catch (e) {
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
        'details': _i4.Serializers.instance.serialize<UnsupportedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on Error catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.Error',
        'details': _i4.Serializers.instance.serialize<Error>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.AsyncError, Map<String, Object?>>(
      serialize: ($value) => {
        r'error': $value.error,
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i7.AsyncError(
          $serialized[r'error']!,
          _i4.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'duration':
            _i4.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i7.TimeoutException(
          ($serialized[r'message'] as String?),
          _i4.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i8.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => {
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
      },
      deserialize: ($serialized) {
        return _i8.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<ArgumentError, Map<String, Object?>?>(
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => {r'modifiedObject': $value.modifiedObject},
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<FormatException, Map<String, Object?>?>(
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<IndexError, Map<String, Object?>>(
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
    _i4.Serializers.instance.put(_i4.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<RangeError, Map<String, Object?>>(
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.BadShapeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'shape': _i4.Serializers.instance.serialize<_i2.Shape>($value.shape)
      },
      deserialize: ($serialized) {
        return _i3.BadShapeException(_i4.Serializers.instance
            .deserialize<_i2.Shape>($serialized[r'shape']));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.CustomError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i10.JsonMap>(
          $value.additionalInfo,
          const _i4.TypeToken<_i10.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.CustomError();
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i3.CustomErrorToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i3.CustomErrorToFromJson.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i3.CustomErrorWithStackTrace, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>($value.stackTrace),
        r'message': $value.message,
        r'additionalInfo': $value.additionalInfo,
      },
      deserialize: ($serialized) {
        return _i3.CustomErrorWithStackTrace(
            stackTrace: _i4.Serializers.instance
                .deserialize<StackTrace?>($serialized?[r'stackTrace']));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.CustomException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i10.JsonMap>(
          $value.additionalInfo,
          const _i4.TypeToken<_i10.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.CustomException();
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i3.CustomExceptionToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i3.CustomExceptionToFromJson.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.ShapeException, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i3.BadShapeException) {
          return {
            ...(_i4.Serializers.instance
                    .serialize<_i3.BadShapeException>($value)
                as Map<String, Object?>),
            r'$type': r'BadShapeException',
          };
        }
        throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'ShapeException')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'BadShapeException') {
          return _i4.Serializers.instance
              .deserialize<_i3.BadShapeException>($serialized);
        }
        throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'ShapeException')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i2.Circle, Map<String, Object?>>(
      serialize: ($value) => {
        r'radius': $value.radius,
        r'area': $value.area,
      },
      deserialize: ($serialized) {
        return _i2.Circle(($serialized[r'radius'] as num).toDouble());
      },
    ));
    _i4.Serializers.instance.put(const ErrResult_T_ShapeSerializer());
    _i4.Serializers.instance
        .put(const ErrResult_T_ShapeSerializer<_i2.Shape>());
    _i4.Serializers.instance
        .put(const ErrResult_T_ShapeSerializer<_i2.Circle>());
    _i4.Serializers.instance
        .put(const ErrResult_T_ShapeSerializer<_i2.Rectangle>());
    _i4.Serializers.instance.put(const ErrResult_E_ShapeExceptionSerializer());
    _i4.Serializers.instance
        .put(const ErrResult_E_ShapeExceptionSerializer<_i3.ShapeException>());
    _i4.Serializers.instance.put(
        const ErrResult_E_ShapeExceptionSerializer<_i3.BadShapeException>());
    _i4.Serializers.instance.put(const OkResult_T_ShapeSerializer());
    _i4.Serializers.instance.put(const OkResult_T_ShapeSerializer<_i2.Shape>());
    _i4.Serializers.instance
        .put(const OkResult_T_ShapeSerializer<_i2.Circle>());
    _i4.Serializers.instance
        .put(const OkResult_T_ShapeSerializer<_i2.Rectangle>());
    _i4.Serializers.instance.put(const OkResult_E_ShapeExceptionSerializer());
    _i4.Serializers.instance
        .put(const OkResult_E_ShapeExceptionSerializer<_i3.ShapeException>());
    _i4.Serializers.instance.put(
        const OkResult_E_ShapeExceptionSerializer<_i3.BadShapeException>());
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i2.Rectangle, Map<String, Object?>>(
      serialize: ($value) => {
        r'width': $value.width,
        r'height': $value.height,
        r'area': $value.area,
      },
      deserialize: ($serialized) {
        return _i2.Rectangle(
          ($serialized[r'width'] as num).toDouble(),
          ($serialized[r'height'] as num).toDouble(),
        );
      },
    ));
    _i4.Serializers.instance
        .put(const Result_T_Shape_E_ShapeExceptionSerializer());
    _i4.Serializers.instance.put(
        const Result_T_Shape_E_ShapeExceptionSerializer<_i2.Shape,
            _i3.ShapeException>());
    _i4.Serializers.instance.put(
        const Result_T_Shape_E_ShapeExceptionSerializer<_i2.Shape,
            _i3.BadShapeException>());
    _i4.Serializers.instance.put(
        const Result_T_Shape_E_ShapeExceptionSerializer<_i2.Circle,
            _i3.ShapeException>());
    _i4.Serializers.instance.put(
        const Result_T_Shape_E_ShapeExceptionSerializer<_i2.Circle,
            _i3.BadShapeException>());
    _i4.Serializers.instance.put(
        const Result_T_Shape_E_ShapeExceptionSerializer<_i2.Rectangle,
            _i3.ShapeException>());
    _i4.Serializers.instance.put(
        const Result_T_Shape_E_ShapeExceptionSerializer<_i2.Rectangle,
            _i3.BadShapeException>());
    _i4.Serializers.instance
        .put(const Result_E_ShapeException_T_ShapeSerializer());
    _i4.Serializers.instance.put(
        const Result_E_ShapeException_T_ShapeSerializer<_i3.ShapeException,
            _i2.Shape>());
    _i4.Serializers.instance.put(
        const Result_E_ShapeException_T_ShapeSerializer<_i3.ShapeException,
            _i2.Circle>());
    _i4.Serializers.instance.put(
        const Result_E_ShapeException_T_ShapeSerializer<_i3.ShapeException,
            _i2.Rectangle>());
    _i4.Serializers.instance.put(
        const Result_E_ShapeException_T_ShapeSerializer<_i3.BadShapeException,
            _i2.Shape>());
    _i4.Serializers.instance.put(
        const Result_E_ShapeException_T_ShapeSerializer<_i3.BadShapeException,
            _i2.Circle>());
    _i4.Serializers.instance.put(
        const Result_E_ShapeException_T_ShapeSerializer<_i3.BadShapeException,
            _i2.Rectangle>());
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i2.Shape, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i2.Circle) {
          return {
            ...(_i4.Serializers.instance.serialize<_i2.Circle>($value)
                as Map<String, Object?>),
            r'$type': r'Circle',
          };
        }
        if ($value is _i2.Rectangle) {
          return {
            ...(_i4.Serializers.instance.serialize<_i2.Rectangle>($value)
                as Map<String, Object?>),
            r'$type': r'Rectangle',
          };
        }
        throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Shape')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'Circle') {
          return _i4.Serializers.instance.deserialize<_i2.Circle>($serialized);
        }
        if ($serialized[r'$type'] == r'Rectangle') {
          return _i4.Serializers.instance
              .deserialize<_i2.Rectangle>($serialized);
        }
        throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Shape')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
      },
    ));
    _i4.Serializers.instance
        .put(const SwappedResult_E_ShapeException_T_ShapeSerializer());
    _i4.Serializers.instance.put(
        const SwappedResult_E_ShapeException_T_ShapeSerializer<
            _i3.ShapeException, _i2.Shape>());
    _i4.Serializers.instance.put(
        const SwappedResult_E_ShapeException_T_ShapeSerializer<
            _i3.ShapeException, _i2.Circle>());
    _i4.Serializers.instance.put(
        const SwappedResult_E_ShapeException_T_ShapeSerializer<
            _i3.ShapeException, _i2.Rectangle>());
    _i4.Serializers.instance.put(
        const SwappedResult_E_ShapeException_T_ShapeSerializer<
            _i3.BadShapeException, _i2.Shape>());
    _i4.Serializers.instance.put(
        const SwappedResult_E_ShapeException_T_ShapeSerializer<
            _i3.BadShapeException, _i2.Circle>());
    _i4.Serializers.instance.put(
        const SwappedResult_E_ShapeException_T_ShapeSerializer<
            _i3.BadShapeException, _i2.Rectangle>());
    _i4.Serializers.instance
        .put(const SwappedResult_T_Shape_E_ShapeExceptionSerializer());
    _i4.Serializers.instance.put(
        const SwappedResult_T_Shape_E_ShapeExceptionSerializer<_i2.Shape,
            _i3.ShapeException>());
    _i4.Serializers.instance.put(
        const SwappedResult_T_Shape_E_ShapeExceptionSerializer<_i2.Shape,
            _i3.BadShapeException>());
    _i4.Serializers.instance.put(
        const SwappedResult_T_Shape_E_ShapeExceptionSerializer<_i2.Circle,
            _i3.ShapeException>());
    _i4.Serializers.instance.put(
        const SwappedResult_T_Shape_E_ShapeExceptionSerializer<_i2.Circle,
            _i3.BadShapeException>());
    _i4.Serializers.instance.put(
        const SwappedResult_T_Shape_E_ShapeExceptionSerializer<_i2.Rectangle,
            _i3.ShapeException>());
    _i4.Serializers.instance.put(
        const SwappedResult_T_Shape_E_ShapeExceptionSerializer<_i2.Rectangle,
            _i3.BadShapeException>());
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CloudException.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i4.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.JsonMap, Map<String, Object?>>(
        serialize: ($value) => $value,
        deserialize: ($serialized) {
          return _i10.JsonMap(($serialized as Map<String, Object?>));
        },
      ),
      const _i4.TypeToken<_i10.JsonMap>('JsonMap'),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i10.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i10.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': MultipleGenericResultTarget()});
}

final class ErrResult_E_ShapeExceptionSerializer<E extends _i3.ShapeException>
    extends _i4.Serializer<_i2.ErrResult<E>> {
  const ErrResult_E_ShapeExceptionSerializer();

  @override
  _i2.ErrResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i2.ErrResult<E>(
        _i4.Serializers.instance.deserialize<E>($serialized[r'error']));
  }

  @override
  Object? serialize(_i2.ErrResult<E> $value) =>
      {r'error': _i4.Serializers.instance.serialize<E>($value.error)};
}

final class ErrResult_T_ShapeSerializer<T extends _i2.Shape>
    extends _i4.Serializer<_i2.ErrResult<T>> {
  const ErrResult_T_ShapeSerializer();

  @override
  _i2.ErrResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i2.ErrResult<T>(
        _i4.Serializers.instance.deserialize<T>($serialized[r'error']));
  }

  @override
  Object? serialize(_i2.ErrResult<T> $value) =>
      {r'error': _i4.Serializers.instance.serialize<T>($value.error)};
}

final class OkResult_E_ShapeExceptionSerializer<E extends _i3.ShapeException>
    extends _i4.Serializer<_i2.OkResult<E>> {
  const OkResult_E_ShapeExceptionSerializer();

  @override
  _i2.OkResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i2.OkResult<E>(
        _i4.Serializers.instance.deserialize<E>($serialized[r'data']));
  }

  @override
  Object? serialize(_i2.OkResult<E> $value) =>
      {r'data': _i4.Serializers.instance.serialize<E>($value.data)};
}

final class OkResult_T_ShapeSerializer<T extends _i2.Shape>
    extends _i4.Serializer<_i2.OkResult<T>> {
  const OkResult_T_ShapeSerializer();

  @override
  _i2.OkResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i2.OkResult<T>(
        _i4.Serializers.instance.deserialize<T>($serialized[r'data']));
  }

  @override
  Object? serialize(_i2.OkResult<T> $value) =>
      {r'data': _i4.Serializers.instance.serialize<T>($value.data)};
}

final class Result_E_ShapeException_T_ShapeSerializer<
    E extends _i3.ShapeException,
    T extends _i2.Shape> extends _i4.Serializer<_i2.Result<E, T>> {
  const Result_E_ShapeException_T_ShapeSerializer();

  @override
  _i2.Result<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'SwappedResult') {
      return _i4.Serializers.instance
          .deserialize<_i2.SwappedResult<T, E>>($serialized);
    }
    if ($serialized[r'$type'] == r'OkResult') {
      return _i4.Serializers.instance.deserialize<_i2.OkResult<E>>($serialized);
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return _i4.Serializers.instance
          .deserialize<_i2.ErrResult<T>>($serialized);
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i2.Result<E, T> $value) {
    if ($value is _i2.SwappedResult<T, E>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.SwappedResult<T, E>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is _i2.OkResult<E>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.OkResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is _i2.ErrResult<T>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.ErrResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($value.runtimeType))
        .toString());
  }
}

final class Result_T_Shape_E_ShapeExceptionSerializer<T extends _i2.Shape,
    E extends _i3.ShapeException> extends _i4.Serializer<_i2.Result<T, E>> {
  const Result_T_Shape_E_ShapeExceptionSerializer();

  @override
  _i2.Result<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'SwappedResult') {
      return _i4.Serializers.instance
          .deserialize<_i2.SwappedResult<E, T>>($serialized);
    }
    if ($serialized[r'$type'] == r'OkResult') {
      return _i4.Serializers.instance.deserialize<_i2.OkResult<T>>($serialized);
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return _i4.Serializers.instance
          .deserialize<_i2.ErrResult<E>>($serialized);
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i2.Result<T, E> $value) {
    if ($value is _i2.SwappedResult<E, T>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.SwappedResult<E, T>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is _i2.OkResult<T>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.OkResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is _i2.ErrResult<E>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.ErrResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($value.runtimeType))
        .toString());
  }
}

final class SwappedResult_E_ShapeException_T_ShapeSerializer<
    E extends _i3.ShapeException,
    T extends _i2.Shape> extends _i4.Serializer<_i2.SwappedResult<E, T>> {
  const SwappedResult_E_ShapeException_T_ShapeSerializer();

  @override
  _i2.SwappedResult<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i2.SwappedResult<E, T>(_i4.Serializers.instance
        .deserialize<_i2.Result<E, T>>($serialized[r'result']));
  }

  @override
  Object? serialize(_i2.SwappedResult<E, T> $value) => {
        r'result':
            _i4.Serializers.instance.serialize<_i2.Result<E, T>>($value.result)
      };
}

final class SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        T extends _i2.Shape, E extends _i3.ShapeException>
    extends _i4.Serializer<_i2.SwappedResult<T, E>> {
  const SwappedResult_T_Shape_E_ShapeExceptionSerializer();

  @override
  _i2.SwappedResult<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i2.SwappedResult<T, E>(_i4.Serializers.instance
        .deserialize<_i2.Result<T, E>>($serialized[r'result']));
  }

  @override
  Object? serialize(_i2.SwappedResult<T, E> $value) => {
        r'result':
            _i4.Serializers.instance.serialize<_i2.Result<T, E>>($value.result)
      };
}
