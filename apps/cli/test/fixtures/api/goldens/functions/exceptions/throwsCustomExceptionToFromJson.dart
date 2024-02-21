// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i6;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i3;
import 'package:celest_core/src/serialization/json_value.dart' as _i7;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomExceptionToFromJsonTarget
    extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsCustomExceptionToFromJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomExceptionToFromJson();
      return (statusCode: 200, body: {'response': null});
    } on _i3.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i5.InternalServerException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.InternalServerException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerException',
            'details': error,
          }
        }
      );
    } on _i5.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    } on _i6.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.CustomErrorWithStackTrace>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorWithStackTrace',
            'details': error,
          }
        }
      );
    } on _i6.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.CustomErrorToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorToFromJson',
            'details': error,
          }
        }
      );
    } on _i6.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i6.CustomError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomError',
            'details': error,
          }
        }
      );
    } on _i6.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.CustomExceptionToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomExceptionToFromJson',
            'details': error,
          }
        }
      );
    } on _i6.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i6.CustomException>(e);
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
      const _i4.TypeToken<_i7.JsonMap>('JsonMap'),
    );
    _i4.Serializers.instance.put(const CustomExceptionToFromJsonSerializer());
    _i4.Serializers.instance.put(const CustomErrorSerializer());
    _i4.Serializers.instance.put(const CustomErrorToFromJsonSerializer());
    _i4.Serializers.instance.put(const CustomErrorWithStackTraceSerializer());
    _i4.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i4.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i4.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomExceptionToFromJsonTarget()},
  );
}

final class BadRequestExceptionSerializer
    extends _i4.Serializer<_i5.BadRequestException> {
  const BadRequestExceptionSerializer();

  @override
  _i5.BadRequestException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.BadRequestException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.BadRequestException value) =>
      {r'message': value.message};
}

final class CustomErrorSerializer extends _i4.Serializer<_i6.CustomError> {
  const CustomErrorSerializer();

  @override
  _i6.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i6.CustomError();
  }

  @override
  Object? serialize(_i6.CustomError value) => {
        r'message': value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i7.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i7.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomErrorToFromJsonSerializer
    extends _i4.Serializer<_i6.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  _i6.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i6.CustomErrorToFromJson value) => value.toJson();
}

final class CustomErrorWithStackTraceSerializer
    extends _i4.Serializer<_i6.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  _i6.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i6.CustomErrorWithStackTrace(
        stackTrace: (_i4.Serializers.instance
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Object? serialize(_i6.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i7.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i7.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionSerializer
    extends _i4.Serializer<_i6.CustomException> {
  const CustomExceptionSerializer();

  @override
  _i6.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i6.CustomException();
  }

  @override
  Object? serialize(_i6.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': _i4.Serializers.instance.serialize<_i7.JsonMap>(
          value.additionalInfo,
          const _i4.TypeToken<_i7.JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionToFromJsonSerializer
    extends _i4.Serializer<_i6.CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  _i6.CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i6.CustomExceptionToFromJson value) => value.toJson();
}

final class InternalServerExceptionSerializer
    extends _i4.Serializer<_i5.InternalServerException> {
  const InternalServerExceptionSerializer();

  @override
  _i5.InternalServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.InternalServerException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.InternalServerException value) =>
      {r'message': value.message};
}

final class JsonMapSerializer extends _i4.Serializer<_i7.JsonMap> {
  const JsonMapSerializer();

  @override
  _i7.JsonMap deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.JsonMap((serialized as Map<String, Object?>));
  }

  @override
  Object? serialize(_i7.JsonMap value) => value;
}

final class SerializationExceptionSerializer
    extends _i4.Serializer<_i3.SerializationException> {
  const SerializationExceptionSerializer();

  @override
  _i3.SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i3.SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}
