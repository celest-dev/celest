// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/exceptions.dart' as _i5;
import 'package:celest_backend/models/sealed_classes.dart' as _i4;
import 'package:celest_backend/src/functions/sealed_classes.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

final class SealedClassWithOverriddenCustomJsonTarget
    extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'sealedClassWithOverriddenCustomJson';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i2.sealedClassWithOverriddenCustomJson(
        circle: _i3.Serializers.instance
            .deserialize<_i4.CircleWithOverriddenCustomJson>(
                request[r'circle']),
        rectangle: _i3.Serializers.instance
            .deserialize<_i4.RectangleWithOverriddenCustomJson>(
                request[r'rectangle']),
        other: (request[r'other'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance
                .deserialize<_i4.ShapeWithOverriddenCustomJson>(el))
            .toList(),
      );
      return (
        statusCode: 200,
        body: {
          'response': response
              .map((el) => _i3.Serializers.instance
                  .serialize<_i4.ShapeWithOverriddenCustomJson>(el))
              .toList()
        }
      );
    } on _i5.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomErrorWithStackTrace',
        'details': _i3.Serializers.instance
            .serialize<_i5.CustomErrorWithStackTrace>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomErrorToFromJson',
        'details':
            _i3.Serializers.instance.serialize<_i5.CustomErrorToFromJson>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomError',
        'details': _i3.Serializers.instance.serialize<_i5.CustomError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomExceptionToFromJson',
        'details': _i3.Serializers.instance
            .serialize<_i5.CustomExceptionToFromJson>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'api.v1.CustomException',
        'details': _i3.Serializers.instance.serialize<_i5.CustomException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
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
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.CircleWithOverriddenCustomJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.CircleWithOverriddenCustomJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.RectangleWithOverriddenCustomJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return (_i4.ShapeWithOverriddenCustomJson.fromJson({
          r'$type': r'RectangleWithOverriddenCustomJson',
          ...$serialized,
        }) as _i4.RectangleWithOverriddenCustomJson);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.ShapeWithOverriddenCustomJson, Map<String, Object?>>(
      serialize: ($value) => {
        ...$value.toJson(),
        r'$type': switch ($value) {
          _i4.CircleWithOverriddenCustomJson() =>
            r'CircleWithOverriddenCustomJson',
          _i4.RectangleWithOverriddenCustomJson() =>
            r'RectangleWithOverriddenCustomJson',
        },
      },
      deserialize: ($serialized) {
        return _i4.ShapeWithOverriddenCustomJson.fromJson($serialized);
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
  await _i1.serve(targets: {'/': SealedClassWithOverriddenCustomJsonTarget()});
}
