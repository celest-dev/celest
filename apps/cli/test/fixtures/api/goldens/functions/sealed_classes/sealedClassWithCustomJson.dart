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

final class SealedClassWithCustomJsonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sealedClassWithCustomJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.sealedClassWithCustomJson(
          shapes: (request[r'shapes'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance
                  .deserialize<_i4.ShapeWithCustomJson>(el))
              .toList());
      return (
        statusCode: 200,
        body: {
          'response': response
              .map((el) => _i3.Serializers.instance
                  .serialize<_i4.ShapeWithCustomJson>(el))
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
    _i3.Serializers.instance.put(const ShapeWithCustomJsonSerializer());
    _i3.Serializers.instance.put(const CircleWithCustomJsonSerializer());
    _i3.Serializers.instance.put(const RectangleWithCustomJsonSerializer());
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
    targets: {'/': SealedClassWithCustomJsonTarget()},
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

final class CircleWithCustomJsonSerializer
    extends _i3.Serializer<_i4.CircleWithCustomJson> {
  const CircleWithCustomJsonSerializer();

  @override
  _i4.CircleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.CircleWithCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.CircleWithCustomJson value) => value.toJson();
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

final class RectangleWithCustomJsonSerializer
    extends _i3.Serializer<_i4.RectangleWithCustomJson> {
  const RectangleWithCustomJsonSerializer();

  @override
  _i4.RectangleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.RectangleWithCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.RectangleWithCustomJson value) => value.toJson();
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

final class ShapeWithCustomJsonSerializer
    extends _i3.Serializer<_i4.ShapeWithCustomJson> {
  const ShapeWithCustomJsonSerializer();

  @override
  _i4.ShapeWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'CircleWithCustomJson') {
      return _i3.Serializers.instance
          .deserialize<_i4.CircleWithCustomJson>(serialized);
    }
    if (serialized[r'$type'] == r'RectangleWithCustomJson') {
      return _i3.Serializers.instance
          .deserialize<_i4.RectangleWithCustomJson>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeWithCustomJson')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i4.ShapeWithCustomJson value) {
    if (value is _i4.CircleWithCustomJson) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.CircleWithCustomJson>(value)
            as Map<String, Object?>),
        r'$type': r'CircleWithCustomJson',
      };
    }
    if (value is _i4.RectangleWithCustomJson) {
      return {
        ...(_i3.Serializers.instance
                .serialize<_i4.RectangleWithCustomJson>(value)
            as Map<String, Object?>),
        r'$type': r'RectangleWithCustomJson',
      };
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeWithCustomJson')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}
