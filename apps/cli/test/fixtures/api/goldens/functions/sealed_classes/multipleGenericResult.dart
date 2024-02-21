// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i3;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i2;
import 'package:celest_core/src/serialization/json_value.dart' as _i6;

import '../../../functions/sealed_classes.dart' as _i5;

final class MultipleGenericResultTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'multipleGenericResult';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final $T = (request[r'$T'] as String?);
    final $E = (request[r'$E'] as String?);
    final $types = ($T, $E);
    return switch ($types) {
      (r'Shape' || null, r'ShapeException' || null) =>
        innerHandle<_i2.Shape, _i3.ShapeException>(request),
      (r'Shape' || null, r'BadShapeException') =>
        innerHandle<_i2.Shape, _i3.BadShapeException>(request),
      (r'Rectangle', r'ShapeException' || null) =>
        innerHandle<_i2.Rectangle, _i3.ShapeException>(request),
      (r'Rectangle', r'BadShapeException') =>
        innerHandle<_i2.Rectangle, _i3.BadShapeException>(request),
      (r'Circle', r'ShapeException' || null) =>
        innerHandle<_i2.Circle, _i3.ShapeException>(request),
      (r'Circle', r'BadShapeException') =>
        innerHandle<_i2.Circle, _i3.BadShapeException>(request),
      _ =>
        throw _i4.SerializationException('Invalid type parameters: ${$types}'),
    };
  }

  Future<_i1.CelestResponse>
      innerHandle<T extends _i2.Shape, E extends _i3.ShapeException>(
          Map<String, Object?> request) async {
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
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(const ResultSerializer());
    _i4.Serializers.instance
        .put(const ResultSerializer<_i2.Shape, _i3.ShapeException>());
    _i4.Serializers.instance
        .put(const ResultSerializer<_i2.Shape, _i3.BadShapeException>());
    _i4.Serializers.instance
        .put(const ResultSerializer<_i2.Rectangle, _i3.ShapeException>());
    _i4.Serializers.instance
        .put(const ResultSerializer<_i2.Rectangle, _i3.BadShapeException>());
    _i4.Serializers.instance
        .put(const ResultSerializer<_i2.Circle, _i3.ShapeException>());
    _i4.Serializers.instance
        .put(const ResultSerializer<_i2.Circle, _i3.BadShapeException>());
    _i4.Serializers.instance.put(const OkResultSerializer());
    _i4.Serializers.instance.put(const OkResultSerializer<_i2.Shape>());
    _i4.Serializers.instance.put(const OkResultSerializer<_i2.Rectangle>());
    _i4.Serializers.instance.put(const OkResultSerializer<_i2.Circle>());
    _i4.Serializers.instance.put(const ErrResultSerializer());
    _i4.Serializers.instance
        .put(const ErrResultSerializer<_i3.ShapeException>());
    _i4.Serializers.instance
        .put(const ErrResultSerializer<_i3.BadShapeException>());
    _i4.Serializers.instance.put(const SwappedResultSerializer());
    _i4.Serializers.instance
        .put(const SwappedResultSerializer<_i3.ShapeException, _i2.Shape>());
    _i4.Serializers.instance.put(
        const SwappedResultSerializer<_i3.ShapeException, _i2.Rectangle>());
    _i4.Serializers.instance
        .put(const SwappedResultSerializer<_i3.ShapeException, _i2.Circle>());
    _i4.Serializers.instance
        .put(const SwappedResultSerializer<_i3.BadShapeException, _i2.Shape>());
    _i4.Serializers.instance.put(
        const SwappedResultSerializer<_i3.BadShapeException, _i2.Rectangle>());
    _i4.Serializers.instance.put(
        const SwappedResultSerializer<_i3.BadShapeException, _i2.Circle>());
    _i4.Serializers.instance.put(const ShapeExceptionSerializer());
    _i4.Serializers.instance.put(const BadShapeExceptionSerializer());
    _i4.Serializers.instance.put(const ShapeSerializer());
    _i4.Serializers.instance.put(const RectangleSerializer());
    _i4.Serializers.instance.put(const CircleSerializer());
    _i4.Serializers.instance.put(const CustomExceptionSerializer());
    _i4.Serializers.instance.put(
      const JsonMapSerializer(),
      const _i4.TypeToken<_i6.JsonMap>('JsonMap'),
    );
    _i4.Serializers.instance.put(const CustomExceptionToFromJsonSerializer());
    _i4.Serializers.instance.put(const CustomErrorSerializer());
    _i4.Serializers.instance.put(const CustomErrorToFromJsonSerializer());
    _i4.Serializers.instance.put(const CustomErrorWithStackTraceSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': MultipleGenericResultTarget()},
  );
}

final class BadShapeExceptionSerializer
    extends _i4.Serializer<_i3.BadShapeException> {
  const BadShapeExceptionSerializer();

  @override
  _i3.BadShapeException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.BadShapeException(
        _i4.Serializers.instance.deserialize<_i2.Shape>(serialized[r'shape']));
  }

  @override
  Object? serialize(_i3.BadShapeException value) =>
      {r'shape': _i4.Serializers.instance.serialize<_i2.Shape>(value.shape)};
}

final class CircleSerializer extends _i4.Serializer<_i2.Circle> {
  const CircleSerializer();

  @override
  _i2.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Object? serialize(_i2.Circle value) => {r'radius': value.radius};
}

final class CustomErrorSerializer extends _i4.Serializer<_i3.CustomError> {
  const CustomErrorSerializer();

  @override
  _i3.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i3.CustomError();
  }

  @override
  Object? serialize(_i3.CustomError value) => {
        r'message': value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i6.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i6.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomErrorToFromJsonSerializer
    extends _i4.Serializer<_i3.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  _i3.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i3.CustomErrorToFromJson value) => value.toJson();
}

final class CustomErrorWithStackTraceSerializer
    extends _i4.Serializer<_i3.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  _i3.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i3.CustomErrorWithStackTrace(
        stackTrace: (_i4.Serializers.instance
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Object? serialize(_i3.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i6.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i6.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionSerializer
    extends _i4.Serializer<_i3.CustomException> {
  const CustomExceptionSerializer();

  @override
  _i3.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i3.CustomException();
  }

  @override
  Object? serialize(_i3.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i6.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i6.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionToFromJsonSerializer
    extends _i4.Serializer<_i3.CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  _i3.CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i3.CustomExceptionToFromJson value) => value.toJson();
}

final class ErrResultSerializer<E extends _i3.ShapeException>
    extends _i4.Serializer<_i2.ErrResult<E>> {
  const ErrResultSerializer();

  @override
  _i2.ErrResult<E> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.ErrResult<E>(
        _i4.Serializers.instance.deserialize<E>(serialized[r'error']));
  }

  @override
  Object? serialize(_i2.ErrResult<E> value) =>
      {r'error': _i4.Serializers.instance.serialize<E>(value.error)};
}

final class JsonMapSerializer extends _i4.Serializer<_i6.JsonMap> {
  const JsonMapSerializer();

  @override
  _i6.JsonMap deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.JsonMap((serialized as Map<String, Object?>));
  }

  @override
  Object? serialize(_i6.JsonMap value) => value;
}

final class OkResultSerializer<T extends _i2.Shape>
    extends _i4.Serializer<_i2.OkResult<T>> {
  const OkResultSerializer();

  @override
  _i2.OkResult<T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.OkResult<T>(
        _i4.Serializers.instance.deserialize<T>(serialized[r'data']));
  }

  @override
  Object? serialize(_i2.OkResult<T> value) =>
      {r'data': _i4.Serializers.instance.serialize<T>(value.data)};
}

final class RectangleSerializer extends _i4.Serializer<_i2.Rectangle> {
  const RectangleSerializer();

  @override
  _i2.Rectangle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Rectangle(
      (serialized[r'width'] as num).toDouble(),
      (serialized[r'height'] as num).toDouble(),
    );
  }

  @override
  Object? serialize(_i2.Rectangle value) => {
        r'width': value.width,
        r'height': value.height,
      };
}

final class ResultSerializer<T extends _i2.Shape, E extends _i3.ShapeException>
    extends _i4.Serializer<_i2.Result<T, E>> {
  const ResultSerializer();

  @override
  _i2.Result<T, E> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return _i4.Serializers.instance.deserialize<_i2.OkResult<T>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return _i4.Serializers.instance.deserialize<_i2.ErrResult<E>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return _i4.Serializers.instance
          .deserialize<_i2.SwappedResult<E, T>>(serialized);
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i2.Result<T, E> value) {
    if (value is _i2.OkResult<T>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.OkResult<T>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is _i2.ErrResult<E>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.ErrResult<E>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value is _i2.SwappedResult<E, T>) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.SwappedResult<E, T>>(value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class ShapeExceptionSerializer
    extends _i4.Serializer<_i3.ShapeException> {
  const ShapeExceptionSerializer();

  @override
  _i3.ShapeException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'BadShapeException') {
      return _i4.Serializers.instance
          .deserialize<_i3.BadShapeException>(serialized);
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeException')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i3.ShapeException value) {
    if (value is _i3.BadShapeException) {
      return {
        ...(_i4.Serializers.instance.serialize<_i3.BadShapeException>(value)
            as Map<String, Object?>),
        r'$type': r'BadShapeException',
      };
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeException')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class ShapeSerializer extends _i4.Serializer<_i2.Shape> {
  const ShapeSerializer();

  @override
  _i2.Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Rectangle') {
      return _i4.Serializers.instance.deserialize<_i2.Rectangle>(serialized);
    }
    if (serialized[r'$type'] == r'Circle') {
      return _i4.Serializers.instance.deserialize<_i2.Circle>(serialized);
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i2.Shape value) {
    if (value is _i2.Rectangle) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.Rectangle>(value)
            as Map<String, Object?>),
        r'$type': r'Rectangle',
      };
    }
    if (value is _i2.Circle) {
      return {
        ...(_i4.Serializers.instance.serialize<_i2.Circle>(value)
            as Map<String, Object?>),
        r'$type': r'Circle',
      };
    }
    throw _i4.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class SwappedResultSerializer<E extends _i3.ShapeException,
    T extends _i2.Shape> extends _i4.Serializer<_i2.SwappedResult<E, T>> {
  const SwappedResultSerializer();

  @override
  _i2.SwappedResult<E, T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.SwappedResult<E, T>(_i4.Serializers.instance
        .deserialize<_i2.Result<E, T>>(serialized[r'result']));
  }

  @override
  Object? serialize(_i2.SwappedResult<E, T> value) => {
        r'result':
            _i4.Serializers.instance.serialize<_i2.Result<E, T>>(value.result)
      };
}
