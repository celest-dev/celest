// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i5;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;
import 'package:celest_core/src/serialization/json_value.dart' as _i6;

import '../../../functions/sealed_classes.dart' as _i2;

final class SealedClassWithInheritedCustomJsonTarget
    extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sealedClassWithInheritedCustomJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.sealedClassWithInheritedCustomJson(
          shapes: (request[r'shapes'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance
                  .deserialize<_i4.ShapeWithInheritedCustomJson>(el))
              .toList());
      return (
        statusCode: 200,
        body: {
          'response': response
              .map((el) => _i3.Serializers.instance
                  .serialize<_i4.ShapeWithInheritedCustomJson>(el))
              .toList()
        }
      );
    } on _i5.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.CustomErrorWithStackTrace>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorWithStackTrace',
            'details': error,
          }
        }
      );
    } on _i5.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.CustomErrorToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorToFromJson',
            'details': error,
          }
        }
      );
    } on _i5.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.CustomError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomError',
            'details': error,
          }
        }
      );
    } on _i5.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.CustomExceptionToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomExceptionToFromJson',
            'details': error,
          }
        }
      );
    } on _i5.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.CustomException>(e);
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
    _i3.Serializers.instance
        .put(const ShapeWithInheritedCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const RectangleWithInheritedCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const CircleWithInheritedCustomJsonSerializer());
    _i3.Serializers.instance.put(const CustomExceptionSerializer());
    _i3.Serializers.instance.put(
      const JsonMapSerializer(),
      const _i3.TypeToken<_i6.JsonMap>('JsonMap'),
    );
    _i3.Serializers.instance.put(const CustomExceptionToFromJsonSerializer());
    _i3.Serializers.instance.put(const CustomErrorSerializer());
    _i3.Serializers.instance.put(const CustomErrorToFromJsonSerializer());
    _i3.Serializers.instance.put(const CustomErrorWithStackTraceSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SealedClassWithInheritedCustomJsonTarget()},
  );
}

final class CircleWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i4.CircleWithInheritedCustomJson> {
  const CircleWithInheritedCustomJsonSerializer();

  @override
  _i4.CircleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i4.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'CircleWithInheritedCustomJson',
      ...serialized,
    }) as _i4.CircleWithInheritedCustomJson);
  }

  @override
  Object? serialize(_i4.CircleWithInheritedCustomJson value) => value.toJson();
}

final class CustomErrorSerializer extends _i3.Serializer<_i5.CustomError> {
  const CustomErrorSerializer();

  @override
  _i5.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i5.CustomError();
  }

  @override
  Object? serialize(_i5.CustomError value) => {
        r'message': value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i6.JsonMap>(
          value.additionalInfo,
          const _i3.TypeToken<_i6.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomErrorToFromJsonSerializer
    extends _i3.Serializer<_i5.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  _i5.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i5.CustomErrorToFromJson value) => value.toJson();
}

final class CustomErrorWithStackTraceSerializer
    extends _i3.Serializer<_i5.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  _i5.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i5.CustomErrorWithStackTrace(
        stackTrace: (_i3.Serializers.instance
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Object? serialize(_i5.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i6.JsonMap>(
          value.additionalInfo,
          const _i3.TypeToken<_i6.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionSerializer
    extends _i3.Serializer<_i5.CustomException> {
  const CustomExceptionSerializer();

  @override
  _i5.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i5.CustomException();
  }

  @override
  Object? serialize(_i5.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i6.JsonMap>(
          value.additionalInfo,
          const _i3.TypeToken<_i6.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionToFromJsonSerializer
    extends _i3.Serializer<_i5.CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  _i5.CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i5.CustomExceptionToFromJson value) => value.toJson();
}

final class JsonMapSerializer extends _i3.Serializer<_i6.JsonMap> {
  const JsonMapSerializer();

  @override
  _i6.JsonMap deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.JsonMap((serialized as Map<String, Object?>));
  }

  @override
  Object? serialize(_i6.JsonMap value) => value;
}

final class RectangleWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i4.RectangleWithInheritedCustomJson> {
  const RectangleWithInheritedCustomJsonSerializer();

  @override
  _i4.RectangleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i4.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'RectangleWithInheritedCustomJson',
      ...serialized,
    }) as _i4.RectangleWithInheritedCustomJson);
  }

  @override
  Object? serialize(_i4.RectangleWithInheritedCustomJson value) =>
      value.toJson();
}

final class ShapeWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i4.ShapeWithInheritedCustomJson> {
  const ShapeWithInheritedCustomJsonSerializer();

  @override
  _i4.ShapeWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ShapeWithInheritedCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.ShapeWithInheritedCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i4.RectangleWithInheritedCustomJson() =>
            r'RectangleWithInheritedCustomJson',
          _i4.CircleWithInheritedCustomJson() =>
            r'CircleWithInheritedCustomJson',
        },
      };
}
