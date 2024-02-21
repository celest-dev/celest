// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i7;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

import '../../../functions/sealed_classes.dart' as _i2;

final class ShapeResultsTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'shapeResults';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.shapeResults(
          (request[r'shapes'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<_i4.Shape>(el))
              .toList());
      return (
        statusCode: 200,
        body: {
          'response': response
              .map((el) => _i3.Serializers.instance
                  .serialize<_i4.Result<_i4.Shape, String>>(el))
              .toList()
        }
      );
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i6.InternalServerException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.InternalServerException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerException',
            'details': error,
          }
        }
      );
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    } on _i7.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.CustomErrorWithStackTrace>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorWithStackTrace',
            'details': error,
          }
        }
      );
    } on _i7.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.CustomErrorToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorToFromJson',
            'details': error,
          }
        }
      );
    } on _i7.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i7.CustomError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomError',
            'details': error,
          }
        }
      );
    } on _i7.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.CustomExceptionToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomExceptionToFromJson',
            'details': error,
          }
        }
      );
    } on _i7.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i7.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.Result<_i4.Shape, String>, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i4.ErrResult<String>) {
          return {
            ...(_i3.Serializers.instance
                    .serialize<_i4.ErrResult<String>>($value)
                as Map<String, Object?>),
            r'$type': r'ErrResult',
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
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Result')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'ErrResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.ErrResult<String>>($serialized);
        }
        if ($serialized[r'$type'] == r'OkResult') {
          return _i3.Serializers.instance
              .deserialize<_i4.OkResult<_i4.Shape>>($serialized);
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Result')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
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
        _i3.Serializer.define<_i4.OkResult<_i4.Shape>, Map<String, Object?>>(
      serialize: ($value) =>
          {r'data': _i3.Serializers.instance.serialize<_i4.Shape>($value.data)},
      deserialize: ($serialized) {
        return _i4.OkResult<_i4.Shape>(_i3.Serializers.instance
            .deserialize<_i4.Shape>($serialized[r'data']));
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Circle, Map<String, Object?>>(
      serialize: ($value) => {r'radius': $value.radius},
      deserialize: ($serialized) {
        return _i4.Circle(($serialized[r'radius'] as num).toDouble());
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Rectangle, Map<String, Object?>>(
      serialize: ($value) => {
        r'width': $value.width,
        r'height': $value.height,
      },
      deserialize: ($serialized) {
        return _i4.Rectangle(
          ($serialized[r'width'] as num).toDouble(),
          ($serialized[r'height'] as num).toDouble(),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.CustomException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CustomException();
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
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.CustomExceptionToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i7.CustomExceptionToFromJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.CustomError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CustomError();
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.CustomErrorToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i7.CustomErrorToFromJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.CustomErrorWithStackTrace, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.stackTrace),
        r'message': $value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CustomErrorWithStackTrace(
            stackTrace: (_i3.Serializers.instance
                    .deserialize<StackTrace?>($serialized?[r'stackTrace'])) ??
                null);
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.InternalServerException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.InternalServerException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ShapeResultsTarget()},
  );
}
