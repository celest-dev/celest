// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/exceptions.dart' as _i3;
import 'package:celest_backend/models/sealed_classes.dart' as _i2;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

import '../../../functions/sealed_classes.dart' as _i5;

final class MultipleGenericResultTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'multipleGenericResult';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    final $T = (request[r'$T'] as String?);
    final $E = (request[r'$E'] as String?);
    final $types = ($T, $E);
    return switch ($types) {
      (r'Shape' || null, r'ShapeException' || null) =>
        innerHandle<_i2.Shape, _i3.ShapeException>(
          request,
          context: context,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Shape' || null, r'BadShapeException') =>
        innerHandle<_i2.Shape, _i3.BadShapeException>(
          request,
          context: context,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Circle', r'ShapeException' || null) =>
        innerHandle<_i2.Circle, _i3.ShapeException>(
          request,
          context: context,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Circle', r'BadShapeException') =>
        innerHandle<_i2.Circle, _i3.BadShapeException>(
          request,
          context: context,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Rectangle', r'ShapeException' || null) =>
        innerHandle<_i2.Rectangle, _i3.ShapeException>(
          request,
          context: context,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Rectangle', r'BadShapeException') =>
        innerHandle<_i2.Rectangle, _i3.BadShapeException>(
          request,
          context: context,
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
    required Map<String, String> context,
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
    } on _i3.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.CustomErrorWithStackTrace>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorWithStackTrace',
            'details': error,
          }
        }
      );
    } on _i3.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.CustomErrorToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorToFromJson',
            'details': error,
          }
        }
      );
    } on _i3.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CustomError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomError',
            'details': error,
          }
        }
      );
    } on _i3.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.CustomExceptionToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomExceptionToFromJson',
            'details': error,
          }
        }
      );
    } on _i3.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i7.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i7.InternalServerError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerError',
            'details': error,
          }
        }
      );
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i7.UnauthorizedException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UnauthorizedException',
            'details': error,
          }
        }
      );
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i7.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
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
        r'additionalInfo': _i4.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i4.TypeToken<_i8.JsonMap>('JsonMap'),
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
        r'additionalInfo': _i4.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i4.TypeToken<_i8.JsonMap>('JsonMap'),
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
      serialize: ($value) => {r'radius': $value.radius},
      deserialize: ($serialized) {
        return _i2.Circle(($serialized[r'radius'] as num).toDouble());
      },
    ));
    _i4.Serializers.instance.put(const ErrResult_E_ShapeExceptionSerializer());
    _i4.Serializers.instance
        .put(const ErrResult_E_ShapeExceptionSerializer<_i3.ShapeException>());
    _i4.Serializers.instance.put(
        const ErrResult_E_ShapeExceptionSerializer<_i3.BadShapeException>());
    _i4.Serializers.instance.put(const ErrResult_T_ShapeSerializer());
    _i4.Serializers.instance
        .put(const ErrResult_T_ShapeSerializer<_i2.Shape>());
    _i4.Serializers.instance
        .put(const ErrResult_T_ShapeSerializer<_i2.Circle>());
    _i4.Serializers.instance
        .put(const ErrResult_T_ShapeSerializer<_i2.Rectangle>());
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
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i6.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i8.JsonMap, Map<String, Object?>>(
        serialize: ($value) => $value,
        deserialize: ($serialized) {
          return _i8.JsonMap(($serialized as Map<String, Object?>));
        },
      ),
      const _i4.TypeToken<_i8.JsonMap>('JsonMap'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': MultipleGenericResultTarget()},
  );
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
