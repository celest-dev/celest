// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i5;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;
import 'package:celest_core/src/serialization/json_value.dart' as _i6;

import '../../../functions/sealed_classes.dart' as _i2;

final class RectangleWithOverriddenCustomJsonTarget
    extends _i1.CloudFunctionTarget {
  @override
  String get name => 'rectangleWithOverriddenCustomJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.rectangleWithOverriddenCustomJson(_i3
          .Serializers.instance
          .deserialize<_i4.RectangleWithOverriddenCustomJson>(
              request[r'rectangle']));
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance
              .serialize<_i4.ShapeWithOverriddenCustomJson>(response)
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
        .put(const ShapeWithOverriddenCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const CircleWithOverriddenCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const RectangleWithOverriddenCustomJsonSerializer());
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
    targets: {'/': RectangleWithOverriddenCustomJsonTarget()},
  );
}

final class CircleWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i4.CircleWithOverriddenCustomJson> {
  const CircleWithOverriddenCustomJsonSerializer();

  @override
  _i4.CircleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.CircleWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.CircleWithOverriddenCustomJson value) => value.toJson();
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

final class RectangleWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i4.RectangleWithOverriddenCustomJson> {
  const RectangleWithOverriddenCustomJsonSerializer();

  @override
  _i4.RectangleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i4.ShapeWithOverriddenCustomJson.fromJson({
      r'$type': r'RectangleWithOverriddenCustomJson',
      ...serialized,
    }) as _i4.RectangleWithOverriddenCustomJson);
  }

  @override
  Object? serialize(_i4.RectangleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class ShapeWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i4.ShapeWithOverriddenCustomJson> {
  const ShapeWithOverriddenCustomJsonSerializer();

  @override
  _i4.ShapeWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ShapeWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.ShapeWithOverriddenCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i4.CircleWithOverriddenCustomJson() =>
            r'CircleWithOverriddenCustomJson',
          _i4.RectangleWithOverriddenCustomJson() =>
            r'RectangleWithOverriddenCustomJson',
        },
      };
}
