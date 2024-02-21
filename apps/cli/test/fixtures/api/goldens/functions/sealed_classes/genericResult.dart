// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i7;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i2;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

import '../../../functions/sealed_classes.dart' as _i4;

final class GenericResultTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'genericResult';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final $T = (request[r'$T'] as String?);
    final $types = ($T,);
    return switch ($types) {
      (r'Shape' || null,) => innerHandle<_i2.Shape>(request),
      (r'Rectangle',) => innerHandle<_i2.Rectangle>(request),
      (r'Circle',) => innerHandle<_i2.Circle>(request),
      _ =>
        throw _i3.SerializationException('Invalid type parameters: ${$types}'),
    };
  }

  Future<_i1.CelestResponse> innerHandle<T extends _i2.Shape>(
      Map<String, Object?> request) async {
    try {
      final response = _i4.genericResult<T>(
          _i3.Serializers.instance.deserialize<T>(request[r'data']));
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i2.OkResult<T>>(response)
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
    _i3.Serializers.instance.put(const OkResultSerializer());
    _i3.Serializers.instance.put(const OkResultSerializer<_i2.Shape>());
    _i3.Serializers.instance.put(const OkResultSerializer<_i2.Rectangle>());
    _i3.Serializers.instance.put(const OkResultSerializer<_i2.Circle>());
    _i3.Serializers.instance.put(const ShapeSerializer());
    _i3.Serializers.instance.put(const RectangleSerializer());
    _i3.Serializers.instance.put(const CircleSerializer());
    _i3.Serializers.instance.put(const CustomExceptionSerializer());
    _i3.Serializers.instance.put(
      const JsonMapSerializer(),
      const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
    );
    _i3.Serializers.instance.put(const CustomExceptionToFromJsonSerializer());
    _i3.Serializers.instance.put(const CustomErrorSerializer());
    _i3.Serializers.instance.put(const CustomErrorToFromJsonSerializer());
    _i3.Serializers.instance.put(const CustomErrorWithStackTraceSerializer());
    _i3.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i3.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i3.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': GenericResultTarget()},
  );
}

final class BadRequestExceptionSerializer
    extends _i3.Serializer<_i6.BadRequestException> {
  const BadRequestExceptionSerializer();

  @override
  _i6.BadRequestException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.BadRequestException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i6.BadRequestException value) =>
      {r'message': value.message};
}

final class CircleSerializer extends _i3.Serializer<_i2.Circle> {
  const CircleSerializer();

  @override
  _i2.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Object? serialize(_i2.Circle value) => {r'radius': value.radius};
}

final class CustomErrorSerializer extends _i3.Serializer<_i7.CustomError> {
  const CustomErrorSerializer();

  @override
  _i7.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i7.CustomError();
  }

  @override
  Object? serialize(_i7.CustomError value) => {
        r'message': value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomErrorToFromJsonSerializer
    extends _i3.Serializer<_i7.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  _i7.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i7.CustomErrorToFromJson value) => value.toJson();
}

final class CustomErrorWithStackTraceSerializer
    extends _i3.Serializer<_i7.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  _i7.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i7.CustomErrorWithStackTrace(
        stackTrace: (_i3.Serializers.instance
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Object? serialize(_i7.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionSerializer
    extends _i3.Serializer<_i7.CustomException> {
  const CustomExceptionSerializer();

  @override
  _i7.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i7.CustomException();
  }

  @override
  Object? serialize(_i7.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionToFromJsonSerializer
    extends _i3.Serializer<_i7.CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  _i7.CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i7.CustomExceptionToFromJson value) => value.toJson();
}

final class InternalServerExceptionSerializer
    extends _i3.Serializer<_i6.InternalServerException> {
  const InternalServerExceptionSerializer();

  @override
  _i6.InternalServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.InternalServerException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i6.InternalServerException value) =>
      {r'message': value.message};
}

final class JsonMapSerializer extends _i3.Serializer<_i8.JsonMap> {
  const JsonMapSerializer();

  @override
  _i8.JsonMap deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i8.JsonMap((serialized as Map<String, Object?>));
  }

  @override
  Object? serialize(_i8.JsonMap value) => value;
}

final class OkResultSerializer<T extends _i2.Shape>
    extends _i3.Serializer<_i2.OkResult<T>> {
  const OkResultSerializer();

  @override
  _i2.OkResult<T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.OkResult<T>(
        _i3.Serializers.instance.deserialize<T>(serialized[r'data']));
  }

  @override
  Object? serialize(_i2.OkResult<T> value) =>
      {r'data': _i3.Serializers.instance.serialize<T>(value.data)};
}

final class RectangleSerializer extends _i3.Serializer<_i2.Rectangle> {
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

final class SerializationExceptionSerializer
    extends _i3.Serializer<_i5.SerializationException> {
  const SerializationExceptionSerializer();

  @override
  _i5.SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}

final class ShapeSerializer extends _i3.Serializer<_i2.Shape> {
  const ShapeSerializer();

  @override
  _i2.Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Rectangle') {
      return _i3.Serializers.instance.deserialize<_i2.Rectangle>(serialized);
    }
    if (serialized[r'$type'] == r'Circle') {
      return _i3.Serializers.instance.deserialize<_i2.Circle>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i2.Shape value) {
    if (value is _i2.Rectangle) {
      return {
        ...(_i3.Serializers.instance.serialize<_i2.Rectangle>(value)
            as Map<String, Object?>),
        r'$type': r'Rectangle',
      };
    }
    if (value is _i2.Circle) {
      return {
        ...(_i3.Serializers.instance.serialize<_i2.Circle>(value)
            as Map<String, Object?>),
        r'$type': r'Circle',
      };
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}
