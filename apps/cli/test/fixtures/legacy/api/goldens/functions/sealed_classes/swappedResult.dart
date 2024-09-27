// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/exceptions.dart' as _i5;
import 'package:celest_backend/models/sealed_classes.dart' as _i4;
import 'package:celest_backend/src/functions/sealed_classes.dart' as _i2;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

final class SwappedResultTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'swappedResult';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i2.swappedResult(_i3.Serializers.instance
          .deserialize<_i4.Result<_i4.Shape, String>>(request[r'result']));
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance
              .serialize<_i4.SwappedResult<_i4.Shape, String>>(response)
        }
      );
    } on _i5.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.CustomErrorWithStackTrace',
        'details': _i3.Serializers.instance
            .serialize<_i5.CustomErrorWithStackTrace>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.CustomErrorToFromJson',
        'details':
            _i3.Serializers.instance.serialize<_i5.CustomErrorToFromJson>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.CustomError',
        'details': _i3.Serializers.instance.serialize<_i5.CustomError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'api.CustomExceptionToFromJson',
        'details': _i3.Serializers.instance
            .serialize<_i5.CustomExceptionToFromJson>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'api.CustomException',
        'details': _i3.Serializers.instance.serialize<_i5.CustomException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.CustomError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CustomError();
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.CustomErrorToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.CustomErrorToFromJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.CustomErrorWithStackTrace, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.stackTrace),
        r'message': $value.message,
        r'additionalInfo': $value.additionalInfo,
      },
      deserialize: ($serialized) {
        return _i5.CustomErrorWithStackTrace(
            stackTrace: _i3.Serializers.instance
                .deserialize<StackTrace?>($serialized?[r'stackTrace']));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.CustomException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CustomException();
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.CustomExceptionToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.CustomExceptionToFromJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Circle, Map<String, Object?>>(
      serialize: ($value) => {
        r'radius': $value.radius,
        r'area': $value.area,
      },
      deserialize: ($serialized) {
        return _i4.Circle(($serialized[r'radius'] as num).toDouble());
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.ErrResult<String>, Map<String, Object?>>(
      serialize: ($value) => {r'error': $value.error},
      deserialize: ($serialized) {
        return _i4.ErrResult<String>(($serialized[r'error'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i4.ErrResult<_i4.Shape>, Map<String, Object?>>(
      serialize: ($value) => {
        r'error': _i3.Serializers.instance.serialize<_i4.Shape>($value.error)
      },
      deserialize: ($serialized) {
        return _i4.ErrResult<_i4.Shape>(_i3.Serializers.instance
            .deserialize<_i4.Shape>($serialized[r'error']));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i4.OkResult<_i4.Shape>, Map<String, Object?>>(
      serialize: ($value) =>
          {r'data': _i3.Serializers.instance.serialize<_i4.Shape>($value.data)},
      deserialize: ($serialized) {
        return _i4.OkResult<_i4.Shape>(_i3.Serializers.instance
            .deserialize<_i4.Shape>($serialized[r'data']));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.OkResult<String>, Map<String, Object?>>(
      serialize: ($value) => {r'data': $value.data},
      deserialize: ($serialized) {
        return _i4.OkResult<String>(($serialized[r'data'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Rectangle, Map<String, Object?>>(
      serialize: ($value) => {
        r'width': $value.width,
        r'height': $value.height,
        r'area': $value.area,
      },
      deserialize: ($serialized) {
        return _i4.Rectangle(
          ($serialized[r'width'] as num).toDouble(),
          ($serialized[r'height'] as num).toDouble(),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.Result<_i4.Shape, String>, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i4.SwappedResult<String, _i4.Shape>) {
          return {
            ...(_i3.Serializers.instance
                    .serialize<_i4.SwappedResult<String, _i4.Shape>>($value)
                as Map<String, Object?>),
            r'$type': r'SwappedResult',
          };
        }
        if ($value is _i4.OkResult<_i4.Shape>) {
          return {
            ...(_i3.Serializers.instance
                    .serialize<_i4.OkResult<_i4.Shape>>($value)
                as Map<String, Object?>),
            r'$type': r'OkResult',
          };
        }
        if ($value is _i4.ErrResult<String>) {
          return {
            ...(_i3.Serializers.instance
                    .serialize<_i4.ErrResult<String>>($value)
                as Map<String, Object?>),
            r'$type': r'ErrResult',
          };
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Result')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'SwappedResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.SwappedResult<String, _i4.Shape>>($serialized);
        }
        if ($serialized[r'$type'] == r'OkResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.OkResult<_i4.Shape>>($serialized);
        }
        if ($serialized[r'$type'] == r'ErrResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.ErrResult<String>>($serialized);
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Result')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.Result<String, _i4.Shape>, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i4.SwappedResult<_i4.Shape, String>) {
          return {
            ...(_i3.Serializers.instance
                    .serialize<_i4.SwappedResult<_i4.Shape, String>>($value)
                as Map<String, Object?>),
            r'$type': r'SwappedResult',
          };
        }
        if ($value is _i4.OkResult<String>) {
          return {
            ...(_i3.Serializers.instance.serialize<_i4.OkResult<String>>($value)
                as Map<String, Object?>),
            r'$type': r'OkResult',
          };
        }
        if ($value is _i4.ErrResult<_i4.Shape>) {
          return {
            ...(_i3.Serializers.instance
                    .serialize<_i4.ErrResult<_i4.Shape>>($value)
                as Map<String, Object?>),
            r'$type': r'ErrResult',
          };
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Result')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'SwappedResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.SwappedResult<_i4.Shape, String>>($serialized);
        }
        if ($serialized[r'$type'] == r'OkResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.OkResult<String>>($serialized);
        }
        if ($serialized[r'$type'] == r'ErrResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.ErrResult<_i4.Shape>>($serialized);
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Result')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Shape, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i4.Circle) {
          return {
            ...(_i3.Serializers.instance.serialize<_i4.Circle>($value)
                as Map<String, Object?>),
            r'$type': r'Circle',
          };
        }
        if ($value is _i4.Rectangle) {
          return {
            ...(_i3.Serializers.instance.serialize<_i4.Rectangle>($value)
                as Map<String, Object?>),
            r'$type': r'Rectangle',
          };
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Shape')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'Circle') {
          return _i3.Serializers.instance.deserialize<_i4.Circle>($serialized);
        }
        if ($serialized[r'$type'] == r'Rectangle') {
          return _i3.Serializers.instance
              .deserialize<_i4.Rectangle>($serialized);
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Shape')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.SwappedResult<String, _i4.Shape>, Map<String, Object?>>(
      serialize: ($value) => {
        r'result': _i3.Serializers.instance
            .serialize<_i4.Result<String, _i4.Shape>>($value.result)
      },
      deserialize: ($serialized) {
        return _i4.SwappedResult<String, _i4.Shape>(_i3.Serializers.instance
            .deserialize<_i4.Result<String, _i4.Shape>>(
                $serialized[r'result']));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.SwappedResult<_i4.Shape, String>, Map<String, Object?>>(
      serialize: ($value) => {
        r'result': _i3.Serializers.instance
            .serialize<_i4.Result<_i4.Shape, String>>($value.result)
      },
      deserialize: ($serialized) {
        return _i4.SwappedResult<_i4.Shape, String>(_i3.Serializers.instance
            .deserialize<_i4.Result<_i4.Shape, String>>(
                $serialized[r'result']));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i8.JsonMap, Map<String, Object?>>(
        serialize: ($value) => $value,
        deserialize: ($serialized) {
          return _i8.JsonMap(($serialized as Map<String, Object?>));
        },
      ),
      const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
    );
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i8.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i8.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': SwappedResultTarget()});
}
