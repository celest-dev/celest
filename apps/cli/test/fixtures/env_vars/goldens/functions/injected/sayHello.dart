// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i3;

import 'package:celest/celest.dart' as _i5;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i4;

import '../../../functions/injected.dart' as _i2;

final class SayHelloTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sayHello';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.sayHello(
        name: _i3.Platform.environment[r'MY_NAME']!,
        age: int.parse(_i3.Platform.environment[r'MY_AGE']!),
      );
      return (statusCode: 200, body: {'response': response});
    } on _i4.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i5.Serializers.instance.serialize<_i4.SerializationException>(e);
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
          _i5.Serializers.instance.serialize<_i6.InternalServerException>(e);
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
          _i5.Serializers.instance.serialize<_i6.BadRequestException>(e);
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
    _i5.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i5.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i5.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SayHelloTarget()},
  );
}

final class BadRequestExceptionSerializer
    extends _i5.Serializer<_i6.BadRequestException> {
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

final class InternalServerExceptionSerializer
    extends _i5.Serializer<_i6.InternalServerException> {
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

final class SerializationExceptionSerializer
    extends _i5.Serializer<_i4.SerializationException> {
  const SerializationExceptionSerializer();

  @override
  _i4.SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i4.SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}
