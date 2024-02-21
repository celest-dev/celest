// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i3;
import 'package:celest_core/src/serialization/json_value.dart' as _i5;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomErrorTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsCustomError';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomError();
      return (statusCode: 200, body: {'response': null});
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
    _i4.Serializers.instance.put(const CustomExceptionSerializer());
    _i4.Serializers.instance.put(
      const JsonMapSerializer(),
      const _i4.TypeToken<_i5.JsonMap>('JsonMap'),
    );
    _i4.Serializers.instance.put(const CustomExceptionToFromJsonSerializer());
    _i4.Serializers.instance.put(const CustomErrorSerializer());
    _i4.Serializers.instance.put(const CustomErrorToFromJsonSerializer());
    _i4.Serializers.instance.put(const CustomErrorWithStackTraceSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomErrorTarget()},
  );
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
        r'additionalInfo': _i4.Serializers.instance.serialize<_i5.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i5.JsonMap>('JsonMap'),
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
        r'additionalInfo': _i4.Serializers.instance.serialize<_i5.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i5.JsonMap>('JsonMap'),
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
        r'additionalInfo': _i4.Serializers.instance.serialize<_i5.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i5.JsonMap>('JsonMap'),
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

final class JsonMapSerializer extends _i4.Serializer<_i5.JsonMap> {
  const JsonMapSerializer();

  @override
  _i5.JsonMap deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.JsonMap((serialized as Map<String, Object?>));
  }

  @override
  Object? serialize(_i5.JsonMap value) => value;
}
